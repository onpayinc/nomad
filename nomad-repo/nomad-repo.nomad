job "nomad-repository" {
  datacenters = ["us-east-1"]
  type = "system"

  group "all" {
    restart {
      attempts = 0
      mode = "fail"
    }

    constraint {
      attribute = "${node.unique.id}"
      value = "fecd805d-4a0d-ec76-7719-0bfea9114f8e"
    }

    task "authGitRepoLocally" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args = ["/nomad/nomad-repo/run.sh"]
      }
    }
  }
}
