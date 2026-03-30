// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardERC20 is ERC20 {
    constructor() ERC20("Reward Token", "REWARD") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        uint256 reward = amount / 100;
        _transfer(msg.sender, to, amount - reward);
        _mint(msg.sender, reward);
        return true;
    }
}
