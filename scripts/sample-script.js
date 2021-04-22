// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy

  const Operator = await hre.ethers.getContractFactory("Operator");
  const operator = await Operator.deploy();
  await operator.deployed();
  console.log("Operator deployed to:", operator.address);

  const Ownable = await hre.ethers.getContractFactory("Ownable");
  const ownable = await Ownable.deploy();
  await ownable.deployed();
  console.log("Ownable deployed to:", ownable.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
