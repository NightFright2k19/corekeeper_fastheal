#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; Hotkey config
HealKey   := "f"  ; Use healing potion (hotbar slot 0, first row)
FoodKey   := "g"  ; Consume food (hotbar slot 9, first row)
AltOffKey := "h"  ; Equip alternate off-hand item (hotbar slot 1, second row)

; State trackers for ingame chat and healing cooldown 
chatOpen := false
healCooldown := 0

; Game-specific hotkeys (only active when Core Keeper is in foreground)
#HotIf WinActive("ahk_exe CoreKeeper.exe")

; Check for opened chat window
$Enter::{
    global chatOpen
    chatOpen := !chatOpen
    Send "{Enter}"
}

; Check for closed chat window (with Escape)
Esc::{
    global chatOpen
    if (chatOpen) {
        chatOpen := false
    }
    Send "{Esc}"
}

; General function for hotkey usage
UseHotbarKey(key) {
    Send key
    Sleep 150
    Click "Right"
    Sleep 150
    Send "1"
}

; Heal key
HealAction(*) {
    global chatOpen, healCooldown
    if (chatOpen) {
        Send "{Text}" HealKey
        return
    }
    if (A_TickCount < healCooldown)
        return
    UseHotbarKey("0")
    healCooldown := A_TickCount + 5000
}

; Food key
FoodAction(*) {
    global chatOpen
    if (chatOpen) {
        Send "{Text}" FoodKey
        return
    }
    UseHotbarKey("9")
}

; Off-hand item swap key
AltOffAction(*) {
    Send "{LCtrl down}"
    Send "{WheelDown 1}"
    Send "{LCtrl up}"   
    Sleep 100
    Send "1"
    Sleep 100  
    Click "Right"
    Sleep 100
    Send "{LCtrl down}"
    Send "{WheelUp 1}"
    Send "{LCtrl up}"
    Sleep 100
    Send "1"
    Sleep 100
}

Hotkey(HealKey, HealAction)
Hotkey(FoodKey, FoodAction)
Hotkey(AltOffKey, AltOffAction)

; Convenience hotkeys
#SuspendExempt
F1::Suspend  ; Pause/resume script
F2::Reload   ; Reload script
F3::ExitApp  ; Close script
#SuspendExempt 0

#HotIf  ; End game-specific hotkeys


; Optional: Visual feedback (tray tip during cooldown phase)
/*
SetTimer(CheckCooldownFeedback, 500)

CheckCooldownFeedback() {
    global healCooldown
    if healCooldown > A_TickCount {
        remaining := Round((healCooldown - A_TickCount) / 1000, 1)
        ToolTip("Potion cooldown: " remaining "s")
        SetTimer(() => ToolTip(), -1000)
    }
}
*/

/*
"FAST HEAL" / "SWITCH OFF-HAND" HOTKEYS FOR CORE KEEPER

This script adds two hotkeys (defaults: f, g) to quickly access healing potions and food items.
Another hotkey (default: h) allows to quickly switch to an alternate off-hand item on demand.

Instructions:
1. Activate the script and launch the game.
2. Make sure "Borderless Window" mode is selected in the video options menu.
3. Place your primary weapon/tool in hotbar slot 1 (first row).
4. Place your food/consumables in hotbar slot 9 (first row).
5. Place your healing potions in hotbar slot 0 (first row).
6. Place your alternate off-hand item in hotbar slot 1 (second row).
7. Main hotkeys:
   - F (default): Drink healing potion (respects potion cooldown of 5s)
   - G (default): Consume a food item
   - H (default): Switch between default/alternate off-hand item
8. Convenience hotkeys:
   - F1: Pause/resume script
   - F2: Reload script
   - F3: Exit script
*/