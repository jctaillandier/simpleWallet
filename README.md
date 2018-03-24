# simpleWallet
My first basic wallet accepting incoming and outgoing transactions, written and tested using Remix' Solidity IDE.

'Owned' function modifier insures only owner of contract can call the functions within it.

'mortal' modifier allows suicide (kill) function, which transfers all remaining funds in contract to the owner
