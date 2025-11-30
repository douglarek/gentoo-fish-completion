# pkgcheck completion for fish

# Helper functions to get dynamic completion data

function __fish_pkgcheck_keywords
    if test -f /usr/share/pkgcheck/keywords
        cat /usr/share/pkgcheck/keywords
    else
        pkgcheck show --keywords 2>/dev/null | string split \n
    end
end

function __fish_pkgcheck_checks
    if test -f /usr/share/pkgcheck/checks
        cat /usr/share/pkgcheck/checks
    else
        pkgcheck show --checks 2>/dev/null | string split \n
    end
end

function __fish_pkgcheck_reporters
    if test -f /usr/share/pkgcheck/reporters
        cat /usr/share/pkgcheck/reporters
    else
        pkgcheck show --reporters 2>/dev/null | string split \n
    end
end

function __fish_pkgcheck_scopes
    if test -f /usr/share/pkgcheck/scopes
        cat /usr/share/pkgcheck/scopes
    else
        pkgcheck show --scopes 2>/dev/null | string split \n
    end
end

function __fish_pkgcheck_caches
    if test -f /usr/share/pkgcheck/caches
        cat /usr/share/pkgcheck/caches
    else
        pkgcheck show --caches 2>/dev/null | string split \n
    end
end

function __fish_pkgcheck_repos
    # Get list of repos from portageq or similar
    command -q portageq; and portageq get_repos / 2>/dev/null | string split ' '
end

function __fish_pkgcheck_arches
    # Common Gentoo arches
    echo alpha
    echo amd64
    echo arm
    echo arm64
    echo hppa
    echo ia64
    echo loong
    echo m68k
    echo mips
    echo ppc
    echo ppc64
    echo riscv
    echo s390
    echo sparc
    echo x86
end

# Base options (available for all commands)
complete -c pkgcheck -f -n 'not __fish_contains_opt -s h help version' -l version -d 'Show version information and exit'
complete -c pkgcheck -n 'not __fish_contains_opt config' -l config -d 'Use custom config or skip loading system config' -rF
complete -c pkgcheck -f -n 'not __fish_contains_opt -s h help version' -s h -l help -d 'Show help information and exit'
complete -c pkgcheck -f -n 'not __fish_contains_opt debug' -l debug -d 'Enable debugging output'
complete -c pkgcheck -f -n 'not __fish_contains_opt -s q quiet' -s q -l quiet -d 'Suppress non-error output'
complete -c pkgcheck -f -n 'not __fish_contains_opt -s v verbose' -s v -l verbose -d 'Show verbose output'
complete -c pkgcheck -f -n 'not __fish_contains_opt color' -l color -d 'Color output' -xa 'y n'

# Subcommands
complete -c pkgcheck -f -n __fish_use_subcommand -a scan -d 'Scan targets for QA issues'
complete -c pkgcheck -f -n __fish_use_subcommand -a cache -d 'Perform cache operations'
complete -c pkgcheck -f -n __fish_use_subcommand -a replay -d 'Replay results streams'
complete -c pkgcheck -f -n __fish_use_subcommand -a show -d 'Show various pkgcheck info'

# scan subcommand options
complete -c pkgcheck -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt config' -l config -d 'Use custom pkgcheck scan settings file' -rF
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s r repo' -s r -l repo -d 'Repo to pull packages from' -xa '(__fish_pkgcheck_repos)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s R reporter' -s R -l reporter -d 'Use a non-default reporter' -xa '(__fish_pkgcheck_reporters)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s f filter' -s f -l filter -d 'Limit targeted packages for scanning' -xa 'latest repo'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s j jobs' -s j -l jobs -d 'Number of checks to run in parallel' -r
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s t tasks' -s t -l tasks -d 'Number of asynchronous tasks to run concurrently' -r
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt cache' -l cache -d 'Forcibly enable/disable caches' -xa '(__fish_pkgcheck_caches)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt exit' -l exit -d 'Comma separated list of keywords that trigger an error exit status' -xa '(__fish_pkgcheck_keywords)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s C checksets' -s C -l checksets -d 'Comma separated list of checksets to enable/disable' -r
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s c checks' -s c -l checks -d 'Comma separated list of checks to enable/disable' -xa '(__fish_pkgcheck_checks)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s k keywords' -s k -l keywords -d 'Comma separated list of keywords to enable/disable' -xa '(__fish_pkgcheck_keywords)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s s scopes' -s s -l scopes -d 'Comma separated list of keyword scopes to enable/disable' -xa '(__fish_pkgcheck_scopes)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt net' -l net -d 'Run checks that require internet access'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt timeout' -l timeout -d 'Timeout used for network checks (in seconds)' -r
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s a arches' -s a -l arches -d 'Comma separated list of arches to enable/disable' -xa '(__fish_pkgcheck_arches)'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt commits' -l commits -d 'Determine scan targets from local git repo commits'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from scan; and not __fish_contains_opt -s p profiles' -s p -l profiles -d 'Comma separated list of profiles to enable/disable' -xa 'stable dev exp deprecated'

# cache subcommand options
complete -c pkgcheck -f -n '__fish_seen_subcommand_from cache; and not __fish_contains_opt -s u update' -s u -l update -d 'Update caches'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from cache; and not __fish_contains_opt -s f force' -s f -l force -d 'Forcibly update caches'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from cache; and not __fish_contains_opt -s R remove' -s R -l remove -d 'Forcibly remove caches'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from cache; and not __fish_contains_opt -s t type' -s t -l type -d 'Target cache types' -xa '(__fish_pkgcheck_caches)'

# replay subcommand options
# replay accepts pickled results files, so we allow file completion here
complete -c pkgcheck -n '__fish_seen_subcommand_from replay' -a '(__fish_complete_suffix .pkl)' -d 'Pickled results file'

# show subcommand options
complete -c pkgcheck -f -n '__fish_seen_subcommand_from show; and not __fish_contains_opt -s k keywords' -s k -l keywords -d 'Show available warning/error keywords'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from show; and not __fish_contains_opt -s c checks' -s c -l checks -d 'Show available checks'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from show; and not __fish_contains_opt -s s scopes' -s s -l scopes -d 'Show available keyword/check scopes'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from show; and not __fish_contains_opt -s r reporters' -s r -l reporters -d 'Show available reporters'
complete -c pkgcheck -f -n '__fish_seen_subcommand_from show; and not __fish_contains_opt -s C caches' -s C -l caches -d 'Show available caches'
