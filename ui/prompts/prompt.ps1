function prompt {
    param (
        [Parameter(Mandatory)]
        [String] $title
    )

    $half_width = [math]::Round($WINDOW_WIDTH / 2);

    $x = $half_width - 10;
    $y = [math]::Round($WINDOW_HEIGHT / 2 - 2);

    if($title.Length -gt 16) {
        Write-Host "Title is too big";
        return;
    }

    $width = 20;
    $height = 4;

    $title_x = $x + 2;
    $title_y = $y + 1;
    
    draw_rect_size $x $y $width $height Gray;

    print $title_x $title_y $title -bg Gray -fg Black;

    set_cursor_visibility $true;
    set_cursor_pos $title_x ($title_y + 1);

    $output = "";
    $offset = 0;
    $key = $null;
    while($key -ne $KEY_ENTER) {
        $key = get_key;

        if($key -eq $KEY_BACKSPACE) {
            if($offset -le 0) {
                continue;
            }

            $offset--;
            $output = $output.Substring(0, $output.Length - 1);

            print ($title_x + $offset) ($title_y + 1) " " -bg Gray -fg Black;
            set_cursor_pos ($title_x + $offset) ($title_y + 1);
        }

        if($key -eq $KEY_ESCAPE) {
            set_cursor_visibility $false;

            draw_rect_size $x $y $width $height DarkMagenta;
            draw_ui;
            return;
        }

        if($offset -eq 16) {
            continue;
        }

        if(($key -ge $KEY_A -and $key -le $KEY_Z) -or
                ($key -ge $KEY_0 -and $key -le $KEY_9) -or
                ($key -ge $KEY_NUMPAD_0 -and $key -le $KEY_NUMPAD_9) -or
                $key -eq $KEY_SPACE -or
                $key -eq $KEY_DOT -or
                $key -eq $KEY_SUBTRACT) {

            if($key -eq $KEY_DOT) { $key = '.' }
            if($key -eq $KEY_SUBTRACT) { $key = '-' }
            if($key -ge $KEY_NUMPAD_0 -and $key -le $KEY_NUMPAD_9) { $key -= 48 }

            print ($title_x + $offset) ($title_y + 1) ([char]$key) -bg Gray -fg Black;
            $offset++;
            set_cursor_pos ($title_x + $offset) ($title_y + 1);

            $output += ([char]$key);
        }
    }

    set_cursor_visibility $false;

    draw_rect_size $x $y $width $height DarkMagenta;
    draw_ui;

    return $output;
}