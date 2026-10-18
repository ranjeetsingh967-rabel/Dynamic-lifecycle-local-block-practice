rgs = {
  rg1 = {
    name     = "ravi-rg"
    location = "centralindia"
  }
}

virtual = {
  virtual1 = {
    name          = "ravi-vnet"
    location      = "centralindia"
    rg_name     = "ravi-rg"
    address_space = ["10.0.0.0/16"]
# Dynamic block practice
    subnet = [
      {
        subnet_name     = "ravi-subnet"
        address_prefixes = ["10.0.2.0/24"]
      },
      {
        subnet_name     = "ravi-subnet1"
        address_prefixes = ["10.0.3.0/24"]
      }
    ]
  }
}