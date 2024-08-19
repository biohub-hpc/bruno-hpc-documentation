
# How Job Submission Works

## Submitting a Job

A job consists in two parts: resource requests and job steps.

1. Resource requests describe the amount of computing resource (CPUs, GPUs, memory, expected run time, etc.) that the job will need to successfully run.
2. Job steps describe tasks that must be executed.

There are two distinct types of jobs that encompass the resource allocations and steps through Slurm. 

Interactive jobs and batch jobs. They both serve different purposes based on user needs.

### Interactive Jobs
Interactive jobs allow users to engage with the computational resources in real time, often through a command-line interface or graphical user interface.

These types of jobs are ideal for tasks that require immediate input or iterative development, such as debugging or testing code. 

### Batch Jobs 

Batch jobs, in contrast to interactive ones, are pre-defined tasks submitted to the scheduler with specified resource requirements and run in the background without user interaction. 

Batch jobs are well-suited for running long, complex simulations or analyses that do not need immediate user input and can be queued and executed automatically by Slurm when resources become available.

### Job Submission Diagram:
A simplified diagram of the basic job submission process in Slurm:

```
kroki-actdiag
actdiag {
  submit -> parseargs -> accept -> schedule -> assign -> run -> writeoutput -> exit -> writejobrecord -> reviewoutput

  lane user {
     label = "User"
     submit [label = "Submit Job\nsbatch, srun, salloc"];
     reviewoutput [label = "slurm-JOBID.out"];
  }
  lane slurmctld {
     label = "Slurm Controller"
     parseargs [label = "Parse job options"];
     accept [label = "Accept job submission"];
     schedule [label = "Schedule job for\nexecution"];
     assign [label = "Assign job to\nresources"];
     writejobrecord [label = "Write job record\nto accounting db"];
  }
  lane slurmd {
     label = "Slurm Node\nDaemon(s)";
     run [label = "Run job script on\nnodes(s)"];
     writeoutput [label = "Write stdio/stderr\nto output file"];
     exit [label = "Return script exit\ncode"];
  }
}
```

