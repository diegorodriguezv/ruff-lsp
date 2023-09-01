default: fmt check

lock:
  pip-compile --resolver=backtracking --upgrade -o requirements.txt pyproject.toml
  pip-compile --resolver=backtracking --upgrade --extra dev -o requirements-dev.txt pyproject.toml

install:
  pip install --no-deps -r requirements.txt
  pip install --no-deps -r requirements-dev.txt

fmt:
  ruff check --fix ./ruff_lsp ./tests
  ruff format ./ruff_lsp ./tests

check:
  ruff format ./ruff_lsp ./tests
  git diff HEAD | cat

  ruff check ./ruff_lsp ./tests
  ruff format --check ./ruff_lsp ./tests
  mypy ./ruff_lsp ./tests

test:
  pytest
