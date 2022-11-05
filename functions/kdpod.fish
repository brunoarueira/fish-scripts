function kdpod --argument-names namespace -d 'Describe pod through kubectl on the specified namespace'
  if ! test -n "$namespace"
    set namespace "-n $namespace"
  end

  function __list_pods --inherit-variable namespace
    kubectl -n $namespace get pods --no-headers
  end

  set pod (__list_pods | fzf | awk '{print $1}')

  if test -n "$pod"
    kubectl -n $namespace describe pod $pod
  end
end
