// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// DeFi contract that allows users to deposit and withdraw funds
contract Subdefi {
  // Mapping to store user balances
  mapping (address => uint256) public balances;

  // Event to track deposits
  event Deposit(address indexed from, uint256 amount);

  // Function to allow users to deposit funds
  function deposit() public payable {
    // Add the deposit amount to the user's balance
    balances[msg.sender] += msg.value;

    // Emit a Deposit event
    emit Deposit(msg.sender, msg.value);
  }

  // Function to allow users to withdraw funds
  function withdraw(uint256 amount) public {
    // Check if the user has sufficient balance
    require(balances[msg.sender] >= amount, "Insufficient balance");

    // Subtract the withdrawal amount from the user's balance
    balances[msg.sender] -= amount;

    // Convert the user's address to an "address payable" type
    address payable userAddress = payable (address(msg.sender));

    // Send the withdrawal amount to the user
    userAddress.transfer(amount);
  }
}
