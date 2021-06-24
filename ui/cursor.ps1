# Set the position of the cursor to X, Y
function set_cursor_pos {
    param(
        [Parameter(Mandatory)]
        [Int32] $x,
        [Parameter(Mandatory)]
        [Int32] $y
    )

    if($x -lt 0 -or $x -ge $WINDOW_WIDTH) {
        Write-Host "Trying to set the cursor outside of the window's width: $x. Width: $WINDOW_WIDTH";
        break;
    }
    if($y -lt 0 -or $y -ge $WINDOW_HEIGHT) {
        Write-Host "Trying to set the cursor outside of the window's height: $y. Height: $WINDOW_HEIGHT";
        break;
    }

    $cursor_position = $Host.UI.RawUI.CursorPosition;

    $cursor_position.X = $x;
    $cursor_position.Y = $y;

    $Host.UI.RawUI.CursorPosition = $cursor_position;
}

# Returns the cursor's X position
function get_cursor_x {
    return $Host.UI.RawUI.CursorPosition.X;
}

# Returns the cursor's Y position
function get_cursor_y {
    return $Host.UI.RawUI.CursorPosition.Y;
}

# Set the cursor's X position to $x
function set_cursor_x {
    param(
        [Parameter(Mandatory)]
        [Int32] $x
    )

    set_cursor_pos $x (get_cursor_y);
}

# Set the cursor's Y position to $y
function set_cursor_y {
    param(
        [Parameter(Mandatory)]
        [Int32] $y
    )

    set_cursor_pos (get_cursor_x) $y;
}

# Set the visibility of the cursor
function set_cursor_visibility {
    param(
        [Boolean] $visible = $true
    )

    [Console]::CursorVisible = $visible;
}