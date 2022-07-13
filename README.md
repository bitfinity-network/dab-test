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

### AMM IMAGE UPDATE
When the latest version of the amm-dev image changes, you can update it directly in the Dockerfile and push.
That should rebuild this container to have the changes from the new amm-dev image, however this will most likely be automated later.


