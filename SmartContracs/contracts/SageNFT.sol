
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Importing ERC 1155 Token contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract SageNFT is ERC1155 , Ownable  {
    
    string constant public name = "SageNFT";
    string constant z05txF = "petf";


    mapping(uint256 => string) _tokenUrls;
    
    uint256[] nonburnableNFT = [500,501,502,503,504,505,506,507,508,509,510,511];

    mapping(address => string) _NFTList;

    constructor() ERC1155("")  {}


    function buyCoins(uint256 _itemId) payable public /*onlyOwner*/{
    }

    //buy burnable nft
    function buyNonBurnItem(uint256 _tokenId, string memory _tokenUrl) public /*onlyOwner*/{
        //IMPORTANT Implement own security (set ownership to users). Not production ready contract
        require(_tokenId <= nonburnableNFT.length , "invalid item");
        _tokenUrls[nonburnableNFT[_tokenId]] = _tokenUrl;
        _mint(msg.sender, nonburnableNFT[_tokenId], 1, "");
           bytes memory a = abi.encodePacked(_NFTList[msg.sender], ",", Strings.toString(nonburnableNFT[_tokenId]));
       _NFTList[msg.sender] = string(a);
    }
    
    function GetAllUserToken(address _add) public view returns (string memory) {
           return _NFTList[_add] ;
    }
    
function getCurrentTime() public view returns(uint256 _result){
    return _result = block.timestamp;
}
 

    function uri(uint256 id) public view virtual override returns (string memory) {
        return _tokenUrls[id];
    }


    function withdraw(address _recipient) public payable onlyOwner {
    payable(_recipient).transfer(address(this).balance);
}
}