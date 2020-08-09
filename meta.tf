terraform {
  backend "s3" {
    bucket = "matrix-remote-backend"
    key    = "remote.tfstate"
    region = "us-west-2"
  }
}
