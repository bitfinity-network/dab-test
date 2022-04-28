import { HttpAgent } from "@dfinity/agent";
import { Principal } from "@dfinity/principal";
import { getAllUserNFTs, getNFTActor, getAllNFTS } from "@psychedelic/dab-js";
import fetch from "node-fetch";

// global.crypto = crypto;
// global.TextEncoder = textEncoding.TextEncoder;
// global.TextDecoder = textEncoding.TextDecoder;
global.fetch = fetch;

const replacer = (key, value) => {
  return typeof value === "bigint" ? value.toString() + "n" : value;
};

const reviver = (key, value) => {
  if (typeof value === "string" && /^\d+n$/.test(value)) {
    return BigInt(value.substring(0, value.length - 1));
  }
  return value;
};

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
const canisterId = 'rrkah-fqaaa-aaaaa-aaaaq-cai';
// const principal =
//   "y4nw3-upugh-yyv2b-jv6jy-ppfse-4fkfd-uaqv5-woqup-u3cx3-hah2c-yae";
const principal =
  "oorz3-h6wp7-4vd3v-h6n2l-fmwdt-lfbid-f4q5d-67bb4-v6e2j-ep6v3-cae";

const getNFTCollections = async () => {
  const collections = await getAllUserNFTs({
    agent: await makeAgent(),
    user: principal,
    canisterId
  });

  console.log("col", collections);
  console.log("tkns", collections[0].tokens);
};

getNFTCollections();

// const transferNFT = () => {
//   try {
//     const agent = await makeAgent();

//     const NFT = getNFTActor({
//       canisterId: 'r7inp-6aaaa-aaaaa-aaabq-cai',
//       agent,
//       standard: 'DIP721v2',
//     });

//     await NFT.transfer(
//       Principal.fromText(to),
//       20
//     );

//     const col = await getAllUserNFTs({ user: principal, agent })
//     console.log('col', col)
//   } catch (e) {
//     console.log('transfer err', e)
//   }
//  }

//  transferNFT();
