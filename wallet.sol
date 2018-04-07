pragma solidity ^0.4.21;

import "/owned.sol";

contract SimpleWallet is mortal {

    mapping(address => Permission) myAddressMapping;
    
    event someoneAddedSomeone(address personwhoAdded, address personAllowed, uint hmuchHecanSend);
    event fundSended(address fundSender, address fundReceiver, uint amountSentinWei);
    event personRemovedfromList(address personWhoRemoved, address personNowRemoved);

    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }

    function addAddressToSendersList(address permitted, uint maxTransferAmount) public onlyowner {
        myAddressMapping[permitted] = Permission(true, maxTransferAmount);
        someoneAddedSomeone(msg.sender, permitted, maxTransferAmount);
    }

    function sendFunds(address receiver, uint amountInWei) public {
        require(myAddressMapping[msg.sender].isAllowed);
        require(myAddressMapping[msg.sender].maxTransferAmount >= amountInWei);
        receiver.transfer(amountInWei);
        fundSended(msg.sender, receiver, amountInWei);
    }
    
 
    function removefromSendersList(address removeHim) public onlyowner { //onlyowner ensures only msg.sender can call this 
        
        myAddressMapping[removeHim].isAllowed = false ;
        
        /*Or
        myAddressMapping[removeHim] = Permission(false, 0);
        Or
        delete(myAddressMapping[removeHim]);
        personRemovedfromList(msg.sender, removeHim);
        */
    }

    function () public payable {}

}
