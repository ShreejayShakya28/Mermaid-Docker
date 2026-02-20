# Mermaid Docker

Convert `.mmd` diagram files to PNG, PDF, or SVG using Docker. No need to install Node, npm, or any dependencies — just Docker.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) installed and running

## Setup (One Time Only)

**1. Clone the repo**
```bash
git clone <repo-url> ~/Documents/mermaid/mermaid-docker
```

**2. Create input and output folders**
```bash
mkdir -p ~/Documents/mermaid/input
mkdir -p ~/Documents/mermaid/output
```

**3. Build the Docker image**
```bash
cd ~/Documents/mermaid/mermaid-docker
docker build -t mermaid .
```
This will take a few minutes the first time — it downloads and sets up everything inside the container.

**4. Make the script executable**
```bash
chmod +x mermaid
```

---

## Folder Structure

```
~/Documents/mermaid/
├── mermaid-docker/    ← the repo (code lives here)
├── input/             ← put your .mmd files here
└── output/            ← converted files appear here
```

---

## Usage

Put your `.mmd` files in `~/Documents/mermaid/input/` then from inside `~/Documents/mermaid/mermaid-docker` run:

```bash
# Export as PNG (high quality, scale 5)
./mermaid diagram.mmd png

# Export as PDF
./mermaid diagram.mmd pdf

# Export as SVG (vector, infinite resolution)
./mermaid diagram.mmd svg
```

Output appears in `~/Documents/mermaid/output/` with the same name, just a different extension.

---

## Formats

| Format | Best For |
|--------|----------|
| `png` | Presentations, docs, sharing — high quality at scale 5 |
| `pdf` | Printing — vector based, crisp at any size |
| `svg` | Web, design tools — infinite resolution, fully scalable |

---

## Example

Create a file `~/Documents/mermaid/input/flow.mmd`:
```
graph TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Do this]
    B -->|No| D[Do that]
```

Then run:
```bash
cd ~/Documents/mermaid/mermaid-docker
./mermaid flow.mmd png
```

You will get `~/Documents/mermaid/output/flow.png` — black and white, high quality.

---

## Notes

- Output is always **black and white** (print friendly)
- PNG scale is always **5** (high quality)
- Docker must be running before using the `mermaid` command
- `input/` and `output/` folders are created automatically if they don't exist
