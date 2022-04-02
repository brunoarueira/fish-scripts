function kdpod --argument-names namespace -d 'Describe pod through kubectl on the specified namespace'
  if test -z "$namespace"
    set namespace_command "-n $namespace"
  end

  function __list_pods --inherit-variable namespace
    kubectl $namespace_command get pods --no-headers
  end

  set pod (__list_pods | fzf | awk '{print $1}')

  if test -n "$pod"
    kubectl $namespace_command describe pod $pod
  end
end
