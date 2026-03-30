// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract BlacklistMintERC20 is ERC20,Ownable {
    mapping(address=>bool) public blacklist;
    constructor() ERC20("BlacklistMint","BLMINT"){_mint(msg.sender,1000000 ether);}
    function setBlacklist(address acc,bool val) public onlyOwner {blacklist[acc]=val;}
    function mint(address to,uint256 amt) public onlyOwner {
        require(!blacklist[to],"Blacklisted");
        _mint(to,amt);
    }
}
