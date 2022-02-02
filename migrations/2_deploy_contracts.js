var CreateToken = artifacts.require("CreateToken");

module.exports = function(deployer) {
    deployer.deploy(CreateToken, "SGD Token", "SGDT");
};