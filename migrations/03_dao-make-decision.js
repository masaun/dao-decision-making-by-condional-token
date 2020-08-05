const DaoMakeDecision = artifacts.require("DaoMakeDecision");
const ConditionalTokens = artifacts.require("ConditionalTokens");

const _conditionalTokens = ConditionalTokens.address;                       /// Local
//const _conditionalTokens = "0x36bede640D19981A82090519bC1626249984c908";  /// Rinkeby

module.exports = function(deployer) {
    deployer.deploy(DaoMakeDecision, _conditionalTokens);
};
