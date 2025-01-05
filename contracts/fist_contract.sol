pragma solidity ^0.8.24;

contract fist_contract {
    
    mapping(address => uint256) private _balances;

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

}