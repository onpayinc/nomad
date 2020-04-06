job "nomad-repo2" {
  datacenters = ["*"]
  type = "system"

  group "all-servers" {
    task "authGitRepoLocally" {
      driver = "raw_exec"
      config {
        command = "/nomad/nomad-repo/run.sh"
      }
    }
    task "cloneGitRepo" {
      driver = "raw_exec"

      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/bin/sleep"
        args    = ["10"]
      }

      artifact {
        source = "git::ssh://git@bitbucket.org:onpay/nomad.git"
        destination = "/opt/nomad-repo"
        options {
          sshkey = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBeFh3Y3UzNXJTNmh3VWVHVjhUb095MXZiaGFxNERZaW9kWW5KNE9jRnJ4QmpOSjBVCmYwTjlxWHN6L01kenUvUmJVMDJQZnRMYVQzd2EvWTAwMUk5cXZxSmxEU1MxdHRiRnorNE5DWmtKdXJycElBVlAKNjJreHNzQm9QREtxaG42NDRsUmsva1J4K014Q1hCb3pLRWNKOEdCUVYwQUlRQUh0TWhJMExqTnJuUFFqanVwQwpmaldCbVF3cGQyb3hjWWEyYmtxNWVTeVdVYzhVRmdHWVplZTNZb1Y3cHpnVmtjV1dqWU1VTENHNExCV1M5bEozCmZ4K0JPUnFEUzh2RWNBS3VOS3VlSUdlZ2Rva3lodHRRamRHR2M1QVdFd2h4UVROUjRmYUx3V1pTeFd0RkJYdk4KbUpDS0k0SC9QQlVFNE01Nnc2QVluSzNteGtRVHJCU3lnSytlUndJREFRQUJBb0lCQUJYdGt3OHFtV1ZjUGFTSgo1T2xWSmdGa29McDEyMXY5V1o4N2ZvUVBndTBPWjhXV3o0aldDS1VCL2lMS1RzcUc5b0VJY3ErRllDSkZTSVh3CjRQWGRPdUFTRGlCb2ZCamlQaks1WHc4NncvN005RWZPN3pIWGkySXF4U2d5QkFkTkdPQmd1Sm9YSllTWHdhS1MKY2kyOXZaZklTZ04ySTdSZndtTzE2NzlaakZCd0JYQ1hSRnpVdDJyY2NTM2toTlZTMzRNeTBHNDJPNGhEL3dBWApOenkva3JSS29NRHp5VHUxUllRa3RldW5uT05wdTBjZy9UaGt1ZUFFWkxFb3pZbUNqMDc3eW9aTSs0QW5HdC9RCm9zWUNhMEVWb3hjVnVzVE16cWVDUGJjMHNwa3RLdWhKN2VSRmZNeGI3SVNQbUt6bmJ3WkdISjlmdGw3V0RhZ3oKSjd5N1R5RUNnWUVBNkk0L1lqU2E2NEk2a3BwRFVVWXpCS0docnZJZHorL3NFeHl0UW9PZTV1VkpTZXhJL3F0cwpITGUyK2Z2T1pRZnAyUHV1U0Z0Nko1QVBNZmtURE5yS21SOGV6ZDdveDFPOXgrUEVFcW9IalFnTGlyMEFVMEdZCnczTFJzM05kOS9hZGVBTS9LczdDcm1wcXdUODgwaDZZREFvRXVFUzZ2am9iTHNYNVppN0tNSEVDZ1lFQTJXVEQKVTlBZ2VGZWZ2U0NRNm5KNFNXdDd4ME9HZHNvSXZldEpDQWlIOGdVV0JlbGFCekZEaENES3FGN3JXY29PQXNVZgp5c0pYZlNwUm5iK1ZqR2dtbzhtaEtobkNuRTVjU0xvZGhLWGQxMkpFK0JYTTgyQ3RyWTZIRHNncEpoUVVpeU1RCm5zVlNzV2hkTHRmditKL3hzZEtDVlJHdlYzVWFOUDVJREdjdGxqY0NnWUIvQTRJV3p3aDE3SEMxTlUvakNlWS8KZDAvcFR3OTlURnF4clkzcnNCdVBuRmRFNnFxTGZYRFUxbm8zV3BKRmwrYmV2Y2RZZWEza0FjaHEwTkRZeW42dwoxdEJxUEg4Q3J2Z09QcFlPWTVNd01kNnI3Y0pKdHFBS3o2RTgwNXZWSEhxdzI0VWFpa2JHSUJVaWFybDdRWDVsCnhPc0RBWGJGQXROcDNuTHlua2VMNFFLQmdFbkpMWkx3L1ZSYlNWaUVDU3ZLRnBHMDdacEFqUThjbThMNmJSdFEKNmZOM1RuWkxNY2RuTFNkWGlmR0Q1aFhmd3NtbDVwaUhSZkt4dm1ud2NPM3JHOUpUeVdQa3dtMFRHN2VEbENsRgpzdm83M0hUbjBWeDUzL2tjZXpMRk5WSTdWbzJ6SlJ6K2xJYXFpWll3ckw2U2F4S1VCTENqQkFTSE5wSHVETDVJCjl1d1pBb0dCQUxxMmZQRWFFUWZFUWJidnVHSUU2czU1aUxjOWFCMXVWbHFTTkh3ZmllZEJrV24xakhnd0szWkMKWmNJZ3l0NFhXc3MrUGtFN29laDNhbG40Tzl4am5oVitEd1RqSitGZWQrMGRUSlhxOWhteFNCN0JGOUc1elpmRwpBUFFVOENPRHBSempPaC9ueS9sY1Z0dGZVZEJHQytmaUw4NjNQb1hvdERLTks1ZFFKcnliCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=="
        }
      }
    }
  }
}
