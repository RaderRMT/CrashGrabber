function is_color_valid {
    param(
        [Parameter(Mandatory)]
        [String] $color
    )

    foreach($_color in [Enum]::GetValues([ConsoleColor])) {
        if($_color -eq $color) { return $true }
    }

    return $false;
}