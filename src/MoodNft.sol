// SPDX - License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {

 error MoodNft__CantFlipMoodIfNotOwner();
    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;
    enum mood { SAD, HAPPY 
        
    }

    mapping(uint256 => mood) private s_tokenIdToMood;
    constructor( string memory sadSvgImageUri , string memory happySvgImageUri) ERC721("MoodNft", "MOOD") {s_tokenCounter = 0;

        s_sadSvg = sadSvgImageUri;
        s_happySvg = happySvgImageUri;

    }

    function _mintNft() public {
   
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter]  = mood.HAPPY;
        s_tokenCounter++;
    }

    function getMood(uint256 tokenId) public view returns (string memory) {
    if (s_tokenIdToMood[tokenId] == mood.HAPPY) {
        return "HAPPY";
    } else {
        return "SAD";
    }
}



    

 function FlipMood(uint256 tokenId) public {
        if (getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
            revert MoodNft__CantFlipMoodIfNotOwner();
        }
       
if(s_tokenIdToMood[tokenId] == mood.HAPPY) {
            s_tokenIdToMood[tokenId] = mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = mood.HAPPY;
        }


    }
     function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }
     

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageUri;
        if (s_tokenIdToMood[tokenId] == mood.HAPPY) {
            imageUri = s_happySvg;
        } else {
            imageUri = s_sadSvg;
        }

        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageUri,
                            '"}'
                    )
                )
            )
        )
    );
    }
}