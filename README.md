# Degen Gaming Token (DegenToken)

Welcome to the Degen Gaming Token project! This project implements an ERC20 token named **Degen** (symbol: **DGN**) to be used within the Degen Gaming platform, allowing players to earn tokens as rewards, transfer them, redeem them for in-game items, and manage their token balances.

## Table of Contents

- Description
- Challenge
- Tools Used
- Smart Contract Features
  

## Description

Degen Gaming is a renowned game studio that has approached us to create a unique token that rewards players and enhances their gaming experience. The token will be implemented on the Avalanche blockchain, providing fast and low-fee transactions, allowing players to purchase items in an in-game store or trade with others.

## Challenge

The task was to create an ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should include:

- **Minting new tokens:** Only the owner can mint tokens.
- **Transferring tokens:** Players can transfer their tokens to others.
- **Redeeming tokens:** Players can redeem their tokens for items in the in-game store.
- **Checking token balance:** Players can check their token balance at any time.
- **Burning tokens:** Anyone can burn tokens that they own.

## Tools Used

- Computer
- NodeJS
- Hardhat
- Solidity

## Smart Contract Features

### `DegenToken` Contract

- **Name:** Degen
- **Symbol:** DGN

### Functions

1. **Mint Tokens**
   - **Function:** `mint(address to, uint256 amount)`
   - **Description:** Allows the owner to mint new tokens to a specified address. If the recipient exceeds the bonus threshold, they receive a bonus.

2. **Transfer Tokens**
   - **Function:** `transfer(address recipient, uint256 amount)`
   - **Description:** Allows players to transfer their tokens to other players. If the recipient exceeds the bonus threshold, they receive a bonus.

3. **Check Balance**
   - **Function:** `getBalance()`
   - **Description:** Returns the token balance of the caller.

4. **Redeem Tokens**
   - **Function:** `redeem(uint rewardCategory)`
   - **Description:** Allows players to redeem tokens for in-game rewards. The amount required for redemption is passed as a parameter.

5. **Burn Tokens**
   - **Function:** `burn(uint amount)`
   - **Description:** Allows players to burn their tokens, reducing their balance.
  
  ### After completion of these procedure verify it by checking the activities of the deployed address.
