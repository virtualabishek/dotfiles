function vpnshell
    set server $argv[1]
    if test -z "$server"
        set server singapore-sg-free.ovpn
    end
    set current_path (string join ":" $PATH)
    sudo vopono exec --provider protonvpn --protocol openvpn --server $server "bash -c 'export PATH=$current_path:\$PATH && exec bash'"
end
