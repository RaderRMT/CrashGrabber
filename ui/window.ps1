# Global variables
$global:WINDOW_WIDTH = 1;
$global:WINDOW_HEIGHT = 1;

# Width and height are in characters
function set_window_size {
    param(
        [Parameter(Mandatory)]
        [Int32] $width,
        [Parameter(Mandatory)]
        [Int32] $height
    )

    if($width -lt 0 -or $height -lt 0) {
        Write-Host "Trying to set the window size to a negative value";
        return;
    }

    $global:WINDOW_WIDTH = $width;
    $global:WINDOW_HEIGHT = $height;

    [Console]::setWindowSize($width, $height);
    [Console]::setBufferSize($width + 1, $height + 1);
}

# Set the title of the PowerShell
function set_window_title {
    param (
        [Parameter(Mandatory)]
        [String] $title
    )

    $Host.UI.RawUI.WindowTitle = $title;
}

# Setting up a window with the default size
set_window_size 100 35;