// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AutoPoolDistributeERC20 is ERC20 {
    constructor() ERC20("AutoPoolDistribute","APD"){_mint(msg.sender,1000000 ether);}
    function distributePool()public{
        _mint(msg.sender,balanceOf(address(this)));
    }
}
