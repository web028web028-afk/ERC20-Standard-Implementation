// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract FaucetERC20 is ERC20 {
    mapping(address => uint256) public lastClaim;
    uint256 public claimInterval = 1 days;
    uint256 public claimAmount = 100 ether;
    constructor() ERC20("FaucetToken", "FAUCET") {}
    function claim() public {
        require(block.timestamp >= lastClaim[msg.sender] + claimInterval, "Wait");
        lastClaim[msg.sender] = block.timestamp;
        _mint(msg.sender, claimAmount);
    }
}
