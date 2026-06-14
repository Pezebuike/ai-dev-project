packer {
    required_plugins {
        amazon = {
            version = ">= 1.0.0"
            source  = "github.com/hashicorp/amazon"
        }
    }
}


source "amazon-ebs" "ubuntu" {
    region        = var.region
    instance_type = var.instance_type
    ami_name      = var.ami_name
    source_ami_filter {
        filters = {
            name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
            root-device-type    = "ebs"
            virtualization-type = "hvm"
        }
        most_recent = true
        owners      = ["099720109477"] # Canonical
    }
    ssh_username = var.ssh_username
}

build {
    name    = "Install nginx"
    sources = ["source.amazon-ebs.ubuntu"]

    provisioner "shell" {
        script = "script/nginx.sh"
    }
}
