pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract SampleNFTContract is ERC721 {
    uint256 public tokenCounter;
    uint256 public maxSupply = 3;

    //constructor for an ERC721 is a name and symbol
    constructor () public ERC721 ("Next Chapter", "NEXT") {
        tokenCounter = 0;
    }

    function _baseURI() internal view override returns (string memory) {
        return "https://github.com/blakeim2000/testNFT/tree/main/metadata/";
    }

    //after we mint the token we are going to return the id of the token
    function createNFT() public payable returns (uint256) {
    
        require (tokenCounter < maxSupply);

        require(msg.value == 1 ether, "Not correct ETH sent; check price!");
        
        //get number from token counter
        uint256 newNFTTokenId = tokenCounter;

        //safely mint token for the person that called the function
        _safeMint(msg.sender, newNFTTokenId);
        
        //set the token uri of the token id of the uri passed
        tokenURI(newNFTTokenId);

        //increment the counter
        tokenCounter = tokenCounter + 1;
        
    //return the token id
        return newNFTTokenId;
    }
}
