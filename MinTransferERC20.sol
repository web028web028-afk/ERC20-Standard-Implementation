// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MinTransferERC20 is ERC20 {
    uint256 public minTransfer = 10 ether;
    constructor() ERC20("MinTransfer","MIN"){_mint(msg.sender,1000000 ether);}
    function transfer(address to,uint256 amt) public override returns(bool){
        require(amt >= minTransfer,"Too small");
        return super.transfer(to,amt);
    }
}
