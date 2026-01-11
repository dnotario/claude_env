# Claude Development Environment

An isolated Docker container with full development tools for safe experimentation and development.

## Features

- **Base**: Ubuntu 22.04 LTS
- **Languages**: Python 3, Node.js 20 (LTS)
- **Tools**: Git, Vim, Nano, Curl, Wget, and more
- **Build Tools**: GCC, G++, Make, CMake
- **Node Tools**: Yarn, TypeScript, ts-node, nodemon
- **Claude Code**: Pre-installed and ready to use
- **User**: Non-root user (claude) with sudo access
- **Workspace**: Persistent volume mounted at `/workspace`

## Quick Start

### 1. Build the container

```bash
./build.sh
```

### 2. Start the container

```bash
./start.sh
```

### 3. Enter the container

```bash
./exec.sh
```

You'll be inside the container as the `claude` user in the `/workspace` directory.

### 4. Stop the container

```bash
./stop.sh
```

## File Structure

```
claude_env/
├── Dockerfile              # Container definition
├── docker-compose.yml      # Docker Compose configuration
├── build.sh               # Build the image
├── start.sh               # Start the container
├── exec.sh                # Enter the container
├── stop.sh                # Stop the container
├── clean.sh               # Clean up everything
├── workspace/             # Your persistent workspace
└── README.md              # This file
```

## Usage Tips

### Working with files

Files in the `workspace/` directory are persisted between container restarts. Work here to keep your files safe.

```bash
# Inside the container
cd /workspace
mkdir myproject
```

### Installing additional packages

```bash
# System packages (requires sudo)
sudo apt-get update
sudo apt-get install <package-name>

# Python packages
pip3 install <package-name>

# Node packages
npm install -g <package-name>
```

### Multiple terminal sessions

You can enter the container multiple times from different terminals:

```bash
# Terminal 1
./exec.sh

# Terminal 2 (new terminal window)
./exec.sh
```

### Installing Claude Code

After starting the container, install Claude Code:

```bash
./install-claude.sh
```

Then enter the container and use it:

```bash
# Enter the container
./exec.sh

# Verify installation
claude --version

# Start using Claude Code
claude
```

You'll need to authenticate with your Anthropic API key the first time you use it.

## Cleaning Up

To completely remove the container, image, and volumes:

```bash
./clean.sh
```

**Note**: This preserves your `workspace/` directory but removes bash history and other container data.

## Customization

### Adding more tools

Edit `Dockerfile` and add packages to the `RUN apt-get install` section, then rebuild:

```bash
./build.sh
```

### Resource limits

Uncomment the `deploy` section in `docker-compose.yml` to set CPU and memory limits.

### Environment variables

Add environment variables in the `environment` section of `docker-compose.yml`.

## Troubleshooting

### Container won't start

```bash
# Check Docker is running
docker ps

# View logs
docker-compose logs

# Rebuild from scratch
./clean.sh
./build.sh
./start.sh
```

### Permission issues

All files created in `/workspace` will be owned by the `claude` user (UID 1000). If you need root access inside the container:

```bash
sudo <command>
```

The `claude` user has passwordless sudo access.

## Security Notes

- This container runs as a non-root user by default
- The user has sudo access for convenience (remove from Dockerfile for stricter security)
- The container is isolated from your host system except for the workspace mount
- No network ports are exposed by default
