ENV=dev
PROFILE=default

bash:
	docker-compose exec api bash
cfn-lint:
	docker-compose run api cfn-lint ./cloudformation/Networks.yml
deploy-net:
	docker-compose run api bash ./sh/deploy-net.sh $(ENV) $(PROFILE)
deploy-all:
	docker-compose run api bash ./sh/deploy-net.sh $(ENV) $(PROFILE)