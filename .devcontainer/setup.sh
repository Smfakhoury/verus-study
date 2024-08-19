#!/bin/bash


git clone --branch infra https://github.com/verus-lang/verus-analyzer.git
cd verus-analyzer/editors/code/src
rm client.ts
rm commands.ts
rm main.ts
cp /workspaces/verus-study/telemetry-hook-files/client.ts /workspaces/verus-study/verus-analyzer/editors/code/src/client.ts 
cp /workspaces/verus-study/telemetry-hook-files/commands.ts /workspaces/verus-study/verus-analyzer/editors/code/src/commands.ts
cp /workspaces/verus-study/telemetry-hook-files/main.ts /workspaces/verus-study/verus-analyzer/editors/code/src/main.ts
cd ..
npm add @vscode/extension-telemetry
npm install
npm install -g @vscode/vsce
vsce package

cd /workspaces/verus-study/verus-analyzer
cargo xtask dist
gunzip dist/verus-analyzer-x86_64-unknown-linux-gnu.gz
chmod +x dist/verus-analyzer-x86_64-unknown-linux-gnu

mv /workspaces/verus-study/verus-analyzer/editors/code/verus-analyzer-0.5.0-dev.vsix /workspaces/verus-study/verus-analyzer-0.5.0-dev.vsix