#!/bin/bash

sleep 20s

principal=$(dfx identity get-principal)

# deploy dab nft registry
dfx deploy --no-wallet nft_registry

# deploy DIP721 nft canister
dfx deploy --no-wallet dip721 --argument '(opt record { 
    logo = opt "https://fleek.co"; 
    name = opt "dip 721"; 
    symbol = opt "DIP721v2"; 
    custodians = null 
})'
dip721=$(dfx canister id dip721)

# deploy EXT nft canister
dfx deploy --no-wallet ext --argument "(principal \"$principal\")"
ext=$(dfx canister id ext)

# deploy EXT erc20 canister
dfx deploy --no-wallet erc20 --argument "(\"ERC20 Token\", \"ERC20\", 8, 10000000000:nat, principal \"$principal\")"
erc20=$(dfx canister id erc20)

# index DIP721 canister in the nft registry
dfx canister call nft_registry add "( record {
    name= \"Dip721 1\"; 
    description= \"Description test\"; 
    thumbnail= \"https://qcg3w-tyaaa-aaaah-qakea-cai.raw.ic0.app/Token/1\"; 
    frontend= opt \"https://fleek.ooo\"; 
    principal_id= principal \"$dip721\"; 
    details= vec { record {\"standard\"; variant { Text= \"DIP721v2\" } } }
})"

# index EXT canister in the nft registry
dfx canister call nft_registry add "( record {
    name= \"EXT 1\"; 
    description= \"EXT NFT\"; 
    thumbnail= \"https://qcg3w-tyaaa-aaaah-qakea-cai.raw.ic0.app/Token/6\"; 
    frontend= opt \"https://toniqlabs.com/\"; 
    principal_id= principal \"$ext\"; 
    details= vec { record {\"standard\"; variant { Text= \"EXT\" } } }
})"
