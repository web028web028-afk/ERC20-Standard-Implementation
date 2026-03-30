// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MintCapERC20 is ERC20,Ownable {
    uint256 public totalMinted;
    uint256 public maxMint = 1000000 ether;
    constructor() ERC20("MintCap","MCAP"){}
    function mint(uint256 amt) public onlyOwner {
        require(totalMinted+amt <= maxMint,"Over cap");
        totalMinted+=amt;
        _mint(msg.sender,amt);
    }
}
