// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Define a struct for items
    struct Item {
        uint256 itemId;
        string itemName;
        uint256 itemPrice;
    }

    // State variables
    uint256 public constant bonusThreshold = 1000; // Bonus threshold in tokens
    uint256 public constant bonusAmount = 50;      // Bonus amount in tokens
    mapping(uint256 => Item) public items;         // Mapping of items
    uint256 public itemCount;                      // Counter for items
    mapping(address => mapping(uint256 => bool)) public redeemedItems; // Tracking redeemed items

    // Events
    event RedeemToken(address account, uint256 rewardCategory);
    event BurnToken(address account, uint256 amount);
    event TransferToken(address from, address to, uint256 amount);
    event BonusAwarded(address account, uint256 amount);
    event ItemAdded(uint256 itemId, string itemName, uint256 itemPrice);
    event ItemRedeemed(address account, uint256 itemId, string itemName, uint256 itemPrice);

    // Constructor
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
    }

    // Mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        checkAndRewardBonus(to); // Check if the recipient is eligible for a bonus after minting
    }

    // Override transfer function
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount); // Use _transfer to handle the balance and supply changes
        checkAndRewardBonus(recipient); // Check if the recipient is eligible for a bonus
        emit TransferToken(_msgSender(), recipient, amount); // Emit Transfer event
        return true;
    }

    // Check and reward bonus tokens
    function checkAndRewardBonus(address account) internal {
        if (balanceOf(account) >= bonusThreshold) {
            _mint(account, bonusAmount); // Mint bonus tokens to the user's account
            emit BonusAwarded(account, bonusAmount); // Emit event for awarded bonus
        }
    }

    // Get balance of the sender
    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Function to add a new item
    function addItem(string memory itemName, uint256 itemPrice) external onlyOwner {
        itemCount++;
        items[itemCount] = Item(itemCount, itemName, itemPrice);
        emit ItemAdded(itemCount, itemName, itemPrice);
    }

    // Function to redeem an item using tokens
    function redeem(uint256 itemId) public {
        require(itemId > 0 && itemId <= itemCount, "Invalid item ID");
        Item memory redeemedItem = items[itemId];
        
        require(balanceOf(msg.sender) >= redeemedItem.itemPrice, "Insufficient amount to redeem item");
        require(!redeemedItems[msg.sender][itemId], "Item already redeemed");

        // Burn the required tokens
        burn(redeemedItem.itemPrice);
        redeemedItems[msg.sender][itemId] = true; // Mark item as redeemed
        
        emit ItemRedeemed(msg.sender, itemId, redeemedItem.itemName, redeemedItem.itemPrice);
    }

    // Burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit BurnToken(msg.sender, amount);
    }
}
