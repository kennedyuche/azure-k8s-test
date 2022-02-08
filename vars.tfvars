cluster_name          = "test"
kubernetes_version    = "1.22"
node_pool_name        = "system"
node_pool_count       = 2
node_pool_vm_size     = "Standard_E4s_v3"
node_pool_osdisk_size = 1024
node_pool_max_count   = 5
node_pool_min_count   = 1
env = "dev"

subscription_id = "88f8e67a-c798-4b94-b332-ff259f9e0d22"
client_id       = "e71a36ca-659a-4c30-aa96-f3437bde939a"
client_secret   = "XANCbsy~Cx3gpmGityjxcM_4nacVh4MQ7f"
tenant_id       = "8d6b80b7-89b2-4ee9-8726-5255817a287c"

resource_group_name      = "k8s_test"
resource_group_location  = "eastus"