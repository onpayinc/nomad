job "telegraf" {
  datacenters = ["*"]
  type = "system"


  group "telegraf" {
    task "deployTelegrafDockerContainer" {
      driver = "docker"

      config {
        image = "telegraf:1.13.2"
        volumes = [
          "/files/telegraf/telegraf.conf:/etc/telegraf/conf.d/telegraf.conf", //host:container and the artifact is for how this volume knows where to get this
        ]


        port_map {
          telegrafTCP = 8094
        }
      }

      artifact {
        source      = "files/telegraf/telegraf.conf" //this will need to be bitbucket path
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
    task "" {

    }
  }
}
