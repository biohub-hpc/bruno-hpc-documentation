# Using `seff` and `ruse`

The **Seff tool** is a powerful command-line utility designed to provide users with detailed efficiency 
statistics for jobs run on a Slurm (Simple Linux Utility for Resource Management) workload manager. 
It allows users to quickly assess how effectively their computing resources were utilized during job execution. 
By offering metrics such as memory usage, CPU efficiency, and runtime, Seff enables users to optimize their workflows, ensuring that computational resources are used as efficiently as possible. 
This tool is particularly valuable in high-performance computing environments where resource management and job efficiency are critical.

The **Ruse tool** is a specialized command-line utility for the Slurm workload manager, designed to provide users with insights into the resource usage of their jobs. 
By analyzing various metrics such as memory consumption, CPU utilization, and GPU efficiency, Ruse helps users understand how their jobs are consuming resources in a high-performance computing environment. 
This tool aids in optimizing job configurations by offering detailed reports, enabling users to make informed decisions to enhance resource efficiency, reduce costs, and improve overall computational performance on Slurm-managed clusters.


## `seff`
seff displays statistics related to the efficiency of resource usage by a completed job.

Usage:
  `seff <jobid>`

## `ruse` 

ruse is a command line tool developed by Jan Moren to measure a process' resource usage. It periodically measures the resource use of a process and its subprocesses, and can help you find out how much resource to allocate to your job. It will determine the actual memory, execution time and cores that individual programs or MPI applications need to request in their job submission options.

ruse periodically samples the process and its subprocesses and keeps track of the CPU, time and maximum memory use. It also optionally records the sampled values over time. The purpose or Ruse is not to profile processes in detail, but to follow jobs that run for many minutes, hours or days, with no performance impact and without changing the measured application in any way.

You'll find complete documentation and details about ruse's usage on the project webpage, but here are a few useful examples.
Sizing a job#

In its simplest form, ruse can help discover how much resources a new script or application will need. For instance, you can start a sizing session on a compute node with an overestimated amount of resources, and start your application like this:
