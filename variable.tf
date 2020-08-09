variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}
