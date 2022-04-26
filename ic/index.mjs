import { HttpAgent } from "@dfinity/agent";
import { Principal } from "@dfinity/principal";
import { getAllUserNFTs, getNFTActor, getAllNFTS } from "@psychedelic/dab-js";
import fetch from "node-fetch";
import textEncoding from "text-encoding";
import crypto from "@trust/webcrypto";

// global.crypto = crypto;
// global.TextEncoder = textEncoding.TextEncoder;
// global.TextDecoder = textEncoding.TextDecoder;
global.fetch = fetch;

const makeAgent = async () => {
  const agent = new HttpAgent({ host: "http://localhost:8000" });
  await agent.fetchRootKey();
  return agent;
};

// (async () => {
//   const agent = await makeAgent();
//   const canisterId = "r7inp-6aaaa-aaaaa-aaabq-cai";
//   const out  = await getAllNFTS();
//   console.log("nftColl", out);
// })();

// const getUserNFTs = async () => {
//   const principal =
//     "y4nw3-upugh-yyv2b-jv6jy-ppfse-4fkfd-uaqv5-woqup-u3cx3-hah2c-yae";
//   const canisterId = "r7inp-6aaaa-aaaaa-aaabq-cai";
//   const standard = "DIP721v2";
//   const agent = await makeAgent();
//   console.log("agent created");
//   const NFTActor = getNFTActor({ canisterId, agent, standard });
//   console.log("actor created");
//   const userTokens = await NFTActor.getUserTokens(
//     Principal.fromText(principal)
//   );
//   console.log("usertokens", userTokens);
// };
// getUserNFTs();

const getNFTCollections = async () => {
  const principal =
    "y4nw3-upugh-yyv2b-jv6jy-ppfse-4fkfd-uaqv5-woqup-u3cx3-hah2c-yae";
  const collections = await getAllUserNFTs({
    agent: await makeAgent(),
    user: Principal.fromText(principal),
  });

  console.log("out", collections[0].tokens);
};

getNFTCollections();
