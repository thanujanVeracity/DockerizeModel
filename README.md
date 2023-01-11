# DockerizeModel
Here i have developed and dockerized a inference of a model.

`
docker build -t dockerized-inference .
docker run --name plotd dockerized-inference:latest  python3 inference.py
docker cp plot:/output.jpg .
`
