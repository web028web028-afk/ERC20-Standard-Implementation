// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AllInOneERC20 is ERC20,Ownable {
    constructor() ERC20("AllInOne","AIO"){_mint(msg.sender,1000000 ether);}
    function mint(address t,uint256 a) public onlyOwner {_mint(t,a);}
    function burn(uint256 a) public {_burn(msg.sender,a);}
}
