job "telegraf" {
  datacenters = ["us-east-1"]
  type = "system"


  group "telegraf" {
    task "deployTelegrafDockerContainer" {
      driver = "docker"

      config {
        image = "telegraf:1.13.2"
        volumes = [
          "/files/telegraf/telegraf.conf:/etc/telegraf/conf.d/telegraf.conf",
        ]


        port_map {
          telegrafTCP = 8094
        }
      }

      artifact {
        source      = "files/telegraf/telegraf.conf"
        destination = "/files/telegraf/telegraf.conf"
      }

      service {
        name = "telegraf"
        port = "telegrafTCP"
      }

      resources {
        network {
          port "telegrafTCP" {}
        }
      }
    }
  }
}
