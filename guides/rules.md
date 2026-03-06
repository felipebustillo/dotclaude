# Rules Guide

Rules are contextual instructions in `.claude/rules/` that load automatically based on file patterns.

## Why Rules

CLAUDE.md loads entirely at session start. For large projects, this wastes context on irrelevant sections. Rules let you split instructions by domain — they load only when relevant files are accessed.

## File Format

Plain markdown files in `.claude/rules/`. No frontmatter required.

## Example Structure

```
.claude/rules/
├── infrastructure.md      # Servers, domains, deployment
├── edc-architecture.md    # EDC module specifics
├── cicd-quality.md        # CI/CD quality gates
└── audit-guardrails.md    # Security/audit constraints
```

## CLAUDE.md + Rules Strategy

| Content | Location | Why |
|---------|----------|-----|
| Project overview, tech stack, dev commands | `CLAUDE.md` | Always needed |
| Naming conventions, code patterns | `CLAUDE.md` | Always needed |
| Infrastructure details | `.claude/rules/` | Only for deployment/infra tasks |
| Module-specific architecture | `.claude/rules/` | Only when touching that module |
| CI/CD quality gates | `.claude/rules/` | Only when running checks |
| Audit guardrails | `.claude/rules/` | Only for compliance-related work |

## Target: CLAUDE.md < 200 Lines

Best practice is to keep CLAUDE.md under 200 lines. Extract everything else to rules.

## Reference from CLAUDE.md

Add a section pointing to rules:

```markdown
## Detailed References (in `.claude/rules/`)

- `infrastructure.md` — Servers, domains, deployment
- `edc-architecture.md` — EDC module specifics
- `cicd-quality.md` — Quality gates, pre-push checklist
- `audit-guardrails.md` — Technical audit guardrails
```
