// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AirdropBaseERC20 is ERC20 {
    constructor() ERC20("AirdropToken","AIR"){_mint(msg.sender,1000000 ether);}
    function airdrop(address[] calldata tos,uint256 amt) public onlyOwner {
        for(uint i=0;i<tos.length;i++){
            transfer(tos[i],amt);
        }
    }
}
