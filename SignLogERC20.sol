// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SignLogERC20 is ERC20 {
    event SignedTransfer(address from,address to,uint256 amt);
    constructor() ERC20("SignLog", "SIGN") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        emit SignedTransfer(msg.sender,to,amt);
        return super.transfer(to,amt);
    }
}
