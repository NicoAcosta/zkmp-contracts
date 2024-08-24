// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Indexer is ERC721URIStorage, Ownable {
    address public holder;

    uint256 private _tokenId;

    constructor() ERC721("OpenFlow", "OF") Ownable(msg.sender) {}

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
        _mint(holder, newtokenId);
    }
}
