// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract FreezeAddressERC20 is ERC20,Ownable {
    mapping(address=>bool) public frozen;
    constructor() ERC20("FreezeToken","FREEZE"){_mint(msg.sender,1000000 ether);}
    function setFrozen(address acc,bool val) public onlyOwner {frozen[acc]=val;}
    function _transfer(address f,address t,uint256 a) internal override {
        require(!frozen[f] && !frozen[t],"Frozen");
        super._transfer(f,t,a);
    }
}
