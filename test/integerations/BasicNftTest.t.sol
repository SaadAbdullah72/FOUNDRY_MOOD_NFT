// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test } from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";


contract BasicNftTest is Test
{BasicNft public basicNft;
DeployBasicNft   public deployer;
address public USER= makeAddr('user');
string public constant PUG = "ipfs://QmTFV8zHZ8PmnrvHJ2chSq9zHftPoghrHohUyqDVHcek2w";

function setUp () public {

  deployer = new DeployBasicNft();
  basicNft = deployer.run();



}

function testName() public {

    string memory expectedName = "Dogie";
    string memory actualName = basicNft.name();
 assert(keccak256(abi.encodePacked(actualName)) == keccak256(abi.encodePacked(expectedName)));


}function testCanMintAndHaveBalance() public {

    vm.startPrank(USER);
    basicNft.mintNft(PUG);
    uint256 balance = basicNft.balanceOf(USER);
    assertEq(balance, 1, "Balance should be 1 after minting");
    assertEq(keccak256(abi.encodePacked(basicNft.tokenURI(0))), keccak256(abi.encodePacked(PUG)), "Token URI should match the minted NFT");
    vm.stopPrank();
}
}