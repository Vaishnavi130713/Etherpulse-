# Etherpulse


## Project Title
Etherpulse


## Project Description
Etherpulse is a minimal Solidity smart contract that lets users send a "pulse" (a small ETH payment) along with an attached message. Pulses are recorded on-chain and can be inspected by index. The contract owner can withdraw accumulated funds.


## Project Vision
To provide a tiny, user-friendly on-chain tipping / micropayment primitive that can be embedded into websites or dApps for supporters to send a short message and a small amount of Ether.


## Key Features
- `pulse(string message)` — payably send a pulse and save a message on-chain.
- `withdraw()` — owner-only function to withdraw the contract balance.
- `getPulse(uint256 index)` and `getPulseCount()` — read stored pulses.
- `receive()` fallback — accept plain ETH transfers and record them as pulses.
- Minimal, gas-conscious design for easy integration.


## Future Scope
- Add pagination / events indexing helpers for front-end efficiency.
- Add ability for receivers to tip a specific address, or split payments.
- Add meta-transactions / gasless pulses using relayers.
- Add moderation (message length limits) and spam protections.
- Add contract verification on Etherscan in the deploy script.


## How to use
1. Copy `.env.example` to `.env` and fill values.
2. Install dependencies: `npm install`.
3. Compile: `npx hardhat compile`.
4. Deploy: `npx hardhat run scripts/deploy.js --network <network>`.


## Contract address (replace after deploy)
`CONTRACT_ADDRESS_HERE`


## Image
Replace `image.png` in the project root with your project's image. If you intend to show the contract address within an image file name or overlay, replace the placeholder `CONTRACT_ADDRESS_HERE` above after deployment.
 contract address - 0xB6568066bC566F7237e29e0901CD7164B0B32d6F
 ![alt text](image.png)