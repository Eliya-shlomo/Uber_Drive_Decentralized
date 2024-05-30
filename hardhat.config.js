require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.19",
  networks: {
    localhost: {
      url: "http://localhost:8545", // URL of your local test network
      chainId: 1337 // Chain ID of your local test network
    }
  }
};
