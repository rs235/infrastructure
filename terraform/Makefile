.PHONY: init fmt validate plan apply destroy output refresh graph clean

ENV ?= home
STACK ?= sandbox

init:
	cd environments/$(ENV)/$(STACK) && terraform init

fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

validate:
	cd environments/$(ENV)/$(STACK) && terraform validate

plan:
	cd environments/$(ENV)/$(STACK) && terraform plan

plan-out:
	cd environments/$(ENV)/$(STACK) && terraform plan -out=tfplan

apply:
	cd environments/$(ENV)/$(STACK) && terraform apply

show:
	cd environments/$(ENV)/$(STACK) && terraform show

destroy:
	cd environments/$(ENV)/$(STACK) && terraform destroy

output:
	cd environments/$(ENV)/$(STACK) && terraform output

graph:
	cd environments/$(ENV)/$(STACK) && terraform graph | dot -Tpng > graph.png

clean:
	find . -type d -name ".terraform" -exec rm -rf {} +
	find . -type f -name "terraform.tfstate*" -delete
	find . -type f -name "*.tfplan" -delete
	find . -type f -name "graph.png" -delete
