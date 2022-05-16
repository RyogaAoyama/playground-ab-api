ENV=dev
PROFILE=default

bash:
	docker-compose exec api bash
cfn-lint:
	docker-compose run api cfn-lint ./cloudformation/Networks.yml
deploy-app:
	docker-compose run api bash ./sh/deploy-app.sh $(ENV) $(PROFILE)
deploy-sec:
	docker-compose run api bash ./sh/deploy-sec.sh $(ENV) $(PROFILE)
deploy-all:
	docker-compose run api bash ./sh/deploy-app.sh $(ENV) $(PROFILE)
	docker-compose run api bash ./sh/deploy-sec.sh $(ENV) $(PROFILE)