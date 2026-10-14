# Red NAT con DHCP: proporciona conectividad exterior a las VMs
resource "libvirt_network" "ej4-nat-dhcp" {
  name      = "ej4-nat-dhcp"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.100.0/24"]
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

# Red aislada sin DHCP: comunicación interna con IP estática
resource "libvirt_network" "ej4-aislada-static" {
  name      = "ej4-aislada-static"
  mode      = "none"
  addresses = ["192.168.130.0/24"]
  dhcp { enabled = false }
  autostart = true
}

# Red muy aislada sin DHCP: sin comunicación interna con IP estática
resource "libvirt_network" "ej4-muy-aislada-static" {
  name      = "ej4-muy-aislada-static"
  mode      = "none"
  dhcp { enabled = false }
  autostart = true
}
