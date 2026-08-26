# NOTE: depends on the profile settings in `~/.codex/fast.config.toml`.
function ai --description "Run AI agent with the fast read-only profile"
    if test (count $argv) -eq 0
        echo "Usage: ai <task>" >&2
        return 2
    end

    set -l diagnostics

    codex exec \
        --profile fast \
        --skip-git-repo-check \
        --sandbox read-only \
        -- \
        "$(string join ' ' -- $argv)" 2>| read -z diagnostics

    set -l ai_status $pipestatus[1]

    if test $ai_status -ne 0
        if test -n "$diagnostics"
            printf '%s' "$diagnostics" >&2
        else
            echo "Failed with status $ai_status" >&2
        end
    end

    return $ai_status
end
