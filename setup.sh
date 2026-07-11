#!/usr/bin/env bash
#
# setup.sh - prime this repo with the AI PMO plan.
#
# Creates 7 milestones, 5 labels, and the quick-win starter issues.
# Idempotent: safe to run more than once. It never creates duplicates.
#
# Requirements: gh (GitHub CLI), authenticated (gh auth status).
# Usage: bash setup.sh

set -euo pipefail

# Resolve the current repo (owner/name).
REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo "Priming AI PMO in: $REPO"
echo

# ---------------------------------------------------------------------------
# Labels
# ---------------------------------------------------------------------------
echo "== Labels =="
existing_labels="$(gh label list --repo "$REPO" --limit 200 --json name -q '.[].name')"
create_label () {
  local name="$1" color="$2" desc="$3"
  if grep -qxF "$name" <<< "$existing_labels"; then
    echo "  = label exists: $name"
  else
    gh label create "$name" --repo "$REPO" --color "$color" --description "$desc" >/dev/null
    echo "  + label created: $name"
  fi
}
create_label "agent"     "5319e7" "AI agent work"
create_label "ops"       "0e8a16" "Operations and process"
create_label "revenue"   "b60205" "Directly tied to revenue"
create_label "content"   "1d76db" "Content and marketing"
create_label "quick-win" "fbca04" "Fast, high-value task"
echo

# ---------------------------------------------------------------------------
# Milestones (created via the REST API; gh has no milestone command)
# ---------------------------------------------------------------------------
echo "== Milestones =="
existing_milestones="$(gh api "repos/$REPO/milestones?state=all&per_page=100" -q '.[].title')"
create_milestone () {
  local title="$1"
  if grep -qxF "$title" <<< "$existing_milestones"; then
    echo "  = milestone exists: $title"
  else
    gh api "repos/$REPO/milestones" -f title="$title" >/dev/null
    echo "  + milestone created: $title"
  fi
}
create_milestone "Day 1 Foundations"
create_milestone "Day 2 Audit your chaos"
create_milestone "Day 3 Deploy Aitana on Hermes"
create_milestone "Day 4 Plan in Linear (Claude turns your audit into the board)"
create_milestone "Day 5 Stop missing calls (Reception.ai)"
create_milestone "Day 6 Hire your first agent"
create_milestone "Day 7 Review and next move"
echo

# ---------------------------------------------------------------------------
# Issues
# ---------------------------------------------------------------------------
echo "== Issues =="
existing_issues="$(gh issue list --repo "$REPO" --state all --limit 200 --json title -q '.[].title')"
create_issue () {
  local title="$1" milestone="$2"; shift 2
  local labels=("$@")
  if grep -qxF "$title" <<< "$existing_issues"; then
    echo "  = issue exists: $title"
    return
  fi
  local label_args=()
  for l in "${labels[@]}"; do label_args+=(--label "$l"); done
  local body="Quick-win task from the AI PMO Template Pack.

Milestone: ${milestone}

See CLAUDE.md for how this stays in sync with Linear."
  gh issue create --repo "$REPO" \
    --title "$title" \
    --body "$body" \
    --milestone "$milestone" \
    "${label_args[@]}" >/dev/null
  echo "  + issue created: $title"
}

create_issue "Install Claude Code" \
  "Day 1 Foundations" "quick-win"
create_issue "Audit: count missed calls, list lead sources, map time sinks" \
  "Day 2 Audit your chaos" "ops" "quick-win"
create_issue "Deploy Aitana on Hermes at portal.nousresearch.com/cloud" \
  "Day 3 Deploy Aitana on Hermes" "ops" "quick-win"
create_issue "Ask Claude to turn your audit into this board" \
  "Day 4 Plan in Linear (Claude turns your audit into the board)" "ops"
create_issue "Turn on ElevenLabs Reception.ai" \
  "Day 5 Stop missing calls (Reception.ai)" "revenue" "quick-win"
create_issue "Hire your first agent (Emma, Paula, Claude, or Andrea)" \
  "Day 6 Hire your first agent" "agent"
create_issue "Review results and pick your next move" \
  "Day 7 Review and next move" "ops"
echo

echo "Done. Your AI PMO is primed."
echo "Next: paste BOOTSTRAP.md into Claude Code to mirror this into Linear."
