// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{

    uint256 private s_tokenCounter;
    mapping (uint256=> string ) s_tokenIdToUri;
    constructor()  ERC721("Dogie","DOG"){

        s_tokenCounter=     0;
        
    }
function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

     

     function tokenURI (uint256 tokenId) public view override returns (string memory) {
     
        return s_tokenIdToUri[tokenId];
}
}