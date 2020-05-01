# THIS IS NOT GOING TO WORK UNTIL THE REGISTRY NOMAD JOB
# IS DONE SO IT CAN PULL FROM THE CORRECT IMAGE

job "telegraf" {
  datacenters = ["us-east-1"]
  type = "system"

  group "telegraf" {
    task "deployTelegrafMetricsDockerContainer" {
      driver = "docker"

      config {
        image = "telegraf:latest"
        port_map {
          telegrafMetricsTCP = 8094
        }
      }

      service {
        name = "telegraf-metric"
        port = "telegrafMetricsTCP"
      }

      resources {
        network {
          port "telegrafMetricsTCP" {}
        }
      }
    }

    task "deployTelegrafLoggerDockerContainer" {
      driver = "docker"

      config {
        image = "telegraf:latest"
      }

      service {
        name = "telegraf-logger"
      }
    }
  }
}


#  image = "docker.onpay.dev:5000/telegraf:latest"
#  image = "docker.onpay.dev:5000/telegraf/telegraf-logger:latest"