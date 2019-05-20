locals {
  default_tags = ["env:${var.env}", "service:${var.service_name}", "managed:terraform"]
}

resource "datadog_synthetics_test" "synthetic_montior" {
  name    = "Check on ${var.request["url"]}"
  message = "Synthetic test for `${var.service_name}` failed. ${var.alert_message_output}"
  type    = "api"

  request = "${var.request}"

  assertions = "${var.assertions}"

  locations = "${var.locations}"

  options = "${var.options}"

  tags = "${concat(local.default_tags, var.tags)}"

  status = "${var.status}"

  count = "${var.env == "prd" ? 1 : 0}"
}
