// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract ReceiverWhitelistERC20 is ERC20,Ownable {
    mapping(address=>bool) public allowedReceiver;
    constructor() ERC20("ReceiverWhite","RW"){_mint(msg.sender,1000000 ether);}
    function allowReceiver(address acc,bool val) public onlyOwner {allowedReceiver[acc]=val;}
    function transfer(address to,uint256 amt) public override returns(bool){
        require(allowedReceiver[to],"Not allowed");
        return super.transfer(to,amt);
    }
}
