pragma solidity ^0.4.0;

contract Token {
    address issuer;
    mapping (address => uint) balances;

    event Issue(address account, uint amount);
    event Transfer(address from, address to, uint amount);

    function Token() {
        issuer = msg.sender;
    }

    function issue(address account, uint amount) {
        log1(bytes32(msg.sender), bytes32('msg.sender'));
        log1(bytes32(issuer), bytes32('issuer'));
        if (msg.sender != issuer) throw;
        balances[account] += amount;
        Issue(account, amount);
    }

    function transfer(address to, uint amount) {
        if (balances[msg.sender] < amount) throw;

        balances[msg.sender] -= amount;
        balances[to] += amount;

        Transfer(msg.sender, to, amount);
    }

    function getBalance(address account) constant returns (uint) {
        return balances[account];
    }
}
