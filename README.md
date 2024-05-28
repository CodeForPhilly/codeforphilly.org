# codeforphilly.org

## Overview

Code for Philly's website repository built as an extension of [laddr](https://github.com/CodeForPhilly/laddr), a website building tool designed specifically for civic hacking groups.

## Developing

The following is directly taken from the [Getting started guide on laddr's README](https://github.com/CodeForPhilly/laddr#getting-started).

### Dependencies

Install recent versions of [Habitat](http://habitat.sh) and [Docker](https://www.docker.com/) on your Linux, Mac, or Windows workstation.

### Clone Laddr

```bash
cd ~/Repositories/laddr # or wherever you cloned this rep

# expose port 7080 (http) and 3306 (mysql) from any Docker container started by Habitat
export HAB_DOCKER_OPTS="-p 7080:7080 -p 3306:3306"

# launch and enter a Habitat studio
hab studio enter

# once the studio has finished loading, start all services with a local database
start-all

# clone a production instance's database
load-sql https://codeforphilly.org

# build and load the site, then wait for file changes
watch-site
```

At that point you should be able to see an instance at http://localhost:7080 and any edits should be reflected live
