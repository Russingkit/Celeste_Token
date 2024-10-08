# TOKEN

### Overview of the Code

This Solidity smart contract defines a basic token named "CATIZEN" with the symbol "$CATI". It is designed to manage the minting and burning of tokens. Here's a simple breakdown of the key components:

1. **Public Variables**: 
   - `tokenName` stores the name of the token, which is "CATIZEN".
   - `tokenAbbrv` stores the symbol of the token, which is "$CATI".
   - `totalSupply` tracks the total supply of tokens.

2. **Mapping (balances)**: 
   - This keeps track of the balance of each address that holds the token. It is a mapping from an Ethereum address to an unsigned integer representing the number of tokens that address owns.

3. **Mint Function**:
   - `mint(address _to, uint _value)` increases the total supply of tokens and adds the specified number of tokens (`_value`) to the balance of a particular address (`_to`).

4. **Burn Function**:
   - `burn(address _from, uint _value)` decreases the total supply of tokens and subtracts the specified number of tokens (`_value`) from the balance of a particular address (`_from`), provided the address has enough tokens to burn.

### Purpose:
The contract allows for the creation of a simple token on the Ethereum blockchain. It provides mechanisms for increasing (`mint`) or decreasing (`burn`) the supply of tokens while maintaining a balance for each holder of the token.

## Description

This Solidity smart contract defines a token called **"CATIZEN"** with the symbol **"$CATI"**. It allows for the minting and burning of tokens, adjusting the total supply accordingly. The contract tracks the balances of individual token holders using a mapping. The **`mint`** function increases the total supply and adds tokens to an address, while the **`burn`** function decreases the total supply by burning tokens from an address, ensuring sufficient balance before doing so.

## Getting Started

### Installing

* You can my file at Github link: https://github.com/Russingkit/Celeste_Token/blob/main/myToken.sol

### Executing program

* To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

* Here’s a complete step-by-step guide on how to compile, deploy, and interact with your Solidity smart contract, including the necessary code for compilation:

### 1. **Set Up Development Environment**:
   - **Remix IDE** (Online): No installation is required. Visit [remix.ethereum.org](https://remix.ethereum.org).
   - **Local Development** (Optional): Install **Node.js** and use tools like **Hardhat** or **Truffle** for local development.

### 2. **Write/Copy the Contract**:
   - In **Remix**, create a new file (e.g., `MyToken.sol`) and copy your contract code into the file:
   
   ```solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.18;

   contract MyToken {
       // Public variables to store token details
       string public tokenName = "CATIZEN";
       string public tokenAbbrv = "$CATI";
       uint public totalSupply = 0;
       // Mapping to track balances of addresses
       mapping(address => uint) public balances;

       // Mint function to increase total supply and balance
       function mint(address _to, uint _value) public {
           totalSupply += _value;           // Increase total supply
           balances[_to] += _value;         // Increase balance
       }

       // Burn function to decrease total supply and balance
       function burn(address _from, uint _value) public {
           require(balances[_from] >= _value, "You have insufficient balance to burn");
           totalSupply -= _value;           // Decrease total supply
           balances[_from] -= _value;       // Decrease balance
       }
   }
   ```

### 3. **Compile the Contract in Remix**:
   - Go to the **Solidity Compiler** tab (from the left sidebar).
   - Ensure the correct compiler version (`0.8.18`) is selected in the dropdown.
   - Click **Compile MyToken.sol**.

   If you are using a local environment (e.g., Hardhat), create a project and compile using the following commands:
   - Initialize Hardhat:  
     ```bash
     npx hardhat
     ```
   - Create a contracts folder and add `MyToken.sol` in the `contracts/` directory.
   - Then compile the contract:  
     ```bash
     npx hardhat compile
     ```

### 4. **Deploy the Contract**:

#### In Remix:
   - Go to the **Deploy & Run Transactions** tab.
   - Select **Injected Web3** to use MetaMask or **Remix VM** to test locally.
   - Click **Deploy** and confirm the transaction in MetaMask (if using a public testnet or mainnet).

#### In Hardhat (Locally):
   - First, create a script to deploy the contract. Create a file like `deploy.js` inside the `scripts/` folder:
   
     ```javascript
     async function main() {
         const MyToken = await ethers.getContractFactory("MyToken");
         const myToken = await MyToken.deploy();
         console.log("MyToken deployed to:", myToken.address);
     }

     main()
         .then(() => process.exit(0))
         .catch((error) => {
             console.error(error);
             process.exit(1);
         });
     ```

   - Run the deployment script:  
     ```bash
     npx hardhat run scripts/deploy.js --network <network>
     ```

   Replace `<network>` with your target, like `localhost` or `goerli` for a testnet.

### 5. **Interact with the Contract**:

#### In Remix:
   - Once deployed, the contract will appear under "Deployed Contracts."
   - Use the functions:
     - **tokenName**, **tokenAbbrv**, and **totalSupply** can be called to view token details.
     - Use **mint** to add tokens to an address by specifying `_to` and `_value`.
     - Use **burn** to reduce the token balance by specifying `_from` and `_value`.

#### In Hardhat:
   You can write a script to interact with the contract or use Hardhat’s console for direct interaction:
   ```bash
   npx hardhat console --network <network>
   ```
   - Then interact with the contract like this:
   
   ```javascript
   const myToken = await ethers.getContractAt("MyToken", "<deployed_address>");

   // Mint tokens
   await myToken.mint("0xRecipientAddress", 100);

   // Burn tokens
   await myToken.burn("0xHolderAddress", 50);
   ```

### 6. **Test the Contract**:
   - To mint or burn tokens in **Remix**, input the appropriate address and value into the `mint` or `burn` functions and click "Transact."
   - Use the **balances** function to check an address's balance after minting or burning tokens.
   - Ensure that **totalSupply** updates correctly after minting or burning actions.

### 7. **Optional - Deploy to Public Network**:
   - Connect MetaMask to a testnet (e.g., **Goerli**) in Remix.
   - Get testnet ETH from a faucet (e.g., [Goerli Faucet](https://goerlifaucet.com)).
   - Deploy the contract on the testnet and interact with it as described above.

This guide helps you compile, deploy, and interact with your smart contract, whether using Remix or a local development environment.

## Author

Contributors names and contact info

Curt Russel M. Celeste  
[@Curt Russel Celeste](https://www.facebook.com/profile.php?id=100069766380432&mibextid=ZbWKwL)


## License

This project is licensed under the [Curt Russel M. Celeste] License - see the LICENSE.md file for details
