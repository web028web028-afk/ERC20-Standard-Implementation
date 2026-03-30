// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TimedMintERC20 is ERC20 {
    uint256 public mintStartTime;
    constructor() ERC20("TimedMint","TMINT"){
        mintStartTime = block.timestamp + 7 days;
    }
    function mint() public {
        require(block.timestamp >= mintStartTime,"Not open");
        _mint(msg.sender,100 ether);
    }
}
