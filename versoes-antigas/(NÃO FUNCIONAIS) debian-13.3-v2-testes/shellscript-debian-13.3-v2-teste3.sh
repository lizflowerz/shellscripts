echo "Shellscript de Configuração para o Debian 13.3 v2 por lizflowerz"
#teclado
#echo "Adicionando layout de teclado PT-BR..."
#gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'br')]"

#apps
#echo "Instalando aplicativos..."
sudo apt install curl git gtk2-engines-murrine flatpak libsass1 sassc vlc timeshift gnome-software-plugin-flatpak steam-devices -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.mattjakeman.ExtensionManager \
#io.github.kolunmi.Bazaar com.rafaelmardojai.Blanket org.pulseaudio.pavucontrol io.github.diegopvlk.Dosage \
#com.heroicgameslauncher.hgl io.itch.itch md.obsidian.Obsidian io.github.kriptolix.Poliedros \
#org.prismlauncher.PrismLauncher com.spotify.Client com.valvesoftware.Steam com.stremio.Stremio app.zen_browser.zen
mkdir ~/shellscript
curl "https://vencord.dev/download/vesktop/amd64/deb" -o ~/shellscript/vesktop.deb
sudo dpkg -i ~/shellscript/vesktop.deb

#extensões
#echo "Instalando extensões da Gnome Shell..."
#mkdir ~/shellscript/extensions
#curl https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v102.shell-extension.zip -o ~/shellscript/extensions/dashtodock.zip
#curl https://extensions.gnome.org/extension-data/VitalsCoreCoding.com.v73.shell-extension.zip -o ~/shellscript/extensions/vitals.zip
#curl https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v70.shell-extension.zip -o ~/shellscript/extensions/blurmyshell.zip
#curl https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v64.shell-extension.zip -o ~/shellscript/extensions/userthemes.zip
#curl https://extensions.gnome.org/extension-data/tilingshellferrarodomenico.com.v67.shell-extension.zip -o ~/shellscript/extensions/tilingshell.zip
#gnome-extensions install ~/shellscript/extensions/dashtodock.zip
#gnome-extensions install ~/shellscript/extensions/vitals.zip
#gnome-extensions install ~/shellscript/extensions/blurmyshell.zip
#gnome-extensions install ~/shellscript/extensions/userthemes.zip
#gnome-extensions install ~/shellscript/extensions/tilingshell.zip

#customizações
echo Aplicando customizações
mkdir .wallpaper
curl "https://www.celestegame.com/images/completes/complete-8.png" -o ~/.wallpaper/wallpaper.png
gsettings set org.gnome.desktop.background picture-uri file:///home/liz/.wallpaper/wallpaper.png
gsettings set org.gnome.desktop.background picture-uri-dark file:///home/liz/.wallpaper/wallpaper.png
#git clone "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git" ~/shellscript/Catppuccin-GTK-Theme
#bash ~/shellscript/Catppuccin-GTK-Theme/themes/install.sh -n 'Catppuccin-Mocha' -t mauve -c dark -s standard -l --tweaks float macos
#gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Mauve-Dark"
#sudo flatpak override --filesystem=$HOME/.themes
#flatpak override --user --filesystem=xdg-config/gtk-4.0
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt update
sudo apt install papirus-icon-theme -y
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
git clone "https://github.com/catppuccin/papirus-folders.git" ~/shellscript/papirus-folders
sudo cp -r ~/shellscript/papirus-folders/src/* /usr/share/icons/Papirus
curl "https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders" -o ~/shellscript/folderscript.sh
chmod +x ~/shellscript/folderscript.sh
bash ~/shellscript/folderscript.sh -C cat-mocha-mauve --theme Papirus
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

#kernel
#echo "Instalando kernel novo para compatibilidade do adaptador Wi-Fi..."
#cat > ~/shellscript/debian-backport.sources << EOF
#Types: deb deb-src
#URIs: http://deb.debian.org/debian
#Suites: trixie-backports
#Components: main
#Enabled: yes
#Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
#EOF
#sudo mv ~/shellscript/debian-backport.sources /etc/apt/sources.list.d
#sudo apt update -y
#sudo apt upgrade -y
#sudo apt install linux-image-6.16.12+deb13-amd64 -y
#echo "Removendo arquivos desnecessários..."
#sudo rm -r ~/shellscript
#echo "Pronto! Reinicie o sistema para todas as modificações terem efeito."
