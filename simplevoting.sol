// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public owner;
    mapping(address => bool) public eligibleVoters;
    mapping(address => bool) public hasVoted;
    uint256 public totalVotes;

    event Voted(address voter);

    constructor() {
        owner = msg.sender;
    }

    // Function to add an eligible voter
    function addEligibleVoter(address voter) public {
        require(msg.sender == owner, "Only the owner can add eligible voters");
        eligibleVoters[voter] = true;
    }

    // Function to vote
    function vote() public {
        // Ensure the voter is eligible
        require(eligibleVoters[msg.sender], "You are not eligible to vote");
        // Ensure the voter has not voted before
        require(!hasVoted[msg.sender], "You have already voted");

        hasVoted[msg.sender] = true;
        totalVotes += 1;

        emit Voted(msg.sender);
    }

    // Function to reset votes
    function resetVotes() public {
        // Only the owner can reset the votes
        if (msg.sender != owner) {
            revert("Only the owner can reset the votes");
        }

        // Ensure all votes are reset properly
        assert(totalVotes > 0);

        totalVotes = 0;
        for (address voter = address(0); voter <= address(type(uint160).max); ) {
            if (hasVoted[voter]) {
                hasVoted[voter] = false;
            }
        }
    }
}
