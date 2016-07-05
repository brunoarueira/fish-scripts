#################################
### Network Related
#################################

alias localip="ipconfig getifaddr $argv"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d '$argv' -t '^(GET|POST) ' 'tcp and port 80'"
