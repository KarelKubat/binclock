#!/bin/bash

# Navigate to the project directory
cd "$(dirname "$0")"

echo "🔨 Building BinClock..."
if swift build -c release; then
    BINARY_PATH=$(swift build -c release --show-bin-path)/BinClock
    echo ""
    echo "✅ Build Successful!"
    echo "🚀 You can find the binary at:"
    echo "$BINARY_PATH"
else
    echo "❌ Build Failed."
    exit 1
fi
