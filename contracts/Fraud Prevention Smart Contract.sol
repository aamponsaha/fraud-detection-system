// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FraudPreventionSystem {
    bool stat;

    struct ClaimData{
        uint256 n1;
        uint256 n2;
        uint256 n3;
        uint256 n4;
        uint256 n5;
        uint256 amount;
        }

    ClaimData [] claimData;

    function collectdata (uint256 _n1, uint256 _n2, uint256 _n3, uint256 _n4, uint256 _n5, 
                            uint256 _amount) public{
        claimData.push(ClaimData(_n1, _n2, _n3, _n4, _n5, _amount));

        if (_n1 == 0 && _n2 == 0 && _n3 == 0 && _n4 == 0 && _n5 == 0){
                stat = false;
        }
        else if (_n1 != 0 || _n2 != 0 || _n3 != 0 || _n4 != 0 || _n5 != 0) {
        
                if((_n1 != 0 || _n2 != 0 || _n3 != 0 || _n4 != 0 || _n5 != 0) && (((_n1 == _n2) && ((_n1 !=0) || (_n2 !=0))) || ((_n1 == _n3) && ((_n1 !=0) || (_n3 !=0)))  || ((_n1 == _n4) && ((_n1 !=0) || (_n4 !=0))) || ((_n1 == _n5) && ((_n1 !=0) || (_n5 !=0))) || ((_n2 == _n3) && ((_n2 !=0) || (_n3 !=0))) || ((_n2 == _n4) && ((_n2 !=0) || (_n4 !=0))) || ((_n2 == _n5) && ((_n2 !=0) || (_n5 !=0))) || ((_n3 == _n4) && ((_n3 !=0) || (_n4 !=0))) || ((_n3 == _n5) && ((_n3 !=0) || (_n5 !=0))) || ((_n4 == _n5) && ((_n4 !=0) || (_n5 !=0))))){
                        stat = true;
                } 
                else {
                stat = false;
        }
        } 
}

    function validate () public view returns (bool){
        return stat;
    }
    
}