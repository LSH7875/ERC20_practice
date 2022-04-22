pragma solidity ^0.4.16;

contract SecureGeneralWalletCompatibleToken{
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
            if (balnceOf[msg.sender] < _value) revert();
            //revert(): 예외가 발생하면서 전체 트랜잭션이 실패하고 트랜잭션에서 발생한 변경 내용이 트랜잭션 실행 이전으로 되돌린다. 
            //return을 하면 토큰 전송이 실패해도 전체 트랜잭션은 성공적으로 처리되기 때문에 데이터의 불일치가 발생할 수 있다.
            //revert()는 revert()를 실행한 시점까지 소모한 가스만 마이너에게 지급하고 나머지는 트랜잭션을 요청한 송신자에게 반환되도록 개선되었다. 
            //sned, call, delegatecall, callcode의 반환값이 거짓이면 이전 상태로 되돌리기 위해서 revert()를 호출해야 한다.  
            balanceOf[msg.sender] -= _value;
            if (balanceOf[_to] + _value < balanceOf[_to]) revert();
            balanceOf[_to] += _value;
            emit Transfer(msg.sneder, _to, _value);
        }
}
//문제: EOA가 컨트랙트의 transfer 함수를 바로 부르는 경우는 안전하지만,
//다른 컨트랙트에서 transfer함수를 부를 때 문제가 발생할 수 있다. 

//  
