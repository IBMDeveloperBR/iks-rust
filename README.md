# iks-rust

Compilando código Rust em um binário estático usando Docker (cross-compiling), e implantando-o com uma imagem levíssima (Alpine) em um cluster IKS.

- x86_64-unknown-linux-musl static binary [OK]
- x86_64-linux-musl-gcc static binary [FAZER!] <- Por hora não é possível gerar um binário estático caso o pacote Rust dependa de bibliotecas C (elas devem ser instaladas na imagem Alpine, ou o musl-gcc deve ser configurado corretamente e utilizado para compilar o binário.

## Passos:

1. Instanciar um cluster IKS
2. Instanciar ICR e criar um namespace
3. Instalar Docker
4. Instalar IBM CLI e plugins do ICR e IKS.
6. Executar PowerShell script (TO DO: bash equivalente)
7. Executar `kubectl logs rust-application --follow` para ver stdout.
