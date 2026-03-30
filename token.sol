// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleERC20WithBlackHole is ERC20, Ownable {
    // 固定黑洞地址（代币转入此地址即完成蒸发/销毁）
    address public immutable BLACK_HOLE = 0x000000000000000000000000000000000000dEaD;

    // 构造函数：初始化代币名称、符号、初始发行量
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply_
    ) ERC20(name_, symbol_) Ownable(msg.sender) {
        _mint(msg.sender, initialSupply_ * 10 ** decimals()); // 适配小数位
    }

    // 铸币功能（仅合约所有者调用）
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }

    // 代币蒸发：将指定数量代币转入黑洞地址（任意用户可调用）
    function burnToBlackHole(uint256 amount) external {
        uint256 amountWithDecimals = amount * 10 ** decimals();
        require(balanceOf(msg.sender) >= amountWithDecimals, "Insufficient balance");
        _transfer(msg.sender, BLACK_HOLE, amountWithDecimals);
    }
}