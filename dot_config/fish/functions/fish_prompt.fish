function fish_prompt
    set -l pwd_info (set_color cba6f7)(prompt_pwd)
    set -l git_info

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (git symbolic-ref --short HEAD 2>/dev/null; or git rev-parse --short HEAD 2>/dev/null)
        set git_info " "(set_color 6c7086)"$git_branch"
    end

    if [ "$TERM" = xterm-ghostty ]
        echo -n "$git_info"(set_color cba6f7)" ⇒ "
    else
        echo -n "$pwd_info$git_info"(set_color cba6f7)" ⇒ "
    end
end
