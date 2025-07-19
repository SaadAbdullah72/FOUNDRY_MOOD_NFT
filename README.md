# 🧠 FOUNDRY_MOOD_NFT

**A fully on-chain dynamic NFT** built with Solidity and Foundry that reflects the owner’s mood — **Happy** or **Sad**.  
Utilizes SVGs encoded in JSON metadata, no off-chain dependencies, and is deployed locally via Anvil.



## 🔍 Table of Contents

- [✨ Features](#✨-features)  
- [🛠️ Tech Stack](#🛠️-tech-stack)  
- [🚀 Getting Started](#🚀-getting-started)  
  - [Prerequisites](#prerequisites)  
  - [Setup](#setup)  
  - [Usage](#usage)  
- [📈 Workflow](#📈-workflow)  
- [⚖️ License](#⚖️-license)  


## ✨ Features

- 🌀 **On-chain SVG metadata** — no IPFS or external storage  
- 🎭 **Mood toggle**: owners can flip between *Happy* & *Sad*  
- 🔒 **Ownership-enforced**—only owner/approved can flip mood  
- 🔧 Built using **Forge** & **Anvil** for fast dev cycles  



## 🛠️ Tech Stack

| Tool                     | Description                        |
|--------------------------|------------------------------------|
| **Solidity v0.8.13**     | Smart contract language            |
| **OpenZeppelin ERC‑721** | Secure, audited NFT base           |
| **Foundry (forge/cast)** | Dev toolkit & CLI commands         |
| **Anvil**                | Local Ethereum node for testing    |
| **MetaMask**             | Wallet integration & testing       |
| **Base64**               | Encoding for JSON+SVG metadata     |

---

## 🚀 Getting Started

### Prerequisites

Make sure you have:
- [Node.js & npm](https://nodejs.org)  
- [Foundry](https://github.com/foundry-rs/foundry#installation) (`forge`, `cast`)  
- [MetaMask](https://metamask.io) (for manual contract interaction)


### Setup

1. **Clone the repo**  
   ```bash
   git clone https://github.com/SaadAbdullah72/FOUNDRY_MOOD_NFT.git
   cd FOUNDRY_MOOD_NFT


2. **Install dependencies**
   (If you use OpenZeppelin via npm)

   ```bash
   npm install @openzeppelin/contracts
   

3. **Set up environment variables**
   Create `.env` in project's root:

   ```
   Anvil_PRIVATE_KEY=0xYOUR_ANVIL_PK_HERE
   ```

4. **Launch Anvil**

   ```bash
   anvil --host 0.0.0.0
   ```

---

### Usage

1. **Deploy contract**

   ```bash
   forge script script/DeployMoodNft.s.sol:DeployMoodNft \
     --rpc-url http://127.0.0.1:8545 \
     --private-key $Anvil_PRIVATE_KEY \
     --broadcast
   ```

2. **Mint your first NFT**

   ```bash
   cast send $CONTRACT_ADDR "_mintNft()" \
     --private-key $Anvil_PRIVATE_KEY \
     --rpc-url http://127.0.0.1:8545
   ```

3. **Flip the mood of tokenId = 0**

   ```bash
   cast send $CONTRACT_ADDR "FlipMood(uint256)" 0 \
     --private-key $Anvil_PRIVATE_KEY \
     --rpc-url http://127.0.0.1:8545
   ```

4. **Check mood status**

   ```bash
   cast call $CONTRACT_ADDR "getMood(uint256)(string)" 0 \
     --rpc-url http://127.0.0.1:8545
   ```

5. **View metadata**

   ```bash
   cast call $CONTRACT_ADDR "tokenURI(uint256)(string)" 0 \
     --rpc-url http://127.0.0.1:8545
   ```

   Decode with:

   ```bash
   echo '<base64_part>' | base64 --decode | jq
   ```

---

## 📈 Workflow

1. Write and test in Solidity
2. Use `forge script` to deploy on Anvil
3. Interact via `cast` commands (mint, flip, view)
4. Build frontend (optional) to visualize dynamic SVG

---

## ⚖️ License

This project is licensed under the [MIT License](LICENSE).
© Saad Abdullah

---

> 🔥 *“A smart NFT that reflects your mood — fully on‑chain, forever yours.”*

---

```

---

### ✅ How to Use

- Copy the above markdown into `README.md` at your repo root.
- Update `$CONTRACT_ADDR` in Usage section after deploying to Anvil.
- Optional: Add a GIF or SVG screenshot at the top to showcase the dynamic mood change.

