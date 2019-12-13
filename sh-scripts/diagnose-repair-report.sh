msg Diagnosing, attempting to repair, and reporting ...

# fetch the mcm version
# and turn off debugging (by default, debugging is on)
$ssh_cmd "curl -s https://raw.githubusercontent.com/PMET-public/magento-cloud-manager/diagnose-repair-report/cli/bin/env-scripts/diagnose-repair-report.sh | env debug=${debug:=0} bash" 2>/dev/null |
  tee /dev/tty |
  # copy report to clipboard and strip color characters
  perl -pe 's/\e\[\d+(?>(;\d+)*)m//g;' | pbcopy

