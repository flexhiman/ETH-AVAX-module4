# Degen Gaming Token (DegenToken)

Welcome to the Degen Gaming Token project! This project implements an ERC20 token named **Degen** (symbol: **DGN**) to be used within the Degen Gaming platform, allowing players to earn tokens as rewards, transfer them, redeem them for in-game items, and manage their token balances.

## Table of Contents

- [Description](#description)
- [Challenge](#challenge)
- [Tools Used](#tools-used)
- [Smart Contract Features](#smart-contract-features)
- [Bonus Functionality](#bonus-functionality)
- [Verification](#verification)

## Description

Degen Gaming is a renowned game studio that has approached us to create a unique token that rewards players and enhances their gaming experience. The token will be implemented on the Avalanche blockchain, providing fast and low-fee transactions, allowing players to purchase items in an in-game store or trade with others.

## Challenge

The task was to create an ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should include:

- **Minting new tokens:** Only the owner can mint tokens.
- **Transferring tokens:** Players can transfer their tokens to others.
- **Redeeming tokens:** Players can redeem their tokens for items in the in-game store.
- **Checking token balance:** Players can check their token balance at any time.
- **Burning tokens:** Players can burn tokens that they own.
- **Managing in-game items:** The owner can add items to the in-game store.

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

4. **Add Item**
   - **Function:** `addItem(string memory itemName, uint256 itemPrice)`
   - **Description:** Allows the owner to add a new item to the in-game store.

5. **Redeem Tokens**
   - **Function:** `redeem(uint256 itemId)`
   - **Description:** Allows players to redeem tokens for in-game rewards. The amount required for redemption is specified by the item price.

6. **Burn Tokens**
   - **Function:** `burn(uint256 amount)`
   - **Description:** Allows players to burn their tokens, reducing their balance.

## Bonus Functionality

This DegenToken contract includes a bonus system designed to encourage player engagement and reward loyalty. The specifics are as follows:

- **Bonus Threshold:** Players receive a bonus when their token balance reaches **1000 DGN**.
- **Bonus Amount:** Upon reaching this threshold, players are awarded an additional **50 DGN** tokens.

### How It Works

1. **After Minting:** When the owner mints tokens for a player, the contract checks if the new balance qualifies for a bonus. If it does, the bonus is automatically minted and added to the player’s balance.
  
2. **Upon Transfer:** Similarly, after a player transfers tokens, the contract checks the recipient's new balance for eligibility. If the balance exceeds the threshold, the bonus is awarded.

This incentivizes players to engage more actively with the token ecosystem, fostering a thriving in-game economy.

## Verification

After completing the procedures, verify the activities of the deployed address at:  
[Snowtrace Testnet Explorer](https://testnet.snowtrace.io/)

---

This README provides an overview of the Degen Gaming Token project, its features, and how to interact with the smart contract. For further inquiries or contributions, please feel free to reach out!
