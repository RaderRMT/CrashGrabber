# keyboard keys
$KEY_BACKSPACE = 8;
$KEY_ENTER = 13;
$KEY_ESCAPE = 27;
$KEY_SPACE = 32;
$KEY_ARROW_LEFT = 37;
$KEY_ARROW_UP = 38;
$KEY_ARROW_RIGHT = 39;
$KEY_ARROW_DOWN = 40;
$KEY_0 = 48;
$KEY_9 = 57;
$KEY_A = 65;
$KEY_R = 82;
$KEY_Z = 90;
$KEY_NUMPAD_0 = 96;
$KEY_NUMPAD_9 = 105;
$KEY_SUBTRACT = 109;
$KEY_DOT = 110;

# Get a key press
function get_key {
    $press = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown");
    
    return $press.virtualkeycode;
}

function pause {
    $ignore_me = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown");
}