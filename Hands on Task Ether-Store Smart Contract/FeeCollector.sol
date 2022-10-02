//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector{

    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external{
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only Owner Can Withdraw");
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount);
        balance -= amount;
    }
}