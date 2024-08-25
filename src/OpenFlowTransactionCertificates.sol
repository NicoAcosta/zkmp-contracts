//
//   ______     ______   ______     __   __     ______   __         ______     __     __
//  /\  __ \   /\  == \ /\  ___\   /\ "-.\ \   /\  ___\ /\ \       /\  __ \   /\ \  _ \ \
//  \ \ \/\ \  \ \  _-/ \ \  __\   \ \ \-.  \  \ \  __\ \ \ \____  \ \ \/\ \  \ \ \/ ".\ \
//   \ \_____\  \ \_\    \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\  \ \_____\  \ \__/".~\_\
//    \/_____/   \/_/     \/_____/   \/_/ \/_/   \/_/     \/_____/   \/_____/   \/_/   \/_/
//
//

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract OpenFlowTransactionCertificates is ERC721URIStorage, Ownable {
    uint256 private _tokenId;

    constructor(
        address _owner
    ) ERC721("OpenFlow Transaction Certificates", "OFTX") Ownable(_owner) {}

    function mint(string memory _uri) public onlyOwner {
        __mint(_uri);
    }

    function mintBatch(string[] memory _uris) public onlyOwner {
        for (uint256 i = 0; i < _uris.length; i++) {
            __mint(_uris[i]);
        }
    }

    function __mint(string memory _uri) private {
        uint256 newtokenId = _tokenId++;

        _setTokenURI(newtokenId, _uri);
        _mint(address(this), newtokenId);
    }
}
