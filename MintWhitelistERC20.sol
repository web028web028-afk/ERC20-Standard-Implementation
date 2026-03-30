// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MintWhitelistERC20 is ERC20,Ownable {
    mapping(address=>bool) public canMint;
    constructor() ERC20("MintWhite","MW"){canMint[msg.sender]=true;}
    function setMinter(address acc,bool val) public onlyOwner {canMint[acc]=val;}
    function mint(uint256 amt) public {
        require(canMint[msg.sender],"No");
        _mint(msg.sender,amt);
    }
}
