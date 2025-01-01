@startuml
!define osaPuml https://raw.githubusercontent.com/Crashedmind/PlantUML-opensecurityarchitecture2-icons/master
!include osaPuml/Common.puml
!include osaPuml/Hardware/all.puml
!include osaPuml/Server/all.puml
!include osaPuml/Site/all.puml

' Define Sites (Cities)
osa_site_office(ankara, "Ankara Office", "Main Office with Servers")
osa_site_office(istanbul, "Istanbul Office", "Branch Office")
osa_site_office(izmir, "Izmir Office", "Branch Office")

' Devices in Ankara
together {
    osa_server(dhcp_server, "2001:db8:ankara:40::11", "DHCP Server", "IPv6")
    osa_server(dns_server, "2001:db8:ankara:40::12", "DNS Server", "IPv6")
    osa_server(web_server, "2001:db8:ankara:40::13", "Web Server", "IPv6")
    osa_device_switch(ankara_core, "Ankara Core Switch", "L3 Switch")
    osa_device_switch(ankara_mgmt, "Management VLAN (2001:db8:ankara:1::/64)", "VLAN 1")
    osa_device_switch(ankara_it, "IT VLAN (192.168.10.0/26)", "VLAN 10")
    osa_device_switch(ankara_workers, "Workers VLAN (192.168.20.0/24)", "VLAN 20")
    osa_device_switch(ankara_guests, "Guests VLAN (192.168.30.0/25)", "VLAN 30")
}

' Devices in Istanbul
together {
    osa_device_switch(istanbul_core, "Istanbul Core Switch", "L3 Switch")
    osa_device_switch(istanbul_mgmt, "Management VLAN (2001:db8:istanbul:1::/64)", "VLAN 2")
    osa_device_switch(istanbul_it, "IT VLAN (192.168.11.0/26)", "VLAN 11")
    osa_device_switch(istanbul_workers, "Workers VLAN (192.168.22.0/24)", "VLAN 22")
    osa_device_switch(istanbul_guests, "Guests VLAN (192.168.33.0/25)", "VLAN 33")
}

' Devices in Izmir
together {
    osa_device_switch(izmir_core, "Izmir Core Switch", "L3 Switch")
    osa_device_switch(izmir_mgmt, "Management VLAN (2001:db8:izmir:1::/64)", "VLAN 3")
    osa_device_switch(izmir_it, "IT VLAN (192.168.111.0/26)", "VLAN 111")
    osa_device_switch(izmir_workers, "Workers VLAN (192.168.222.0/24)", "VLAN 222")
    osa_device_switch(izmir_guests, "Guests VLAN (192.168.35.0/25)", "VLAN 35")
}

' Network Topology
osa_device_router(router_ankara, "Ankara Router", "Main Router")
osa_device_router(router_istanbul, "Istanbul Router", "Branch Router")
osa_device_router(router_izmir, "Izmir Router", "Branch Router")

router_ankara --> ankara_core
router_istanbul --> istanbul_core
router_izmir --> izmir_core

ankara_core --> dhcp_server
ankara_core --> dns_server
ankara_core --> web_server

ankara_core --> ankara_mgmt
ankara_core --> ankara_it
ankara_core --> ankara_workers
ankara_core --> ankara_guests

istanbul_core --> istanbul_mgmt
istanbul_core --> istanbul_it
istanbul_core --> istanbul_workers
istanbul_core --> istanbul_guests

izmir_core --> izmir_mgmt
izmir_core --> izmir_it
izmir_core --> izmir_workers
izmir_core --> izmir_guests

footer %filename() rendered with PlantUML version %version()\nMulti-City VLAN Network by Mohammed AlMashhor
@enduml
