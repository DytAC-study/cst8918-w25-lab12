# Lab 12 项目状态总结

## 已完成的工作 ✅

### 1. 项目结构
- ✅ 创建了所有必要的目录结构
- ✅ 配置了基本的Terraform文件
- ✅ 创建了GitHub Actions工作流

### 2. Terraform配置
- ✅ 更新了 `infra/tf-app/terraform.tf` 支持OIDC
- ✅ 更新了 `infra/tf-app/main.tf` 使用你的学号
- ✅ 更新了 `infra/tf-app/variables.tf`
- ✅ 创建了 `infra/tf-app/outputs.tf`
- ✅ 创建了 `infra/tf-app/.tflint.hcl`

### 3. Federated Credentials配置
- ✅ 创建了 `infra/az-federated-credential-params/production-deploy.json`
- ✅ 创建了 `infra/az-federated-credential-params/pull-request.json`
- ✅ 创建了 `infra/az-federated-credential-params/branch-main.json`

### 4. GitHub Actions工作流
- ✅ 创建了 `.github/workflows/infra-static-tests.yml`
- ✅ 创建了 `.github/workflows/infra-integration.yml`
- ✅ 创建了 `.github/workflows/infra-deploy.yml`
- ✅ 创建了 `.github/workflows/infra-drift-detection.yml`

## 还需要完成的工作 ❌

### 1. Azure AD应用程序创建 (通过Azure门户)
由于CLI权限限制，需要通过Azure门户手动创建：

1. 登录 https://portal.azure.com
2. 进入 Azure Active Directory > App registrations
3. 创建两个应用程序：
   - `0411175585-githubactions-rw` (具有contributor权限)
   - `0411175585-githubactions-r` (具有reader权限)
4. 为每个应用程序创建服务主体
5. 分配相应的角色权限
6. 使用已创建的JSON文件配置Federated Credentials

### 2. GitHub Secrets配置
在GitHub仓库中配置以下secrets：

**Repository Level Secrets:**
- `AZURE_TENANT_ID`: `ec1bd924-0a6a-4aa9-aa89-c980316c0449`
- `AZURE_SUBSCRIPTION_ID`: `cf8bfe92-3d85-4f0a-bbd1-ae319eefc4ee`
- `AZURE_CLIENT_ID`: [从reader应用程序获取]
- `ARM_ACCESS_KEY`: [从存储账户获取]

**Production Environment Secret:**
- `AZURE_CLIENT_ID`: [从contributor应用程序获取]

### 3. 部署后端基础设施
1. 切换到 `infra/tf-backend` 目录
2. 运行 `terraform init`
3. 运行 `terraform plan`
4. 运行 `terraform apply`

### 4. 测试工作流
1. 推送代码到GitHub
2. 创建Pull Request测试工作流
3. 合并到main分支测试部署
4. 截图记录结果

### 5. 更新README.md
1. 添加团队成员信息
2. 嵌入测试截图
3. 添加项目描述

## 下一步行动

1. **立即可以做的**: 通过Azure门户创建Azure AD应用程序
2. **配置GitHub Secrets**: 获取应用程序ID后配置secrets
3. **部署后端**: 创建存储账户和容器
4. **测试工作流**: 推送代码并测试所有工作流
5. **完成文档**: 更新README.md并添加截图

## 重要信息

- **学号**: 0411175585
- **Azure订阅**: AVD-Prod (cf8bfe92-3d85-4f0a-bbd1-ae319eefc4ee)
- **Azure租户**: ec1bd924-0a6a-4aa9-aa89-c980316c0449
- **GitHub仓库**: zhao0294/cst8918-w25-lab12 