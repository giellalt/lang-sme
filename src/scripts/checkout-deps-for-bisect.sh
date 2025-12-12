#!/bin/bash
# Script to checkout the closest commits in dependent repositories
# based on the current commit timestamp in lang-sme
#
# Dependent repositories (adjust paths as needed):
# - giella-core
# - giella-shared
# - (add other dependencies here)

set -e

# Get the current commit timestamp
current_timestamp=$(git log -1 --format=%ct)
current_date=$(git log -1 --format=%ci)

echo "Current lang-sme commit: $(git rev-parse --short HEAD)"
echo "Commit date: $current_date"
echo "Timestamp: $current_timestamp"
echo ""

# Function to checkout closest commit in a repository
checkout_closest_commit() {
    local repo_path="$1"
    local repo_name="$2"
    
    if [ ! -d "$repo_path" ]; then
        echo "Warning: Repository $repo_name not found at $repo_path"
        return
    fi
    
    echo "Processing $repo_name..."
    cd "$repo_path"
    
    # Find the closest previous commit (before or at the target timestamp)
    closest_commit=$(git log --all --format='%ct %H' | \
        awk -v target="$current_timestamp" '
            $1 <= target {
                if (min == "" || target - $1 < min) {
                    min = target - $1
                    commit = $2
                }
            }
        END { print commit }')
    
    if [ -n "$closest_commit" ]; then
        commit_date=$(git log -1 --format=%ci "$closest_commit")
        echo "  Checking out: $closest_commit"
        echo "  Date: $commit_date"
        git checkout "$closest_commit" 2>/dev/null || echo "  Warning: Could not checkout commit"
        ./autogen.sh
        ./configure
        make
    else
        echo "  Warning: Could not find suitable commit"
    fi
    
    cd - > /dev/null
    echo ""
}

# Checkout closest commits in dependent repositories
# Adjust these paths to match your setup
for repo_name in "shared-mul" "shared-smi" "giella-core"; do
    checkout_closest_commit ../"$repo_name" "$repo_name"
done

echo "Done! Dependent repositories have been updated to closest commits."
