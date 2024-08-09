variable "env" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "sgp" {
  type = string
}

variable "rds_name" {
  type = string
}

variable "rds_username" {
  type = string
}

variable "rds_db_name" {
  type = string
}

variable "rds_engine_version" {
  type = string
}

variable "rds_engine" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "default_tag" {
  type = string
}