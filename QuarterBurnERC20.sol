// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract QuarterBurnERC20 is ERC20 {
    constructor() ERC20("QuarterBurn", "QBURN") {_mint(msg.sender,1000000 ether);}
    function burnQuarter()public{
        _burn(msg.sender,balanceOf(msg.sender)/100);
    }
}
