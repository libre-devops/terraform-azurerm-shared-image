output "image_id" {
  value = {
    for key, value in element(azurerm_shared_image.shared_image[*], 0) : key => value.id
  }
  description = "The id of the image"
}

output "image_name" {
  value = {
    for key, value in element(azurerm_shared_image.shared_image[*], 0) : key => value.name
  }
  description = "The name of the image"
}
