const Oracle = artifacts.require("Oracle.sol");
const Consumer = artifacts.require("Consumer.sol");

module.exports = async function(deployer, _network, accounts) {
  const admin = accounts[0];
  const reporter = accounts[1];

  await deployer.deploy(Oracle, admin);
  const oracle = await Oracle.deployed();
  await oracle.updateReporter(reporter, true);
  deployer.deploy(Consumer, oracle.address);
};
