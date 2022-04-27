dfx deploy nft_registry

dfx deploy dip721 --argument '(opt record { 
    logo = null; 
    name = opt "dip 721"; 
    symbol = opt "dip721"; 
    custodians = null 
})'

dip721=$(dfx canister id dip721)

dfx canister call nft_registry add "(
  record {
    thumbnail = \"https://qcg3w-tyaaa-aaaah-qakea-cai.raw.ic0.app/Token/1\";
    name = \"Dip721v2\";
    frontend = opt \"https://icpunks.com/\";
    description = \"example nft\";
    principal_id = principal \"$dip721\";
    details = vec { record { \"standard\"; variant { Text = \"DIP721v2\" };};};
  },
)"