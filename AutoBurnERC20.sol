// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AutoBurnERC20 is ERC20 {
    uint256 public burnRate = 1;
    constructor() ERC20("AutoBurn","ABURN"){_mint(msg.sender,1000000 ether);}
    function transfer(address to,uint256 amt) public override returns(bool){
        uint256 burn = amt*burnRate/100;
        _burn(msg.sender,burn);
        return super.transfer(to,amt-burn);
    }
}
