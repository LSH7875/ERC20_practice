pragma solidity ^0.4.16;

contract CrowdFundWithUnsecureToken {
    UnsecureGeneralWalletCompatibleToken3 tokenReward;
    uint transferCount public;

    function transfer() external {
        transferCount++;
        tokenReward.transfer(msg.sender,10);
    }
}