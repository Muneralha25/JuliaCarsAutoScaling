resource "oci_core_instance_configuration" "JuliaCars" {
    compartment_id = var.compartment_ocid
    display_name = "JuliaCarsInstanceWebserverConfiguration"
    instance_id = oci_core_instance.web-01.id
    source = "INSTANCE"
}