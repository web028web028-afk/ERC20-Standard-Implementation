// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SnapshotERC20 is ERC20 {
    mapping(address=>uint256) public snapshot;
    constructor() ERC20("Snapshot", "SNAP") {_mint(msg.sender,1000000 ether);}
    function takeSnapshot() public {
        snapshot[msg.sender] = balanceOf(msg.sender);
    }
}
