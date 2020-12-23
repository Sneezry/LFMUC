release=$1
wget -O hekili-origin.zip https://github.com/Hekili/hekili/releases/download/$release/Hekili-$release.zip
unzip hekili-origin.zip
cd hekili-origin/Hekili
sed -i 's/b.Keybinding:SetText( keybind )/b.Keybinding:SetText( keybind ) if (i == 1) then LFMUC("hekili:" .. keybind) end/' UI.lua
rm -rf .git*
cd ../..
echo "$1" > version.txt
git config user.name Sneezry
git config user.email lizhe@lizhe.org
git add version.txt
git commit -m "$1"
git push
