# Slurm REST API

## Overview

The SlurmREST API provides a powerful and flexible interface for HPC users to interact with Slurm clusters programmatically. Through this RESTful API, users can perform a wide range of tasks, including submitting, monitoring, and managing jobs, querying job statuses, and accessing cluster information. 

The API supports the creation, modification, and deletion of jobs, making it easier to automate workflows and integrate Slurm functionality into custom applications or scripts. Additionally, SlurmREST allows users to retrieve detailed information about resources, queues, and job allocations, providing a comprehensive toolset for managing and optimizing HPC workloads from a web-based or programmatic environment.

## Python Example

This simple bit of Python will run `slurmrestd` as the user, giving access to the full API without running a service. It's sufficient for simple and moderate volumes of calls to the API and doesn't require any special authentication or setup.

``` {.python}
import subprocess, os, json
from pprint import pprint as pprint

# Wrap slurmrestd so that it Just Works(tm).
# By default we return the API definition.

def request(method = 'GET', url = '/openapi'):
    command = 'echo "%s %s HTTP/1.1\r\n" | %s' % (method, url, 'slurmrestd')
    os.environ['SLURMRESTD_SECURITY'] = 'disable_user_check'
    status, output = subprocess.getstatusoutput(command)

    return output

def request_json(method = 'GET', url = '/openapi'):
    head, body = request(method, url).split('\n\n',1)
    return body

def request_dict(method = 'GET', url = '/openapi'):
    body = json.loads(request_json(method, url))
    return body

if __name__ == "__main__":
    print(request('GET', '/slurm/v0.0.38/ping'))

```


