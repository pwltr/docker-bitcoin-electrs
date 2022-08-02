# Docker Bitcoin Electrs

## Requirements

- Docker
- Docker Compose v2

## Usage

1. Spin up containers

```shell
docker compose up -d
```

2. Create a wallet

```shell
docker exec -it bitcoin bitcoin-cli createwallet ""
```

3. Get some BTC

```shell
docker exec -it bitcoin bitcoin-cli -generate 101
```

4. Send a transaction

```shell
docker exec -it bitcoin bitcoin-cli -named sendtoaddress address="<address>" amount="<amount>" fee_rate="25"
```

5. Get confirmation

```shell
docker exec -it bitcoin bitcoin-cli -generate 1
```

## Connections

- Bitcoin RPC: 0.0.0.0:8332
- Bitcoin P2P: 0.0.0.0:8333
- Electrum: 0.0.0.0:50001
