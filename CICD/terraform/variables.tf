# Variables for container pull

variable "login_server" {
  default = "https://aspdotnet.azurecr.io"
  type = string
}

variable "env" {
  type = string
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7CJGvlXX3JSY2Pgp5IBOO1FymGdVbApaUG0ZUUtcmNBxZ/pa6ACCZack2gMJ2VewSRfTLOxLtm+Q5poThoQUjYVyfec6vlVt7mskeG11Xz/FQzPsHSARqgX6HIxcRZ0ga/QKH1Ogy4korfWiBG0Zkiriv/IHKmbTPggtN3Gd/2nTx35IwWL1m46KfjI8jomToFIInhqUxWDhT4AcGAJ8AptUho/qTWtbujl93x3l7CpxIarNbSKq331eXxQIHw8FDTgxewTRyhxfO29jeHAA5RQq/L8quvt6mgGB6TOC7huKcQrNrFgQN2G/xZfHlluGWoOL/LbYXErXi4swpdlaP vagrant"
  type = string
}
