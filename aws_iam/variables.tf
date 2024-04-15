variable "groups_with_users" {
  type = map(list(string))
  default = {
    # "group1" = ["user1", "user2"],
  }
}

variable "security_credentials" {
  description = "IAM user names with descriptions"
  type        = any
  default = {
    # "user1" = ["desc1", "desc2"],
    # "user2" = ["desc3", "desc4"]
  }
}

variable "policies" {
  type = map(list(string))
  default = {
    # "PolicyName1" = ["NEXTCLOUD"],
    # "PolicyName2" = ["GroupName2"],
  }
}
