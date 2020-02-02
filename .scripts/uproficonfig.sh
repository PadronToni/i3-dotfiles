#!/bin/bash

# A script to launch rofi with xrdb values

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

# Dirs
    ROFI_CONFIG="${HOME}/.config/rofi/"
    ROFI_THEMES="${HOME}/.config/rofi/themes/"
# Font
    fontSize=8
    font=$(xrdb -query | grep 'font-regular:'| awk '{print $2, $3; exit}')
    fontBold=$(xrdb -query | grep 'font-bold:'| awk '{print $2, $3; exit}')

# Colors, takes color variables from Xresources file
    foreground=$(xrdb -query | grep 'foreground:'| awk '{print $2; exit}')
    bag=$(xrdb -query | grep 'background:'| awk '{print $2; exit}')
    color0=$(xrdb -query | grep 'color0:'| awk '{print $2; exit}')
    color8=$(xrdb -query | grep 'color8:'| awk '{print $2; exit}')
    color1=$(xrdb -query | grep 'color1:'| awk '{print $2; exit}')
    color9=$(xrdb -query | grep 'color9:'| awk '{print $2; exit}')
    color2=$(xrdb -query | grep 'color2:'| awk '{print $2; exit}')
    color10=$(xrdb -query | grep 'color10:'| awk '{print $2; exit}')
    color3=$(xrdb -query | grep 'color3:'| awk '{print $2; exit}')
    color11=$(xrdb -query | grep 'color11:'| awk '{print $2; exit}')
    color4=$(xrdb -query | grep 'color4:'| awk '{print $2; exit}')
    color12=$(xrdb -query | grep 'color12:'| awk '{print $2; exit}')
    color5=$(xrdb -query | grep 'color5:'| awk '{print $2; exit}')
    color13=$(xrdb -query | grep 'color13:'| awk '{print $2; exit}')
    color6=$(xrdb -query | grep 'color6:'| awk '{print $2; exit}')
    color14=$(xrdb -query | grep 'color14:'| awk '{print $2; exit}')
    color7=$(xrdb -query | grep 'color7:'| awk '{print $2; exit}')
    color15=$(xrdb -query | grep 'color15:'| awk '{print $2; exit}')

# Metrics
    radius=6px
    mar=5px
    pad=15px
    inMar=20px
    inPad=10px

    csBorder=6px
    csPadHor=1%
    csPadBottom=6px

# ---------------------------------------------------------
# ECHOS
# ---------------------------------------------------------

# Writes the config file
echo "
configuration {
	combi-modi: \"drun,run\";
	sidebar-mode:   false;
    show-icons:     false;

//  Those change the \"modi\" names displayed 
	display-combi:        \"舘\";
	display-window:       \"舘\";
	display-run:          \" \";
	display-drun:         \"\";
	display-keys:         \"SHORT-KEYS\";
}

* {
    margin:                     0;
    spacing:                    0;
    border:                     0;
    scrollbar:                  false;
    text-color:                 ${foreground};
    background-color:           transparent;
    border-color:               ${bag};
  	font:                       \"${font} ${fontSize}\";
    highlight:                  bold underline ;

    /* Custom */
    defaultBg:                  ${bag};
    semitraBg:                  ${bag}bb;
    windowBg:                   ${bag}99;

    normal-normal-text:         ${foreground};
    normal-urgent-text:         ${color1};
    normal-active-text:         ${color2};
    selected-normal-text:       ${color3};
    selected-urgent-text:       @defaultBg;
    selected-active-text:       @defaultBg;
    selected-normal-background: @defaultBg;
    selected-urgent-background: ${color9};
    selected-active-background: ${color10};
}

#window {
    location:           center;
    anchor:             center;
    background-color:   @windowBg;
}


#mainbox {
    children:   [ inputbarBorder, listview, message ];
}


//  Inputbar  ----------------------------------------------

#inputbarBorder {
    margin:             ${mar} ${mar} ${mar} ${mar};
    orientation:        horizontal;
    expand:             false;
    children: [  dummy, inputbar, dummy ];
}
#inputbar {
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             true;
    children:   [ textbox-search, entry ];
}
#case-indicator {
    margin:             0 ${mar} 0 0;
}
#entry {
    expand:             true;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"${font} ${fontsize}\"; 
    str:                \"\";
    background-color:   @defaultBg;
    expand:             false;
}

#dummy {
    orientation:        horizontal;
    expand:             true;
}

//  Mode Switcher ------------------------------------------------
#mode-switcher {
    border-radius:      0 ${radius} ${radius} 0;
    background-color:   @semitraBg;
    expand:             false;
}
#button {
    padding:            0 ${pad} 0 ${pad};
  	font:               \"${font} 12\";
    text-color:         ${color3};
}
#button.selected {
    border-radius:      ${radius};
    text-color:         ${color3};
    background-color:   @defaultBg;
}

//  Listview    --------------------------------------------
listview {
    margin:             0 ${mar} ${mar} ${mar};
    border-radius:      ${radius};
    background-color:   @semitraBg;
}

#element {
    padding:            10px;
    border-radius:      ${radius};
}

#element.normal.normal {
    text-color:         @normal-normal-text;
}
#element.normal.urgent {
    text-color:         @normal-urgent-text;
}
#element.normal.active {
    text-color:         @normal-active-text;
}
#element.selected.normal {
    background-color:   @selected-normal-background;
    text-color:         @selected-normal-text;
}
#element.selected.urgent {
    background-color:   @selected-urgent-background;
    text-color:         @selected-urgent-text;
}
#element.selected.active {
    background-color:   @selected-active-background;
    text-color:         @selected-active-text;
}
#element.alternate.normal {
    text-color:         @normal-normal-text;
}
#element.alternate.urgent {
    text-color:         @normal-urgent-text;
}
#element.alternate.active {
    text-color:         @normal-active-text;
}

#message {
    margin:             ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
}

" > "${ROFI_CONFIG}config.rasi"

# Writes the apps theme file
echo "
configuration {
    show-icons:         true;
//    fake-transparency:  true;
//    fake-background:    \"background\";
}

* {
    windowBg:           ${bag}00;
}

#window {
    location:           center;
    anchor:             center;
    width:              50%;
}

#mainbox {
    children:   [ inputbarBorder, listview ];
}

//  Inputbar  ----------------------------------------------

#inputbarBorder {
    margin:             ${mar};
    orientation:        horizontal;
    expand:             false;
    children: [  dummy, inputbar, dummy ];
}
#inputbar {
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             true;
    children:   [ textbox-search, entry ];
}
#case-indicator {
    margin:             0 ${mar} 0 0;
}
#entry {
    expand:             true;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    str:                \"\";
    background-color:   @defaultBg;
    expand:             false;
}


//  Listview  ----------------------------------------------

#listview {
    lines:              1;
    columns:            5;
    margin:             0 ${mar} ${mar} ${mar}; 
    padding:            0;
    border-radius:      ${radius};
    expand:             false;
}

#element {
    orientation:        vertical;
}

#element-icon {
    size:               48px;
    padding:            10px;
}

#element-text {
    vertical-align:     0.5;
    horizontal-align:   0.5;
    expand:             true;
}


" > "${ROFI_THEMES}apps.rasi"

# Writes the apps alt theme file
echo "
configuration {
    show-icons:         true;
    fake-transparency:  true;
    fake-background:    \"background\";
}

* {
    windowBg:           ${bag}00;
}

#window {
    location:           north;
    anchor:             north;
    width:              100%;
}

#mainbox {
    orientation: horizontal;
    margin:             ${mar};
    children:   [ inputbar, listview ];
}

//  Inputbar  ----------------------------------------------

#inputbarBorder {
    orientation:        horizontal;
    expand:             false;
    children: [  dummy, inputbar, dummy ];
}
#inputbar {
    border-radius:      0;
    background-color:   @semitraBg;
    expand:             false;
    children:   [ textbox-search, entry ];
}
#case-indicator {
    margin:             0 ${mar} 0 0;
}
#entry {
    width:              15em;
    expand:             false;
    padding:            0 ${pad};
    vertical-align:     0.5;
}
#textbox-search {
    padding:            0 ${pad};
    border-radius:      0;
    font:               \"${font} ${fontsize}\"; 
    str:                \"\";
    background-color:   @defaultBg;
    vertical-align:     0.5;
    expand:             false;
}


//  Listview  ----------------------------------------------

#listview {
    layout: horizontal;
    margin:             0 0 0 ${mar}; 
    padding:            0;
    background-color:   transparent;
    border-radius:      0;
    expand:             true;
}

#element {
    padding:            7 12 7 0;
    spacing:            0;
    border-radius:      0;
}

#element.normal {
    background-color:   @semitraBg;
}

#element.alternate {
    background-color:   @semitraBg;
}

#element-icon {
    size:               16px;
    padding:            0 12 0 12;
} 

#element-text {
    vertical-align:     0.5;
    expand:             true;
    width:              150;
} 


" > "${ROFI_THEMES}appsalt.rasi"


# Writes the alternative theme file
echo "
/**
 * ROFI Dynamic Color Theme
 * User: KLR
 */

#window {
    fullscreen:         true;
    location:           center;
    anchor:             center;
    background-color:   @semitraBg;
    children: [ mainbox ];
}


#mainbox {
    margin:             0 35% 0 35%;
    children:   [ dummy, inputbar, listview, message, dummy ];
}

mainBorder {
}

//  Inputbar  ----------------------------------------------
#inputbar {
    margin:             ${mar} ${mar} 0 ${mar};
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:   [ textbox-search, entry ];
}
#entry {
    orientation:        vertical;
    width:              20em;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"FontAwesome ${fontSize}\"; 
    str:                \"\";
    text-color:         ${color5};
    background-color:   @defaultBg;
    expand:             false;
}

//  Listview    --------------------------------------------
#listview {
    margin:             ${mar} ${mar} 0 ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
    expand:             false;
}
#element {
    padding: 6px;
}

" > ${ROFI_THEMES}alt.rasi

# Writes the options theme file
echo "
configuration {
    fake-transparency:  true;
    fake-background:    \"background\";
}
* {
    font:               \"${font} 30\";
    windowBg:           ${bag}bb;
}

#window {
    fullscreen:         true;
    location:           center;
    anchor:             center;
    background-color:   @windowBg;
    children: [ dummy, mainbox, dummy ];
}

#mainbox {
    margin:             0;
    children:   [ textBorder, listview ];
}

#textBorder {
    orientation:        horizontal;
    margin:             0 0 ${mar} 0;
    border-radius:      ${radius};
    expand:             false;
    children:   [ textbox-title, dummy ];
}

#textbox-title {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"${font} ${fontSize}\"; 
    str:                \"\";
    background-color:   @defaultBg;
    expand:             false;
}

//  Listview    --------------------------------------------
#listview {
    margin:             0;
    columns:            100;
    lines:              1;
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
}

#element {
    orientation:        horizontal;
    padding:            45px;
    border-radius:      ${radius};
    expand:             true;
}

#element-text {
    horizontal-align:   0.5;
}

" > "${ROFI_THEMES}options.rasi"

# Writes the colorscheme theme file
echo "
/**
 * ROFI Dynamic Color Theme
 * User: KLR
 */

* {
    margin:                     0;
    spacing:                    0;
    border:                     0;
    scrollbar:                  false;
    text-color:                 ${foreground};
    background-color:           transparent;
  	font:                       \"${font} ${fontSize}\";
    highlight:                  bold underline ;

    /* Custom */
    defaultBg:                  ${bag};
    semitraBg:                  ${bag}70;
    windowBg:                   ${bag}50;

    normal-normal-text:         ${foreground};
    normal-urgent-text:         ${color1};
    normal-active-text:         ${color2};
    selected-normal-text:       ${color3};
    selected-urgent-text:       @defaultBg;
    selected-active-text:       @defaultBg;
    selected-normal-background: @defaultBg;
    selected-urgent-background: ${color9};
    selected-active-background: ${color10};
}

#window {
    fullscreen:         true;
    location:           center;
    anchor:             center;
    background-color:   @semitraBg;
    children: [ mainbox ];
}


#mainbox {
    margin:             0 20% 0 20%;
    children:   [ dummy, inputbarBorder, listview, message, csBorder, dummy ];
}

#inputbarBorder {
    margin:             0; 
    children: [ dummy, inputbar, dummy ];
}

//  Listview    --------------------------------------------
#listview {
    columns:            3;
    margin:             ${mar} ${mar} 0 ${mar};
    padding:            ${inPad};
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
}
#element {
    padding:            8px;
    border-radius:      ${radius};
    expand:             false;
}

// Color Scheme ----------------------------------
#csBorder {
    orientation:        horizontal;
    margin:             0 ${mar} ${mar} ${mar};
    padding:            0; 
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:           [ textbox-colors, textbox-color0, textbox-color8, textbox-color1, textbox-color9, textbox-color2, textbox-color10, textbox-color3, textbox-color11, textbox-color4, textbox-color12, textbox-color5, textbox-color13, textbox-color6, textbox-color14, textbox-color7, textbox-color15  ];
}
#textbox-colors {
    padding:            ${pad};
    font:               \"${fontBold} ${fontSize}\";
    str:                \"Color Scheme\";
    background-color:   ${bag};
}
#textbox-color0 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:               \"${fontBold} ${fontSize}\";
    str:                \"0\";
	text-color:   	${color0};
	border-color:   	${color0};
    expand:             false;
}
#textbox-color8 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
	font:               \"${fontBold} ${fontSize}\";
	str:                \"8\";
	text-color:   ${color8};
	border-color:   ${color8};
	expand:             false;
}
#textbox-color1 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:               \"${fontBold} ${fontSize}\";
    str:                \"1\";
    text-color:   ${color1};
    border-color:   ${color1};
	expand:             false;
}
#textbox-color9 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"9\";
    text-color:   ${color9};
    border-color:   ${color9};
	expand:         false;
}
#textbox-color2 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"2\";
    text-color:   ${color2};
    border-color:   ${color2};
	expand:         false;
}
#textbox-color10 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"10\";
    text-color:   ${color10};
    border-color:   ${color10};
	expand:         false;
}
#textbox-color3 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"3\";
    text-color:   ${color3};
    border-color:   ${color3};
	expand:         false;
}
#textbox-color11 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"11\";
    text-color:   ${color11};
    border-color:   ${color11};
	expand:         false;
}
#textbox-color4 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"4\";
    text-color:   ${color4};
    border-color:   ${color4};
	expand:         false;
}
#textbox-color12 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"12\";
    text-color:   ${color12};
    border-color:   ${color12};
	expand:         false;
}
#textbox-color5 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"5\";
    text-color:   ${color5};
    border-color:   ${color5};
	expand:         false;
}
#textbox-color13 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"13\";
    text-color:   ${color13};
    border-color:   ${color13};
	expand:         false;
}
#textbox-color6 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"6\";
    text-color:   ${color6};
    border-color:   ${color6};
	expand:         false;
}
#textbox-color14 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"14\";
    text-color:   ${color14};
    border-color:   ${color14};
	expand:         false;
}
#textbox-color7 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"7\";
    text-color:   ${color7};
    border-color:   ${color7};
	expand:         false;
}
#textbox-color15 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:         0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"15\";
    text-color:   ${color15};
    border-color:   ${color15};
	expand:         false;
}


" > ${ROFI_THEMES}colorscheme.rasi

