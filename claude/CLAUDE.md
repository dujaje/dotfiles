# Universal Preferences

## Git Operations

Before any git operations (commit, push, pull, status), always:
1. Clarify which repository the user intends (if workspace has multiple repos)
2. Confirm the current working directory with `pwd`
3. Show `git remote -v` output if there's any ambiguity

## My Preferences

- [Add your universal preferences here]

## Product Development Workflow

I follow **specification-driven development** when building products. Specifications are the source of truth for what we're building and why.

### Specification Types

**Domain Specifications**
- Cover broad, foundational concepts and design principles
- Apply across multiple features (e.g., "Authentication Model", "Data Privacy Principles", "API Design Standards")
- Define the "rules of the world" that features must operate within
- Updated infrequently, but referenced often

**Feature Specifications**
- Targeted at delivering a specific feature or capability
- Reference relevant domain specs for context and constraints
- Define acceptance criteria, user flows, and implementation details
- Scoped to a deliverable unit of work

### Specification Workflow

1. **Draft locally** - Work with Claude Code to write and iterate on specifications in local markdown files
2. **Review and refine** - Iterate until the specification is clear, complete, and ready for collaboration
3. **Publish to documentation** - Use MCP to push finalised specs to Craft or Notion for cross-company visibility and collaboration
4. **Create delivery tickets** - Extract actionable work from specifications and push to Linear as tickets for implementation

### Working with Claude on Specifications

When drafting specifications with me:
- Start by identifying whether this is a domain spec or feature spec
- For feature specs, reference which domain specs apply
- Focus on the "what" and "why" before the "how"
- Iterate in drafts before publishing
