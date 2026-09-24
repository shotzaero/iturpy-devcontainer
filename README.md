# ITU-Rpy DevContainer

This repository contains a DevContainer configuration for easy setup of the ITU-Rpy Python library in Coder.

## What is ITU-Rpy?

ITU-Rpy is a Python implementation of the ITU-R P. Recommendations for atmospheric modeling and RF link budget calculations.

## Quick Start on Coder

### For Users:

1. Go to **https://coder.aero.org**
2. Click **"Create Workspace"**
3. Select **"Bring Your Own DevContainer"** template
4. Configure:
   - **Repository URL:** `https://github.com/shotzaero/iturpy-devcontainer` (or wherever you host this)
   - **Cluster:** GPU
   - **Home disk size:** 5 GB
   - **CPU:** 4 Cores
   - **Memory:** 6 GB
5. Click **"Create Workspace"**
6. Wait 3-5 minutes for setup to complete
7. Open **Terminal** or **VS Code**
8. Run: `source /workspace/ITU-Rpy/activate.sh`
9. Start using ITU-Rpy!

### Running Examples

```bash
# Activate environment
source /workspace/ITU-Rpy/activate.sh

# Run example
cd examples
python single_location.py
```

### Using ITU-Rpy Interactively

```bash
# Activate environment
source /workspace/ITU-Rpy/activate.sh

# Start Python
python

# Use the library
>>> import itur
>>> lat, lon = 41.39, -71.05
>>> el = 60
>>> f = 22.5 * itur.u.GHz
>>> A_r = itur.rain_attenuation(lat, lon, f, el, p=0.1)
>>> print(A_r)
```

## What Gets Installed

- Python 3.10
- ITU-Rpy library (from official repository)
- Dependencies: astropy, scipy, numpy, pyproj, pytest
- Git
- VS Code extensions: Python, Pylance

## Troubleshooting

### "Module not found" error
Make sure you activated the environment:
```bash
source /workspace/ITU-Rpy/activate.sh
```

### Workspace creation fails
- Try GPU cluster instead of Dev
- Reduce home disk size to 3 GB if quota issues persist

## Support

- **ITU-Rpy Issues:** https://github.com/the-aerospace-corporation/ITU-Rpy/issues
- **Coder Setup:** Contact stephanie.hotz@aero.org

## Technical Details

This DevContainer:
- Uses `python:3.10-bullseye` base image
- Clones ITU-Rpy from https://github.com/the-aerospace-corporation/ITU-Rpy
- Creates virtual environment at `/workspace/ITU-Rpy/venv`
- Installs all dependencies automatically
- Provides activation helper script

## Files in This Repository

```
.devcontainer/
├── devcontainer.json       # DevContainer configuration
└── setup-iturpy.sh         # Setup script (runs on container creation)
README.md                   # This file
```
