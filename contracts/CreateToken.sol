// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CreateToken is ERC20 {

    // string public name = "TutorialToken";
    // string public symbol = "TT";
    // uint8 public decimals = 18;
    uint256 public initialSupply = 1700;

    // constructor() public {
    //     _mint(msg.sender, totalSupply);
    // }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, initialSupply * 10**uint(decimals()));
    }
}