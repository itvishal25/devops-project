# Terraform Infrastructure Learning Project

## Overview

This directory contains a hands-on Terraform learning project built using the HashiCorp Local provider. It demonstrates Infrastructure as Code (IaC) fundamentals by managing local files through declarative configuration.

**Important:** This is a local learning environment. It does not provision AWS or other cloud infrastructure.

## Prerequisites

- Terraform CLI
- Git
- Ubuntu or another supported operating system
- Internet connection for initial provider installation

## Project Structure

```text
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── data.tf
├── .terraform.lock.hcl
└── modules/
    └── app/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

Terraform automatically generates local state and provider-cache files. These local artifacts should not be committed to Git.

## Concepts Practiced

- **Infrastructure as Code:** Define desired resources declaratively.
- **Variables and validation:** Configure input values and enforce constraints.
- **Locals and outputs:** Reuse expressions and expose useful results.
- **Data sources:** Retrieve information for use in configuration.
- **Dependencies:** Control relationships between resources.
- **`count` and `for_each`:** Create multiple resource instances.
- **Conditional expressions and functions:** Transform values and select configuration.
- **Modules:** Reuse application configuration across multiple instances.
- **Lifecycle rules:** Explore resource lifecycle behavior.
- **State management:** Inspect managed resources and understand configuration drift.
- **Resource migration:** Practice the `moved` block for renaming a resource address.

These are learning examples, not a production cloud deployment.

## Getting Started

Run the following commands from this directory.

### 1. Initialize Terraform

```bash
terraform init
```

Initializes the working directory and installs the required provider.

### 2. Format the configuration

```bash
terraform fmt -recursive
```

### 3. Validate the configuration

```bash
terraform validate
```

### 4. Review the execution plan

```bash
terraform plan
```

Review the proposed actions before applying changes.

### 5. Apply changes

```bash
terraform apply
```

Use this only when you understand and approve the proposed changes. In this learning project, the configured resources manage local files.

### 6. Inspect state and outputs

```bash
terraform state list
terraform output
```

State inspection commands operate on the currently selected workspace and its state.

## Reusable Application Module

The `modules/app/` directory contains a reusable module that accepts an application name and message and creates a local file. The root configuration uses this module for two separate application examples.

## State and Security

- Do not commit Terraform state files or state backups.
- Do not commit `.tfvars` files containing local configuration or sensitive values.
- Do not store real credentials in Terraform configuration.
- Treat state files as potentially sensitive, even when resources are local.
- Keep `.terraform/` out of version control.
- Review `terraform plan` before applying changes.
- Back up state before experimenting with state-management commands.

## Current Limitations

- Uses the Local provider rather than AWS or another cloud provider.
- Does not demonstrate remote state storage or cloud infrastructure provisioning.
- Some resources exist specifically to demonstrate Terraform language features.
- Successful validation and planning do not establish production readiness.

## Learning Objective

Build a practical foundation in Terraform syntax, resource lifecycle, modules, state management, safe change planning, and reproducible Infrastructure as Code workflows.
