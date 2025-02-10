pragma solidity ^0.8.0;
import {Ownable} from "node_modules/@openzeppelin/contracts/access/Ownable.sol"
import {IERC20} from "node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BridgeETH is Ownable {

    uint256 public balance ;
    address public tokenAddress;

    event Locked(address indexed depositor , uint amount);

    mapping (address => uint256) public pendingBalance;


    constructor (address _tokenAddress)  Ownable(msg.sender) {
        tokenAddress = _tokenAddress;       
    }

    function lock(IERC20 _tokenAddress , uint256 amount) public {
        require(address(_tokenAddress) == tokenAddress); //check the tooken that person wants to lock is sane as suppoerted by contact
        require(_tokenAddress.allowance(msg.sender,address(this)) >= _amount);
        //check if the amount to be locked is greater than the approved amount
        require(_tokenAddress.transferFrom(msg.sender,address(this), _amount));
        emit lock(msg.sender,_amount);

    }

    function unlock(IERC20 _tokenAddress  ,uint256 _amount) public {
        require(address(_tokenAddress) == tokenAddress);
        require(pendingBalance[msg.sender] >= _amount);
        pendingBalance[msg.sender] -= amount;
        _tokenAddress.transfer(msg.sender,_amount);
    }

    function burnedOnAnotherSide (address userAccount , uint256 _amount) public onlyOwner  {
        pendingBalance[userAccount] += _amount;


    }
    //this address has burned this  much amoutn on other side , we are storing that state 

    
}