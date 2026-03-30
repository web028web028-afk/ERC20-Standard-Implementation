// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ContractOnlyERC20 is ERC20 {
    constructor() ERC20("ContractOnly", "CONO") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        require(to.code.length > 0,"Only contract");
        return super.transfer(to,amt);
    }
}
