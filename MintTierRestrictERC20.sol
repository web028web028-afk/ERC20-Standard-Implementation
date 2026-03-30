// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MintTierRestrictERC20 is ERC20 {
    address public highLevel;
    constructor() ERC20("MintTierRestrict","MTR"){
        highLevel=msg.sender;
    }
    function mint(uint256 a)public{
        require(msg.sender==highLevel);
        _mint(msg.sender,a);
    }
}
