pragma solidity ^0.4.21;

contract owned{
    address owner;
    
    modifier onlyowner() {
        if (owner == msg.sender){
            _;
        }
        else{
            throw;
        }
    }
}    
contract mortal is owned{
    
    function kill() {
        if( owner == msg.sender){
            selfdestruct(owner);
        }
    }
}
