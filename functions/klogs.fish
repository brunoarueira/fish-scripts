function klogs --argument-names namespace -d 'Access logs through kubectl from pods on the specified namespace'
  if ! test -n "$namespace"
    set namespace "default"
  end

  function __list_pods --inherit-variable namespace
    kubectl -n $namespace get pods --no-headers
  end

  set pod (__list_pods | fzf | awk '{print $1}')

  if test -n "$pod"
    kubectl -n $namespace logs -f $pod
  end
end
