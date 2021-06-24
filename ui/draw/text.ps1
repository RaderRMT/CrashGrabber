function print {
    param (
        [Parameter(Mandatory)]
        [Int32] $x,
        [Parameter(Mandatory)]
        [Int32] $y,
        [Parameter(Mandatory)]
        [String] $message,
        [String] $fg = "White",
        [String] $bg = "DarkMagenta"
    )

    if(!(is_color_valid $fg) -or !(is_color_valid $bg)) {
        Write-Host "Invalid foreground/background color: $color";
        return;
    }

    set_cursor_pos $x $y;

    Write-Host $message -ForegroundColor $fg -BackgroundColor $bg;
}