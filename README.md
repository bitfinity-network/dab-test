## DAB TEST
This repo sets up the dab nft registry, indexes an NFT of the dip721 standard locally.

### SETUP
- spin up the local execution environment with the registry & nft canister deployed
    ```
    ./deploy.sh
    ```
- mint some nft to the test user principal by running
    ```
    ./mint.sh
    ```
- interact with it using the dab-js library
  ```
  cd ic && yarn install
  node index.mjs
  ```

### NOTE
The dab-js library harcodes the nft registry canister to the what is on mainnet, you will have to edit node_modules/@psychedelic/dab-js/dist/registries/nfts_registry.js
and change the CANISTER_ID variable to that of the locally deployed nft_registry canister id.


