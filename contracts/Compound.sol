pragma solidity 0.7.3;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract Compound {
    using SafeERC20 for IERC20;

    address private _wallet;
    bool private paused;

    address private dollar;
    address private vpegPool;

    function caculator() public {}

    function deposit(uint256 amount) internal {}

    function withdraw(uint256) internal {}

    function togglePaused() internal {}
}
