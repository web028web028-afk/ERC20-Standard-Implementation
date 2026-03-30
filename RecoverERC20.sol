// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RecoverERC20 is ERC20, Ownable {
    constructor() ERC20("RecoverToken", "RECOVER") {
        _mint(msg.sender, 1000000 ether);
    }

    function recoverNative() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
