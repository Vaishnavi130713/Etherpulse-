// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherPulse {
    // Structure to store a pulse
    struct Pulse {
        address sender;
        uint256 timestamp;
        string message; // Optional message for the pulse
    }

    // Mapping from pulse ID to pulse details
    mapping(uint256 => Pulse) private pulses;
    uint256 private nextPulseId = 1;

    // Event emitted when a new pulse is sent
    event PulseSent(uint256 indexed pulseId, address indexed sender, uint256 timestamp, string message);

    // Function to send a new pulse
    function sendPulse(string memory message) external {
        pulses[nextPulseId] = Pulse({
            sender: msg.sender,
            timestamp: block.timestamp,
            message: message
        });

        emit PulseSent(nextPulseId, msg.sender, block.timestamp, message);
        nextPulseId++;
    }

    // Function to view a pulse by its ID
    function viewPulse(uint256 pulseId) external view returns (address sender, uint256 timestamp, string memory message) {
        Pulse memory pulse = pulses[pulseId];
        require(pulse.timestamp != 0, "Pulse does not exist");
        return (pulse.sender, pulse.timestamp, pulse.message);
    }

    // Function to get the total number of pulses sent
    function totalPulses() external view returns (uint256) {
        return nextPulseId - 1;
    }
}
