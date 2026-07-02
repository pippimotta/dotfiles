# mysql-client (keg-only) — brew won't symlink this into PATH, so wire it up
# manually. Guarded on the keg existing so this is a no-op on machines without
# it. Relies on $HOMEBREW_PREFIX from 10-homebrew.zsh (falls back to the
# Apple-Silicon default).
_mysql_client="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/mysql-client"
if [[ -d "$_mysql_client" ]]; then
  export PATH="$_mysql_client/bin:$PATH"
  # For compilers/linkers (e.g. building Python mysqlclient, CGO). Append so we
  # don't clobber flags set by other keg-only formulae.
  export LDFLAGS="-L$_mysql_client/lib${LDFLAGS:+ $LDFLAGS}"
  export CPPFLAGS="-I$_mysql_client/include${CPPFLAGS:+ $CPPFLAGS}"
fi
unset _mysql_client
