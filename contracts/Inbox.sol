pragma solidity > 0.5.0;

contract Inbox {
    //Structure
    mapping (string => string) public ipfsInbox;
    //Events
    event ipfsSent(string _ipfsHash, string _address);
    event inboxResponse(string response);
    //Modifiers
    modifier notFull (string memory _string) {
        bytes memory stringTest = bytes(_string);
        require(stringTest.length==0);
        _;
    }
    // An empty constructor that creates an instance of the contract
    constructor() public {}

    //takes in receiver's address and IPFS hash. Places the IPFSaddress in the receivers inbox
    function sendIPFS(string memory _address, string memory _ipfsHash) notFull(ipfsInbox[_address]) public {
        ipfsInbox[_address] = _ipfsHash; // adds to users inbox
        emit ipfsSent(_ipfsHash, _address); // 
    }
    
    //retrieves hash
    function getHash (string memory _address) public view returns (string memory) {
        string memory ipfs_hash = ipfsInbox[_address];
        return ipfs_hash;
    }
}

