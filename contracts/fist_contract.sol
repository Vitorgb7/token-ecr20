pragma solidity ^0.8.24;

contract fist_contract {
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

    
}