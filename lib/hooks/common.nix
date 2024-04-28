''
  debug() {
    if [[ ''${NIXAGO_DEBUG-0} -gt 0 ]]; then
      printf "(DEBUG) nixago: %s\n" "''${*}" >&2
    fi
  }

  error() {
    printf "!!! nixago: ERROR %s\n" "''${*}" >&2
  }

  log() {
    if [[ -n $nixago_log_format ]]; then
      local msg=$* color_normal=""
      if [[ -t 2 ]]; then
        color_normal="\e[m"
      fi
      # shellcheck disable=SC2059,SC1117
      printf "''${color_normal}''${nixago_log_format}''${color_normal}\n" "$msg" >&2
    fi

  }

  run_if_trace() {
    if [[ ''${NIXAGO_TRACE-0} -gt 0 ]]; then
      eval ''${*}
    fi
  }

  try_make_path() {
    dirname="$(dirname ''${1})"
    if [[ ! -d "$dirname" ]]; then
      mkdir -p "$dirname"
    fi
  }

  PS4='+ Line $(expr $LINENO + 4): '

  if [[ ''${NIXAGO_LOG-1} -gt 0 ]]; then
    if [[ -n ''${NIXAGO_LOG_FORMAT-} ]]; then
      nixago_log_format="''${NIXAGO_LOG_FORMAT}"
    elif [[ -n ''${DIRENV_LOG_FORMAT-} ]]; then
      nixago_log_format="''${DIRENV_LOG_FORMAT/direnv/nixago}"
    else
      nixago_log_format=$'\E[mnixago: \E[38;5;8m%s\E[m'
    fi
  fi

  if [[ -n $nixago_log_format ]]; then
    printf "nixago: updating repository files\n" >&2
  fi
''
