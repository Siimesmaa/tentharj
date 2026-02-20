# Docker C -ohjelma

Tämä projekti kääntää ja ajaa yksinkertaisen C-ohjelman Docker-kontissa käyttäen monivaiheista buildia.

## Vaatimukset

- [Docker](https://www.docker.com/) asennettuna

## Sovelluksen ajaminen Dockerilla

### 1. Rakenna Docker-image

```bash
docker build -t c-app .
```

### 2. Aja ohjelma kontissa

```bash
docker run --rm c-app
```

Tuloste terminaalissa:

```
Hello, World!
```
