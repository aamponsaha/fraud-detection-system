// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// This source is detecting fraud in Health Insurance Claims processing 
// using the extracted knowledge from Machine Learning (Decision tree)
contract FraudPreventionSystem {
    bool stat; // This variable stores the status of the claims data being submitted
    bool stat2; 

    struct ClaimData{
        uint256 n1;
        uint256 n2;
        uint256 n3;
        uint256 n4;
        uint256 n5;
        uint256 amount;
        }

    ClaimData [] claimData;

// This is the function which collects the claims data from the users of the system.
// It is the component 5 of the generic framework
    function collectdata (uint256 _n1, uint256 _n2, uint256 _n3, uint256 _n4, uint256 _n5, 
                            uint256 _amount) public{
        claimData.push(ClaimData(_n1, _n2, _n3, _n4, _n5, _amount));

// This section is the decision making module (Component 3) of the generic framework
// The implemented classification rules and the extracted knowledge.

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
        
        if ((_n2 == 1 && _amount > 48) || (_n2 == 1 && _amount > 23)){
            stat2 = true;
        }
        else {stat2 = false;}
}

// This function displays the fraudulent status of the submitted claims data using the
// extracted knowledge
    function validate () public view returns (bool){
        return stat;
        
    }
// This function displays the fraudulent status of the submitted claims data using samples
// of the classification rules
    function validate2() public view returns (bool){
        return stat2;
    }
    
}