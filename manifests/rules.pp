# apply user-defined rules
class logrotate::rules{

  $hieramerge = $::logrotate::hieramerge
  $rules      = $::logrotate::rules
  $include_defaults = $::logrotate::include_defaults

  if $hieramerge {
    $_rules = hiera_hash('logrotate::rules', $rules)
  } else {
    $_rules = $rules
  }

  create_resources('logrotate::rule', $_rules)

  if $include_defaults {
    include ::logrotate::defaults
  }

}
