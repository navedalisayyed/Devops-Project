output "vpc_id" {
    value       = aws_vpc.main.id
    description = "The ID of VPC created"
  
}

output "public_subnet_ids" {
    value       = [for s in aws_subnet.public: s.id]
    description = "List of Public IDs"
  
}

output "private_subnet_ids" {
    value       = [for s in aws_subnet.private: s.id]
    description = "List of Private IDs"
  
}

output "public_subnet_map" {
    value       = {for az, subnet in aws_subnet.public: az => subnet.id}
    description = "Map of AZs to public Subnet ID" 
  
}