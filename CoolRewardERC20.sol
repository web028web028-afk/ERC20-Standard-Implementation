// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract CoolRewardERC20 is ERC20 {
    mapping(address=>uint256)public last;
    constructor() ERC20("CoolReward", "CR") {_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        require(block.timestamp>=last[msg.sender]+1 minutes);
        last[msg.sender]=block.timestamp;
        _mint(msg.sender,a/500);
        return super.transfer(t,a);
    }
}
