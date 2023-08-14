<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Peertube, verified and packaged by Elestio

[Peertube](https://joinpeertube.org/) PeerTube is a tool for sharing online videos developed by Framasoft, a french non-profit.

<img src="https://github.com/elestio-examples/peertube/raw/main/Peertube.png" alt="peertube" width="800">

[![deploy](https://github.com/elestio-examples/peertube/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/peertube)

Deploy a <a target="_blank" href="https://elest.io/open-source/peertube">fully managed Peertube</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want a free and open-source, decentralized, ActivityPub federated video platform powered by WebTorrent, that uses peer-to-peer technology to reduce load on individual servers when viewing videos.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/peertube.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./assets
    mkdir -p ./docker-volume/data
    mkdir -p ./docker-volume/config
    mkdir -p ./docker-volume/db
    mkdir -p ./docker-volume/redis
    mkdir -p ./docker-volume/opendkim/keys

    chown -R 1001:1001 ./assets
    chown -R 1001:1001 ./docker-volume/data
    chown -R 1001:1001 ./docker-volume/config
    chown -R 1001:1001 ./docker-volume/db
    chown -R 1001:1001 ./docker-volume/redis
    chown -R 1001:1001 ./docker-volume/opendkim/keys

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:9000`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.3"

    services:
      peertube:
        image: elestio4test/peertube:${SOFTWARE_VERSION_TAG}
        networks:
          default:
            ipv4_address: 172.18.0.42
        env_file:
          - .env
        ports:
          - "9000:9000"
        volumes:
          - assets:/app/client/dist
          - ./docker-volume/data:/data
          - ./docker-volume/config:/config
        depends_on:
          - postgres
          - redis
          - postfix
        restart: "always"

      postgres:
        image: postgres:13-alpine
        env_file:
          - .env
        volumes:
          - ./docker-volume/db:/var/lib/postgresql/data
        restart: "always"

      redis:
        image: redis:6-alpine
        volumes:
          - ./docker-volume/redis:/data
        restart: "always"

      postfix:
        image: mwader/postfix-relay
        env_file:
          - .env
        volumes:
          - ./docker-volume/opendkim/keys:/etc/opendkim/keys
        restart: "always"

    networks:
      default:
        ipam:
          driver: default
          config:
            - subnet: 172.18.0.0/16

    volumes:
      assets:

### Environment variables

|       Variable       |   Value (example)   |
| :------------------: | :-----------------: |
| SOFTWARE_VERSION_TAG |       latest        |
|         USER         |        admin        |
|       PASSWORD       |    your-password    |
|        SECRET        |     your-Secret     |
|        APIKEY        |     your-APIKEY     |
|        DOMAIN        | https://your.domain |
|   SESSION_DURATION   |         1d          |

# Maintenance

## Logging

The Elestio Peertube Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.joinpeertube.org/">Peertube documentation</a>

- <a target="_blank" href="https://github.com/Chocobozzz/PeerTube">Peertube Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/peertube">Elestio/peertube Github repository</a>
