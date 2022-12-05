resource "oci_autoscaling_auto_scaling_configuration" "JuliaCarsThresholdAutoScalingConfiguration" {
    auto_scaling_resources {

        id = oci_core_instance_pool.JuliaCarsInstancePool.id
        type = "instancePool"
    }
    compartment_id  = var.compartment_ocid
    policies {
        display_name = "JuliaCarsThresholdAutoScalingConfigurationPolicies"
        capacity {
            initial = var.minimal_size
            max = "2"
            min = "1"
        }
        policy_type = "threshold"
        rules {
            action {
                type = "CHANGE_COUNT_BY"
                value = "1"
            }
            display_name = "JuliaCarsThresholdAutoScalingConfigurationPoliciesScaleOutRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "GT"
                    value = "99"
                }
            }
        }
        rules {
            action {
                type  = "CHANGE_COUNT_BY"
                value = "-1"
            }
            display_name = "JuliaCarsThresholdAutoScalingConfigurationPoliciesScaleInRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "LT"
                    value = "1"
                }
            }
        }
    }
    cool_down_in_seconds = "300"
    display_name = "JuliaCarsThresholdAutoScalingConfiguration"
}
