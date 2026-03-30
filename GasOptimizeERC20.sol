// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract GasOptimizeERC20 is ERC20 {
    constructor() ERC20("GasOptimize", "GAS") {_mint(msg.sender,1000000 ether);}
    function fastTransfer(address t,uint256 a)public returns(bool){
        _transfer(msg.sender,t,a);
        return true;
    }
}
