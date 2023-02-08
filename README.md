# Typescript & Node template

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white) ![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)

## Getting Started

These instructions will give you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Requirements for the software and other tools to build, test and push

- [Docker](https://docs.docker.com/get-docker/)

### Building an image

To build this project in dev mode you only need docker (you may need to use sudo)

```bash
docker build -t <image-name> . --target=dev
```

for prod

```bash
docker build -t <image-name> . --target=prod
```

run the image

```bash
docker run -it --name=<container-name> --mount type=bind,source="$(pwd)",target=/app <image-name> .
```

we need bind mount to reload nodemon on save (to avoid rebuilding the image).

## License

This project is licensed under the [GNU GPL](LICENSE) License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

- Inspiration for this project is [this](https://www.codewars.com/kata/587136ba2eefcb92a9000027) kata on codewars
