pragma solidity ^0.5.13;

import "./Allowance.sol";

contract SimpleWallet is allowance{
    event moneySent(address indexed _benificiary, uint _amount);
    event moneyReceived(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract!!");
        if (!isOwner()){
            reduceAllowance(msg.sender, _amount);
        }
        emit moneySent(_to, _amount);
        _to.transfer(_amount);
    }
    
    function renounceOwnership() public onlyOwner{
        revert("Can't renounce ownership here");
    }

    function () external payable {
        emit moneyReceived(msg.sender, msg.value);
    }
}