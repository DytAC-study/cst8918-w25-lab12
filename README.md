CST8918 - DevOps: Infrastructure as Code  
Prof. Robert McKenney

**Team Members:**
- [Yuntian Du] ([DytAC-study](https://github.com/DytAC-study))
- [Cong Zhao] ([zhao0294](https://github.com/zhao0294))
- [Jianyi Fan] ([JianyiF](https://github.com/JianyiF))

## Team Collaboration & Responsibilities

### Yuntian Du (DytAC-study)
- **GitHub Repository Setup**: Created repository, configured environments and branch protection rules
- **GitHub Secrets Configuration**: Set up all Azure secrets and OIDC authentication
- **Terraform Code Development**: Created and maintained all Terraform configurations
- **Azure AD Setup**: Created Azure AD applications and service principals
- **RBAC Configuration**: Configured role assignments for service principals

### Cong Zhao (zhao0294)
- **Azure Infrastructure Setup**: Created Azure resource groups and storage accounts
- **OIDC Authentication Troubleshooting**: Resolved federated credential issues
- **GitHub Actions Workflow Development**: Created and debugged all CI/CD workflows
- **Terraform Backend Configuration**: Set up Azure Blob Storage for remote state
- **Deployment Testing**: Tested and validated all workflows

### Jianyi Fan (JianyiF)
- **Documentation**: Created comprehensive documentation and guides
- **Screenshots**: Captured all required screenshots for Lab submission
- **Pull Request Reviews**: Reviewed and approved team contributions
- **Final Validation**: Verified all Lab requirements were met

## Collaboration Summary
All team members contributed equally to the project, with each person taking lead on different aspects of the infrastructure and CI/CD pipeline development.

# Lab 12: Terraform CI/CD on Azure with GitHub Actions

## Background

This lab is based on the scenario of an integrated git project with Terraform and Azure. Imagine that the project is a simple web application that is containerized and deployed to an Azure Kubernetes Service (AKS) cluster. The application and it's Dockerfile would be defined in the `app` folder.

> [!IMPORTANT]
> The application code is not provided in this lab. The focus is on the infrastructure as code (IaC) aspect of the example project. There is an empty `app` folder as a representation of the application code.

The infrastructure is defined in a Terraform configuration in the `infra` folder. The Terraform configuration creates supporting resources in Azure and deploys the sample web application to the cluster. 

You will create several GitHub Actions CI/CD workflows for automating:

- **static code analysis** of a Terraform configuration on push to any branch
- running all Terraform **integration tests** on pull request to the main branch
- **deployment** of a Terraform configuration to Azure on merge to the main branch
- daily **drift detection** of the deployed infrastructure v.s. the Terraform configuration

A separate Terraform "backend" configuration will create the storage account and container to store your Terraform state file for the application infrastructure.

### Project folder structure

When you are done, your project folder structure should look like this:

```plaintext
cst8918-w25-lab12
├── .github
│   └── workflows
│       ├── infra-static-tests.yml
│       ├── infra-integration.yml
│       ├── infra-deploy.yml
│       └── infra-drift-detection.yml
├── app
│   └── .gitkeep
├── infra
│   ├── az-federated-credential-params
|   |   ├── branch-main.json
│   │   ├── production-deploy.json
|   |   ├── pull-request.json
│   │   └── branch-workflow-test-2.json
│   ├── tf-app
│   |   ├── .tflint.hcl
│   │   ├── main.tf
│   │   ├── outputs.tf
|   │   ├── terraform.tf
│   │   └── variables.tf
│   └── tf-backend
│       └── main.tf
├── .editorconfig
├── .gitignore
└── README.md
```

## Instructions

This lab should be completed in teams of three. One team member will create the GitHub repository and invite the others as collaborators. Most of the numbered steps should be completed by one of the team member committing and pushing the code on a dev branch, with the other team members reviewing and approving the pull request. Each team member should contribute equally to the codebase.

> [!IMPORTANT]
> Submissions with only one team member's contributions will incur 20% grade penalty for that team member, and the other team member will receive a grade of zero (0). Collaboration is required!

Full instructions for each step can be found in the [docs](docs) folder. Please complete each step in order.

1. Setup your GitHub repo with an environment and branch protection rules.
2. Configure Terraform to use Azure Blob Storage for remote state.
3. Create Azure access credentials for automation with GitHub Actions.
4. Add Azure identity values as _secrets_ in your GitHub repo.
5. Update the Terraform configuration to use the Azure identity values.
6. Create a GitHub Actions workflows to:  
   6.1 run Terraform static analysis.  
   6.2 run Terraform integration tests.  
   6.3 deploy the Terraform infrastructure.  
   6.4 detect drift between Terraform and Azure.  
7. Test the workflows by making changes to the Terraform configuration.

## Submission

1. Submit the URL of your GitHub repository.
2. Include in your submission a screenshot of the Pull Request showing the successful completion of the workflows - expand the "All checks have passed" section to show the steps.
Deployment infrastructure
<img width="1900" height="803" alt="image" src="https://github.com/user-attachments/assets/7ae1cd32-78f3-493c-94f2-975125739c09" />
<img width="1878" height="905" alt="image" src="https://github.com/user-attachments/assets/0eb451eb-ba2e-4630-b404-b271190d2d66" />
<img width="1892" height="918" alt="image" src="https://github.com/user-attachments/assets/76315be2-907e-4644-97a3-fd54d8f9c16f" />
<img width="1898" height="912" alt="image" src="https://github.com/user-attachments/assets/114771fa-d684-4585-95cd-61d60c2207c4" />
<img width="1892" height="896" alt="image" src="https://github.com/user-attachments/assets/c83ecf2c-bb3f-45ad-9e16-15f62598d942" />
Integration test
<img width="1872" height="773" alt="image" src="https://github.com/user-attachments/assets/937fc217-cd9f-479b-be90-efe34ef32e1d" />
<img width="1890" height="910" alt="image" src="https://github.com/user-attachments/assets/cb0c21d4-bb16-45e9-92d2-98c0544dd185" />
<img width="1888" height="916" alt="image" src="https://github.com/user-attachments/assets/d0260277-3680-4bdb-a6c1-bd394162a6a8" />
<img width="1885" height="914" alt="image" src="https://github.com/user-attachments/assets/3f169469-f647-46e0-b0da-4e50edeb9a90" />
<img width="1885" height="893" alt="image" src="https://github.com/user-attachments/assets/73b9c9d2-2c03-460f-88e8-3d5d80c61b79" />
static code analysis
<img width="1875" height="719" alt="image" src="https://github.com/user-attachments/assets/ca1d4f84-33b6-42f8-bbad-99b4c25b53c4" />
<img width="1885" height="904" alt="image" src="https://github.com/user-attachments/assets/9aeb340d-f4ce-4f3c-b8fd-236d66048aaa" />
<img width="1894" height="911" alt="image" src="https://github.com/user-attachments/assets/a486e47d-f221-46aa-9704-9a8ef4786cfa" />
<img width="1885" height="891" alt="image" src="https://github.com/user-attachments/assets/681c4047-1ffb-49f2-9d6a-258460286f2a" />
Drift Detection
<img width="1898" height="898" alt="image" src="https://github.com/user-attachments/assets/83b95d46-91ee-4e42-80b1-57e7fd1f0f86" />
<img width="1897" height="902" alt="image" src="https://github.com/user-attachments/assets/357c489b-994c-4573-a873-3f9ac923a909" />
<img width="1890" height="907" alt="image" src="https://github.com/user-attachments/assets/ca3ea36c-9efc-4d53-9e29-1fecf7cc6fac" />
<img width="1885" height="896" alt="image" src="https://github.com/user-attachments/assets/fb53106e-f84f-4365-b044-df05d923c48f" />


3. Include in your submission a screenshot of the Pull Request showing the expanded results of the Terraform Plan step.
<img width="1263" height="906" alt="image" src="https://github.com/user-attachments/assets/e0fc11df-4e6f-43ab-988d-62dc5c1d9d29" />

4. Embed the screenshots in your README.md file.
5. The README.md file should clearly identify the full name and GitHub username of each team member.


### Azure Resources Created
![screenshotofrg](https://github.com/user-attachments/assets/6cda584b-7033-46ff-93c5-2247c0b3d29e)

## Lab Completion Status

**All Lab requirements completed successfully!**

### Completed Tasks:
- [x] GitHub repository setup with environment and branch protection
- [x] Azure Blob Storage backend configuration
- [x] Azure AD applications and service principals
- [x] GitHub Secrets configuration
- [x] OIDC authentication setup
- [x] Terraform configuration with variables
- [x] All GitHub Actions workflows created and tested
- [x] Successful deployment to Azure
- [x] Drift detection working
- [x] Team collaboration demonstrated

### Workflows Status:
-  **Terraform Static Tests** - Working
-  **Terraform Integration Tests** - Working  
-  **Terraform Deploy** - Working
-  **Terraform Drift Detection** - Working

## Additional References

Based on the [GitHub Actions Workflows for Terraform](https://github.com/Azure-Samples/terraform-github-actions)

https://learn.microsoft.com/en-ca/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux#use-the-azure-login-action-with-openid-connect
