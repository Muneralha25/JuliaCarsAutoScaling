resource "oci_core_instance_pool" "JuliaCarsInstancePool" {
    compartment_id  = var.compartment_ocid
    instance_configuration_id = oci_core_instance_configuration.JuliaCars.id  
    placement_configurations {
        availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1]["name"]
        primary_subnet_id = oci_core_subnet.subnet.id

    }
    size = "2"
    display_name = "JuliaCarsInstancePool"
    load_balancers {
        backend_set_name  = oci_load_balancer_backend_set.web-servers-backend.name
        load_balancer_id  = oci_load_balancer.Load_Balancer.id
        port = "80"
        vnic_selection = "PrimaryVnic"
    }
}