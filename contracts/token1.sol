pragma solidity ^0.4.16;

contract UnsecureGeneralWalletCompatibleToken2 {
        string public name;
        string public symbol;
        uint8 public decimals;

        mapping (address =>uint256) balanceOf;

        event Transfer(address _from, address _to, uint _value);

        function UnsecureGeneralWalletCompatibleToken2(string tokenName, string tokenSymbol, uint8 decimalUnits, uint256 initialSupply) public {
            name = tokenName;
            symbol = tokenSymbol;
            decimals = decimalUnits;
            balanceOf[msg.sender] = initialSupply;
        }

        function trnasfer(address _to, uint256 _value) public {
            if (balnceOf[msg.sender] < _value) return;
            balanceOf[msg.sender] -= _value;
            if (balanceOf[_to] + _value < balanceOf[_to]) return;
            balanceOf[_to] += _value;
            emit Transfer(msg.sneder, _to, _value);
        }
}