terraform {
  required_providers {
    godaddy = {
      source  = "n3integration/godaddy"
      version = "1.8.7"
    }
  }
}

provider "godaddy" {
  // Configured via environment variables:
  // - GODADDY_API_KEY
  // - GODADDY_API_SECRET
}
