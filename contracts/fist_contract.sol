pragma solidity ^0.8.24;

contract fist_contract {
    
    mapping(address => uint256) private _balances;
    // dono dos fundos => (autorizado => quantia autorizada)
    mapping(address => mapping(address => uint256)) private _allowances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(){
        _balances[msg.sender] = totalSupply();
    }

    function name() public pure returns (string memory) {
        return "fist_contract";
    }

    function symbol() public pure returns (string memory) {
        return "FC";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 10000 * 10 ** decimals();
    }

    // função saldo
    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool){
        require(balanceOf(msg.sender) >= _value, "saldo insuficiente");

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
            require(_allowances[_from][msg.sender] >= _value, " permissao insuficiente");
            require(balanceOf(_from) >= _value, "saldo insuficiente");
            _balances[_from] -= _value;
            _balances[_to] += _value;
            _allowances[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool){
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256){
        return _allowances[_owner][_spender];
    }
}