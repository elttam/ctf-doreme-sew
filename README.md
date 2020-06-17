# Overview

**Title:** Doreme Sew  
**Category:** Web  
**Flag:** libctf{8f72301c-9915-4a00-a74f-f3df6a33e3a5}  
**Difficulty:** easy  

# Usage

The following will pull the latest 'elttam/ctf-doreme-sew' image from DockerHub, run a new container named 'libctfso-doreme-sew', and publish the vulnerable service on port 80:

```sh
docker run --rm \
  --publish 80:80 \
  --name libctfso-doreme-sew \
  elttam/ctf-doreme-sew:latest
```

# Build (Optional)

If you prefer to build the 'elttam/ctf-doreme-sew' image yourself you can do so first with:

```sh
docker build ${PWD} \
  --tag elttam/ctf-doreme-sew:latest
```

