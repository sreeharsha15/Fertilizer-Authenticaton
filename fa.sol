pragma solidity ^0.4.26;
contract FertilizerAuthenticity
{
    string[] public Fertilizer_Companies;
    string Fertilizer_Name;
    bool  public exists;
    string extract;
    int inp_count = 0;
    uint public com_count = 0;
    address owner;
    bool public deleted;
    //here the address of smart contract operator is compared with deployer address if both are same then operator will have access
    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }
    //constructor which initializes the address of the deployer who is considered as owner
    constructor() public{
        owner = msg.sender;
    }
    
    function add_Fertilizer_Company(string Company_Name) public OnlyOwner{

        Fertilizer_Companies.push(string(Company_Name));
        //com_count++;
        
    }
    function Input_Company(string Company) public{
        Fertilizer_Name = Company;
    }
    function Compare_Fertilizer_Companies() public{
        inp_count = 0;
        if(Fertilizer_Companies.length==0)
        {
            exists=false;
        }
        else
        {
            for(uint i=0;i<Fertilizer_Companies.length;i++){
                extract = Fertilizer_Companies[i];
                if(keccak256(extract) == keccak256(Fertilizer_Name)){
                        exists = true;
                        break;
                }
                else{
                    exists = false;
                
                }
            }
        }
    }
    function Delete_Company()public OnlyOwner
    {
        if(Fertilizer_Companies.length==0)
        {
            deleted=false;
        }
        else
        {
            for(uint i=0;i<Fertilizer_Companies.length;i++)
            {
                if(keccak256(Fertilizer_Companies[i]) == keccak256(Fertilizer_Name)){
                //delete Fertilizer_Companies[i];
                Fertilizer_Companies[i] = Fertilizer_Companies[Fertilizer_Companies.length-1];
                Fertilizer_Companies.length--;
                deleted = true;
                com_count=Fertilizer_Companies.length;
                break;
                }
                else
                {
                    deleted = false;
                }
            }
        }
    }
}
