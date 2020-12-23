release=$1
echo $1 > version.txt
sudo apt install zip
git clone https://github.com/Hekili/hekili.git Hekili
cd Hekili
git checkout $release
sed -i 's/b.Keybinding:SetText( keybind )/b.Keybinding:SetText( keybind ) if (i == 1) then LFMUC("hekili:" .. keybind) end/' UI.lua
rm -rf .git*
cd ..
