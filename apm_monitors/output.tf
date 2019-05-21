output "high_average_latency_apm_monitor_id" {
  value = "${module.high_average_latency.apm_monitor_id}"
}

output "high_error_rate_apm_monitor_id" {
  value = "${module.high_error_rate.apm_monitor_id}"
}

output "high_p90_latency_apm_monitor_id" {
  value = "${module.high_p90_latency.apm_monitor_id}"
}

output "abnormal_throughput_apm_monitor_id" {
  value = "${module.abnormal_throughput.apm_monitor_id}"
}
