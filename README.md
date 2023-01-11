# DockerizeModel
Here i have developed and dockerized a inference of a model.

```
docker build -t dockerized-inference .
docker run --name plotd dockerized-inference:latest  python3 inference.py
docker cp plot:/output.jpg .
```
```
docker run --name docker_inference -itd dockerized-inference:latest 
docker exec -it 470af6a7a67de3a72584d756a917a7c3fd64b823dffd62f04715963bdde48fc6 sh
python3 inference.py
docker cp plot:/output.jpg .
```
