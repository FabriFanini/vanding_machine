// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract VendingMachine {
    //Struct
    struct Snack {
        uint32 id;
        string name;
        uint16 quantity;
        uint8 price;
    }

    //Events
    event newSnackadded (string _name, uint _price);
    event snackRestocked (uint32 _id, uint16 _quantity);
    event snackSold (uint32 _id, uint16 _quantity);

    //Variables
    address payable private owner;
    mapping (uint32 => Snack) snacks;
    Snack [] stock;
    uint32 totalSnacks;

    //Constructor
    constructor (){
        owner = payable(msg.sender);
        totalSnacks = 0;
    }

    //Funciones
    function getAllSancks () external view returns (Snack [] memory _stock)
    {
        return stock;
    }

    function compareStrings (string memory a, string memory b) internal pure returns (bool)
    {
        return(keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b)));
    }

    function addNewSnack (string memory _name, uint16 _quantity, uint8 _price) external onlyOwner
    {
        require (bytes(_name).length > 0, "Null name");
        require (_quantity > 0, "Null amount");
        require (_price > 0, "Null price");

        for (uint32 i = 0; i < totalSnacks; i++){
            require(!compareStrings(_name, snacks[i].name));
        }

        snacks[totalSnacks] = Snack(totalSnacks, _name, _quantity, _price);
        stock.push(snacks[totalSnacks]);
        totalSnacks ++;

        emit newSnackadded(_name, _price);
    }

    function restock (uint32 _id, uint16 _quantity) external onlyOwner
    {
        require (_id <= stock.length, "The snack doesn't exists.");
        require (_quantity > 0, "Null amount.");

        stock[_id].quantity += _quantity;
        emit snackRestocked(_id, _quantity);
    }

    function buySnack (uint32 _id, uint16 _quantity) external payable
    {
        require (_id <= totalSnacks, "The snack doesn't exists.");
        require (stock[_id].quantity >= _quantity,  "Insufficient stock.");
        
        uint totalPrice = stock[_id].price * _quantity;
        require(totalPrice <= msg.value, "Insufficient funds.");

        stock[_id].quantity -= _quantity;
    }

    function getMachineBalance () external view onlyOwner returns (uint)
    {
        return address(this).balance;
    }

    function withDraw () external onlyOwner 
    {
        owner.transfer(address(this).balance);
    }
    
    //Modifier
    modifier onlyOwner {
        require (owner == msg.sender, "Null operation, only the owner can do this.");
        _;
    }
}