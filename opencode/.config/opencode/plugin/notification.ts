export const NotificationPlugin = async ({ project, client, $, directory, worktree }) => {
  return {
    event: async ({ event }) => {
      // Send notification on session completion (main agent only, not sub-agents)
      if (event.type === "session.idle") {
        const session = await client.session.get({
          path: { id: event.properties.sessionID }
        });

        // Skip notifications for sub-agent sessions (Task tool)
        if (session.data?.parentID) {
          return;
        }

        await $`notify-send "Session Complete" "Your coding session has ended." --icon=dialog-information`;
      }
    }
  }
}
