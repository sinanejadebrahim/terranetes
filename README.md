# 🌟 Terranetes: Your Lightweight Kubernetes Cluster Setup with Ansible and Terraform 🌟

Welcome to **Terranetes**, the easy and straightforward way to set up your Kubernetes cluster using Ansible and Terraform! No need for complex tools like KubeSpray or Kops—Terranetes is here to streamline the process with just a few Ansible tasks. 🚀

### Everything is Logical and based on a vars file - each variable runs a set of tasks (can be used alone or mixed):
   for example:
   
      1. you can use prepare and init master
      2. you can just use prepare and add worker 
      3. Just Calico and metrics server
      4. join some worker node on the other side of the planet to your cluster that you built without terranetes 
      5. maybe you just want to create with terraform - can do that too
      6. sky is the limit (I've tried to break the flow or a cluster with multiple test, haven't been successful yet)
##### Also kubelet is always checked to keep your clusters safe in case of wrong values in vars
## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Getting Started](#getting-started)
3. [Running the Playbook](#running-the-playbook)
4. [What the Playbook Does](#what-the-playbook-does)
5. [Verifying the Setup](#verifying-the-setup)
6. [Conclusion](#conclusion)

## Prerequisites 🛠️

Before you begin, ensure you have the following:
- A server with an updated version of Ansible installed.
- Terraform installed on your machine.
- Ansible Galaxy collection for community modules: `ansible-galaxy collection install community.general`.
- HCLOUD token (or any cloud provider  - I'm using hetzner here)

## Getting Started 🚀

1. **Clone the repository** (if you haven't already):
   ```sh
   git clone git@github.com:sinanejadebrahim/terranetes.git
   cd terranetes
   # update the provider.tf file in terranetes/files/ with your token
   ```

2. **Install the required Ansible Galaxy collection**:
   ```sh
   ansible-galaxy collection install community.general
   ```

3. **change vars.yml file**:
   ```sh
   everyhing is based on this file
   ```
   
## Running the Playbook ▶️

To set up your Kubernetes cluster, simply run the following command:
```sh
ansible-playbook playbook.yml
```

No inventory file is needed! Terranetes dynamically updates the inventory with hosts created by Terraform.

## What the Playbook Does 📝

1. **Terraform Setup**:
   - Uses Terraform to build your servers.

2. **Prerequisites Installation**:
   - Installs all necessary prerequisites on your servers for Kubernetes.

3. **Kubernetes Master Initialization**:
   - can initialize the master node.

4. **Worker Nodes Addition**:
   - can add worker nodes to your cluster .

5. **Apply Calico and Metrics Server**:
   - can apply Calico and the Metrics Server to your cluster.

## Verifying the Setup ✅

Once the playbook completes, SSH into your master node (you can find it in the file terraform-hosts.ini after the playbook runs) and run:
```sh
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl get nodes
```

You should see all nodes up and running perfectly! 🎉

## Conclusion 🎬

With Terranetes, setting up a Kubernetes cluster has never been easier. Enjoy your new cluster and happy container orchestration! 🐳✨

For any issues or contributions, feel free to open an issue or submit a pull request. Happy hacking! 👨‍💻👩‍💻

---

### a few notes: 
1. I already know this could look much better with variables,templates,  etc... contributions are appreciated
2. no shade to Kops or kubeSpray people, you're awesome , i'm just too lazy to check out all those files and that's why i made this.



## Stargazers over time
[![Stargazers over time](https://starchart.cc/sinanejadebrahim/terranetes.svg?variant=light)](https://starchart.cc/sinanejadebrahim/terranetes)

