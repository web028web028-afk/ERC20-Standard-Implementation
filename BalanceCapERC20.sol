// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract BalanceCapERC20 is ERC20 {
    uint256 public maxBalance = 100000 ether;
    constructor() ERC20("BalanceCap","BCAP"){_mint(msg.sender,1000000 ether);}
    function _transfer(address f,address t,uint256 a) internal override {
        require(balanceOf(t)+a <= maxBalance,"Balance cap");
        super._transfer(f,t,a);
    }
}
