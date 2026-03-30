// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DataLogERC20 is ERC20 {
    event DataLogged(string data);
    constructor() ERC20("DataToken","DATA"){_mint(msg.sender,1000000 ether);}
    function logData(string calldata data) external {
        emit DataLogged(data);
    }
}
