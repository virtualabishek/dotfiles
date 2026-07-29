function vpnshell
    sudo vopono exec --provider protonvpn --protocol openvpn --server singapore-sg-free.ovpn "bash -c 'export PATH=\$PATH:/home/abi/.bun/bin && exec bash'"
end
