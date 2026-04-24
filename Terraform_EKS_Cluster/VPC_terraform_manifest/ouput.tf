output "vpc_id" {
    value       = module.vpc.vpc_id
    description = "The ID of VPC created"
  
}

output "public_subnet_ids" {
    value       = module.vpc.public_subnet_ids
    description = "List of Public IDs"
  
}

output "private_subnet_ids" {
    value       = module.vpc.private_subnet_ids
    description = "List of Private IDs"
  
}

output "public_subnet_map" {
    value       = module.vpc.public_subnet_map
    description = "Map of AZs to public Subnet ID" 
  
}