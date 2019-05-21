module "high_average_latency" {
  source = "../apm_monitor"

  service_name           = "${var.service_name}"
  env                    = "${var.env}"
  type                   = "query alert"
  monitor_condition_name = "high average latency"
  alert_message_output   = "${var.high_avg_latency_alert_message_output}"

  query = "avg(last_12h):anomalies(( sum:${var.apm_request_resource}.duration{service:${var.service_name},env:${var.env}} / sum:${var.apm_request_resource}.hits{service:${var.service_name},env:${var.env}} ), 'basic', 3, direction='above', alert_window='last_1h', interval=120, count_default_zero='true') >= 1"

  thresholds = "${var.high_avg_latency_thresholds}"

  threshold_windows = {
    recovery_window = "last_1h"
    trigger_window  = "last_1h"
  }

  create = "${var.create_high_avg_latency_monitor == true ? true : false}"
}

module "high_error_rate" {
  source = "../apm_monitor"

  service_name           = "${var.service_name}"
  env                    = "${var.env}"
  type                   = "query alert"
  monitor_condition_name = "high error rate"
  alert_message_output   = "${var.high_error_rate_alert_message_output}"

  query = "avg(last_10m):( sum:${var.apm_request_resource}.errors{service:${var.service_name},env:${var.env}} / sum:${var.apm_request_resource}.hits{service:${var.service_name},env:${var.env}} ) > 0.05"

  thresholds = "${var.high_error_rate_thresholds}"

  create = "${var.create_high_error_rate_monitor == true ? true : false}"
}

module "high_p90_latency" {
  source = "../apm_monitor"

  service_name           = "${var.service_name}"
  env                    = "${var.env}"
  type                   = "metric alert"
  monitor_condition_name = "high p90 latency"
  alert_message_output   = "${var.high_p90_alert_message_output}"

  query = "avg(last_12h):anomalies(avg:${var.apm_request_resource}.duration.by.service.90p{service:${var.service_name},env:${var.env}}, 'basic', 2, direction='above', alert_window='last_1h', interval=120, count_default_zero='true') >= 1"

  thresholds = "${var.high_p90_latency_thresholds}"

  threshold_windows = {
    recovery_window = "last_1h"
    trigger_window  = "last_1h"
  }

  create = "${var.create_high_p90_latency_monitor == true ? true : false}"
}

module "abnormal_throughput" {
  source = "../apm_monitor"

  service_name           = "${var.service_name}"
  env                    = "${var.env}"
  type                   = "query alert"
  monitor_condition_name = "abnormal change in throughput"
  alert_message_output   = "${var.abnormal_throughput_alert_message_output}"

  query = "avg(last_1h):anomalies(sum:${var.apm_request_resource}.hits{service:${var.service_name},env:${var.env}}, 'agile', 3, direction='both', alert_window='last_30m', interval=20, count_default_zero='true', seasonality='hourly') >= 1"

  thresholds = "${var.abnormal_throughput_thresholds}"

  threshold_windows = {
    recovery_window = "last_30m"
    trigger_window  = "last_30m"
  }

  create = "${var.create_abnormal_throughput_monitor == true ? true : false}"
}
