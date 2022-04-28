dfx deploy nft_registry

dfx deploy dip721 --argument '(opt record { 
    logo = opt "https://fleek.co"; 
    name = opt "dip 721"; 
    symbol = opt "DIP721v2"; 
    custodians = null 
})'

dip721=$(dfx canister id dip721)

dfx canister call nft_registry add "( record {
    name= \"Test NFT\"; 
    description= \"Description test\"; 
    thumbnail= \"https://fleek.co\"; 
    frontend= opt \"https://fleek.ooo\"; 
    principal_id= principal \"$dip721\"; 
    details= vec { record {\"standard\"; variant { Text= \"DIP721v2\" } } }
  })"