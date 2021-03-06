resource "azurerm_shared_image" "shared_image" {
  for_each                            = var.images
  name                                = each.key
  gallery_name                        = each.value.gallery_name
  resource_group_name                 = var.rg_name
  location                            = var.location
  tags                                = var.tags
  description                         = try(each.value.description, null)
  eula                                = try(each.value.eula, null)
  specialized                         = try(each.value.is_image_specialised, null)
  hyper_v_generation                  = upper(try(each.value.image_hyper_v_generation, null))
  os_type                             = title(each.value.image_os_type)
  privacy_statement_uri               = try(each.value.image_privacy_statement_uri, null)
  release_note_uri                    = try(each.value.image_release_note_uri, null)
  trusted_launch_enabled              = try(each.value.image_trusted_launch_enabled, null)
  accelerated_network_support_enabled = try(each.value.accelerated_network_support_enabled, null)

  dynamic "identifier" {
    for_each = lookup(var.images[each.key], "identifier", {}) != {} ? [1] : []
    content {
      publisher = lookup(var.images[each.key].identifier, "publisher", null)
      offer     = lookup(var.images[each.key].identifier, "offer", null)
      sku       = lookup(var.images[each.key].identifier, "sku", null)
    }
  }

  dynamic "purchase_plan" {
    for_each = lookup(var.images[each.key], "purchase_plan", {}) != {} ? [1] : []
    content {
      publisher = lookup(var.images[each.key].purchase_plan, "publisher", null)
      name      = lookup(var.images[each.key].purchase_plan, "name", null)
      product   = lookup(var.images[each.key].purchase_plan, "product", null)
    }
  }
}

#resource "azurerm_shared_image_version" "shared_image_version" {
#  for_each            = var.create_image_version == true ? [var.images] : []
#  name                = each.value.image_version_number
#  gallery_name        = azurerm_shared_image.shared_image[each.key].gallery_name
#  image_name          = azurerm_shared_image.shared_image[each.key].gallery_name
#  resource_group_name = azurerm_shared_image.shared_image[each.key].resource_group_name
#  location            = azurerm_shared_image.shared_image[each.key].location
#  managed_image_id    = try(each.value.managed_image_id, null)
#  exclude_from_latest = try(each.value.exclude_from_latest, true)
#  tags                = azurerm_shared_image.shared_image[each.key].tags
#
#  dynamic "target_region" {
#    for_each = lookup(var.images[each.key], "image_version_target_region", {}) != {} ? [1] : []
#    content {
#      name                   = lookup(var.images[each.key].image_version_target_region, "image_replication_zone_location_name", var.location)
#      regional_replica_count = lookup(var.images[each.key].image_version_target_region, "regional_replica_count", "2")
#      storage_account_type   = lookup(var.images[each.key].image_version_target_region, "storage_account_type", "Standard_LRS")
#    }
#  }
#}