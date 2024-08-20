# eth-intermediate

# SimpleVoting Smart Contract

## Overview

The `SimpleVoting` smart contract is a basic voting system implemented in Solidity for use on the Ethereum blockchain. It provides functionality for managing eligible voters, casting votes, and resetting the voting process. The contract ensures that only eligible voters can vote and that each voter can only vote once.

## Features

- **Owner Control**: Only the contract owner can add eligible voters and reset votes.
- **Eligibility and Voting Check**: Ensures that only eligible voters can cast their vote and prevents multiple votes from the same address.
- **Event Logging**: Emits a `Voted` event when a vote is cast.
- **Voting Reset**: Allows the contract owner to reset all votes, preparing for a new voting cycle.

## Contract Functions

### `constructor()`
- **Description**: Sets the deployer of the contract as the owner.
- **Visibility**: `public`

### `addEligibleVoter(address voter)`
- **Description**: Adds an address to the list of eligible voters.
- **Modifiers**: Only callable by the contract owner.
- **Parameters**:
  - `voter`: The Ethereum address of the voter to be added.

### `vote()`
- **Description**: Allows an eligible voter to cast their vote.
- **Modifiers**: Checks that the sender is eligible and has not voted before.
- **Events**: Emits a `Voted` event when a vote is cast.

### `resetVotes()`
- **Description**: Resets all votes and eligible voters.
- **Modifiers**: Only callable by the contract owner.
- **Notes**:
  - Uses `assert` to ensure that `totalVotes` is greater than 0 before resetting.
  - The `for` loop used to clear `hasVoted` mapping is not practical in real scenarios due to Solidity limitations; this loop is provided for illustrative purposes.

## Deployment

1. **Compile the Contract**: Use a Solidity compiler that supports version ^0.8.0.
2. **Deploy**: Deploy the contract to an Ethereum network using tools like Remix, Truffle, or Hardhat.

## Usage

1. **Adding Voters**: Use `addEligibleVoter` to register eligible addresses.
2. **Casting Votes**: Eligible addresses can call `vote` to cast their vote.
3. **Resetting Votes**: Call `resetVotes` to clear all votes and reset the contract.

## Notes

- **Gas Costs**: Be aware of gas costs associated with adding voters, casting votes, and resetting the contract.
- **Practical Considerations**: The `resetVotes` function's `for` loop is not feasible in practice for large sets of voters. This is a demonstration of how it might be implemented, but actual implementations should consider alternative approaches for handling mappings.
  
## Authors

Ashpan Kaushal

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
