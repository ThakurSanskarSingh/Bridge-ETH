pragma solidity ^0.8.0;

import {Ownable} from "node_modules/@openzeppelin/contracts/access/Ownable.sol"

contract BridgeBase() is Ownable {
   

 constructor (address _tokenAddress)  Ownable(msg.sender) {
        tokenAddress = _tokenAddress;
       
    }
function mint() public {

}
function burn () public {

} 

function depositedOnAnotherSide () public {


}
}