function error {
    param (
        [Parameter(Mandatory)]
        [String] $title,
        [Parameter(Mandatory)]
        [String] $message
    )

    text_popup $title $message $true White DarkRed;
}