job "nomad-repository" {
  datacenters = ["us-east-1"]
  type = "system"
  constraint {
    attribute = "${node.unique.id}"
    value = "fecd805d-4a0d-ec76-7719-0bfea9114f8e"
  }

  group "all-servers" {
    task "createGitRepoFolder" {
      driver = "raw_exec"
      config {
        command = "mkdir"
        args = ["-p", "/nomad-repo"]
      }
    }

    task "authGitRepoLocally" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args = ["-C", "/nomad/nomad-repo/run.sh"]
      }
    }
  }
}
