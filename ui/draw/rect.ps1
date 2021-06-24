function draw_rect {
    param(
        [Parameter(Mandatory)]
        [Int32] $x1,
        [Parameter(Mandatory)]
        [Int32] $y1,
        [Parameter(Mandatory)]
        [Int32] $x2,
        [Parameter(Mandatory)]
        [Int32] $y2,
        [String] $color = "Black"
    )

    if(!(is_color_valid $color)) {
        Write-Host "Invalid color: $color";
        return;
    }

    if(($x1 -lt 0 -or $x1 -ge $WINDOW_WIDTH) -or
            ($y1 -lt 0 -or $y1 -ge $WINDOW_HEIGHT) -or
            ($x2 -lt 0 -or $x2 -ge $WINDOW_WIDTH) -or
            ($y2 -lt 0 -or $y2 -ge $WINDOW_HEIGHT)) {
        Write-Host "Rectangle outside of window bounds";
        break;
    }

    for($y = $y1; $y -lt $y2; $y++) {
        draw_horizontal_line $x1 $y ($x2 - $x1) $color;
    }
}

function draw_rect_size {
    param(
        [Parameter(Mandatory)]
        [Int32] $x,
        [Parameter(Mandatory)]
        [Int32] $y,
        [Parameter(Mandatory)]
        [Int32] $width,
        [Parameter(Mandatory)]
        [Int32] $height,
        [String] $color = "Black"
    )

    draw_rect $x $y ($x + $width) ($y + $height) $color;
}