// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract FeeDividendERC20 is ERC20 {
    constructor() ERC20("FeeDividend","FDIV"){_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        _transfer(msg.sender,address(this),a/100);
        return super.transfer(t,a-a/100);
    }
    function claimDividend()public{
        _transfer(address(this),msg.sender,balanceOf(address(this))/100);
    }
}
