variable "env" {}

variable "service_name" {
  description = "The service name of that is being monitored."
}

variable "monitor_condition_name" {
  description = "TODO"
}

variable "query" {
  description = "Query that the monitor will use to measure against."
}

variable "thresholds" {
  type        = "map"
  description = "TODO"
}

variable "threshold_windows" {
  type        = "map"
  description = "TODO"

  default = {}
}

variable "escalation_message" {
  description = "TODO"
  default     = ""
}

variable "tags" {
  type        = "list"
  description = "TODO"
  default     = []
}

variable "create" {
  description = "TODO"
}

variable "alert_message_output" {
  description = "TODO"
}

variable "type" {
  description = "TODO"
}
