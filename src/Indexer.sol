// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

enum TransactionType {
    NULL,
    DEPOSIT,
    WITHDRAW
}

struct Transaction {
    TransactionType _type;
    uint256 amount;
    uint256 timestamp;
    string cid;
}

event TransactionAdded(
        TransactionType _type,
        uint256 amount,
        uint256 timestamp,
        string cid
    );

contract Indexer is Ownable {
    Transaction[] public transactions;

    constructor(address _owner) Ownable(_owner) {}

    function addTransaction(Transaction memory _transaction) public onlyOwner {
        transactions.push(_transaction);

        emit TransactionAdded(_transaction._type, _transaction.amount, _transaction.timestamp, _transaction.cid);
    }

    function addTransactionBatch(Transaction[] memory _transactions) public onlyOwner {
        for (uint256 i = 0; i < _transactions.length; i++) {
            transactions.push(_transactions[i]);

            emit TransactionAdded(_transactions[i]._type, _transactions[i].amount, _transactions[i].timestamp, _transactions[i].cid);
        }
    }

    function totalTransactions() public view returns (uint256) {
        return transactions.length;
    }
}
