const DaoMakeDecision = artifacts.require('DaoMakeDecision')
const ConditionalTokens = artifacts.require('ConditionalTokens')
const chai = require('chai')
const assert = chai.assert
chai.use(require('chai-as-promised'))


contract('DaoMakeDecision', accounts => {
    let daoMakeDecision
    let conditionalTokens
    let _conditionalTokens = "0x36bede640D19981A82090519bC1626249984c908";  /// Rinkeby
    const creator = accounts[0]

    beforeEach(async () => {
        daoMakeDecision = await DaoMakeDecision.new(_conditionalTokens, { from: creator })
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
})