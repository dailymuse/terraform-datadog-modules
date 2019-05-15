output "high_average_latency_apm_monitor_id" {
  value = "${datadog_monitor.high_average_latency.*.id}"
}

output "high_p90_latency_apm_monitor_id" {
  value = "${datadog_monitor.high_p90_latency.*.id}"
}

output "high_error_rate_apm_monitor_id" {
  value = "${datadog_monitor.high_error_rate.*.id}"
}

output "abnormal_throughput_apm_monitor_id" {
  value = "${datadog_monitor.abnormal_throughput.*.id}"
}
