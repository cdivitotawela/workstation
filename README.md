# Workstation Setup 
This repository contains the commonly used configurations for a DevSecOps engineer

## Setup iTerm2 badge for kubectl current context
This is useful if you use the kubectl in iTerm2 and would like to see the current context in iTerm2 badge.
1. Run `curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash` to install the shell integration
2. Open iTerm2 Settings -> Profiles
3. Update the Badge with `\(user.badge)`
4. Update the ~/.zprofile 

```bash
# ~/.zprofile
function iterm2_print_user_vars() {
  unset badge
  kubectl config current-context >/dev/null 2>&1 && {
    badge=$(kubectl config current-context)
    iterm2_set_user_var badge "$badge"
  }
}
```

Notes:
- Using the unset badge so that if kubectl config command fails it removes the current value
- Varible name `badge` can be any name as long as same varible name is configured in iTerm2 profile and `~/.zprofile`
