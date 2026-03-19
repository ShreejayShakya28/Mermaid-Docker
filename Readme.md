# Mermaid Docker

Convert `.mmd` diagram files to PNG, PDF, or SVG using Docker. No need to install Node, npm, or any dependencies — just Docker.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) installed and running
- Podman with Docker CLI emulation is also supported

## Docker Quick Guide (Priority)

Use this order if `mermaid` is not working:

**1) Start Docker engine**

Linux (Docker daemon):
```bash
sudo systemctl start docker
sudo systemctl status docker
```

**2) Build image (first time, or after code changes)**
```bash
cd mermaid-docker
docker build -t mermaid .
```

**3) Run command from your diagram folder**
```bash
cd /path/to/folder-with-mmd
mermaid file.mmd png
```

**4) Stop Docker engine (optional)**
```bash
sudo systemctl stop docker
```

Notes:
- You do not manually start a long-running Mermaid container.
- Each `mermaid ...` command runs a temporary container and exits.
- On Linux, `mermaid` will try to start Docker automatically if needed.
- The `mermaid` image is built once during install and then reused across commands.
- Docker is kept running, so repeated commands like `mermaid a.mmd png` then `mermaid b.mmd svg` are fast.
- For Podman + SELinux systems, the wrapper uses a compatible mount mode to avoid relabeling errors.

You can also use helper commands:
```bash
mermaid docker-status
mermaid docker-images
mermaid docker-containers
mermaid docker-stop
```

## Setup (One Time Only)

**1. Clone the repo**
```bash
git clone <repo-url>
cd mermaid-docker
```

**2. Run installer**
```bash
chmod +x install.sh
./install.sh
```

This installer will:
- build the Docker image (`mermaid`)
- make the wrapper executable
- install the `mermaid` command to `/usr/local/bin/mermaid`

After that, you can run `mermaid` from any folder.

---

## Manual Setup (Optional)

If you prefer not to use the installer:

```bash
docker build -t mermaid .
chmod +x mermaid
sudo ln -sf "$PWD/mermaid" /usr/local/bin/mermaid
```

---

## Workflow

```
<any-folder>/
└── code.mmd
```

From inside that folder (the one containing `code.mmd`), run `mermaid code.mmd png`.

---

## Usage

From the folder that contains your Mermaid file (for example `code.mmd`):

```bash
cd /path/to/folder-with-code-mmd
```

Then run:

```bash
# Export as PNG (high quality, scale 5)
mermaid code.mmd png

# Export as PDF
mermaid code.mmd pdf

# Export as SVG (vector, infinite resolution)
mermaid code.mmd svg

# Or provide exact output filename
mermaid code.mmd output.svg
```

Output is created in your current folder (or relative path you pass as output filename).

Docker helper commands:

```bash
# Show if Docker engine is running
mermaid docker-status

# Show Mermaid image
mermaid docker-images

# Show running/recent containers for Mermaid image
mermaid docker-containers

# Stop Docker manually after conversions
mermaid docker-stop
```

---

## Formats

| Format | Best For |
|--------|----------|
| `png` | Presentations, docs, sharing — high quality at scale 5 |
| `pdf` | Printing — vector based, crisp at any size |
| `svg` | Web, design tools — infinite resolution, fully scalable |

---

## Example

Create a file `code.mmd`:
```
graph TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Do this]
    B -->|No| D[Do that]
```

Then run:
```bash
cd /path/to/folder-with-code-mmd
mermaid code.mmd png
```

You will get `code.png` in that same folder — black and white, high quality.

Another example:
```bash
cd ~/Downloads
mermaid b.mmd b.svg
```

This creates `~/Downloads/b.svg`.

---

## Notes

- Output is always **black and white** (print friendly)
- PNG scale is always **5** (high quality)
- Font is set to **Times New Roman** (with serif fallback)
- `mermaid` prints Docker status on each run (running/started/image found)
- Second argument can be a format (`png|pdf|svg`) or explicit output filename (`out.svg`)
