resource "aws_key_pair" "user_key" {
  key_name = "${var.key_name}"
  public_key = "${var.key_public}"
}
