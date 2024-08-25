// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/OpenFlowTransactionCertificates.sol";

contract MyScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        OpenFlowTransactionCertificates nft = new OpenFlowTransactionCertificates(
                0xaEe07187f47a24627427Ccc3C25bE6CB7D73A9F4
            );

        vm.stopBroadcast();
    }
}
