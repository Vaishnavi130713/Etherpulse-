// scripts/deploy.js
// Usage: npx hardhat run scripts/deploy.js --network <network>


const hre = require("hardhat");
require('dotenv').config();


async function main() {
const Etherpulse = await hre.ethers.getContractFactory("Etherpulse");
console.log("Deploying Etherpulse...");
const etherpulse = await Etherpulse.deploy();
await etherpulse.deployed();


console.log("Etherpulse deployed to:", etherpulse.address);
console.log("Update your README.md and image (if you embed the address in an image file name) with the contract address:");
console.log(etherpulse.address);
}


main().catch((error) => {
console.error(error);
process.exitCode = 1;
});