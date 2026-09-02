# DevOps-Engineer-Local-Environment-Setup
# DevOps Environment Setup

## 1. Overview

This project documents the setup and configuration of a local DevOps development environment.

The environment provides the tools required for source control, containerisation, Kubernetes orchestration, cloud management, Infrastructure as Code (IaC), configuration management, scripting, and AI-assisted DevOps workflows.

The environment was designed to run on **Windows using WSL2 and Ubuntu**, providing a Linux-based development environment while retaining access to Windows tools such as Visual Studio Code and Docker Desktop.

---

## 2. Environment Configuration

### Host Environment

* Operating System: Windows 10/11
* Linux Environment: WSL2
* Linux Distribution: Ubuntu
* Recommended RAM: 8 GB or more
* Recommended free disk space: 30 GB or more
* CPU: 2 or more cores
* Container Runtime: Docker Desktop
* Kubernetes Runtime: Minikube using Docker driver

### Package Manager

The primary Linux package manager used was:

```bash
apt
```

Additional tools were installed using their official installation methods where appropriate.

---

## 3. Tools Installed

The following DevOps tools were installed and verified:

| Tool               | Purpose                                    |
| ------------------ | ------------------------------------------ |
| Git                | Source control and version management      |
| Visual Studio Code | Code editor and development environment    |
| Docker             | Containerisation                           |
| Docker Compose     | Multi-container application management     |
| kubectl            | Kubernetes cluster management              |
| Minikube           | Local Kubernetes cluster                   |
| Helm               | Kubernetes package management              |
| AWS CLI            | AWS cloud administration                   |
| Azure CLI          | Microsoft Azure administration             |
| Node.js            | JavaScript runtime and backend development |
| npm                | Node.js package management                 |
| jq                 | JSON processing                            |
| Terraform          | Infrastructure as Code                     |
| Ansible            | Configuration management and automation    |

Optional AI-assisted tooling can also be added, including GitHub Copilot, Amazon Q, Gemini CLI, Codex CLI, or LocalStack.

---

## 4. Git Configuration

Git was installed and configured using:

```bash
git --version
```

Git identity was configured using:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

The configuration was verified using:

```bash
git config --list
```

A test Git repository was created to confirm that Git was working correctly.

---

## 5. Visual Studio Code

Visual Studio Code was installed as the primary development environment.

The WSL extension was installed to allow Visual Studio Code to connect directly to the Ubuntu WSL2 environment.

The environment was tested using:

```bash
code .
```

This allowed Linux-based DevOps projects to be edited and managed directly from Visual Studio Code.

---

## 6. Docker Configuration

Docker Desktop was installed on the Windows host and configured to integrate with WSL2.

WSL2 integration was enabled for the Ubuntu distribution.

Docker was verified using:

```bash
docker --version
```

Docker Compose was verified using:

```bash
docker compose version
```

The Docker installation was further tested using:

```bash
docker run hello-world
```

The successful `Hello from Docker!` response confirmed that Docker was operational.

---

## 7. Docker Compose Test

A test Docker Compose configuration was created using an NGINX container.

Example:

```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
```

The application was started using:

```bash
docker compose up -d
```

The running container was checked using:

```bash
docker ps
```

The application was stopped using:

```bash
docker compose down
```

---

## 8. Kubernetes Configuration

Kubernetes tooling was installed using:

* kubectl
* Minikube
* Helm

The Kubernetes client was verified using:

```bash
kubectl version --client
```

Minikube was verified using:

```bash
minikube version
```

Helm was verified using:

```bash
helm version
```

---

## 9. Minikube Local Cluster

A local Kubernetes cluster was created using Minikube with Docker as the driver:

```bash
minikube start --driver=docker
```

The cluster status was verified using:

```bash
minikube status
```

The Kubernetes node was verified using:

```bash
kubectl get nodes
```

The expected result was a node with a status of:

```text
Ready
```

Additional cluster information was checked using:

```bash
kubectl get pods -A
```

A test NGINX deployment was also created:

```bash
kubectl create deployment nginx --image=nginx
```

The deployment was verified using:

```bash
kubectl get deployments
kubectl get pods
```

---

## 10. Cloud CLI Configuration

### AWS CLI

AWS CLI was installed and verified using:

```bash
aws --version
```

If required, authentication can be configured using:

```bash
aws configure
```

AWS credentials and secret keys were not stored in the project repository.

### Azure CLI

Azure CLI was installed and verified using:

```bash
az version
```

Authentication can be performed using:

```bash
az login
```

No Azure credentials or authentication tokens were stored in the project repository.

---

## 11. Node.js

Node.js was installed using NVM to make it easier to manage Node.js versions.

The installation was verified using:

```bash
node --version
```

npm was verified using:

```bash
npm --version
```

---

## 12. jq

The `jq` utility was installed for processing JSON data.

Verification:

```bash
jq --version
```

Example:

```bash
echo '{"name":"DevOps","type":"environment"}' | jq .
```

---

## 13. Terraform

Terraform was installed for Infrastructure as Code.

The installation was verified using:

```bash
terraform --version
```

Terraform can be used to define and provision cloud and infrastructure resources using configuration files.

---

## 14. Ansible

Ansible was installed for configuration management and automation.

The installation was verified using:

```bash
ansible --version
```

Ansible can be used to automate server configuration, application deployment, and operational tasks.

---

## 15. Shell Configuration

A `.bashrc` configuration file was used to configure the development environment.

Useful aliases were added for frequently used DevOps commands.

Examples:

```bash
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias dps='docker ps'
alias tf='terraform'
alias gs='git status'
```

The configuration was loaded using:

```bash
source ~/.bashrc
```

---

## 16. Verification

A verification script was created to check that all required tools were installed correctly.

The script verifies:

```text
Git
Docker
Docker Compose
kubectl
Minikube
Helm
AWS CLI
Azure CLI
Node.js
npm
jq
Terraform
Ansible
```

The verification script can be executed using:

```bash
./verify-tools.sh
```

The output was saved using:

```bash
./verify-tools.sh | tee tooling-verification.txt
```

The resulting `tooling-verification.txt` file provides evidence of the installed tool versions.

---

## 17. Kubernetes Verification

The following commands were used to verify the local Kubernetes environment:

```bash
minikube status
```

```bash
kubectl get nodes
```

```bash
kubectl get pods -A
```

A healthy environment should show:

* Minikube host running
* Kubernetes kubelet running
* Kubernetes API server running
* Kubernetes configuration available
* Kubernetes node in `Ready` state

---

## 18. Troubleshooting

### Docker was not available inside WSL2

Docker Desktop was restarted and WSL2 integration was checked.

The Ubuntu distribution was enabled under:

```text
Docker Desktop
→ Settings
→ Resources
→ WSL Integration
```

Docker was then tested again using:

```bash
docker run hello-world
```

### Minikube failed to start

Docker was checked first:

```bash
docker ps
```

Minikube was then started using:

```bash
minikube start --driver=docker
```

The cluster status was checked using:

```bash
minikube status
```

### kubectl could not connect to Kubernetes

The Minikube cluster was started and the current Kubernetes context was checked:

```bash
kubectl config current-context
```

The expected context was:

```text
minikube
```

The cluster was then tested with:

```bash
kubectl get nodes
```

### Permission issues

Commands requiring administrative privileges were executed using:

```bash
sudo
```

Care was taken not to run unnecessary commands with elevated privileges.

---

## 19. Security Considerations

Security was considered during the environment setup.

The following practices were followed:

* Cloud credentials were not committed to Git.
* API keys and passwords were not stored in configuration files.
* Secrets were not included in screenshots or verification reports.
* `.gitignore` can be used to prevent sensitive files from being committed.
* Software was installed from official repositories or trusted sources.
* Docker and Kubernetes environments were kept for local development and testing.
* Least-privilege principles should be applied when configuring cloud access.

Example `.gitignore` entries:

```text
.env
*.key
*.pem
credentials
secrets/
```

---

## 20. Project Structure

The completed project can be organised as follows:

```text
DevOps-Environment/
│
├── README.md
│
├── configuration/
│   └── bashrc.txt
│
├── verification/
│   ├── tooling-verification.txt
│   └── kubernetes-proof.txt
│
├── docker/
│   └── compose.yaml
│
├── kubernetes/
│   └── nginx.yaml
│
└── scripts/
    └── verify-tools.sh
```

---

## 21. Evidence Submitted

The following evidence was prepared for the DevOps environment assessment:

### Environment Configuration

```text
configuration/bashrc.txt
```

### Tooling Verification

```text
verification/tooling-verification.txt
```

### Kubernetes Proof

```text
verification/kubernetes-proof.txt
```

### Setup Documentation

```text
README.md
```

Screenshots were also captured showing the successful installation and operation of the required tools and the running Minikube Kubernetes node.

---

## 22. Final Validation

The environment was considered successfully configured after confirming that:

```bash
git --version
docker --version
docker compose version
kubectl version --client
minikube version
helm version
aws --version
az version
node --version
npm --version
jq --version
terraform --version
ansible --version
```

were all returning valid version information.

The local Kubernetes cluster was also confirmed to be operational using:

```bash
minikube status
kubectl get nodes
```

The environment is now ready for DevOps development, containerisation, Kubernetes experimentation, cloud CLI operations, Infrastructure as Code, configuration management, and automation.
