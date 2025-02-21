_pkgname=tlauncher

pkgname="${_pkgname}"
pkgrel=1
pkgdesc="The Launcher for Minecraft"
arch=('x86_64')
url="https://tlauncher.org"
license=('custom')
makedepends=('meson' 'ninja')
depends=('jdk-openjdk')
options=(!strip)
pkgver=1.13

source_x86_64=("${url}/jar" "${pkgname}.png::${url}/favicon-196x196.png"
"minecraft.png::https://ia800402.us.archive.org/0/items/minecraft-vector-icons/Minecraft_2009_icon.png"
"${pkgname}.desktop"
"${pkgname}_minecraft.desktop"
"${pkgname}"
"meson.build"
"set_wm_class.c::https://gist.githubusercontent.com/tgr/eae411cefde08cbed5c59d4f51ddb062/raw/a96b602639b198646a7912df5b70669ac97ead33/set_wm_class.c"
"set_window_class.sh")

sha256sums_x86_64=('SKIP'
                   'f73ebca88c29fd48562a40c5fafbfcc149b4d4f02fafe4a4bca8fda6b3e35b2c'
                   '959f47cbd60acc7fc009b39fc7ba51f201433e9a42779ce2eff534bc12d91bba'
                   'e980518dbb826c017405067868e53ff64bdad72dc99def818bec98bf2df600df'
                   '844d05299db5675e06af8dffd227566c6650be4f551f08ce13b5d5466b01cbfe'
                   'c9605848bdefcc1ac9dcf6a583916e90364be576f185ffb1643e4ae344950ece'
                   'd94e9d513f81e068b39d86e2e28873779ff7b18d746572c36f5ecc71293c423d'
                   '73a85052fa4071a9a240b8770e78bb2ff7b9793205af6916243a008b515a84e9'
                   'd54f0a0c3741c7065c508970e4b3adf4ba56fbca8b3f8b07157f643bc9201860')

pkgver() {
    DOWNLOAD_NAME=$(curl -sIkL https://tlauncher.org/jar | sed -r '/filename=/!d;s/.*filename=(.*)$/\1/')
    printf "1.%.*s" 2 $(echo "${DOWNLOAD_NAME}" | sed -r 's|^.[a-zA-Z]+.v([0-9.]+).zip.|\1|g')
}

prepare() {
    chmod +x "${srcdir}/TLauncher.jar"
    chmod +x "${pkgname}"
    chmod +x "set_window_class.sh"
}

build()
{
    meson setup --prefix="/opt" build
    ninja -C build
}


package() {
    # meson install -C build --destdir "${pkgdir}/"

    install -Dm755 "${srcdir}/TLauncher.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Installing Desktop files
    # (for the loading screen and the actual program as the icon won't work otherwise)
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${srcdir}/${_pkgname}_minecraft.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}_minecraft.desktop"

    # Installing Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp "${srcdir}/minecraft.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    install -dm755 "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "${srcdir}/build/set_wm_class" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "${srcdir}/set_window_class.sh" "${pkgdir}/opt/${pkgname}/"

    # install -Dm755 "${pkgdir}/opt/${pkgname}/"
}
