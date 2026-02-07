# Fill Agent TODOs

Search the entire codebase for every comment matching the pattern `TODO(agent): <description>`. The comment marker varies by language (`#`, `//`, `/* */`, `--`, `<!-- -->`, etc.) — match all of them.

The text after `TODO(agent):` is your DIRECTIONS. Follow those directions exactly. Do not deviate.

For each TODO found, you MUST:

1. **Scope-locked replacement.** Replace ONLY the TODO comment and fill in the requested code at **the same scope level** where the comment lives. "Scope level" means the innermost enclosing block:
   - Inside a function/method body → only change code within that function/method.
   - Inside a loop body (`for`, `while`, `.forEach`, etc.) → only change code within that loop block.
   - Inside a conditional, `try`/`catch`, `with`, `match`, or any braced `{}` / indented block → only change code within that block.
   - At module/file top level → only change code at that top level, not inside any function or class.

   Read the rest of the file for context (helper functions, types, imports, conventions). Use that as context, NOT as a target. **Do NOT** modify, refactor, rename, reformat, or touch anything outside the immediate scope of each TODO. The surrounding code is read-only context.

2. **Match the existing style.** Write easy to read, not convouted, testable code code that matches the patterns, naming, and idioms already present in the file. Do not introduce new conventions.

3. **Minimal diff.** Each replacement must be the smallest change that fulfils the DIRECTIONS. No drive-by fixes, no style changes, no unrelated improvements. Do not deviate from what the TODO asks.

4. **Check code quality before moving on.** After completing the changes to fullfil the DIRECTION check linting errors with `mise run lint`, format the code with `mise run format` and test it with `mise run test`. 

5. **One at a time.** Work through the todo list sequentially. After completing each item, mark it as completed and move to the next.

6. **Verify.** After all TODOs are resolved, grep the codebase again for `TODO(agent):` to confirm none remain.

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
