release=$1
wget -O hekili-origin.zip https://github.com/Hekili/hekili/releases/download/$release/Hekili-$release.zip
unzip hekili-origin.zip -d hekili-origin
cd hekili-origin/Hekili
sed -i 's/b.Keybinding:SetText( keybind )/b.Keybinding:SetText( keybind ) if (i == 1) then local c_spell = UnitChannelInfo("player") if c_spell then LFMUC("wait") else info=C_BattleNet.GetAccountInfoByID(select(3, BNGetInfo())) LFMUC("hekili:" .. keybind .. ":tag:" .. info.battleTag .. ":hekili:" .. keybind .. ":tag:" .. info.battleTag .. ":hekili:" .. keybind .. ":tag:" .. info.battleTag) end end/' UI.lua
cd ../..
echo "$1" > version.txt
git config user.name Sneezry
git config user.email lizhe@lizhe.org
git add version.txt
git commit -m "$1"
git push
