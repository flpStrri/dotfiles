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

    # Get branch info
    set branch_info (git rev-parse --abbrev-ref HEAD)
    set tracking_info (git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))

    # Initialize ahead and behind counts
    set ahead 0
    set behind 0

    # Get ahead/behind status if tracking info exists
    if test -n "$tracking_info"
        set tracking_status (git rev-list --left-right --count $branch_info...$tracking_info 2>/dev/null)
        if test -n "$tracking_status"
            set ahead_behind (string split ' ' $tracking_status)

            # Ensure ahead and behind are numbers
            set ahead (string replace -r '\D' '' $ahead_behind[1]) # Remove non-numeric characters
            set behind (string replace -r '\D' '' $ahead_behind[2])
        end
    end

    # Safeguard in case of emtpy ahead/behind
    set ahead_count (math "$ahead + 0")
    set behind_count (math "$behind + 0")

    set status_line "$branch_info → $tracking_info"

    # Update status line with appropriate arrows based on numeric comparison
    if test $ahead_count -gt 0 -a $behind_count -gt 0
        set status_line "$status_line ⇅"
    else if test $ahead_count -gt 0
        set status_line "$status_line ↑"
    else if test $behind_count -gt 0
        set status_line "$status_line ↓"
    else
        set status_line "$status_line ≡" # Up-to-date
    end

    # Get git diff stats
    set diff_output (git diff --color --stat HEAD 2>/dev/null | sed '$d; s/^ //' | cut -d '|' -f 2)

    # Split status and diff into arrays
    set status_lines (string split '\n' $status_output)
    set diff_lines (string split '\n' $diff_output)

    # Check if there are no changes
    if test (count $status_lines) -eq 1
        echo $status_line
        printf "\033[93mNothing to commit, working tree clean\033[0m\n"
        return 0
    end

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
    echo $status_line
    for i in (seq 2 (count $status_lines))
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
