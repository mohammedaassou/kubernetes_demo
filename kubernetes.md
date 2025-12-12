


# Kubernetes + Minikube Project

This project demonstrates how to set up a **local Kubernetes cluster** using **Minikube** and deploy applications using `kubectl`. It is suitable for development, testing, and learning Kubernetes locally.

---

## Table of Contents

1. [Overview](#overview)  
2. [Prerequisites](#prerequisites)  
3. [Install Minikube](#install-minikube)  
4. [Start Minikube Cluster](#start-minikube-cluster)  
5. [Kubernetes Commands](#kubernetes-commands)  
6. [Deploy Application](#deploy-application)  
7. [Access Services](#access-services)  
8. [Stop Minikube](#stop-minikube)  
9. [References](#references)

---

## Overview

Minikube allows you to run a **single-node Kubernetes cluster locally** on your laptop. You can deploy applications, create services, and test Kubernetes features without using a cloud provider.

---

## Prerequisites

- Docker installed on your machine (for building container images)  
- `kubectl` installed  
- Minikube installed  

Check versions:

```bash
kubectl version --client
minikube version
# Kubernetes + Minikube Project

This project demonstrates how to set up a **local Kubernetes cluster** using **Minikube** and deploy applications using `kubectl`. It is suitable for development, testing, and learning Kubernetes locally.

---

## Table of Contents

1. [Overview](#overview)  
2. [Prerequisites](#prerequisites)  
3. [Install Minikube](#install-minikube)  
4. [Start Minikube Cluster](#start-minikube-cluster)  
5. [Kubernetes Commands](#kubernetes-commands)  
6. [Deploy Application](#deploy-application)  
7. [Access Services](#access-services)  
8. [Stop Minikube](#stop-minikube)  
9. [Project Workflow Diagram](#project-workflow-diagram)  
10. [References](#references)

---

## Overview

Minikube allows you to run a **single-node Kubernetes cluster locally** on your laptop. You can deploy applications, create services, and test Kubernetes features without using a cloud provider.

---

## Prerequisites

- Docker installed on your machine (for building container images)  
- `kubectl` installed  
- Minikube installed  

Check versions:

```bash
kubectl version --client
minikube version
docker --version
```

---

## Install Minikube

For Mac (Apple Silicon):

```bash
brew install minikube
```

For other platforms, follow the official guide:
[Minikube Documentation](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable)

---

## Start Minikube Cluster

```bash
minikube start
```

Check cluster status:

```bash
kubectl get nodes
kubectl cluster-info
```

> 💡 Tip: Use `minikube dashboard` to open the Kubernetes dashboard in your browser.

---

## Kubernetes Commands

* Watch pods in real-time:

```bash
kubectl get pods -w
```

* List services:

```bash
kubectl get services
```

* Describe a resource:

```bash
kubectl describe pod <pod_name>
kubectl describe service <service_name>
```

---

## Deploy Application

Apply Kubernetes manifests:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Check pods and services:

```bash
kubectl get pods
kubectl get services
```

---

## Access Services

Open a service in your browser using Minikube:

```bash
minikube service <service_name>
```

---

## Stop Minikube

Stop the cluster:

```bash
minikube stop
```

Clean up (optional):

```bash
minikube delete
```

---

## Project Workflow Diagram

The typical request flow inside the cluster:

```
Developer -> kubectl apply (Deployment, Service)
           
				 +------------------------------+
				 |         Kubernetes Cluster   |
				 |                              |
				 |   +------------+             |
External User -> |   |  Service   |  (ClusterIP/NodePort)
 via Browser     |   +-----+------+             |
  (minikube)     |         |                    |
				 |   +-----v------+             |
				 |   | Deployment  |  (ReplicaSet -> Pods)
				 |   +-----+------+             |
				 |         |                    |
				 |   +-----v------+             |
				 |   |   Pod      |  (Container/Image)
				 |   +------------+             |
				 +------------------------------+

Expose locally with Minikube:
Browser <--> minikube service <service_name> <--> Service <--> Pods
```

Quick access command:

```bash
minikube service <service_name> --url
```

---

## References

* Minikube Docs: [https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable)
* Kubernetes Docs: [https://kubernetes.io/docs/home/](https://kubernetes.io/docs/home/)

