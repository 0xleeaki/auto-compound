pragma solidity 0.7.3;

contract Ownable {
    address private _owner;

    event OwnershipTranserfer(
        address indexed currentOwner,
        address indexed newOwner
    );

    constructor() {
        _owner = msg.sender;
        emit OwnershipTranserfer(address(0), msg.sender);
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not owner");
        _;
    }

    function tranferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is zero address");
        require(newOwner != _owner, "Owable: new owner not change");
        emit OwnershipTranserfer(_owner, newOwner);
        _owner = newOwner;
    }
}
