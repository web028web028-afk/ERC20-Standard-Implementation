// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TieredMintERC20 is ERC20 {
    address public superAdmin;
    address public admin;
    constructor() ERC20("TieredMint", "TIER") {
        superAdmin = msg.sender;
        admin = msg.sender;
        _mint(msg.sender, 1000000 ether);
    }
    function mint(address to, uint256 amt) public {
        require(msg.sender == superAdmin || msg.sender == admin, "No permission");
        _mint(to, amt);
    }
}
