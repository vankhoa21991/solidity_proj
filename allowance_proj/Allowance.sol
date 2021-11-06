pragma solidity ^0.5.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/19c74140523e9af5a8489fe484456ca2adc87484/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/19c74140523e9af5a8489fe484456ca2adc87484/contracts/math/SafeMath.sol";

contract allowance is Ownable{
    using SafeMath for uint;
    event allowanceChanched(address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount);
    mapping(address => uint) public allowance;
    
    function addAllowance(address _who, uint _amount) public onlyOwner{
        emit allowanceChanched(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }
    

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    function reduceAllowance(address _who, uint _amount) internal {
        emit allowanceChanched(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        allowance[_who] = allowance[_who].sub(_amount);
    }
}