// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    // Hardcoded IPFS URI for the NFT metadata
    string public constant PUG_URI = "ipfs://QmTFV8zHZ8PmnrvHJ2chSq9zHftPoghrHohUyqDVHcek2w";
    
    function run() external {
        // Get contract address from environment variables
        address nftContract = vm.envAddress("NFT_CONTRACT_ADDRESS");
        require(nftContract != address(0), "NFT contract address not set");
        
        // Execute minting in one transaction
        vm.startBroadcast();
        BasicNft(nftContract).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}