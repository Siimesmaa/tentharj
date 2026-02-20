# Docker C -ohjelma

Tämä projekti kääntää ja ajaa yksinkertaisen C-ohjelman Docker-kontissa käyttäen monivaiheista buildia.

## Vaatimukset

- [Docker](https://www.docker.com/) asennettuna (suositellaan versiota 20.10+, joka sisältää BuildKit-tuen)

## SSH-yhteys Ubuntu-virtuaalikoneeseen

Kyllä, kaikki komennot toimivat normaalisti SSH-yhteyden kautta Ubuntu-virtuaalikoneessa. Jos Dockeria ei ole vielä asennettu, asenna se näin:

```bash
sudo apt-get update
sudo apt-get install -y docker.io docker-buildx
sudo systemctl enable --now docker
```

## Vianmääritys

### Docker-sockettiin ei ole oikeuksia (permission denied)

Jos saat virheen `permission denied while trying to connect to the Docker daemon socket`, toimi seuraavasti:

**1. Tarkista, että Docker-daemon on käynnissä:**

```bash
sudo systemctl status docker
```

Jos daemon ei ole käynnissä, käynnistä se:

```bash
sudo systemctl start docker
```

**2. Lisää käyttäjä `docker`-ryhmään:**

```bash
sudo usermod -aG docker $USER
```

**3. Kirjaudu ulos ja takaisin sisään** (SSH-yhteydellä katkaistaan ja avataan uusi yhteys), jotta ryhmämuutos astuu voimaan:

```bash
exit
ssh <käyttäjä>@<virtuaalikoneen-ip>
```

**4. Tarkista, että ryhmämuutos on voimassa:**

```bash
groups
```

Tulosteessa pitäisi näkyä `docker`. Jos ei näy, käynnistä virtuaalikone uudelleen (`sudo reboot`) ja yhdistä uudelleen.

**Vaihtoehtoisesti – nopea testi `sudo`-komennolla** (ei vaadi uudelleenkirjautumista):

```bash
sudo docker buildx build -t c-app .
sudo docker run --rm c-app
```

## Sovelluksen ajaminen Dockerilla

### 1. Rakenna Docker-image

```bash
docker buildx build -t c-app .
```

### 2. Aja ohjelma kontissa

```bash
docker run --rm c-app
```

Tuloste terminaalissa:

```
Hello, World!
```
