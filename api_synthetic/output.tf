output "synthetic_monitor_id" {
  value = "${datadog_synthetics_test.synthetic_montior.*.id}"
}
