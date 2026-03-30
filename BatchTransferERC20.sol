// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract BatchTransferERC20 is ERC20 {
    constructor() ERC20("BatchToken","BATCH"){_mint(msg.sender,1000000 ether);}
    function batchTransfer(address[] calldata tos,uint256[] calldata amts) external {
        require(tos.length == amts.length,"Length mismatch");
        for(uint i=0;i<tos.length;i++){
            transfer(tos[i],amts[i]);
        }
    }
}
