# What is Swarm
- Native clustering for Docker
- Compatible with Docker remote API

<img src="images/swarmlogo.png">

!SUB
# Swarm overview

<img src="images/swarmoverview.png">

!SUB
# Swarm capabilities
- Built-in scheduler with filters
  - Node tags
  - Affinity
  - Strategies
- Pluggable node discovery
- Pluggable schedulers

!SUB
# Swarm creation
- Create a unique cluster_id token
- Create Swarm nodes
- Create a Swarm manager

!SLIDE
# What is Compose
- Defining and running multi-container applications
- Using a Compose file (docker-compose.yml)

<img src="images/composelogo.png">

!SUB
# Compose overview

<img src="images/composeoverview.png">

!SUB
# Compose capabilities
- Multiple isolated environments on single host
- Preserve volume data when containers are created
- Only recreate containers that have changed
- Using variables and extending Compose files

!SUB
# Compose file
- Run it using ```docker-compose up```

```
web:
  build: .
  ports:
   - "5000:5000"
  volumes:
   - .:/code
  links:
   - redis
redis:
  image: redis
```

!SLIDE
# Workshop Setup
