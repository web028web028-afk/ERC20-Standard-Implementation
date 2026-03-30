// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract PeriodBurnERC20 is ERC20 {
    constructor() ERC20("PeriodBurn", "PBURN") {_mint(msg.sender,1000000 ether);}
    function autoBurn() public {
        _burn(address(this),balanceOf(address(this)));
    }
}
