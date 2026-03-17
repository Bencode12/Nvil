# Contributing to Nvil

Thank you for considering contributing to Nvil! This guide will help you get started.

## 🎯 How to Contribute

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps to reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed and what behavior you expected**
* **Include screenshots if possible**
* **Include your Neovim version (`nvim --version`)**
* **Include your OS information**

### Suggesting Features

Feature suggestions are always welcome! Please provide:

* **Use a clear and descriptive title**
* **Provide a detailed description of the suggested feature**
* **Explain why this feature would be useful**
* **Provide examples of how it would be used**
* **List similar features in other editors/IDEs if applicable**

### Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit your changes using conventional commits
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Development Setup

1. Fork and clone the repository
2. Install all dependencies (see README.md)
3. Make your changes in a feature branch
4. Test with `nvim` to ensure everything works
5. Submit a PR

## 📝 Code Style Guidelines

### Lua Style

* Use 2 spaces for indentation
* Use camelCase for variables and functions
* Use PascalCase for classes/modules
* Add comments for complex logic
* Keep functions small and focused

Example:
```lua
-- Good
local function calculate_xp(amount)
  local bonus = math.floor(amount * 0.1)
  return amount + bonus
end

-- Bad
local function CalculateXP(Amount)  -- Wrong casing
  local Bonus = math.floor(Amount * 0.1)  -- Wrong casing
  return Amount + Bonus  -- Too simple, no comment needed here
end
```

### File Organization

* Plugin configurations go in `lua/plugins/`
* Core configurations go in `lua/config/`
* Utilities go in `lua/utils/`

### Documentation

* Document public functions
* Add usage examples for complex features
* Update README.md if adding new features
* Comment non-obvious code sections

## 🔍 Testing

Before submitting a PR:

1. ✅ Test with clean Neovim startup
2. ✅ Verify all plugins load correctly
3. ✅ Test keybindings work as expected
4. ✅ Check for performance issues
5. ✅ Ensure no errors in `:messages`

## 📚 Areas Needing Contribution

### High Priority
- Better LSP configuration for less common languages
- Improved AI integration
- Performance optimizations
- Accessibility improvements

### Medium Priority
- More ASCII art logos
- Additional themes
- Tutorial/documentation videos
- Plugin recommendations

### Low Priority
- UI polish and animations
- Easter eggs and fun features
- Community showcase section

## 💬 Questions?

Feel free to open an issue with the "question" label if you have any questions about contributing.

## 🙏 Thank You!

Your contributions to open source, large or small, make projects like this possible. Thank you for taking the time to contribute.

---

This contribution guide is inspired by many amazing open source projects.
