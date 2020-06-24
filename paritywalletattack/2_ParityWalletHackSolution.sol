// It is possible to call the wallet with a function which is not present in the wallet
// But is only present in the library, triggering the fallback function in the wallet
// Eg. Calling addOwner function on the wallet.

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
    
    //fallback function. It is possible to call
    function() {
        _walletLibrary.delegatecall(msg.data)
    }

}
