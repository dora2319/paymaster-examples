// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing OpenZeppelin's ERC721 Implementation
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// Importing OpenZeppelin's Ownable contract to control ownership 
import "@openzeppelin/contracts/access/Ownable.sol";


/**
 * @dev This contract is for basic demonstration purposes only. It should not be used in production.
 * It is for the convience of the ERC721gatedPaymaster.sol contract and its corresponding test file. 
 */
contract MyNFT is ERC721, Ownable {
    // Maintains a counter of token IDs for uniqueness
    uint256 public tokenCounter;

    // A constructor that gives my NFT a name and a symbol
    constructor () public ERC721 ("MyNFT", "MNFT"){
        // Initializes the tokenCounter to 0. Every new token has a unique ID starting from 1
        tokenCounter = 0;
    }

    // Creates an NFT collection, with a unique token ID and a token URI
    function createCollectible(string memory tokenURI, address recipient) public onlyOwner returns (uint256) {
        // Increases the tokenCounter by 1 and then mints the token with this new ID
        _safeMint(recipient, tokenCounter);

        // Sets the token URI of the newly minted token
        _setTokenURI(tokenCounter, tokenURI);

        // Increments the token counter for the next token to be minted
        tokenCounter = tokenCounter + 1;

        return tokenCounter;
    }


    // Overrides the _baseURI function in ERC721 to set the base URI for the token metadata
    function _baseURI() internal pure override returns (string memory) {
        // Returns a base URL for the token's metadata
        return "https://my.token.uri/";
    }
}
