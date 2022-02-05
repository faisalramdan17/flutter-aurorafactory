// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./AuroraRC20.sol";

contract AuroraToken is AuroraRC20 {
    constructor(string memory name, string memory symbol) AuroraRC20(name, symbol) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 1700 * 10**uint(decimals()));
    }
}