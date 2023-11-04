# Workshop Safe

- Safe {core} protocol
- Safe {core} API
- Safe {core} AA

## Safe {core} protocol

    Accounts ---- Manager ---- Modules (hooks, plugins)
                    |
                    |
                  Registries

modular, you can enable modules. 100% audited
hooks -> before and after a transaction

- Demo app: https://5afe.github.io/safe-core-protocol-demo/
- GH repo: https://github.com/5afe/safe-core-protocol-demo

## Safe {core} AA

- Auth Kit (Login with social accounts or wallet) integrates with Web3Auth Pack
- Protocol Kit (a ts library to interface with smart accounts)
- Onramp Kit: buy crypto with fiat
- Relay kit: relay for AA (gasless tx)

- Demo app: https://github.com/5afe/account-abstraction-demo-ui/tree/8ca4189734a7e92719600dbac390a7e8d646caf6
- GH repo: https://github.com/5afe/account-abstraction-demo-ui/tree/8ca4189734a7e92719600dbac390a7e8d646caf6

# Near Workshop

BOS allows to deploy frontend and backend code on blockchain

## Architecture

vm running jsx (called gateway)
smart contract where code is deployed
large files on ipfs

you can interact using common wallets (Web3Connect, Metamask)

## BOS

near.org to create account
