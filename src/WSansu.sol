pragma solidity ^0.8.0;
import {ERC20} from "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract WSansu is ERC20 {
    address owner;

    constructor () ERC20("WSansuCoin","WSANS") {
        owner = msg.sender;
    }

    function mint (address _to ,uint _amount) public {
        require(msg.sender == owner);
        _mint(_to,_amount);
    }
    
    // function mintTo (address account , uint256 value) {
    //     _mint(account , value);
    // }
    function burn (address _to, uint amount) public {
         require(msg.sender == owner);
         _burn(_to,amount);

    }


}