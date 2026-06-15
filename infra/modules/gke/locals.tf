locals {
  node_pool_map = { for np in var.node_pools : np.name => np }
}
