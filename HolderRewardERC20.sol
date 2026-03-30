// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HolderRewardERC20 is ERC20 {
    constructor() ERC20("HolderReward", "HREWARD") {
        _mint(msg.sender, 1000000 ether);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        bool success = super.transfer(to, amount);
        uint256 reward = balanceOf(msg.sender) / 200;
        if (reward > 0) _mint(msg.sender, reward);
        return success;
    }
}
