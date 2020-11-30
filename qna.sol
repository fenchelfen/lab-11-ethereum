pragma solidity ^0.7.5;
pragma abicoder v2;
contract lab11 {

    string[] public questions;
    string[] private answers;
    
    constructor() public {   // constructor  
        questions.push("Da?");     
        answers.push("Yes"); 
    }
    
    function compareStrings(string memory a, string memory b) private returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
    
    receive() external payable {}

    
    function answer(uint256 question_id, string memory answer) public payable returns (bool) {    
        require( msg.value > .01 ether);
        if (compareStrings(answers[question_id], answer)) {
            msg.sender.transfer(0.01 ether);
            return true;
        } else {
            return false;
        }
    }   
    
    function getQuestions() public view returns (string[] memory) {
      return questions;
  }
    
}

