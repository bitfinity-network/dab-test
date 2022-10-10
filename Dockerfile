FROM ghcr.io/infinity-swap/amm-dev:v4.0.8

COPY wasm/* ./wasm/
COPY candid/* ./candid/
COPY deploy.sh ./

RUN J=$(jq ".canisters += {\"nft_registry\":{\"type\":\"custom\",\"wasm\":\"$WORK_DIR/wasm/nft_registry.wasm\",\"candid\":\"$WORK_DIR/candid/nft_registry.did\"}}" $WORK_DIR/dfx.json) && echo "$J" > $WORK_DIR/dfx.json && \
    J=$(jq ".canisters += {\"dip721\":{\"type\":\"custom\",\"wasm\":\"$WORK_DIR/wasm/dip721.wasm\",\"candid\":\"$WORK_DIR/candid/dip721.did\"}}" $WORK_DIR/dfx.json) && echo "$J" > $WORK_DIR/dfx.json && \
    J=$(jq ".canisters += {\"ext\":{\"type\":\"custom\",\"wasm\":\"$WORK_DIR/wasm/ext.wasm\",\"candid\":\"$WORK_DIR/candid/ext.did\"}}" $WORK_DIR/dfx.json) && echo "$J" > $WORK_DIR/dfx.json && \
    J=$(jq ".canisters += {\"erc20\":{\"type\":\"custom\",\"wasm\":\"$WORK_DIR/wasm/erc20.wasm\",\"candid\":\"$WORK_DIR/candid/erc20.did\"}}" $WORK_DIR/dfx.json) && echo "$J" > $WORK_DIR/dfx.json

RUN (dfx start --background) && ./deploy.sh && (dfx stop)

RUN cp -rf $WORK_DIR/.dfx/local/* $PUBLIC_DIR


