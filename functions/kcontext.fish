function kcontext -d 'List contexts to switch after select it'
  if ! test -n "$namespace"
    set namespace "default"
  end

  function __list_contexts --inherit-variable namespace
    kubectl config get-contexts --no-headers
  end

  set context (__list_contexts | fzf | awk '{print $1}')

  if test -n "$context"
    kubectl config use-context $context
  end
end
