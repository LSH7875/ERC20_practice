contract ERC20 {
    function totalSuppply() constant returns (uint totalSupply);
    function balanceOf(address _to, uint _value) returns (uint balance);
    function transfer(address _to, uint _value) returns (bool success);
    function transferFrom(address _from, address _to, uint _value) returns (bool success);
    function approve(address _spneder, uint _value) returns (bool success);
    function allowance(address _owner, address _spender) constant returns (uint remaining);
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}

/**
ERC20 표준 토큰을 사용할 때 주의할 점
ERC20 표준 토큰은 요청한 송금이 실패할 때 예외를 던지지 않고 불리언 값을 반환한다. 
따라서 컨랙트에서 ERC20 표준 토큰의 송금 기능을 사용할 경우 반드시 송금 결과를 확인하고, 송금이 실패하면  revert()함수를 호출해야 한다. 
*/