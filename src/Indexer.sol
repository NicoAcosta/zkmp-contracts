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

    function addTransaction(
        TransactionType _type,
        uint256 _amount,
        uint256 _timestamp,
        string memory _cid
    ) public onlyOwner {
        transactions.push(Transaction(_type, _amount, _timestamp, _cid));

        emit TransactionAdded(_type, _amount, _timestamp, _cid);
    }
}
