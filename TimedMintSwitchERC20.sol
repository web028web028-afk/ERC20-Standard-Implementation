// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TimedMintSwitchERC20 is ERC20 {
    uint256 public openTime;
    constructor() ERC20("TimedMintSwitch","TMS"){
        openTime=block.timestamp+30 days;
    }
    function mint()public{
        require(block.timestamp>=openTime);
        _mint(msg.sender,200 ether);
    }
}
