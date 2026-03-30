// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TransferLimitERC20 is ERC20 {
    mapping(address=>uint256)public dailyCount;
    constructor() ERC20("TransferLimit","TLIMIT"){_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        dailyCount[msg.sender]++;
        require(dailyCount[msg.sender]<=50,"Over limit");
        return super.transfer(t,a);
    }
}
