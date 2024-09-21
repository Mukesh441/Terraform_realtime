# Terraform Output Values
/*
# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}

output "for_output_list" {
  description = "for loop list example"
  value = [ for instance in aws_instance.myec2vm: instance.public_dns]
  
}

output "for_output_map" {
  description = "for loop map example"
  value = { for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
  
}

output "for_output_map2" {
  description = "for loop map advanced example"
  value = { for c, instance in aws_instance.myec2vm: c => instance.public_ip }
  }
*/



output "latest_splat_output" {
  description = "Splat operator"
  //value = aws_instance.myec2vm[*].public_dns
  value = [for instance in aws_instance.myec2vm:instance.public_dns]
} 

