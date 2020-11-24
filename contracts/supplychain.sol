pragma solidity >=0.4.22 <0.7.0;


/**
 * @title Bank
 * @dev Implements bank system
 */
contract SupplyChain   {
    uint256 private stock;
    uint256 private pid;
    address private owner;
    
   
    

    struct product {
        uint256 productID;
        uint256 price;
        address owner;

    }
    

    
    mapping(uint256 => product) public medicine;
    
    
    
    // uint256[] public productsp = new productp[](10) ;

    
    // empresas.price = 10;
    
    // mapping(address => empresa) private fornecedor;

    constructor() public payable {
        owner = msg.sender;
        stock = 0;
        pid =0;
    }
    
    
    function register() public payable {
        
       medicine[pid].productID =pid;
       medicine[pid].owner = msg.sender;
       medicine[pid].price = msg.value;
       
       stock+=1;
       pid+=1;
       
    }
    
   
    function getproducts() public view returns (uint256) {

        return stock;
    }
    
    function getproductprice(uint256 id) public view returns (uint256) {

        return medicine[id].price;
       
    }
    
    function getproductowner(uint256 id) public view returns (address) {

        return medicine[id].owner;
       
    }
    
      //  function payment() public payable {
    //   medicine[msg.sender].owner = msg.sender;
    //   medicine[msg.sender].price = msg.value;
       
       
       
    //   stock+=1;
       
    // }
    

  function  purchase(uint256 id,uint256 newprice )
        public payable
        returns (bool)
    {
        
        
        
        if (msg.value  >=  medicine[id].price ) {
            // require(true,"oi");
            
            medicine[id].price = newprice;
            medicine[id].owner = msg.sender;  
            
            
            
            return true;
        }
        return false;
    }
   
}
