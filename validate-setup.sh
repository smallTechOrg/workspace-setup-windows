#!/usr/bin/env bash
#
# Validates that a developer's local machine is set up correctly.
# Checks that required tools are installed and working: Git, Node.js, Python, PostgreSQL.
# Add new checks by writing a check_* function and calling it in the "Run checks" section.
#
# Usage: ./validate-setup.sh   (run from Git Bash)

set -u

RESULTS_NAMES=()
RESULTS_PASSED=()
RESULTS_DETAILS=()

add_result() {
    local name="$1"
    local passed="$2"
    local detail="$3"
    RESULTS_NAMES+=("$name")
    RESULTS_PASSED+=("$passed")
    RESULTS_DETAILS+=("$detail")
}

check_git() {
    if command -v git >/dev/null 2>&1; then
        local version
        version="$(git --version)"
        add_result "Git" "true" "$version"
    else
        add_result "Git" "false" "git is not installed or not on PATH."
    fi
}

check_node() {
    local node_version npm_version
    if command -v node >/dev/null 2>&1; then
        node_version="$(node --version)"
    fi
    if command -v npm >/dev/null 2>&1; then
        npm_version="$(npm --version)"
    fi

    if [[ -n "${node_version:-}" && -n "${npm_version:-}" ]]; then
        add_result "Node.js" "true" "node $node_version, npm $npm_version"
    elif [[ -n "${node_version:-}" ]]; then
        add_result "Node.js" "false" "node $node_version found, but npm is missing or not on PATH."
    else
        add_result "Node.js" "false" "node is not installed or not on PATH."
    fi
}

check_python() {
    local version
    if command -v python >/dev/null 2>&1; then
        version="$(python --version 2>&1)"
    elif command -v python3 >/dev/null 2>&1; then
        version="$(python3 --version 2>&1)"
    fi

    if [[ -n "${version:-}" ]]; then
        add_result "Python" "true" "$version"
    else
        add_result "Python" "false" "python is not installed or not on PATH."
    fi
}

check_postgres() {
    if ! command -v psql >/dev/null 2>&1; then
        add_result "PostgreSQL" "false" "psql is not installed or not on PATH."
        return
    fi

    local version
    version="$(psql --version)"

    # Try to confirm the server is actually reachable/running (uses default connection settings).
    if command -v pg_isready >/dev/null 2>&1 && pg_isready >/dev/null 2>&1; then
        add_result "PostgreSQL" "true" "$version, server is accepting connections."
    else
        add_result "PostgreSQL" "false" "$version, but could not confirm the server is running (pg_isready failed or is unavailable)."
    fi
}

# Run checks. Add future checks (e.g. Claude Code) as new check_* functions and call them here.
check_git
check_node
check_python
check_postgres

echo "Validating local workspace setup..."
echo
echo "Results:"
printf '%.0s-' {1..60}
echo

FAILED_COUNT=0
for i in "${!RESULTS_NAMES[@]}"; do
    name="${RESULTS_NAMES[$i]}"
    passed="${RESULTS_PASSED[$i]}"
    detail="${RESULTS_DETAILS[$i]}"

    if [[ "$passed" == "true" ]]; then
        printf "[ OK ] %-12s %s\n" "$name" "$detail"
    else
        printf "[FAIL] %-12s %s\n" "$name" "$detail"
        FAILED_COUNT=$((FAILED_COUNT + 1))
    fi
done

printf '%.0s-' {1..60}
echo

if [[ "$FAILED_COUNT" -gt 0 ]]; then
    echo
    echo "$FAILED_COUNT check(s) failed. Please install/fix the tools above before continuing."
    exit 1
else
    echo
    echo "All checks passed. Your workspace is set up correctly!"
    exit 0
fi
