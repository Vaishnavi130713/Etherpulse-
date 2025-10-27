// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Etherpulse — send a pulse (micropayment + message) to the contract
/// @notice Minimal contract with core functions: pulse, withdraw, getPulse, getPulseCount
contract Etherpulse {
    address public owner;
    uint256 public pulseCount;

    struct Pulse {
        address from;
        uint256 amount;
        uint256 timestamp;
        string message;
    }

    Pulse[] private pulses;

    event NewPulse(address indexed from, uint256 amount, uint256 timestamp, string message);
    event Withdraw(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Send a pulse to the contract. Include an optional message.
    /// @dev payable — sender must send ETH
    /// @param _message A short message attached to the pulse
    function pulse(string calldata _message) external payable {
        require(msg.value > 0, "Pulse value must be > 0");

        pulses.push(Pulse({
            from: msg.sender,
            amount: msg.value,
            timestamp: block.timestamp,
            message: _message
        }));

        pulseCount += 1;
        emit NewPulse(msg.sender, msg.value, block.timestamp, _message);
    }

    /// @notice Withdraw entire contract balance to owner
    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        (bool success, ) = owner.call{value: balance}("");
        require(success, "Withdraw failed");

        emit Withdraw(owner, balance);
    }

    /// @notice Get total pulse count
    function getPulseCount() external view returns (uint256) {
        return pulseCount;
    }

    /// @notice Read a pulse by index (0-based)
    /// @param _index Index of pulse
    function getPulse(uint256 _index) external view returns (
        address from,
        uint256 amount,
        uint256 timestamp,
        string memory message
    ) {
        require(_index < pulses.length, "Index out of bounds");
        Pulse storage p = pulses[_index];
        return (p.from, p.amount, p.timestamp, p.message);
    }

    /// @notice Fallback to accept plain ETH
    receive() external payable {
        pulses.push(Pulse({
            from: msg.sender,
            amount: msg.value,
            timestamp: block.timestamp,
            message: ""
        }));
        pulseCount += 1;
        emit NewPulse(msg.sender, msg.value, block.timestamp, "");
    }
}
