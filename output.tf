output "shared_image_gallery_name" {
  value = {
    for key, value in element(azurerm_shared_image.shared_image[*], 0) : key => value.gallery_name
  }
  description = "The name of the shared image gallery"
}

output "shared_image_id" {
  value = {
    for key, value in element(azurerm_shared_image.shared_image[*], 0) : key => value.id
  }
  description = "The id of the shared image"
}

output "shared_image_name" {
  value = {
    for key, value in element(azurerm_shared_image.shared_image[*], 0) : key => value.name
  }
  description = "The name of the shared image"
}
