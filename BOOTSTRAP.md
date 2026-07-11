# BOOTSTRAP: paste this whole file into Claude Code

Copy everything below the line and paste it into Claude Code, opened in this repo folder. Claude will set up your AI PMO in GitHub and Linear and turn on the sync rules.

---

You are my CTO. Set up my AI Project Management Office in this repo and in my Linear workspace. Follow `CLAUDE.md` in this repo for the sync rules. Work step by step and confirm each step.

## Step 1: prime this GitHub repo

Use the `gh` CLI. Make sure I am authenticated (`gh auth status`); if not, walk me through `gh auth login`. This repo is my working copy created from a template, so use the current repo.

Create these 7 milestones (they are the 7 days of the plan). If a milestone already exists, skip it. Do not duplicate.

1. Day 1 Foundations
2. Day 2 Audit your chaos
3. Day 3 Deploy Aitana on Hermes
4. Day 4 Plan in Linear (Claude turns your audit into the board)
5. Day 5 Stop missing calls (Reception.ai)
6. Day 6 Hire your first agent
7. Day 7 Review and next move

Create these 5 labels. If a label already exists, skip it.

- `agent`
- `ops`
- `revenue`
- `content`
- `quick-win`

Create these quick-win starter issues. Each line is `Title [milestone] (labels)`. Assign each issue to the matching milestone and apply the listed labels. If an issue with the same title already exists, skip it.

- Install Claude Code [Day 1] (quick-win)
- Audit: count missed calls, list lead sources, map time sinks [Day 2] (ops, quick-win)
- Deploy Aitana on Hermes at portal.nousresearch.com/cloud [Day 3] (ops, quick-win)
- Ask Claude to turn your audit into this board [Day 4] (ops)
- Turn on ElevenLabs Reception.ai [Day 5] (revenue, quick-win)
- Hire your first agent (Emma, Paula, Claude, or Andrea) [Day 6] (agent)
- Review results and pick your next move [Day 7] (ops)

Shortcut: this repo ships `setup.sh`, which does all of the above and is idempotent. You may run `bash setup.sh` instead of issuing the commands one by one. After it runs, verify with `gh api` that the 7 milestones, 5 labels, and 7 issues exist.

## Step 2: mirror everything into my Linear

Ask me for my Linear API key. I will paste it. Do not print it back and do not commit it anywhere. Use it only for API calls in this session.

Then, in my Linear workspace:

1. Create a team for this PMO if I do not already have one to use (ask me which team to use).
2. Create the 5 labels: `agent`, `ops`, `revenue`, `content`, `quick-win`.
3. Create 7 Linear projects, one per milestone, with the exact same names as the GitHub milestones.
4. For each GitHub issue, create a matching Linear issue: same title, same body, same labels, and place it in the project that matches its milestone.
5. In each Linear issue description, add the marker `GH #NN` with the GitHub issue number so the two are linked.
6. On each GitHub issue, add a comment with the Linear issue identifier (for example `PMO-12`) so the link works both ways.

Map status as you go: GitHub open maps to Linear Todo. GitHub closed maps to Linear Done.

## Step 3: turn on the sync rules

From now on, follow `CLAUDE.md` in this repo:

- Mirror creates, edits, status changes, labels, and milestones in both directions.
- When one side closes, close the other.
- Reconcile daily and give me a short summary of what you synced, what you fixed, and what needs my decision.
- If the same item changed on both sides, show me both versions and ask which wins. Everywhere else, mirror without asking.

Confirm that GitHub and Linear now match, then tell me my PMO is live and what my Day 1 tasks are.
