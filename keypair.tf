resource "aws_key_pair" "k8s" {
  key_name   = "k8s"
  public_key = file("demo-key.pub")
}