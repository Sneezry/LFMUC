release=$1
wget -O hekili-origin.zip https://github.com/Hekili/hekili/releases/download/$release/Hekili-$release.zip
unzip hekili-origin.zip -d hekili-origin
cd hekili-origin/Hekili
sed -i 's/b.Keybinding:SetText( keybind )/b.Keybinding:SetText( keybind ) if (i == 1 and LFHENABLED) then local c_spell = UnitChannelInfo("player") if c_spell and not LFMSSKIP then LFMUC("") else info=(UnitGUID("player") and C_BattleNet.GetAccountInfoByGUID(UnitGUID("player")) or nil) LFMUC("key:" .. keybind .. ":tag:" .. (info and info.battleTag or "NPE#0404") .. ":key:" .. keybind .. ":tag:" .. (info and info.battleTag or "NPE#0404") .. ":key:" .. keybind .. ":tag:" .. (info and info.battleTag or "NPE#0404")) end end/' UI.lua
cd ../..
echo "$1" > version.txt
git config user.name Sneezry
git config user.email lizhe@lizhe.org
git add version.txt
git commit -m "$1"
git push
