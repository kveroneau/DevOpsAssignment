terraform.plan: main.tf variables.tf
	terraform plan -no-color -out terraform.plan | tee plan.txt

terraform.tfstate: terraform.plan
	terraform apply $^
	mkdir -p ~/.kube
	terraform output kubeconfig > ~/.kube/config
	terraform output config-map-aws-auth | kubectl apply -f -

clean:
	terraform destroy
	rm terraform.plan terraform.tfstate terraform.tfstate.backup plan.txt

cluster: terraform.tfstate
	kubectl get svc

nodes: terraform.tfstate
	kubectl get nodes

pods: terraform.tfstate
	kubectl get pods -l app=node-hello -l tier=frontend

services: terraform.tfstate
	kubectl get services

veerum: terraform.tfstate
	kubectl apply -f deploy/website.yml
