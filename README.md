# Docker

Build my first Dockerfile, this repo is include : 

---
- Webserver
- Database
---
> ### How to run the Webserver
> - `cd Webserver`
> - `docker build -t="<name_use>" . `
> - `docker run -d -p 8000:80 <image_id>`
---
> ### How to run the Database
> - `cd database`
> - `docker build -t="<name_use" . `
> - `docker run -d -p 4406:3306 <image_id>`
