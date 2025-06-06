
const userConfigOptions = {
    // For every option, see ~/.config/ags/modules/.configuration/user_options.js
    // (vscode users ctrl+click this: file://./modules/.configuration/user_options.js)
    // (vim users: `:vsp` to split window, move cursor to this path, press `gf`. `Ctrl-w` twice to switch between)
    //   options listed in this file will override the default ones in the above file
    // Here's an example
    'overview': {
        'scale': 0.15, // Relative to screen size
        'numOfRows': 2,
        'numOfCols': 4,
        'wsNumScale': 0.15,
        'wsNumMarginScale': 0.10,
    },
        'keybinds': {
        'sidebar': {
            'pin': "Ctrl+p",
            'nextTab': "Ctrl+Page_Down",
            'prevTab': "Ctrl+Page_Up",
        },
    },
}

export default userConfigOptions;
