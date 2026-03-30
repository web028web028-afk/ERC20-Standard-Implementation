// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract EventLogERC20 is ERC20 {
    event TransferLogged(address from,address to,uint256 amt,uint256 time);
    constructor() ERC20("EventToken","EVENT"){_mint(msg.sender,1000000 ether);}
    function transfer(address to,uint256 amt) public override returns(bool){
        emit TransferLogged(msg.sender,to,amt,block.timestamp);
        return super.transfer(to,amt);
    }
}
