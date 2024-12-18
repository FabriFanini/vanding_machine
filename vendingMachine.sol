// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract VendingMachine {
    //Struct
    struct Snack {
        string name;
        uint32 id;
        uint16 quantity;
        uint8 price;
    }

    //Events


    //Variables
    address payable private owner;
    mapping (uint => Snack) snacks;
    Snack [] stock;
    uint totalSnacks;

    //Constructor
    constructor (){
        owner = payable(msg.sender);
        totalSnacks =0;
    }

    //Funciones

    //Modifier
    modifier onlyOwner {
        require (owner == msg.sender, "Null operation, only the owner can do this.");
        _;
    }
}