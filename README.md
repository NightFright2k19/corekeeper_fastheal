# FAST HEAL/EAT AUTOHOTKEY SCRIPT FOR CORE KEEPER

This is a small mod for the game <a href="https://store.steampowered.com/app/1621690/Core_Keeper" target= "_blank">**Core Keeper**</a> which adds three hotkeys to the game while it is loaded: "F" for healing, "G" for consuming food items and (as a bonus) "H" to quickly switch to a different off-hand item stored in the second row of the hotbar.<br><br>
Its basic concept is heavily inspired by the existing mod <a href="https://mod.io/g/corekeeper/m/bind4consumables#description" target= "_blank">**Bind4Consumables**</a> which is not working any more with latest versions of the game. The advantage of this script is that it will ALWAYS work, regardless of any game-related changes.<br><br>
Notes:<br>
- If you open the chat window, the hotkeys should not trigger. However, it is assumed the default chat window key ("Enter") is **not** altered.<br>
- For adding text in any other form, e.g. editing labels for signs or chests, it is recommended to temporarily pause the script via F1.<br><br>

**How to use:**<br>
- Activate the script (run **ck_fastheal.exe**) and launch the game.<br>
- Make sure "Borderless Window" mode is selected in the video options menu.<br>
- Place your primary weapon/tool in hotbar **slot 1** (first row).<br>
- Place your food/consumables in hotbar **slot 9** (first row).<br>
- Place your healing potions in hotbar **slot 0** (first row).<br>
- Place your alternate off-hand item in hotbar slot 1 (second row).<br>
- Main hotkeys (defaults):<br>
  **F**: Drink healing potion (respects potion cooldown of 5s)<br>
  **G**: Consume a food item<br>
  **H**: Switch between default/alternate off-hand item<br>
- Convenience hotkeys (defaults):<br>
  **F1**: Pause/resume script<br>
  **F2**: Reload script<br>
  **F3**: Exit script<br><br>

**How to recompile:**<br>
You may alter the script as you wish, e.g. in order to adjust hotkeys. You can do so by editing the script with a text editor. Both the script (ck_fastheal.ahk) and the icon file (ck_icon.ico) are included in the release ("Source" subdir).<br>
- Get <a href="https://www.autohotkey.com" target= "_blank">AutoHotkey</a><br>
- Get the <a href="https://github.com/AutoHotkey/Ahk2Exe" target= "_blank">AHK script compiler (Ahk2Exe)</a><br>
- Place Ahk2Exe.exe in your AutoHotkey folder (or wherever else you want), then launch it<br>
- Compilation setup:<br> 
"Source": Select the (edited) script, i.e. ck_fastheal.ahk<br>
"Custom icon": Select ck_icon.ico from this repository (optional)<br>
"Base File": Select your AutoHotkey executable<br>
"Compress exe": Select "(none)" (avoids false positives in AV apps)
