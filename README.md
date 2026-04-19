# ERC20-Standard-Implementation
基于 Solidity 语言实现的简洁、安全且完全合规的 ERC20 代币标准方案。

## 核心特性
✅ 严格遵循ERC20 (EIP-20) 标准规范  
✅ 无冗余代码，便于审计和二次开发  
✅ 包含基础测试用例（如Remix/Foundry/Hardhat测试）  
✅ 兼容主流EVM链（Ethereum、BSC、Polygon等）  

## 快速使用
1. 克隆仓库：`git clone https://github.com/web028web028-afk/ERC20-Standard-Implementation.git`  
2. 编译合约：使用Hardhat/Foundry/Truffle编译`ERC20.sol`  
3. 部署：参考`deploy/`目录下的部署脚本  

## 合约核心接口
- `totalSupply()`: 查询总发行量  
- `balanceOf(address)`: 查询地址余额  
- `transfer(address, uint256)`: 转账  
- `approve(address, uint256)`: 授权  
- `transferFrom(address, address, uint256)`: 授权转账  

## 审计说明
本合约为基础实现，生产环境使用前建议完成第三方安全审计。
