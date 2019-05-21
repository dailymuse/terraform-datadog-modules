output "apm_monitor_id" {
  value = "${datadog_monitor.apm_monitor.*.id}"
}
