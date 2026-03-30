// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DailyMintERC20 is ERC20 {
    mapping(address=>uint256) public lastDaily;
    uint256 public dailyAmt = 100 ether;
    constructor() ERC20("DailyMint","DAILY"){}
    function dailyMint() external {
        require(block.timestamp >= lastDaily[msg.sender]+1 days,"Wait 1d");
        lastDaily[msg.sender] = block.timestamp;
        _mint(msg.sender,dailyAmt);
    }
}
