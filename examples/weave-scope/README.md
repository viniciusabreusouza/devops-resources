#Utilizando o Weave Scope

Weave Scope is a visualization and monitoring tool for Docker and Kubernetes.
It provides a top down view into your app as well as your entire infrastructure, and allows you to diagnose any problems with your distributed containerized app,
in real time, as it is being deployed to a cloud provider.

[Weave Scope](https://www.weave.works/docs/scope/latest/introducing/)


To run in local using Minikube:

- Run `$kubectl create -f \weave-scope\scope.yaml`  
- Run `$ kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040` 
