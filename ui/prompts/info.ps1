function info {
    param (
        [Parameter(Mandatory)]
        [String] $title,
        [Parameter(Mandatory)]
        [String] $message
    )

    text_popup $title $message $false Black Gray;
}