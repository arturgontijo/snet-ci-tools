![singnetlogo](docs/assets/singnet-logo.jpg 'SingularityNET')

[![CircleCI](https://circleci.com/gh/singnet/snet-ci-tools.svg?style=svg)](https://circleci.com/gh/singnet/dnn-model-services)

# snet-ci-tools
Some tools that are used in the CI/CD of the SingularityNET's services.

- SingularityNET CircleCI Orb: [ssh-deployment](https://circleci.com/orbs/registry/orb/singularitynet/ssh-deployment)
- Orb helper scripts:
  - `check_daemon.sh`: Checks the running version of the SNET Daemon on the target Container and updates it if necessary.
  - `check_files.sh`: Checks if target files has changed in the last `git push` in order to trigger a new `docker build`.
- Testing CI `config.yml`
