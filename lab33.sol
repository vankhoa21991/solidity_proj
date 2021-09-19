pragma solidity ^0.5.13;

contract StartStopUpdateExample {
    function sendMoney() public payable {

    }

    function withdrawAllMonay( address payable _to) public {
        _to.transfer(address(this).balance);
    }
}