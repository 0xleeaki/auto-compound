pragma solidity 0.7.3;

import "./Ownable.sol";

contract Operator is Ownable {
    address private _operator;

    constructor() {
        _operator = msg.sender;
    }

    event OperatorTransfer(
        address indexed currentOperator,
        address indexed newOperator
    );

    function operator() public view returns (address) {
        return _operator;
    }

    function isOperator() public view returns (bool) {
        return _operator == msg.sender;
    }

    modifier onlyOperator() {
        require(_operator == msg.sender, "Operator: caller is not operator");
        _;
    }

    function _transferOperator(address newOperator) internal {
        require(
            newOperator != address(0),
            "Operator: new owner is the zero address"
        );
        _operator = newOperator;
        emit OperatorTransfer(_operator, newOperator);
    }

    function transferOperator(address _newOperator) public onlyOwner {
        _transferOperator(_newOperator);
    }
}
