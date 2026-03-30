// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AmountLogERC20 is ERC20 {
    event Amount(uint256 amt);
    constructor() ERC20("AmountLog", "AMLOG") {_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        emit Amount(a);
        return super.transfer(t,a);
    }
}
