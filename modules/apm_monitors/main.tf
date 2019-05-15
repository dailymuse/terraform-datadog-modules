locals {
  default_locked              = true
  default_include_tags        = true
  default_new_host_delay      = 300
  default_no_data_timeframe   = 20
  default_notify_audit        = false
  default_notify_no_data      = true
  default_renotify_interval   = 60
  default_require_full_window = true
  default_timeout_h           = 0

  default_tags = ["env:${var.env}", "service:${var.service_name}", "managed:terraform"]
}

resource "datadog_monitor" "high_average_latency" {
  name               = "Service ${var.service_name} has a high average latency on env:${var.env}"
  type               = "query alert"
  message            = "`${var.service_name}` average latency is too high.\n ${var.alert_message_output}"
  escalation_message = ""

  query = "avg(last_12h):anomalies(( sum:${var.apm_request_resource}.duration{service:tm.partners,env:${var.env}} / sum:${var.apm_request_resource}.hits{service:tm.partners,env:${var.env}} ), 'basic', 3, direction='above', alert_window='last_1h', interval=120, count_default_zero='true') >= 1"

  thresholds = "${var.high_avg_latency_thresholds}"

  new_host_delay    = "${local.default_new_host_delay}"
  notify_audit      = "${local.default_notify_audit}"
  notify_no_data    = "${local.default_notify_no_data}"
  no_data_timeframe = "${local.default_no_data_timeframe}"

  renotify_interval   = "${local.default_renotify_interval}"
  require_full_window = "${local.default_require_full_window}"

  locked       = "${local.default_locked}"
  timeout_h    = "${local.default_timeout_h}"
  include_tags = "${local.default_include_tags}"

  tags = "${local.default_tags}"

  threshold_windows = {
    recovery_window = "last_1h"
    trigger_window  = "last_1h"
  }

  count = "${var.create_high_avg_latency_monitor == true ? 1 : 0}"
}

resource "datadog_monitor" "high_error_rate" {
  name               = "Service ${var.service_name} has a high error rate on env:${var.env}"
  type               = "query alert"
  message            = "`${var.service_name}` error rate is too high.\n ${var.alert_message_output}"
  escalation_message = ""

  query = "avg(last_10m):( sum:${var.apm_request_resource}.errors{service:${var.service_name},env:${var.env}} / sum:${var.apm_request_resource}.hits{service:${var.service_name},env:${var.env}} ) > 0.05"

  thresholds = "${var.high_error_rate_thresholds}"

  new_host_delay    = "${local.default_new_host_delay}"
  notify_audit      = "${local.default_notify_audit}"
  notify_no_data    = "${local.default_notify_no_data}"
  no_data_timeframe = "${local.default_no_data_timeframe}"

  renotify_interval   = "${local.default_renotify_interval}"
  require_full_window = "${local.default_require_full_window}"

  locked       = "${local.default_locked}"
  timeout_h    = "${local.default_timeout_h}"
  include_tags = "${local.default_include_tags}"

  tags = "${local.default_tags}"

  count = "${var.create_high_error_rate_monitor == true ? 1 : 0}"
}

resource "datadog_monitor" "high_p90_latency" {
  name               = "Service ${var.service_name} has a high p90 latency on env:${var.env}"
  type               = "metric alert"
  message            = "`${var.service_name}` 90th percentile latency is too high.\n ${var.alert_message_output}"
  escalation_message = ""

  query = "avg(last_12h):anomalies(avg:${var.apm_request_resource}.duration.by.service.90p{service:tm.partners,env:${var.env}}, 'basic', 2, direction='above', alert_window='last_1h', interval=120, count_default_zero='true') >= 1"

  thresholds = "${var.high_p90_latency_thresholds}"

  new_host_delay    = "${local.default_new_host_delay}"
  notify_audit      = "${local.default_notify_audit}"
  notify_no_data    = "${local.default_notify_no_data}"
  no_data_timeframe = "${local.default_no_data_timeframe}"

  renotify_interval   = "${local.default_renotify_interval}"
  require_full_window = "${local.default_require_full_window}"

  locked       = "${local.default_locked}"
  timeout_h    = "${local.default_timeout_h}"
  include_tags = "${local.default_include_tags}"

  tags = "${local.default_tags}"

  threshold_windows = {
    recovery_window = "last_1h"
    trigger_window  = "last_1h"
  }

  count = "${var.create_high_p90_latency_monitor == true ? 1 : 0}"
}

resource "datadog_monitor" "abnormal_throughput" {
  name               = "Service ${var.service_name} has an abnormal change in throughput on ${var.env}"
  type               = "query alert"
  message            = "`${var.service_name}` throughput deviated too much from its usual value.\n ${var.alert_message_output}"
  escalation_message = ""

  query = "avg(last_1h):anomalies(sum:${var.apm_request_resource}.hits{service:${var.service_name},env:${var.env}}, 'agile', 3, direction='both', alert_window='last_30m', interval=20, count_default_zero='true', seasonality='hourly') >= 1"

  thresholds = "${var.abnormal_throughput_thresholds}"

  new_host_delay    = "${local.default_new_host_delay}"
  notify_audit      = "${local.default_notify_audit}"
  notify_no_data    = "${local.default_notify_no_data}"
  no_data_timeframe = "${local.default_no_data_timeframe}"

  renotify_interval   = "${local.default_renotify_interval}"
  require_full_window = "${local.default_require_full_window}"

  locked       = "${local.default_locked}"
  timeout_h    = "${local.default_timeout_h}"
  include_tags = "${local.default_include_tags}"

  tags = "${local.default_tags}"

  threshold_windows = {
    recovery_window = "last_30m"
    trigger_window  = "last_30m"
  }

  count = "${var.create_abnormal_throughput_monitor == true ? 1 : 0}"
}
