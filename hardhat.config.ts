import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import '@nomiclabs/hardhat-etherscan'
import '@nomicfoundation/hardhat-chai-matchers'
import '@typechain/hardhat'
import 'hardhat-gas-reporter'
import '@openzeppelin/hardhat-upgrades'
import 'solidity-coverage'

const config: HardhatUserConfig = {
  solidity: "0.8.17",
};

export default config;
