@ECHO OFF
ECHO ORIGINAL IDEA AND MORE INFO IN: https://github.com/jfcherng-sublime/SublimeHQ-my-notes/blob/master/lsp_clangd_tips.md
cd ..
mkdir build
cd build
cmake .. -G "MinGW Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
compiledb make
cp compile_commands.json ../compile_commands.json