variable "service_name" {
  description = "The service name of that is being monitored."
}

variable "env" {
  description = "The abbreviated environment that the monitors are being created for. Either 'stg' or 'prd'."
}

variable "alert_message_output" {
  description = "Name of slackroom or service alert output should go."
}

variable "request" {
  type        = "map"
  description = "A map of request details consisting of 'method', 'url' 'timeout' and 'body'."
}

variable "locations" {
  type        = "list"
  description = "Locations where synthetic should operate from."
  default     = ["aws:us-east-2"]
}

variable "options" {
  type        = "map"
  description = "A map of options. 'tick_every' (Required) 900, 1800, 3600, 21600, 43200, 86400, 604800 plus 60."

  default = {
    tick_every           = 60
    min_failure_duration = 180
    min_location_failed  = 1
  }
}

variable "assertions" {
  type        = "list"
  description = "Array of 1 to 10 items, only some combinations of type/operator are valid. 'type', 'operator', 'target' and 'property'."

  default = [{
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }]
}

variable "status" {
  description = "Status of the synthetic alarm either 'live', 'paused'."
  default     = "live"
}

variable "tags" {
  type        = "list"
  description = "A list of tags to associate with your synthetics test. This can help you categorize and filter tests in the manage synthetics page of the UI."
  default     = []
}

variable "create" {
  description = "(Boolean) Whether an alarm should be created or not."
}
