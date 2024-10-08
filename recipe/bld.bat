:: check licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY.yml || goto :error

:: build statically linked binary with Rust
set BTM_GENERATE="true" || goto :error
cargo install --bins --no-track --locked --root %LIBRARY_PREFIX% --path . || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
