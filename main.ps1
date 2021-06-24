Get-Module | Remove-Module;

# Important UI Modules
Import-Module ".\ui\cursor.ps1";
Import-Module ".\ui\window.ps1";

# Drawing Modules
Import-Module ".\ui\draw\color.ps1";
Import-Module ".\ui\draw\line.ps1";
Import-Module ".\ui\draw\rect.ps1";
Import-Module ".\ui\draw\text.ps1";

# Keys Module
Import-Module ".\utils\keyboard.ps1";

# Prompts Module
Import-Module ".\ui\prompts\error.ps1";
Import-Module ".\ui\prompts\info.ps1";
Import-Module ".\ui\prompts\popup.ps1";
Import-Module ".\ui\prompts\prompt.ps1";
Import-Module ".\ui\prompts\yes_no.ps1";

function draw_ui {
    set_cursor_visibility $false;
    
    #borders
    draw_horizontal_line 0 0 -length 100;
    draw_vertical_line 0 0 -length 34;
    draw_vertical_line 1 0 -length 34;
    draw_vertical_line 98 0 -length 34;
    draw_vertical_line 99 0 -length 34;
    draw_horizontal_line 0 34 -length 100;

    # title separation
    draw_horizontal_line 2 4 -length 100;

    print 41 2 "M3 Crash Grabber";

    draw_vertical_line 24 5 -length 29;
    draw_vertical_line 25 5 -length 29;

    print 8 6 "Computers:";

    print 6 7 "$([char]27)[4mA$([char]27)[24mdd";
    print 15 7 "$([char]27)[4mR$([char]27)[24memove";
    
    draw_horizontal_line 2 9 -length 22;
}

function main {
    draw_ui;

    #todo: the yes/no prompt
    info "Information:" "Hello, World!";
    error "Error:" "Hi!";
    prompt "Say hi:";

    # act as a pause
    pause;
}

main;