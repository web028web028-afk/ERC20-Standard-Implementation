// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract FixedRateMintERC20 is ERC20 {
    constructor() ERC20("FixedRateMint", "FRM") {}
    function mint()public payable{
        _mint(msg.sender,msg.value*1000);
    }
}
