# Veerum DevOps Technical Assessment

## Assignment
Just one thing! Create a k8s pod that exposes the docker image, https://hub.docker.com/r/eatatjoes/docker-demo on port 80. The `Dockerfile` for this image can be found here, https://github.com/trentmillar/docker-demo/blob/master/Dockerfile

Please complete the assignment by only using Terraform, YAML, or file changes. No BASH or other command line scripts.

Commit your code changes to your personal online Github account and email robs@veerum.com with the link to your git repo when you are finished.

Good luck.


#### Notes
You are provided the complete working Terraform source to create:

- VPC (contains all public x3 and private x3 subnets)
   - 10.0.0.0/16
   - Public 10.0.101.0/24, 10.0.102.0/24, 10.0.103.0/24
   - Private 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24
- Security Groups
- Load Balancer
- NAT Gateway
- EKS k8s cluster & nodes on AWS

**You will need to create:**
- AWS - Create EC2 Keypair
- AWS - S3 State bucket
- Install - aws-iam authenticator
- K8s - your Pod & Service

#### Configure your IAM Authenticator
Use the following to generate the connector yaml file you'll need to apply with `kubectl`,
`terraform output config-map-aws-auth > config-map-aws-auth.yaml`

### Generate Kube/config for your EKS cluster
run `terraform output kubeconfig`

#### kubectl common commands
1. To view the available kubernetes machines run,
	`kubectl config get-contexts`

	CURRENT   NAME                 CLUSTER                      AUTHINFO             NAMESPACE
    
          docker-for-desktop   docker-for-desktop-cluster   docker-for-desktop   
*         minikube             minikube                     minikube   

The * represents the active context.


2. To choose a new context to run execute,

`kubectl config use-context docker-for-desktop`

3. To get all the running nodes/clusters,

`kubectl get nodes`

NAME            STATUS   ROLES    AGE   VERSION

node/eks        Ready    master   15d   v1.15.2

4. To get all running pods/container instances
`kubectl get pods`

    NAME                                  READY   STATUS    RESTARTS   AGE

    pod/web-76f5c4f865-gxcp9              1/1     Running   2          15d


