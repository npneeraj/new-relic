terraform {
#   required_version = ">= 0.12.6"

  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    #   version = "~> 2.21"
    }
  }
}
# Configure the New Relic provider
provider "newrelic" {
  account_id = 3933470
  api_key = "NRAK-D831VMISS8E3R33GAKU7C7B0Q1M" # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}