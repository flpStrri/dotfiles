function git-st
    function usage
        echo "git st/gst:
    Colorful, compact git status
USAGE
    git st
    or
    gst
DESCRIPTION
    One-line status for each file with lines added and removed.
    This version written by https://github.com/PlatyPew/,
    original version by https://www.reddit.com/user/ex1c)"
    end

    # Parse options
    set options (fish_opt -s h -l help)
    if not argparse $options -- $argv
        return 1
    end

    if set -q _flag_h
        usage
        return 0
    end

    # Get git status
    set status_output (git -c color.status=always status -sb)
    if test $status -ne 0
        return 1
    end

    # Get git diff stats
    set diff_output (git diff --color --stat HEAD 2>/dev/null | sed '$d; s/^ //' | cut -d '|' -f 2)

    # Split status and diff into arrays
    set status_lines (string split '\n' $status_output)
    set diff_lines (string split '\n' $diff_output)

    # Find maximum length for padding
    set len 0
    for i in (seq 2 (count $status_lines))
        set curr_len (string length $status_lines[$i])
        if test $curr_len -gt $len
            set len $curr_len
        end
    end
    set len (math "-$len") # Make length negative for left alignment

    # Display formatted output
    for i in (seq 1 (count $status_lines))
        if test $i -eq 1
            echo (string sub --start 3 $status_lines[1])
        else
            set idx (math $i - 1)
            set curr_status $status_lines[$i]

            if test $idx -le (count $diff_lines) -a -n "$diff_lines[$idx]"
                set curr_diff "|$diff_lines[$idx]"
            else
                set curr_diff ""
            end

            # Use correct printf format for left alignment
            printf "%"$len"s  %s\n" "$curr_status" "$curr_diff"
        end
    end

    # Show message if nothing to commit
    if test (count $status_lines) -eq 1
        printf "\033[93mNothing to commit, working tree clean\033[0m\n"
    end
end
