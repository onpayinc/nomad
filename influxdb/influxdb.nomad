job "influxDB" {
  datacenters = ["us-east-1"]
  type = "service"

  constraint {
    attribute = "${meta.ServerType}"
    value     = "influxDB"
  }

  group "influxdb" {
    task "deployInfluxDockerContainer" {
      driver = "docker"

      config {
        image = "influxdb:1.7.9"
        volumes = [
          "/data/influxData:/var/lib/influxd",
        ]

        port_map {
          influxTCP = 8096
        }
      }

      service {
        name = "influxdb"
        port = "influxTCP"
      }

      resources {
        network {
          port "influxTCP" {}
        }
      }
    }
  }
}
