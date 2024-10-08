pragma solidity ^0.8.18;

contract MyToken {
    string public tokenName = "CATIZEN";
    string public tokenAbbrv = "$Cati";
    uint public totalSupply = 0;

    //Mapping to track balances of addresses
    mapping(address => uint) public balances;

    //Mint function to increase total supply and balance
    function mint(address _to, uint _value) public {
        totalSupply += _value;           //Increase total supply
        balances[_to] += _value;         // Increase balance
    }

    //Burn function to decrease total supply and balance
    function burn(address _from, uint _value) public {
        require(balances[_from] >= _value, "You have insufficient balance to burn");
        totalSupply -= _value;           //Decrease total supply
        balances[_from] -= _value;       //Decrease balance
    }
}