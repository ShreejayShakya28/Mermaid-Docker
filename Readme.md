# Mermaid Docker

Convert `.mmd` diagram files to PNG, PDF, or SVG using Docker. No need to install Node, npm, or any dependencies — just Docker.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) installed and running

## Setup (One Time Only)

**1. Clone or download this folder**

**2. Open the folder in terminal**
```bash
cd mermaid-docker
```

**3. Build the Docker image**
```bash
docker build -t mermaid .
```
This will take a few minutes the first time — it downloads and sets up everything inside the container.

**4. Make the script executable**
```bash
chmod +x mermaid
```

---

## Usage

Put your `.mmd` files in:
```
~/Documents/mermaid/
```

Then from inside the `mermaid-docker` folder run:
```bash
# Export as PNG (high quality, scale 5)
./mermaid diagram.mmd png

# Export as PDF
./mermaid diagram.mmd pdf

```

Output file appears in `~/Documents/mermaid/` with the same name, just a different extension.

---

## Formats

| Format | Best For |
|--------|----------|
| `png` | Presentations, docs, sharing — high quality at scale 5 |
| `pdf` | Printing — vector based, crisp at any size |

---

## Example

Create a file `~/Documents/mermaid/flow.mmd`:
```
graph TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Do this]
    B -->|No| D[Do that]
```

Then run:
```bash
./mermaid flow.mmd png
```

You will get `~/Documents/mermaid/flow.png` — black and white, high quality.

---

## Notes

- Output is always **black and white** (print friendly)
- PNG scale is always **5** (high quality)
- Docker must be running before using the `mermaid` command
- The `~/Documents/mermaid/` folder is created automatically if it doesn't exist
