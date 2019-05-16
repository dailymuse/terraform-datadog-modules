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
  default_tags                = ["env:${var.env}", "service:${var.service_name}", "managed:terraform"]
}

resource "datadog_monitor" "apm_monitor" {
  name               = "Service ${var.service_name} has ${var.monitor_condition_name} on env:${var.env}"
  type               = "${var.type}"
  message            = "`${var.service_name}` has ${var.monitor_condition_name}.\n ${var.alert_message_output}"
  escalation_message = "${var.escalation_message}"

  query = "${var.query}"

  thresholds = "${var.thresholds}"

  new_host_delay    = "${local.default_new_host_delay}"
  notify_audit      = "${local.default_notify_audit}"
  notify_no_data    = "${local.default_notify_no_data}"
  no_data_timeframe = "${local.default_no_data_timeframe}"

  renotify_interval   = "${local.default_renotify_interval}"
  require_full_window = "${local.default_require_full_window}"

  locked       = "${local.default_locked}"
  timeout_h    = "${local.default_timeout_h}"
  include_tags = "${local.default_include_tags}"

  tags = "${concat(local.default_tags, var.tags)}"

  threshold_windows = "${var.threshold_windows}"

  count = "${var.create == true ? 1 : 0}"
}
