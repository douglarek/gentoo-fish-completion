# pkgdev completion for fish

# Base options (available for all commands)
complete -c pkgdev -f -n 'not __fish_contains_opt -s h help version' -s h -l help -d 'Show help information and exit'
complete -c pkgdev -f -n 'not __fish_contains_opt -s h help version' -l version -d 'Show version information and exit'
complete -c pkgdev -f -n 'not __fish_contains_opt debug' -l debug -d 'Enable debugging output'
complete -c pkgdev -f -n 'not __fish_contains_opt -s q quiet' -s q -l quiet -d 'Suppress non-error output'
complete -c pkgdev -f -n 'not __fish_contains_opt -s v verbose' -s v -l verbose -d 'Show verbose output'
complete -c pkgdev -f -n 'not __fish_contains_opt color' -l color -d 'Color output' -xa 'y n'

# Subcommands
complete -c pkgdev -f -n __fish_use_subcommand -a commit -d 'Create git commit'
complete -c pkgdev -f -n __fish_use_subcommand -a manifest -d 'Update package manifests'
complete -c pkgdev -f -n __fish_use_subcommand -a mask -d 'Mask packages'
complete -c pkgdev -f -n __fish_use_subcommand -a push -d 'Run QA checks on commits and push them'
complete -c pkgdev -f -n __fish_use_subcommand -a showkw -d 'Show package keywords'

# commit subcommand options
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s b bug' -s b -l bug -d 'Add Bug tag for a given Gentoo or upstream bug' -r
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s c closes' -s c -l closes -d 'Add Closes tag for a given Gentoo bug or upstream PR URL' -r
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s T tag' -s T -l tag -d 'Add commit tag' -r
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s n dry-run' -s n -l dry-run -d 'Pretend to create commit'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s s scan' -s s -l scan -d 'Run pkgcheck against staged changes'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s A ask' -s A -l ask -d 'Confirm creating commit with QA errors'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt mangle' -l mangle -d 'Forcibly enable/disable file mangling'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt signoff' -l signoff -d 'Add a Signed-off-by trailer'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt gpg-sign no-gpg-sign' -l gpg-sign -d 'Enable GPG signing'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt gpg-sign no-gpg-sign' -l no-gpg-sign -d 'Disable GPG signing'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit' -s m -l message -d 'Specify commit message' -r
complete -c pkgdev -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s M message-template' -s M -l message-template -d 'Use commit message template from specified file' -rF
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s e edit' -s e -l edit -d 'Force edit of commit'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s u update' -s u -l update -d 'Stage all changed files'
complete -c pkgdev -f -n '__fish_seen_subcommand_from commit; and not __fish_contains_opt -s a all' -s a -l all -d 'Stage all changed/new/removed files'

# manifest subcommand options
complete -c pkgdev -n '__fish_seen_subcommand_from manifest; and not __fish_contains_opt -s d distdir' -s d -l distdir -d 'Target download directory' -xa '(__fish_complete_directories)'
complete -c pkgdev -f -n '__fish_seen_subcommand_from manifest; and not __fish_contains_opt -s f force' -s f -l force -d 'Forcibly remanifest packages'
complete -c pkgdev -f -n '__fish_seen_subcommand_from manifest; and not __fish_contains_opt -s m mirrors' -s m -l mirrors -d 'Enable fetching from Gentoo mirrors'
complete -c pkgdev -f -n '__fish_seen_subcommand_from manifest; and not __fish_contains_opt if-modified' -l if-modified -d 'Only check packages that have uncommitted modifications'

# mask subcommand options
complete -c pkgdev -f -n '__fish_seen_subcommand_from mask; and not __fish_contains_opt -s r rites' -s r -l rites -d 'Mark for last rites'
complete -c pkgdev -f -n '__fish_seen_subcommand_from mask; and not __fish_contains_opt -s b bugs' -s b -l bugs -d 'Reference bug in the mask comment'
complete -c pkgdev -f -n '__fish_seen_subcommand_from mask; and not __fish_contains_opt email' -l email -d 'Spawn email composer with prepared email for sending to mailing lists'

# push subcommand options
complete -c pkgdev -f -n '__fish_seen_subcommand_from push; and not __fish_contains_opt -s A ask' -s A -l ask -d 'Confirm pushing commits with QA errors'
complete -c pkgdev -f -n '__fish_seen_subcommand_from push; and not __fish_contains_opt -s n dry-run' -s n -l dry-run -d 'Pretend to push commits'
complete -c pkgdev -f -n '__fish_seen_subcommand_from push; and not __fish_contains_opt pull' -l pull -d 'Run git pull --rebase before scanning'

# showkw subcommand options
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s f format' -s f -l format -d 'Keywords table format' -r
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s c collapse' -s c -l collapse -d 'Show collapsed list of arches'
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s s stable' -s s -l stable -d 'Show stable arches'
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s u unstable' -s u -l unstable -d 'Show unstable arches'
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s o only-unstable' -s o -l only-unstable -d 'Show arches that only have unstable keywords'
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s p prefix' -s p -l prefix -d 'Show prefix and non-native arches'
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s a arch' -s a -l arch -d 'Select arches to display' -r
complete -c pkgdev -f -n '__fish_seen_subcommand_from showkw; and not __fish_contains_opt -s r repo' -s r -l repo -d 'Repo to query' -r
