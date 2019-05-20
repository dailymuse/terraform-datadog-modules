variable "alert_message_output" {
  description = "The '@username' notifications where you want alert messages to go."
}

variable "create" {
  description = "(Boolean) Whether an alarm should be created or not."
}

variable "env" {
  description = "The environment the monitor is checking."
}

variable "escalation_message" {
  description = "An optional message to include with a re-notification. Supports the '@username' notification allowed elsewhere."
  default     = ""
}

variable "monitor_condition_name" {
  description = "A short description of the alert condition."
}

variable "query" {
  description = "Query that the monitor will use to measure against."
}

variable "service_name" {
  description = "The service name that is being monitored."
}

variable "tags" {
  type        = "list"
  description = "A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API"
  default     = []
}

variable "threshold_windows" {
  type        = "map"
  description = "A mapping containing recovery_window and trigger_window values, e.g. last_15m. Can only be used for anomaly monitors."
  default     = {}
}

variable "thresholds" {
  type        = "map"
  description = "A dictionary of thresholds by threshold type. Currently we have four threshold types for metric alerts: critical, critical recovery, warning, and warning recovery"
}

variable "type" {
  description = "The type of the monitor"
}
