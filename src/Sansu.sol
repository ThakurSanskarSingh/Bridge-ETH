pragma solidity ^0.8.0;
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Sansu is ERC20 {
    address owner;

    constructor () ERC20("SansuCoin","SANS") {
        owner = msg.sender;
    }

    function mint ( address to ,uint _amount) public {
        require(msg.sender == owner);
        _mint(to,_amount);
    }
    
    // function mintTo (address account , uint256 value) {
    //     _mint(account , value);
    // }
    
}