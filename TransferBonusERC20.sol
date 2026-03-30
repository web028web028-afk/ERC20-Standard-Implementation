// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TransferBonusERC20 is ERC20 {
    mapping(address=>uint256) public count;
    constructor() ERC20("TransferBonus", "TBONUS") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        count[msg.sender]++;
        if(count[msg.sender]%5 == 0) _mint(msg.sender,50 ether);
        return super.transfer(to,amt);
    }
}
