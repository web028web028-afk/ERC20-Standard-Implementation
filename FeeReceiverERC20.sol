// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract FeeReceiverERC20 is ERC20 {
    address public feeReceiver;
    uint256 public fee = 1;
    constructor() ERC20("FeeReceiver","FEE"){
        feeReceiver = msg.sender;
        _mint(msg.sender,1000000 ether);
    }
    function transfer(address to,uint256 amt) public override returns(bool){
        uint256 f = amt*fee/100;
        _transfer(msg.sender,to,amt-f);
        _transfer(msg.sender,feeReceiver,f);
        return true;
    }
}
