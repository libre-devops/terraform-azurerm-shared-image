output "image_id" {
  value       = azurerm_shared_image.shared_image.id
  description = "The id of the image"
}

output "image_name" {
  value       = azurerm_shared_image.shared_image.name
  description = "The name of the image"
}
