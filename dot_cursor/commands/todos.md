# Fill Agent TODOs

Search the entire codebase for every comment matching the pattern `TODO(agent): <description>`. The comment marker varies by language (`#`, `//`, `/* */`, `--`, `<!-- -->`, etc.) — match all of them.

The text after `TODO(agent):` is your DIRECTIONS. Follow those directions exactly. Do not deviate.

## Selection step (do this FIRST)

Before making any changes, present the full list of TODOs you found as a numbered table so I can pick which ones to work on. Each row must include:

- **#** — a stable number for selection
- **File:line** — clickable location (e.g. `src/api/users.ts:42`)
- **Scope** — the innermost enclosing block (e.g. `function getUser`, `for loop in handleBatch`, `module top-level`)
- **Directions** — the text after `TODO(agent):`, verbatim

Example:

| # | File:line | Scope | Directions |
|---|-----------|-------|------------|
| 1 | `src/api/users.ts:42` | `function getUser` | return 404 when user is missing |
| 2 | `src/utils/math.py:10` | `function get_total` | sum item.price * item.quantity for all items |

Then ask: **"Which TODOs should I work on? (e.g. `1,3`, `all`, `1-4`, or list numbers)"**

Wait for my reply before proceeding. Only work on the TODOs I select. If I reply with `none`, an empty message, or indicate I don't want to proceed, stop without making any changes.

## Execution rules

For each selected TODO, you MUST:

1. **Ask when DIRECTIONS are ambiguous.** If the text after `TODO(agent):` is unclear or references something with multiple plausible interpretations (e.g. "use the helper" when several helpers exist, or unresolved names/types), stop and ask for clarification before editing. Do not guess.

2. **Scope-locked replacement.** Replace ONLY the TODO comment and fill in the requested code at **the same scope level** where the comment lives. "Scope level" means the innermost enclosing block:
   - Inside a function/method body → only change code within that function/method.
   - Inside a loop body (`for`, `while`, `.forEach`, etc.) → only change code within that loop block.
   - Inside a conditional, `try`/`catch`, `with`, `match`, or any braced `{}` / indented block → only change code within that block.
   - At module/file top level → only change code at that top level, not inside any function or class.

   Read the rest of the file as read-only context for conventions, helpers, and types — do not modify, refactor, rename, or reformat anything outside the TODO's immediate scope.

3. **Match the existing style.** Write easy to read, not convoluted, testable code that matches the patterns, naming, and idioms already present in the file. Do not introduce new conventions.

4. **Minimal diff.** Each replacement must be the smallest change that fulfils the DIRECTIONS. No drive-by fixes, no style changes, no unrelated improvements. Do not deviate from what the TODO asks.

5. **Check code quality before moving on.** After completing the changes to fulfil the DIRECTIONS, check lint errors. Prefer `mise run lint` if a `mise.toml` with a `lint` task exists; otherwise use the project's configured lint command (e.g. from `package.json` scripts, `Makefile`, `justfile`).

6. **One at a time.** Work through the selected todo list sequentially. After completing each item, mark it as completed and move to the next.

7. **Run the tests once at the end.** Only after ALL selected TODOs are resolved, run the test suite. Prefer `mise run test` if a `mise.toml` with a `test` task exists; otherwise use the project's configured test command. Do not run tests between TODOs.

8. **Verify.** After all selected TODOs are resolved, grep the codebase again for `TODO(agent):` to confirm none of the selected ones remain.

## Examples

### Example 1 — inside a function body

BEFORE:
def get_total(items):
    # TODO(agent): sum item.price * item.quantity for all items
    pass

AFTER:
def get_total(items):
    return sum(item.price * item.quantity for item in items)

* notice: only the TODO line and `pass` were replaced
* the function signature was NOT changed
* nothing outside the function was touched

### Example 2 — inside a loop

BEFORE:
for user in users:
    # TODO(agent): skip inactive users
    send_email(user)

AFTER:
for user in users:
    if not user.is_active:
        continue
    send_email(user)

* notice: the new code lives inside the for block
* `send_email(user)` was NOT removed or moved — it was already there
* nothing outside the loop was touched
