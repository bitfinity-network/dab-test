principal=$1

if [ -z "$principal" ]; then
  principal='y4nw3-upugh-yyv2b-jv6jy-ppfse-4fkfd-uaqv5-woqup-u3cx3-hah2c-yae'
fi

dfx canister call dip721 mint "(
  principal \"$principal\",
  1 : nat,
  vec {
    record {
      \"prop2\";
      variant { Nat64Content = 2 : nat64 };
    };
  },
)"