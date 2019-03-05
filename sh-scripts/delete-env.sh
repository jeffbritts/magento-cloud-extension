msg Deleting env ...

read -p "Confirm deletion of project: ${project} environment: ${environment} (y/n): " -n 1 -r < /dev/tty
if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
  # kill any php process up to 10 times in the next 10 min
  # that may still be running and blocking a proper shutdown
  $ssh_cmd "for i in {1..10}; do pkill php; sleep 60; done &" &

  # in v1.23, --delete-branch appears to be incompatible with the --no-wait flag, so it must be run twice
  "${cli_path}" environment:delete -p "${project}" -e "${environment}" --delete-branch --no-wait --yes
  "${cli_path}" environment:delete -p "${project}" -e "${environment}" --delete-branch --no-wait --yes
else
  exit
fi