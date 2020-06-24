// Try to look for potential hack points
// It includes concepts of delegate call and fallback function
// It is possible to take ownership of a wallet and drain funds

contract Library {
    function initWallet() {
        // code
    }

    function addOwner(address owner) {
        // code
    }

    function isOwner(address _addr) constant returns (bool) {
        // code
    }
}

contract Wallet {
   function isOwner(address _addr) constant returns (bool) {
       return _walletLibrary.delegatecall(msg.data);
   }

    function() {
        _walletLibrary.delegatecall(msg.data)
    }

}
