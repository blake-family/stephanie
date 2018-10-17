yellow = \033[1;33m
green = \033[01;32m
blue = \033[01;34m
lblue = \033[00;34m
cyan = \033[00;36m
white = \033[1;37m
red = \033[1;31m
default = \033[0m

appName=stephanie-blake-music

start-dev-env: build-image install-dependencies deploy shell-to-deployed undeploy

build-image:
	@echo
	@echo "$(blue)build-image: $(yellow)Building $(appName)$(default)"
	@echo
	docker-compose build

install-dependencies:
	@echo
	@echo "$(blue)install-dependencies: $(yellow)Installing packages for $(appName)$(default)"
	@echo
	-docker-compose run --rm web yarn install
	-docker-compose run --rm web bower install

deploy:
	@echo
	@echo "$(blue)deploy: $(yellow)Deploy $(appName)$(default)"
	@echo
	docker-compose up -d
	@echo
	@echo "Running at $(blue)http://localhost"

deploy-dist:
	@echo
	@echo "$(blue)deploy-dist: $(yellow)Deploy $(cyan)dist$(yellow) version of $(appName)$(default)"
	@echo
	@echo
	@echo "Once running it can be reached at $(blue)http://localhost"
	docker-compose -f docker-compose.yml -f docker-compose.dist.yml up

shell-to-deployed:
	@echo
	@echo "$(blue)shell-to-deployed: $(yellow)Shell into deployed $(appName)$(default)"
	@echo
	-docker exec -it $$(docker container ls -q --filter "name=$(appName)_web") bash

undeploy:
	@echo
	@echo "$(blue)undeploy: $(yellow)Undeploy $(appName)$(default)"
	@echo
	docker-compose down

quick-shell:
	@echo
	@echo "$(blue)quick-shell: $(yellow)Shell into a new $(appName) container$(default)"
	@echo
	@echo "Start the server with:"
	@echo "$(green)grunt serve$(default)"
	@echo "Then request $(blue)http://localhost/$(default)"
	@echo
	@docker-compose run --service-ports --rm web bash

logs:
	@echo
	@echo "$(blue)logs: $(yellow)Container logs for $(appName)$(default)"
	@echo
	docker logs --follow $$(docker container ls -q --filter "name=$(appName)_web")

publish:
	@echo
	@echo "$(blue)publish: $(yellow)Publishing $(appName) to GitHub Pages$(default)"
	@echo
	@echo "Make sure you've run $(cyan)grunt dist$(default) first"
	@echo
	docker-compose run --rm web grunt dist
	./deploy.sh
