// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract VoteERC20 is ERC20 {
    mapping(uint256=>mapping(address=>bool)) public voted;
    constructor() ERC20("VoteToken","VOTE"){_mint(msg.sender,1000000 ether);}
    function vote(uint256 proposal) external {
        require(balanceOf(msg.sender)>0,"No balance");
        require(!voted[proposal][msg.sender],"Voted");
        voted[proposal][msg.sender]=true;
    }
}
