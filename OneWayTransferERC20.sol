// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract OneWayTransferERC20 is ERC20 {
    address public immutable owner;
    constructor() ERC20("OneWay", "ONEWAY") {owner=msg.sender;_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        require(msg.sender == owner,"Only owner send");
        return super.transfer(to,amt);
    }
}
