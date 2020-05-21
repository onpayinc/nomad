job "nomad-repository" {
  datacenters = ["us-east-1"]
  type = "system"

  group "all" {
    restart {
      attempts = 0
      mode = "fail"
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
