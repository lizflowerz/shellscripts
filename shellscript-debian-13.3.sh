echo Iniciando script...
#teclado
echo Adicionando layout de teclado PT-BR...
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'br')]"

#apps
echo Instalando aplicativos...
sudo apt install curl git gtk2-engines-murrine flatpak libsass1 sassc vlc timeshift -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub app.zen_browser.zen com.valvesoftware.Steam com.spotify.Client io.github.kolunmi.Bazaar\
 com.stremio.Stremio md.obsidian.Obsidian io.github.realmazharhussain.GdmSettings com.rafaelmardojai.Blanket\
 io.github.diegopvlk.Dosage io.itch.itch org.prismlauncher.PrismLauncher -y
curl -o vesktop.deb "https://vencord.dev/download/vesktop/amd64/deb"
curl -o balenaetcher.deb "https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher_2.1.4_amd64.deb"
sudo dpkg -i vesktop.deb -y
sudo dpkg -i balenaetcher.deb -y
rm ~/*.deb

#extensões
echo Instalando extensões da Gnome-Shell
mkdir extensions
curl https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v102.shell-extension.zip -o ~/extensions/dashtodock.zip
curl https://extensions.gnome.org/extension-data/VitalsCoreCoding.com.v73.shell-extension.zip -o ~/extensions/vitals.zip
curl https://extensions.gnome.org/extension-data/trayIconsReloadedselfmade.pl.v32.shell-extension.zip -o ~/extensions/trayiconsreloaded.zip
curl https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v70.shell-extension.zip -o ~/extensions/blurmyshell.zip
curl https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v64.shell-extension.zip -o ~/extensions/userthemes.zip
curl https://extensions.gnome.org/extension-data/tilingshellferrarodomenico.com.v67.shell-extension.zip -o ~/extensions/tilingshell.zip
gnome-extensions install ~/extensions/dashtodock.zip
gnome-extensions install ~/extensions/vitals.zip
gnome-extensions install ~/extensions/trayiconsreloaded.zip
gnome-extensions install ~/extensions/blurmyshell.zip
gnome-extensions install ~/extensions/userthemes.zip
gnome-extensions install ~/extensions/tilingshell.zip
rm -r ~/extensions

#customizações
echo Modificando wallpaper...
curl -o wallpaper.png "https://www.celestegame.com/images/completes/complete-8.png"
mv wallpaper.png ~/Imagens
gsettings set org.gnome.desktop.background picture-uri file:///home/liz/Imagens/wallpaper.png
echo Instalando tema da shell...
git clone "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git"
bash /home/liz/Catppuccin-GTK-Theme/themes/install.sh -n 'Catppuccin-Mocha' -t mauve -c dark -s standard -l\
 --tweaks float macos
rm -r ~/Catppuccin-GTK-Theme
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Mauve-Dark"
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=xdg-config/gtk-4.0
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt-get update
echo Instalando tema de ícones...
sudo apt-get install papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
git clone https://github.com/catppuccin/papirus-folders.git
sudo cp -r ~/papirus-folders/src/* /usr/share/icons/Papirus
curl -o folderscript.sh "https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders"\
 && chmod +x folderscript.sh
bash folderscript.sh -C cat-mocha-mauve --theme Papirus
rm folderscript.sh
rm -r papirus-folders
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

#kernel
touch debian-backports.sources
echo "Types: deb deb-src" >> debian-backports.sources
echo "URIs: http://deb.debian.org/debian" >> debian-backports.sources
echo "Suites: trixie-backports" >> debian-backports.sources
echo "Components: main" >> debian-backports.sources
echo "Enabled: yes" >> debian-backports.sources
echo "Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg" >> debian-backports.sources
sudo mv debian-backports.sources /etc/apt/sources.list.d
sudo apt update -y
sudo apt upgrade -y
echo Instalando o kernel...
sudo apt install linux-image-6.16.12+deb13-amd64 -y
echo "Pronto! Reinicie o sistema para todas as modificações terem efeito."
