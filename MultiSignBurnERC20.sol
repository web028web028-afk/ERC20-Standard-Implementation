// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MultiSignBurnERC20 is ERC20 {
    address public a1; address public a2;
    constructor() ERC20("MultiBurn","MB"){
        a1=msg.sender; a2=0x1111000000000000000000000000000000001111;
        _mint(msg.sender,1000000 ether);
    }
    function burn(uint256 amt) public {
        require(msg.sender==a1||msg.sender==a2,"No");
        _burn(msg.sender,amt);
    }
}
