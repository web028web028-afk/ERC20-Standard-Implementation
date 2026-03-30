// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract RandomBonusERC20 is ERC20 {
    constructor() ERC20("RandomBonus", "RBONUS") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp,msg.sender)))%5;
        if(rand == 0) _mint(msg.sender, amt/200);
        return super.transfer(to,amt);
    }
}
