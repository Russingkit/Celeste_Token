// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract MyToken {
    string public tokenName = "Catizen";      // Token name set as "Catizen" 
    string public tokenAbbrv = "CATI";       // Token abbreviation set as "CATI"
    uint public totalSupply = 0;            // Variable to track total supply

    // Mapping to store each address's token balance
    mapping(address => uint) public balances;

    // Constructor to initialize total supply and assign it to the deployer
    constructor(uint initialSupply) {
        mint(msg.sender, initialSupply);    // Mint the initial supply to the deployer
    }

    // Mint function that allows increasing the total supply and assigning balance to an address
    function mint(address _to, uint _value) public {
        totalSupply += _value;              // Increase total supply
        balances[_to] += _value;            // Increase balance of the specified address
    }

    // Burn function to decrease total supply and reduce an address's balance
    function burn(address _from, uint _value) public {
        require(_value > 10, "Amount should be greater than 10");  // Ensure amount is greater than 10
        require(balances[_from] >= _value, "Insufficient balance to burn");  // Check for sufficient balance
        totalSupply -= _value;              // Decrease total supply
        balances[_from] -= _value;          // Decrease balance of the specified address
    }

    // Transfer function to move tokens between accounts
    function transfer(address _to, uint _value) public returns (bool) {
        require(balances[msg.sender] >= _value, "Insufficient balance"); // Ensure sender has enough balance
        balances[msg.sender] -= _value;    // Subtract from sender's balance
        balances[_to] += _value;           // Add to recipient's balance
        return true;
    }
}
