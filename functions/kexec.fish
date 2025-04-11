function kexec --argument-names namespace -d 'Access the terminal on pods at the specified namespace'
  if ! test -n "$namespace"
    set namespace "default"
  end

  set context (kubectl config current-context)

  function __list_pods --inherit-variable namespace
    kubectl -n $namespace get pods --no-headers
  end

  set pod (
  	__list_pods |
	fzf --header="Current context: $context" --header-lines=0 --color "header:blue" |
	awk '{print $1}'
	)

  if test -n "$pod"
    kubectl -n $namespace exec -it $pod -- sh
  end
end
