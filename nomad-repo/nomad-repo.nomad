job "nomad-repository" {
  datacenters = ["us-east-1"]
  type = "system"

  group "all" {
    restart {
      attempts = 0
      mode = "fail"
    }

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
