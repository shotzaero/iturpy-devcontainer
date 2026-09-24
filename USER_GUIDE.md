# ITU-Rpy on Coder: User Guide for Engineers

**Quick Start Guide for Using ITU-Rpy on coder.aero.org**

---

## What is This?

This guide helps you set up a ready-to-use Python environment for ITU-Rpy (atmospheric modeling for RF link budgets) on Coder. No Python expertise required!

---

## Step-by-Step Setup (One-time, ~5 minutes)

### 1. Create Your Workspace

1. Go to **https://coder.aero.org**
2. Click the **"Create Workspace"** button (top right)

### 2. Select Template

- Choose **"Bring Your Own DevContainer"** from the template list

### 3. Configure Settings

Fill in these values:

| Setting | Value |
|---------|-------|
| **Repository URL** | `https://github.com/shotzaero/iturpy-devcontainer` |
| **Cluster** | GPU |
| **Home disk size** | 5 GB |
| **CPU** | 4 Cores |
| **Memory** | 6 GB |

### 4. Create Workspace

1. Give your workspace a name (e.g., "my-iturpy")
2. Click **"Create Workspace"**
3. Wait 3-5 minutes while it builds

You'll see progress logs showing:
- Cloning repository
- Installing dependencies
- Setting up environment

### 5. Open Your Workspace

Once it says **"Running"**, click one of:
- **Terminal** - Command line interface
- **VS Code Desktop** - Full code editor
- **VS Code Browser** - Lightweight editor

### 6. Activate ITU-Rpy

In the terminal, run:
```bash
source /workspace/ITU-Rpy/activate.sh
```

You'll see a welcome message confirming the environment is ready.

---

## Daily Usage

### Starting a Session

1. Go to https://coder.aero.org/workspaces
2. Find your workspace
3. If stopped, click **"Start"**
4. Open **Terminal**
5. Run: `source /workspace/ITU-Rpy/activate.sh`

### Running Examples

```bash
# Navigate to examples
cd /workspace/ITU-Rpy/examples

# Run an example
python single_location.py
```

This will show atmospheric calculations for a Boston location.

### Using ITU-Rpy for Your Own Calculations

**In Terminal:**
```bash
# Make sure environment is activated
source /workspace/ITU-Rpy/activate.sh

# Start Python
python
```

**In Python:**
```python
import itur

# Your location (latitude, longitude)
lat, lon = 41.39, -71.05

# Link parameters
el = 60                      # Elevation angle (degrees)
f = 22.5 * itur.u.GHz       # Frequency

# Calculate rain attenuation
A_r = itur.rain_attenuation(lat, lon, f, el, p=0.1)
print(f"Rain attenuation: {A_r}")
```

### Saving Your Work

- All files you create in `/workspace/ITU-Rpy/` are automatically saved
- When you **Stop** your workspace, everything is preserved
- Next time you **Start**, your files will still be there

---

## Common Tasks

### Run All Tests
```bash
source /workspace/ITU-Rpy/activate.sh
cd /workspace/ITU-Rpy
pytest test/
```

### Create Your Own Script

1. In VS Code, create a new file: `my_calculation.py`
2. Write your code using `import itur`
3. Save the file
4. Run: `python my_calculation.py`

### Install Additional Python Packages

```bash
source /workspace/ITU-Rpy/activate.sh
pip install package-name
```

---

## Troubleshooting

### "Module not found" Error

**Problem:** You see `ModuleNotFoundError: No module named 'itur'`

**Solution:** Activate the environment first:
```bash
source /workspace/ITU-Rpy/activate.sh
```

### Workspace Won't Create (Quota Error)

**Problem:** Error says "exceeded quota"

**Solutions:**
- Try **GPU cluster** instead of Dev
- Stop/delete any other workspaces you have running
- Contact IT if issue persists

### Forgot to Activate Environment

**Symptom:** Commands don't work, Python can't find modules

**Solution:** Always run this first:
```bash
source /workspace/ITU-Rpy/activate.sh
```

### Need to Start Fresh

If something breaks:
1. Delete your workspace
2. Create a new one following the setup steps
3. All files in `/workspace/ITU-Rpy/` will be restored from GitHub

---

## Tips

### Make Activation Automatic

Add this to your workspace's `~/.bashrc`:
```bash
source /workspace/ITU-Rpy/activate.sh
```

Then the environment activates automatically when you open a terminal!

### Use VS Code for Editing

- Click **"VS Code Desktop"** from your workspace
- Browse files in the left sidebar
- Terminal is integrated at the bottom
- Python auto-complete works!

### Share Results, Not Workspaces

- Your workspace is yours alone
- To share results with colleagues, copy/paste output or save files
- Each person should create their own workspace

---

## Getting Help

**For ITU-Rpy Questions:**
- GitHub: https://github.com/the-aerospace-corporation/ITU-Rpy
- Issues: https://github.com/the-aerospace-corporation/ITU-Rpy/issues

**For Coder/Setup Issues:**
- Contact: stephanie.hotz@aero.org
- Badge: 35058

**For Python Help:**
- ITU-Rpy has examples in the `examples/` folder
- Look at `single_location.py` for a complete working example

---

## Quick Reference

**Key Commands:**
```bash
# Activate environment
source /workspace/ITU-Rpy/activate.sh

# Run example
cd /workspace/ITU-Rpy/examples && python single_location.py

# Start Python
python

# Run tests
pytest test/

# Deactivate (when done)
deactivate
```

**Important Paths:**
- ITU-Rpy code: `/workspace/ITU-Rpy/`
- Examples: `/workspace/ITU-Rpy/examples/`
- Your files: Save anywhere in `/workspace/`

---

**You're all set! Start calculating atmospheric losses for your RF links!** 🛰️
