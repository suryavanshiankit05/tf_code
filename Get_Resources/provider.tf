
# file name: provider.tf
# purpose: contains the provider configuration.

# command: terraform init -plugin-dir= C:/Users/2014202/Surya/Projects/Terraform/providers/terrform-azure-providers/providers/

provider "azurerm" {
  skip_provider_registration = true
  features {

    managed_disk {
      expand_without_downtime = true
    }

    virtual_machine {
      delete_os_disk_on_deletion = true

    }

  }
  // subscription_id = "436ca16e-9edf-457a-a8cc-bdd065065c5f"
}

provider "null" {
  # Configuration options
}