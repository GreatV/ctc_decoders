@echo off
echo Setting up dependencies for CTC decoders on Windows...

if not exist kenlm (
    echo Cloning KenLM repository...
    git clone https://github.com/kpu/kenlm.git
    cd kenlm
    git checkout df2d717e95183f79a90b2fa6e4307083a351ca6a
    cd ..
    echo KenLM cloning completed.
)

if not exist openfst-1.6.3 (
    echo Downloading and extracting OpenFST...
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.6.3.tar.gz', 'openfst-1.6.3.tar.gz')"
    echo Extracting OpenFST...
    
    :: Check for 7-Zip
    where 7z >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        7z x openfst-1.6.3.tar.gz -so | 7z x -aoa -si -ttar
    ) else (
        echo Warning: 7-Zip not found. Trying tar...
        tar -xf openfst-1.6.3.tar.gz
        if %ERRORLEVEL% NEQ 0 (
            echo Error: Could not extract OpenFST. Please install 7-Zip or tar.
            echo You can download 7-Zip from https://7-zip.org/
            exit /b 1
        )
    )
    echo OpenFST extraction complete.
)

if not exist ThreadPool (
    echo Cloning ThreadPool repository...
    git clone https://github.com/progschj/ThreadPool.git
    echo ThreadPool cloning completed.
)

echo All dependencies have been set up successfully!
echo You can now build the CTC decoders using:
echo python setup.py install --num_processes 4 
