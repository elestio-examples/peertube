# PeerTube Agent CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/peertube"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy PeerTube Agent with CI/CD on Elestio

<img src="Peertube.png" style='width: 100%;, max-width:300px;'/>
<br/>
<br/>

# Deployment Instructions

Once deployed, access the PeerTube UI using the following credentials:

- **URL:** [https://[CI_CD_DOMAIN]](https://[CI_CD_DOMAIN])
- **Login:** root
- **Password:** [ADMIN_PASSWORD]

## Documentation

For detailed usage and setup instructions, refer to the [PeerTube documentation](https://docs.joinpeertube.org/use-setup-account).

## Custom Domain Setup

To configure a custom domain:

1. After adding the domain in the 'Custom Domain Names' section of the service details, ensure it's also added to the `.env` file.

2. Navigate to 'Service Details' > 'Overview' > 'Software' tab, click the 'Update Config' button, and update the `PEERTUBE_WEBSERVER_HOSTNAME` variable in the `.env` file with your custom domain. Then, click 'Update & Restart' to apply the changes.

**Warning:** After updating the configuration, execute the following command in the terminal:

    docker-compose exec -T peertube bash -c "NODE_CONFIG_DIR=/app/config:/app/support/docker/production/config:/config NODE_ENV=production npm run update-host; exit;"
