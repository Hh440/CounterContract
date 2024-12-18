// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Coin is ERC20 {

      uint256 public number;

    constructor() ERC20("Coin", "CON") {}
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
    
}
