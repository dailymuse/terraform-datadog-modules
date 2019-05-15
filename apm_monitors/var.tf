variable "service_name" {
  description = "The service name of that is being monitored."
}

variable "env" {
  description = "The abbreviated environment that the monitors are being created for. Either 'stg' or 'prd'."
}

variable "alert_message_output" {
  description = "Name of slackroom or service alert output should go."
}

variable "apm_request_resource" {
  description = "The request resource you want to query against."
}

# high_avg_latency
variable "create_high_avg_latency_monitor" {
  description = "Flag to control whether a high avg latency monitor is created."
  default     = true
}

variable "high_avg_latency_thresholds" {
  description = "Alerting thresholds for high p90 latency monitor."

  default = {
    critical          = 1
    critical_recovery = 0.1
  }
}

# high_p90_latency
variable "create_high_p90_latency_monitor" {
  description = "Flag to control whether a high p90 latency monitor is created."
  default     = true
}

variable "high_p90_latency_thresholds" {
  description = "Alerting thresholds for high p90 latency monitor."

  default = {
    critical = 1
    warning  = 0
  }
}

variable "create_high_error_rate_monitor" {
  description = "Flag to control whether a high error rate monitor is created."
  default     = true
}

# high_error_rate
variable "high_error_rate_thresholds" {
  description = "Alerting thresholds for high error rate monitor."

  default = {
    critical = 0.05
    warning  = 0.01
  }
}

# abnormal_throughput
variable "create_abnormal_throughput_monitor" {
  description = "Flag to control whether an abnormal throughput monitor is created."
  default     = true
}

variable "abnormal_throughput_thresholds" {
  description = "Alerting thresholds for abnormal throughput monitor."

  default = {
    critical          = 1
    critical_recovery = 0.1
  }
}
