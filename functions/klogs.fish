function klogs --argument-names namespace --argument-names init_containers -d 'Access logs through kubectl from pods on the specified namespace'
  if ! test -n "$namespace"
    set namespace "default"
  end

  function __list_pods --inherit-variable namespace
    kubectl -n $namespace get pods --no-headers
  end

  set pod (__list_pods | fzf | awk '{print $1}')

  if test -n "$init_containers"
    function __list_init_containers --inherit-variable namespace --inherit-variable pod
      kubectl -n $namespace get pods $pod -o jsonpath="{.spec.initContainers[*].name}" | tr ' ' '\n'
    end

    set selected_init_container (__list_init_containers | fzf | awk '{print $1}')
  end

  if test -n "$pod" && ! test -n "$selected_init_container"
    kubectl -n $namespace logs -f $pod
  else if test -n "$pod" && test -n "$selected_init_container"
    kubectl -n $namespace logs -f $pod -c $selected_init_container
  end
end
