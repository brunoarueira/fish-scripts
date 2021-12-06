function kexec --argument-names namespace -d 'Connect through kubectl to pods on the specified namespace'
  if test -n "$namespace"
    set namespace_command "-n $namespace"
  end

  function __list_pods --inherit-variable namespace
    kubectl $namespace_command get pods --no-headers
  end

  set pod (__list_pods | fzf | awk '{print $1}')

  if test -n "$pod"
    kubectl $namespace_command exec -it $pod -- sh
  end
end
