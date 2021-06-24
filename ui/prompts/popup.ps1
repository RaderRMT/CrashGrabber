$private:fg;
$private:bg;

function text_popup {
    param (
        [Parameter(Mandatory)]
        [String] $title,
        [Parameter(Mandatory)]
        [String] $message,
        [Parameter(Mandatory)]
        [Boolean] $centered,
        [Parameter(Mandatory)]
        [String] $fg,
        [Parameter(Mandatory)]
        [String] $bg
    )

    if(!(is_color_valid $fg) -or !(is_color_valid $bg)) {
        Write-Host "Invalid foreground/background color: $color";
        return;
    }

    $half_width = [math]::Round($WINDOW_WIDTH / 2);

    $biggest_length = $message.Length;
    if($title.Length -gt $biggest_length) {
        $biggest_length = $title.Length;
    }

    $x = $half_width - [math]::Round($biggest_length / 2) - 2;
    $y = [math]::Round($WINDOW_HEIGHT / 2 - 2);

    if($x -lt 0) {
        Write-Host "Message or title is too big";
        return;
    }

    $width = $biggest_length + 4;
    $height = 4;

    $title_x = $x + 2;
    $title_y = $y + 1;

    $message_x = $title_x;
    $message_y = $title_y + 1;

    if($centered) {
        $message_x = $half_width - [math]::Round($message.Length / 2);
        $title_x = $half_width - [math]::Round($title.Length / 2);
    }
    
    draw_rect_size $x $y $width $height $bg;

    print $title_x $title_y $title -bg $bg -fg $fg;
    print $message_x $message_y $message -bg $bg -fg $fg;

    pause;

    draw_rect_size $x $y $width $height DarkMagenta;
    draw_ui;
}