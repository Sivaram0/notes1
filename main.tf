resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

----------------
EXAMPLE PRACTICE vm
----------------
Define:

resource_group_name
azurerm_virtual_network
azurerm_subnet
azurerm_network_interface
azurerm_linux_virtual_machine


resource "azurerm_resource_group" "hsbc_wb_rg"{
    name = ""
    location = ""
}

resource "azurerm_virtual_network" "hsbc_wb_vn"{
    name = ""
    address_space = ""
    location = ""
    resource_group_name = ""
}

resource "azurerm_subnet" "hsbc_wb_snet"{
    name = ""
    resource_group_name  = ""
    virtual_network_name = ""
    address_prefixes = [""]

}

resource "azurerm_network_interface" "hsbc_wb_nic"{
    name = ""
    location = ""
    resource_group_name = ""
    ip_configuration {
        name = ""
        subnet_id = ""
        private_ip_address_allocation = ""
    }
       
}

resource "azurerm_linux_virtual_machine" "hsbc_vm"{
    name = ""
    resource_group_name = ""
    location = ""
    size = "Standard_B2"
    admin_username = "sivaramaprasad"
    network_interface_ids = [
        azurerm_network_interface.id
    ]

}

------------------------------------------------------------------------------

AWS EC2 from terraform official

# Specify the AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your preferred region
}

# Create a Security Group
resource "aws_security_group" "ec2_security_group" {
  name        = "example-ec2-sg"
  description = "Allow SSH and HTTP traffic"

  # Allow inbound SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this in production
  }

  # Allow inbound HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "example-key"
  public_key = file("~/.ssh/id_rsa.pub") # Replace with your public key path
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0c02fb55956c7d316" # Replace with your preferred AMI ID
  instance_type = "t2.micro"             # Change instance type as needed

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  # Associate the key pair
  key_name = aws_key_pair.ec2_key.key_name

  # Tag the instance
  tags = {
    Name = "ExampleInstance"
  }
}

# Output the instance public IP
output "instance_public_ip" {
  value = aws_instance.example_instance.public_ip
}


----------------
provider
----------------

Define:
aws_provider
aws_security_group { create inbount/ outbount rules }
create key pair
create ec2 instance
output the instance public IP

provider "aws" {
    region = ""
}

resource "aws_security_group" "ec2_security_group" {
    name = ""
    description = ""

    ingress {
        from from_port = 

    }
    egress {

        from_port = 
    }
}

resource "aws_instance" ""




AZURE blob storage 
