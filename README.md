# AI PMO Template Pack

Run your business like a project management office, with AI doing the project management.

This template gives you a working AI Project Management Office (PMO) in minutes. GitHub Issues become your task list. Linear becomes your plan and board. Claude keeps both in sync and turns your day-to-day chaos into a clean 7-day launch plan.

You get a primed repo with 7 milestones, 5 labels, and a set of quick-win issues already created. You paste one prompt into Claude Code, and Claude mirrors everything into your Linear workspace and starts running your PMO.

## The outcome

In one week you go from scattered notes and missed follow-ups to a single source of truth:

- A clear 7-day plan, one milestone per day.
- Quick-win tasks that produce real results fast: stop missing calls, deploy your first always-on assistant, hire your first agent.
- GitHub and Linear always in sync, so humans and AI agents are looking at the same reality.
- Claude acting as your CTO, reconciling the board every day so nothing falls through the cracks.

## How to use

1. Click **Use this template** at the top of this repo and create your own copy.
2. Clone your new repo to your machine.
3. Open the folder in [Claude Code](https://www.anthropic.com/claude-code).
4. Open `BOOTSTRAP.md`, copy the whole prompt, and paste it into Claude Code.

Claude will:

- Create the 7 milestones, 5 labels, and quick-win issues in your repo (or confirm they exist).
- Ask for your Linear API key and mirror the plan into your Linear workspace.
- Turn on the sync rules in `CLAUDE.md` so GitHub and Linear stay aligned from then on.

That is it. You now have an AI PMO.

## What is in the pack

- `README.md`: this file.
- `BOOTSTRAP.md`: the one prompt you paste into Claude Code to set everything up.
- `CLAUDE.md`: the sync rules Claude follows to keep GitHub and Linear aligned. This is the engine.
- `setup.sh`: an idempotent script that primes the repo with milestones, labels, and quick-win issues.
- `.github/ISSUE_TEMPLATE/quick-win.md`: a template so every new task stays consistent.

## The 7-day plan

- **Day 1 Foundations**: install your tools.
- **Day 2 Audit your chaos**: count missed calls, list lead sources, map your time sinks.
- **Day 3 Deploy Aitana on Hermes**: stand up your always-on assistant.
- **Day 4 Plan in Linear**: Claude turns your audit into the board.
- **Day 5 Stop missing calls**: turn on ElevenLabs Reception.ai.
- **Day 6 Hire your first agent**: Emma, Paula, Claude, or Andrea.
- **Day 7 Review and next move**: look at results and pick what is next.

## Notes

- You control your data. The issues, plan, and keys live in your GitHub repo and your Linear workspace.
- You can re-run `setup.sh` any time. It will not create duplicates.
- Requires the GitHub CLI (`gh`), a GitHub account, and a Linear account with an API key.

Built by [Startup Miracle](https://startupmiracle.com).
