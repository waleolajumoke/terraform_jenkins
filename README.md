# Terraform Starter

Helpful Terraform Links:

- [Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

## Step 0: Initialize Terraform

```
terraform init
```

## Step 1: Plan Resources

```
terraform plan 
```

## Step 2: Apply Resources

```
terraform apply 
```

## Step 3: Commands to get the Jenkins admin password via command line

```
chmod 400 <keypair>
ssh -i <keypair> ec2-user@<public_dns>
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Some useful commands:

Hint: attach the test role to the EC2 jenkins

#create EKS cluster
eksctl create cluster --name kubernetes-cluster --version 1.23 --region us-east-1 --nodegroup-name linux-nodes --node-type t2.xlarge --nodes 2 

kubectl get nodes
cat /home/ec2-user/.kube/config #to get context information of kubernetes cluster
kubectl create namespace devsecops #to create namespace in kubernetes cluster
kubectl get deployments --namespace=devsecops #to get deployments in a namespace in kubernetes cluster

# update your pipeline
https://github.com/waleolajumoke/deploy_ecr_image_to_kubernetes_cluster.git

kubectl get deployments -n devsecops
kubectl get pods -n devsecops
kubectl get svc -n devsecops

# paste loadbalancer url in the browser
kubectl delete all --all -n devsecops   #to delete everything in a namespace in kubernetes cluster

#delete EKS cluster
eksctl delete cluster --region=us-east-1 --name=kubernetes-cluster #delete eks cluster

```
## Step 4: Cleanup Terraform Resources
terraform destroy
