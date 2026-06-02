function fish_prompt
    set -l last_status $status

    # Catppuccin Mocha
    set -l rosewater f5e0dc
    set -l peach fab387
    set -l yellow f9e2af
    set -l green a6e3a1
    set -l mauve cba6f7
    set -l red f38ba8
    set -l blue 89b4fa
    set -l lavender b4befe
    set -l overlay0 6c7086
    set -l text cdd6f4

    set -l pwd_info (set_color $blue)(prompt_pwd)
    set -l git_info
    set -l status_info
    set -l symbol "⇒"

    if test $last_status -ne 0
        set status_info (set_color $red)" ✘ $last_status"
    end

    if fish_is_root_user
        set symbol "#"
    end

    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (
            command git symbolic-ref --quiet --short HEAD 2>/dev/null
            or echo "detached:"(command git rev-parse --short HEAD 2>/dev/null)
        )

        set -l dirty
        if not command git diff --quiet --ignore-submodules -- 2>/dev/null
            set dirty (set_color $yellow)"*"
        end

        set -l staged
        if not command git diff --cached --quiet --ignore-submodules -- 2>/dev/null
            set staged (set_color $green)"+"
        end

        set git_info " "(set_color $overlay0)"git:"(set_color $mauve)$git_branch$staged$dirty
    end

    echo -n "$pwd_info$git_info$status_info "(set_color $peach)"$symbol "(set_color normal)
end
