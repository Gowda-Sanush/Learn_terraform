resource "aws_instance" "collabnix_node" {
 ami               = "ami-21f78e11"
 availability_zone = var.availability_zone
 instance_type     = var.instance_type

 tags {
   Name = "Collabnix_terraform"
 }
}

resource "aws_ebs_volume" "collabnix_vol" {
 availability_zone = "us-east-1c"
 size              = 1

  tags {
   Name = "Collabnix_terraform_vol"
 }
}

resource "aws_volume_attachment" "collabnix_vol_attachment" {
 device_name = "/dev/sdh"
 volume_id   = aws_ebs_volume.collabnix_vol.id
 instance_id = aws_instance.collabnix_node.id
}