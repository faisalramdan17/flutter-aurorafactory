var ERC20Factory = artifacts.require("ERC20Factory");

module.exports = function(deployer) {
    deployer.deploy(ERC20Factory);
};