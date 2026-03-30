// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract FixedPoolERC20 is ERC20 {
    constructor() ERC20("FixedPool", "FP") {_mint(msg.sender,1000000 ether);}
    function addFee() public {_mint(address(this), 1000 ether);}
    function claimPool() public {_transfer(address(this), msg.sender, 100 ether);}
}
