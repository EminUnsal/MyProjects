# phonebook-app
-deploy with docker swarm

# infrastructure:
1. public github repo
2. AWS ECR repo
3. docker swarm
   -- 3 manager node
   -- 2 worker node
4. swarm sec gr
5. aws iam role

# app deployment:

* Dockerfile ---> app-server
  - aws ecr 1 gönderilecek
  - phonebook-app.py
  - requirements.txt
  - templates

* docker-compose.yml
  - servisler:
    -- database
    -- app-server (ecr)

* main.tf

# leader manager
- docker/docker-compose
- viz
- ec2connectcli (python, pip)
- aws cli (v2)
- IAM role
- github'tan dosya çekme ---> install git
- dosyaları çekip imaj oluşturma
- docker build image
- docker push to aws ecr
- docker swarm init
- docker stack deploy -c docker-compose.yml