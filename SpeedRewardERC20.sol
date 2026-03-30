// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SpeedRewardERC20 is ERC20 {
    constructor() ERC20("SpeedReward", "SPEED") {_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        if(block.timestamp%5==0)_mint(msg.sender,a/200);
        return super.transfer(t,a);
    }
}
