# Ruby (rbenv) Configuration

# Ensure rbenv command exists before trying to use it
if type -q rbenv
    # Rehash shims (might not be strictly necessary with init)
    rbenv rehash >/dev/null 2>&1

    # Initialize rbenv
    status --is-interactive; and source (rbenv init -|psub)
end

