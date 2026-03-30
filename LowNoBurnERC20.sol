// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract LowNoBurnERC20 is ERC20 {
    constructor() ERC20("LowNoBurn", "LNB") {_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        if(a>1000 ether)_burn(msg.sender,a/100);
        return super.transfer(t,a);
    }
}
