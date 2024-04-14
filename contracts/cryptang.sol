pragma solidity >=0.4.16 <0.9.0;

contract Cryptang {
    event EtherTransferred(address indexed recipient, uint256 amount, bytes32 indexed txHash);
    event UpdatedMessages(string oldStr, string newStr);

    string public message;

    constructor(string memory initMessage) {
        message = initMessage;
    }

    function update(string memory newMessage) public {
        string memory oldMsg = message;
        message = newMessage;
        emit UpdatedMessages(oldMsg, newMessage);
    }

    // Function to transfer Ether to a specified address
    function transferEther(address payable recipient) external payable {
        // Ensure that the caller has provided enough Ether for the transfer
        require(msg.value > 0, "Amount must be greater than 0");

        // Transfer Ether to the specified recipient
        recipient.transfer(msg.value);

        // Emit an event with the transaction hash
        emit EtherTransferred(recipient, msg.value, keccak256(abi.encodePacked(msg.sender, recipient, msg.value)));
    }
}
