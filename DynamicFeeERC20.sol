// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DynamicFeeERC20 is ERC20, Ownable {
    uint256 public feePercent = 1;

    constructor() ERC20("DynamicFee", "DYNFEE") {
        _mint(msg.sender, 1000000 ether);
    }

    function setFee(uint256 newFee) external onlyOwner {
        require(newFee <= 5, "Too high");
        feePercent = newFee;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        uint256 fee = amount * feePercent / 100;
        _transfer(msg.sender, address(this), fee);
        return super.transfer(to, amount - fee);
    }
}
