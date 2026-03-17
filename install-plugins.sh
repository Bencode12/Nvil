#!/bin/bash
# Plugin installation script for NVil

echo "🚀 Installing NVil plugins..."

# Run Neovim in headless mode to install plugins
nvim --headless -c "autocmd User LazyInstall quitall" \
     -c "Lazy sync" \
     -c "qa"

echo "✅ Plugin installation complete!"
echo "You can now start Neovim with: nvim"
