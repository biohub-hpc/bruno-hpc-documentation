# Globus

Globus is a powerful tool for transferring, sharing, and managing large datasets across different systems, including the Bruno high-performance computing cluster. 

It provides a user-friendly, secure, and efficient way to move data between your local machine, cloud storage, and HPC environments. This guide will walk you through the process of using Globus on an HPC system.

## 1. What is Globus?

Globus is a cloud-based service that enables secure, reliable data transfer and sharing across different storage systems. It is particularly well-suited for large-scale data transfers, making it ideal for HPC users who often deal with massive datasets.

### Key Features:
- **High-Speed Transfers:** Optimized for large files and directories.
- **Fault Tolerance:** Automatically retries failed transfers.
- **Security:** Uses OAuth2 for authentication and encryption during transfers.
- **Ease of Use:** Simple web interface with advanced command-line options.

## 2. Setting Up Globus

### Step 1: Create a Globus Account
If you don't already have a Globus account, you need to create one:

1. Go to the [Globus website](https://www.globus.org/).
2. Click on "Login" and sign in with your institution credentials (many universities and research institutions are supported).
3. If your institution is not listed, you can create a Globus ID using your email.

### Step 2: Install Globus Connect Personal (Optional)
If you want to transfer data between your local machine and an HPC system, you'll need to install Globus Connect Personal on your local machine.

1. Download Globus Connect Personal from the [Globus website](https://www.globus.org/globus-connect-personal).
2. Follow the installation instructions for your operating system.
3. Set up a personal endpoint on your machine following the provided instructions.

### Step 3: Find or Set Up Endpoints
Endpoints are locations where data is stored. HPC systems often have a Globus endpoint already set up by the administrators.

1. **Locate the HPC Endpoint**: You can find the endpoint name in your HPC system documentation or by contacting the system administrators.
2. **Create a Personal Endpoint**: If you are transferring data to/from your local machine, you will need to create a personal endpoint using Globus Connect Personal.

## 3. Transferring Data with Globus

### Step 1: Access the Globus Web Interface

1. Go to the [Globus File Manager](https://app.globus.org/file-manager) in your web browser.
2. Log in using your Globus credentials.

### Step 2: Select Your Endpoints

1. In the File Manager, select the "Collection" field on the left side to choose your source endpoint.
2. Do the same on the right side to choose your destination endpoint.

### Step 3: Browse and Transfer Files

1. **Browse Directories**: Navigate through the directory structure on both endpoints to locate your files.
2. **Initiate Transfer**: Select the files or directories you want to transfer from the source endpoint, then click the transfer button (a blue arrow) pointing towards the destination endpoint.
3. **Monitor the Transfer**: You can monitor the progress of your transfers in the "Activity" section. Globus will email you when the transfer is complete or if there are any issues.

### Step 4: Sharing Data (Optional)

1. **Create a Shared Endpoint**: If you want to share data with others, you can create a shared endpoint from your existing endpoint.
2. **Set Permissions**: Define who can access the shared data and what permissions they have (read-only or write access).

## 4. Using the Globus Command-Line Interface (CLI)

For advanced users, Globus provides a command-line interface that allows for scripting and automation of transfers.

### Step 1: Install the Globus CLI

Install the Globus CLI using pip:
```bash
pip install globus-cli
```

### Step 2: Authenticate the CLI

Authenticate your Globus CLI with your account:
```bash
globus login
```

### Step 3: Perform Data Transfers

Initiate a transfer between two endpoints:
```bash
globus transfer SOURCE_ENDPOINT_ID:/source/path DESTINATION_ENDPOINT_ID:/destination/path
```

Check the status of a transfer:
```bash
globus task show TASK_ID
```

## 5. Troubleshooting and Tips

- **Transfer Failures**: Globus automatically retries failed transfers. If issues persist, check file permissions and available storage.
- **Optimizing Transfers**: Use the Globus web interface to adjust transfer settings, such as concurrency and parallelism, for faster transfers.
- **Access Control**: Ensure you have the necessary permissions on both the source and destination endpoints.

## 6. Conclusion

Globus is an essential tool for HPC users who need to transfer large datasets efficiently and securely. Whether you are moving data between your local machine and the cluster or between different clusters, Globus offers a robust solution that integrates well with HPC environments. By following this guide, you should be able to set up and use Globus for your data transfer needs effectively.

For more detailed documentation and support, visit the [Globus Support Center](https://support.globus.org/hc/en-us).
