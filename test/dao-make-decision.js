const DaoMakeDecision = artifacts.require('DaoMakeDecision')
const ConditionalTokens = artifacts.require('ConditionalTokens')
const chai = require('chai')
const assert = chai.assert
chai.use(require('chai-as-promised'))

/// Market Info
const marketConfig = require('../markets.config.js')
console.log('=== marketConfig ===', marketConfig);
console.log('=== marketConfig[0].questionId ===', marketConfig[0].questionId);


contract('DaoMakeDecision', accounts => {
    let daoMakeDecision
    let conditionalTokens

    let _conditionalTokens = ConditionalTokens.address;                       /// Local
    //let _conditionalTokens = "0x36bede640D19981A82090519bC1626249984c908";  /// Rinkeby
    const creator = accounts[0]

    beforeEach(async () => {
        daoMakeDecision = await DaoMakeDecision.new(_conditionalTokens, { from: creator })
        conditionalTokens = await ConditionalTokens.new({ from: creator })
    })

    before(async () => {
        console.log('=== accounts ===\n', accounts);
    })

    it('execute addMemberToOrganization()', async () => {
        const member = accounts[1]
        const memberName = "Test Member"
        const members = await daoMakeDecision.addMemberToOrganization(member, memberName)
        //assert.equal(members, 'HODLNG Token')
    })

    it('execute _prepareCondition()', async () => {
        const member = accounts[1]
        const memberName = "Test Member"
        const members = await daoMakeDecision.addMemberToOrganization(member, memberName)

        const oracle = web3.utils.randomHex(20); 
        const questionId = marketConfig[0].questionId;
        //const questionId = web3.utils.randomHex(32);
        const outcomeSlotCount = web3.utils.toBN(256);

        const condition = await daoMakeDecision._prepareCondition(member, memberName, oracle, questionId, outcomeSlotCount)
    })

})
