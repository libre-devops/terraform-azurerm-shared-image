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
  hyper_v_generation                  = try(each.value.image_hyper_v_generation, null)
  os_type                             = title(each.value.image_os_type)
  privacy_statement_uri               = try(each.value.image_privacy_statement_uri, null)
  release_note_uri                    = try(each.value.image_release_note_uri, null)
  trusted_launch_enabled              = try(each.value.image_trusted_launch_enabled, null)
  accelerated_network_support_enabled = try(each.value.accelerated_network_support_enabled, null)

  dynamic "identifier" {
    for_each = lookup(var.images[each.key], "identifier", {}) != {} ? [1] : []
    content {
      publisher = lookup(var.images.identifier, "publisher", null)
      offer     = lookup(var.images.identifier, "offer", null)
      sku       = lookup(var.images.identifier, "sku", null)
    }
  }

  dynamic "purchase_plan" {
    for_each = lookup(var.images[each.key], "purchase_plan", {}) != {} ? [1] : []
    content {
      publisher = lookup(var.images.purchase_plan, "publisher", null)
      name      = lookup(var.images.purchase_plan, "name", null)
      product   = lookup(var.images.purchase_plan, "product", null)
    }
  }
}