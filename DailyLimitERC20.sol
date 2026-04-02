// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DailyLimitERC20 is ERC20 {
    mapping(address => uint256) public dailyTransfer;
    mapping(address => uint256) public lastReset;
    uint256 public maxDaily = 10000 ether;

    constructor() ERC20("DailyLimitToken", "DLIMIT") {
        _mint(msg.sender, 1000000 ether);
    }

    function _resetDaily(address account) internal {
        if (block.timestamp >= lastReset[account] + 1 days) {
            dailyTransfer[account] = 0;
            lastReset[account] = block.timestamp;
        }
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _resetDaily(msg.sender);
        require(dailyTransfer[msg.sender] + amount <= maxDaily, "Over daily limit");
        dailyTransfer[msg.sender] += amount;
        return super.transfer(to, amount);
    }
}
