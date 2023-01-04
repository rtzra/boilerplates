Small Vault how-to

Up container:
$ docker-compose up -d
Creating vault ... done

Watch the logs:
$ docker logs -f vault

Initialize vault:
$ docker exec -it vault vault operator init
Unseal Key 1: ...
Unseal Key 2: ...
Unseal Key 3: ...
Unseal Key 4: ...
Unseal Key 5: ...

Initial Root Token: hvs...

Unseal vault:
$ docker exec -it vault vault operator unseal <unseal key 1>
$ docker exec -it vault vault operator unseal <unseal key 2>
$ docker exec -it vault vault operator unseal <unseal key 3>

Login to vault via CLI:
$ docker exec -it vault vault login <root token>

Login via web-interface:
http://YOU-DOMAIN.COM:8200/

Create KV storage named 'secret':
$ docker exec -it vault vault secrets enable -version=2 -path=secret kv
Success! Enabled the kv secrets engine at: secret/

Write some secret:
$ docker exec -it vault vault kv put secret/foo bar=test
Success! Data written to: secret/foo

Write some secret in json format:
$ docker exec -it vault vault kv get --format=json secret/foo

Curling you secret:
$ curl -H "X-Vault-Token: <root token>" -X GET https://vault.example.ru/v1/secret/foo -s | jq
