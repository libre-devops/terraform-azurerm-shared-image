module "rg" {
  source = "registry.terraform.io/libre-devops/rg/azurerm"

  rg_name  = "rg-${var.short}-${var.loc}-${terraform.workspace}-build" // rg-ldo-euw-dev-build
  location = local.location                                            // compares var.loc with the var.regions var to match a long-hand name, in this case, "euw", so "westeurope"
  tags     = local.tags

  #  lock_level = "CanNotDelete" // Do not set this value to skip lock
}

module "gallery" {
  source = "registry.terraform.io/libre-devops/compute-gallery/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  gallery_name = "gal${var.short}${var.loc}${terraform.workspace}01"
  description  = "A basic description"
}

module "image" {
  source = "registry.terraform.io/libre-devops/shared-image/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  images = {
    "lbdo-azdo-ubuntu-22.04" = {
      gallery_name             = module.gallery.gallery_name
      is_image_specialised     = false
      image_hyper_v_generation = "V2"
      image_os_type            = "Linux"

      identifier = {
        publisher = "lbdo-azdo-ubuntu-22.04"
        offer     = "Image2"
        sku       = "Latest"

      }

      image_version_number = formatdate("YYYY.MM", timestamp())
      exclude_from_latest  = false

      target_region = {
        image_replication_zone_location = "westeurope"
      }
    }
  }
}