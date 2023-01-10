import hre, { ethers } from 'hardhat'

async function main() {
  console.log("Hello world", hre.userConfig, hre.network.name)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
});
