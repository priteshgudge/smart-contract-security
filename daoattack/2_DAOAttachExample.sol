pragma solidity ^0.4.24;

contract Fundraiser {
    mapping(address=>uint) balances;

    function withdrawCoins(){
    //Vulnerability in this function
      uint withdrawAmount = balances[msg.sender];
      Wallet wallet = Wallet(msg.sender);
      wallet.payout.value(withdrawAmount)(); 
      //Payout is calling a function in the wallet on which we have no control over in the FundRaiser Contract
      // This line could continue calling withdrawCoins as many times over and over till 
      // no more money is left from the fundraiser without ever setting balance to zero
      balances[msg.sender] = 0;

    }

    function getBalance() constant returns (uint) {
        return address(this).balance;
    }

    function contribute() payable {
        balances[msg.sender] += msg.value;
    }

    function() payable {

    }
}

//Wallet with vulnerability expolitation code
contract Wallet {

    Fundraiser fundraiser;

    function Wallet(address fundraiserAddress) {
        fundraiser = Fundraiser(fundraiserAddress);
    }

    function contribute(uint amount) {
        fundraiser.contribute.value(amount)();
    }

    function withdraw(){
        fundraiser.withdrawCoins();
    }

    function getBalance() constant returns (uint) {
        return address(this).balance;
    }

    function payout() payable {
    // We could potentially hack the wallet contract
            
        }
    }

    function() payable {

    }
}
