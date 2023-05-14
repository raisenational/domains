terraform {
  required_providers {
    godaddy = {
      source  = "n3integration/godaddy"
      version = "1.9.1"
    }
  }
}

provider "godaddy" {
  // Configured via environment variables:
  // - GODADDY_API_KEY
  // - GODADDY_API_SECRET
}
