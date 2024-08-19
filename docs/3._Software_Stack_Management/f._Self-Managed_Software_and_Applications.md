# Self-managed Software and Applications

When working with software that is under development, one-off testing, or other needs which require quick install/upgrade turnaround, it's often convenient to self-manage the installation. All storage in the cluster environment is mounted with no restrictions on executing applications, so apps can be self-installed into `${HOME}` or any project/scratch storage space as needed.


## How to Install Software in Your Home Directory on an HPC System

Installing software in your home directory on a high-performance computing (HPC) system can be essential when you require specific software versions or packages that are not available in the system-wide modules. This guide will walk you through the general steps needed to install software in your home directory.

### Step 1: Choose the Software to Install
Decide which software you need to install. Often, this will be a package not provided by the system administrators or a version that is different from the one available.

### Step 2: Set Up Your Environment
Before installing the software, make sure that your environment is set up correctly.

1. **Load Necessary Modules**: Some software may depend on compilers or libraries that are already available on the HPC system. Use the `module load` command to load these dependencies. For example:
   ```bash
   module load gcc
   module load cmake
   ```
2. **Create a Directory for Installation**: It’s good practice to create a directory in your home space where all your custom-installed software will reside. For example:
   ```bash
   mkdir -p ~/software
   ```

### Step 3: Download the Software
Download the source code or binaries of the software to your home directory. This can be done using tools like `wget`, `curl`, or via `git clone`.

Example using `wget`:
```bash
cd ~/software
wget http://example.com/software.tar.gz
```

Example using `git`:
```bash
git clone https://github.com/example/software.git
```

### Step 4: Compile and Install the Software
If the software comes as source code, you'll typically need to compile it. This involves running a configuration script, followed by the `make` and `make install` commands.

1. **Extract the Source Code**: If the software is compressed (e.g., `.tar.gz`), extract it:
   ```bash
   tar -xzvf software.tar.gz
   cd software
   ```
   
2. **Configure the Build**: Run the configuration script, specifying your home directory as the installation prefix:
   ```bash
   ./configure --prefix=$HOME/software/software_name
   ```

3. **Compile the Software**: Compile the software using `make`:
   ```bash
   make
   ```

4. **Install the Software**: Install it into your specified directory:
   ```bash
   make install
   ```

### Step 5: Add the Software to Your Path
To use the software easily, add its installation directory to your `PATH` environment variable. You can do this by editing your shell configuration file (e.g., `.bashrc`, `.bash_profile`, or `.zshrc`).

Example:
```bash
export PATH=$HOME/software/software_name/bin:$PATH
export LD_LIBRARY_PATH=$HOME/software/software_name/lib:$LD_LIBRARY_PATH
```

Then, reload your shell configuration:
```bash
source ~/.bashrc
```

### Step 6: Verify the Installation
Finally, verify that the software is correctly installed by checking its version or running it:
```bash
software_name --version
```

### Step 7: Troubleshooting
If you encounter any issues during the installation, here are a few tips:
- **Check Dependencies**: Ensure all necessary dependencies are loaded or installed.
- **Consult Documentation**: Refer to the software’s documentation for any specific installation instructions.
- **Use Virtual Environments**: For Python packages, consider using `virtualenv` or `conda` to manage installations within your home directory.

### Conclusion
Installing software in your home directory on an HPC system gives you flexibility and control over the tools you use. By following these steps, you can tailor your environment to meet your specific computational needs, ensuring access to the software you need when you need it.
