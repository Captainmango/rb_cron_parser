D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "rb_cron_parser"                       # Directory name

  # library "pathname", "set"       # Standard libraries
  # library "strong_json"           # Gems
  
  configure_code_diagnostics(D::Ruby.lenient)      # `lenient` diagnostics setting
end

# target :test do
#   signature "sig", "sig-private"
#
#   check "test"
#
#   # library "pathname", "set"       # Standard libraries
# end
