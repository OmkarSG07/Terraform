# Terraform Commands Cheat Sheet

## **Basic Terraform Commands**
1. **`terraform --version`**  
   - Check the installed Terraform version.

2. **`terraform init`**  
   - Initialize the working directory and download required provider plugins.

3. **`terraform validate`**  
   - Validate the Terraform configuration files for syntax errors.

4. **`terraform plan`**  
   - Show what changes Terraform will apply without making any actual changes.

5. **`terraform apply`**  
   - Create or update the infrastructure, prompting for confirmation before applying changes.

6. **`terraform apply -auto-approve`**  
   - Apply changes without manual confirmation.

7. **`terraform refresh`**  
   - Sync Terraform's state file with real-world infrastructure.

8. **`terraform state list`**  
   - List all resources currently managed by Terraform.

9. **`terraform state show <resource_name>`**  
   - Show details of a specific Terraform-managed resource.

10. **`terraform output`**  
    - Display output variables defined in the Terraform configuration.

---

## **Updating & Destroying Resources**

11. **`terraform apply`** (after modifying `main.tf`)  
    - Apply changes to existing infrastructure.

12. **`terraform destroy`**  
    - Destroy all Terraform-managed resources, prompting for confirmation.

13. **`terraform destroy -auto-approve`**  
    - Destroy resources without manual confirmation.

---

## **Troubleshooting & Debugging**

14. **`terraform fmt`**  
    - Format Terraform files to maintain best practices.

15. **`terraform taint <resource_name>`**  
    - Mark a resource for recreation in the next `terraform apply`.

16. **`terraform show`**  
    - Show the current Terraform state file in a human-readable format.

17. **`TF_LOG=DEBUG terraform apply`**  
    - Enable detailed debugging logs for troubleshooting.

---

