function op-fields
    set -l vault_flag
    if test (count $argv) -ge 2
        set vault_flag --vault $argv[2]
    end
    op item get $argv[1] $vault_flag --format json | jq '.fields[] | select(.value != null and .value != "") | {id, label, value: (if (.type == "CONCEALED" or .purpose == "PASSWORD") then "[REDACTED]" else .value end)}'
end
