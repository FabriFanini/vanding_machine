# Vending Machine Smart Contract

This project is a smart contract that simulates the functionality of a vending machine. The contract is developed in Solidity and aims to provide a functional representation of common vending machine operations.

## Features

The contract includes the following functionalities:

### Check Inventory
- Users can check the available products in the vending machine along with their prices and quantities.

### Purchase Products
- Users can purchase products by specifying the product type and desired quantity.
- The contract validates if there is enough inventory and if the buyer has provided the correct amount.

### Add New Products
- The owner can add new types of products to the vending machine, specifying their price and initial stock.

### Restock Products
- Only the owner of the vending machine can add inventory to existing products.

### Check Balance
- The owner can review the accumulated balance in the machine.

### Withdraw Funds
- The owner can withdraw the funds collected from sales.

## Technology

- **Language**: Solidity
- **Development and Testing Platform**: [Remix IDE](https://remix.ethereum.org/)
- **Network**: Simulated in Remix with JavaScript VM or deployed to test networks like Goerli or Sepolia.

## Deployment and Testing Instructions

### Prerequisites
- Access to [Remix IDE](https://remix.ethereum.org/) or a local Solidity development environment.
- Basic knowledge of Solidity and smart contracts.

### Deployment Steps
1. Copy the contract code into a file named `VendingMachine.sol`.
2. Open Remix and paste the code into a new file.
3. Compile the contract using the appropriate version of the Solidity compiler.
4. Deploy the contract in the JavaScript VM or on a test network.

### Testing Steps
1. Use the function to check the inventory and verify that products are available.
2. Add new products to the vending machine using the **Add New Products** function (owner only).
3. Simulate purchasing a product by sending the correct amount of ether with the request.
4. Check the inventory after the purchase to confirm the quantity has decreased correctly.
5. As the owner, restock products using the appropriate function.
6. Check the accumulated balance and withdraw funds to verify the operation is successful.

## Notes

- This contract is designed for educational purposes and is not ready for production environments.
