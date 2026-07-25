function pubkey --description "Copy ~/.ssh/id_ed25519.pub to clipboard"
    set -l keyfile $HOME/.ssh/id_ed25519.pub

    if not test -r $keyfile
        echo " ! No readable public key found at $keyfile." >&2
        return 1
    end

    if fish_clipboard_copy <$keyfile
        echo " → Public key copied to clipboard"
        return 0
    end

    echo " ! Failed to copy public key to clipboard." >&2
    return 1
end
