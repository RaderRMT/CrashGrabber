function draw_horizontal_line {
    param(
        [Parameter(Mandatory)]
        [Int32] $x,
        [Parameter(Mandatory)]
        [Int32] $y,
        [Parameter(Mandatory)]
        [Int32] $length,
        [String] $color = "Black"
    )

    if(!(is_color_valid $color)) {
        Write-Host "Invalid color: $color";
        return;
    }

    if($x + $size -ge $WINDOW_WIDTH) {
        Write-Host "Line size must not end outside of the window";
        return;
    }

    set_cursor_pos $x $y;

    for($i = 0; $i -lt $length; $i++) {
        Write-Host " " -BackgroundColor $color -NoNewLine;
    }
}

function draw_vertical_line {
    param(
        [Parameter(Mandatory)]
        [Int32] $x,
        [Parameter(Mandatory)]
        [Int32] $y,
        [Parameter(Mandatory)]
        [Int32] $length,
        [String] $color = "Black"
    )

    if(!(is_color_valid $color)) {
        Write-Host "Invalid color: $color";
        return;
    }

    if($y + $size -ge $WINDOW_HEIGHT) {
        Write-Host "Line size must not end outside of the window";
        return;
    }

    for($i = 0; $i -lt $length; $i++) {
        set_cursor_pos $x ($y + $i);

        Write-Host " " -BackgroundColor $color -NoNewLine;
    }
}