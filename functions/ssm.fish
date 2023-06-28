function ssm --argument-names profile -d 'Connect through aws ssm to instances on ec2'
  if test -z "$profile"
    set profile default
  end

  function __list_instances --inherit-variable profile
    aws ec2 describe-instances \
      --filters Name=instance-state-name,Values=running --query 'reverse(Reservations[*].Instances[*].[LaunchTime,PrivateIpAddress,InstanceId,Tags[?Key==`Name`]|[0].Value][] | sort_by(@, &[0]))' \
      --profile $profile \
      --output text
  end

  set instance (__list_instances | fzf | cut -f 3)

  if test -n "$instance"
    aws ssm start-session --target $instance --profile $profile
  end
end
