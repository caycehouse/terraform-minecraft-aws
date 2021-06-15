provider "aws" {
  profile = "default"
  default_tags {
    tags = {
      Application = "Minecraft"
    }
  }
}