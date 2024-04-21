// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private tokenIdToUri;

    constructor() ERC721("dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return tokenIdToUri[tokenId];
    }

    /**Getter functions */
    function getTokenCounter() external view returns (uint256) {
        return s_tokenCounter;
    }

    function getTokenIdToUri(
        uint256 tokenId
    ) external view returns (string memory) {
        return tokenIdToUri[tokenId];
    }
}
