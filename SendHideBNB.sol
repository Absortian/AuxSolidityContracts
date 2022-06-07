// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SendHideBNB {
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function sendHideBNB(address sendToAddress) payable public {
        require(msg.sender == owner, "Only owner can send HideBNB");
        address payable addr = payable(address(sendToAddress));
        selfdestruct(addr);
    }

    function sendCustomToken(ERC20 token, address sendToAddress, uint256 amount) payable public {
        require(msg.sender == owner, "Only owner can send custom token");
        uint256 tokenBalance = token.balanceOf(address(this));
        require(tokenBalance >= amount, "Not enough token balance");
        token.transfer(sendToAddress, amount);
    }

}