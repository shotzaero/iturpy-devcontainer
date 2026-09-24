#!/bin/bash
set -e

echo "=================================================="
echo "Setting up ITU-Rpy Environment"
echo "=================================================="

# Create workspace directory
mkdir -p /workspace
cd /workspace

# Clone ITU-Rpy repository
echo "Cloning ITU-Rpy repository..."
git clone https://github.com/the-aerospace-corporation/ITU-Rpy.git
cd ITU-Rpy
git checkout release/public

# Create virtual environment
echo "Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "Installing dependencies..."
pip install wheel astropy scipy numpy pyproj pytest

# Install ITU-Rpy
echo "Installing ITU-Rpy..."
pip install . --no-build-isolation

# Test installation
echo "Testing installation..."
python -c "import itur; print('✓ ITU-Rpy version:', itur.__version__)"

# Create activation helper
cat > /workspace/ITU-Rpy/activate.sh << 'EOF'
#!/bin/bash
source /workspace/ITU-Rpy/venv/bin/activate
cd /workspace/ITU-Rpy
echo "=================================================="
echo "ITU-Rpy Environment Activated"
echo "=================================================="
echo "Repository: /workspace/ITU-Rpy"
echo ""
echo "Quick commands:"
echo "  Run example:  cd examples && python single_location.py"
echo "  Run tests:    pytest test/"
echo "  Python shell: python"
echo "=================================================="
EOF
chmod +x /workspace/ITU-Rpy/activate.sh

echo ""
echo "=================================================="
echo "✓ ITU-Rpy Setup Complete!"
echo "=================================================="
echo ""
echo "To use ITU-Rpy:"
echo "  source /workspace/ITU-Rpy/activate.sh"
echo ""
