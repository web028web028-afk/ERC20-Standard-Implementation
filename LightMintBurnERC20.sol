// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract LightMintBurnERC20 is ERC20 {
    constructor() ERC20("LightMB","LMB"){_mint(msg.sender,1000000 ether);}
    function mint(uint256 a) public {_mint(msg.sender,a);}
    function burn(uint256 a) public {_burn(msg.sender,a);}
}
