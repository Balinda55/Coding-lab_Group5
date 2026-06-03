#!/bin/bash
initialize_system() {
    local directories=("active_logs" "archived_logs" "reports")

    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            echo "Creating $dir directory..."
            mkdir -p "$dir"
            if [ $? -eq 0 ]; then
                echo "Successfully created $dir."
            else
                echo "Error: Failed to create $dir." >&2
                return 1
            fi
        else
            echo "Directory $dir already exists."
        fi
    done
} 

secure_data() {
    local target_dir="active_logs"

    if [ -d "$target_dir" ]; then
        echo "Securing $target_dir directory..."

        # Restrict permissions: Owner can read, write, and access. Group and Others get nothing.
        chmod 700 "$target_dir"

        echo "Displaying new permissions for $target_dir:"
        # -ld shows the directory details rather than the files inside it
        ls -ld "$target_dir"
    else
        echo "Error: Directory '$target_dir' does not exist. Run initialize_system first." >&2
        return 1
    fi
}

initialize_system
secure_data


