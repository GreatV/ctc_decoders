# PaddleSpeech CTC Decoders

CTC decoder implementation for PaddleSpeech.

## Building Python Wheels

This repository uses GitHub Actions with cibuildwheel to automatically build Python wheels for multiple platforms.

### Supported Python Versions

- Python 3.9+

### Supported Platforms

- Linux (x86_64)
- macOS (x86_64, arm64)
- Windows (AMD64)

### Local Development

To build the package locally:

```bash
# Install dependencies
pip install -e .

# Or build a wheel
pip install build
python -m build
```

## License

This project is licensed under Apache 2.0 and GNU Lesser General Public License v3 (LGPLv3). 
