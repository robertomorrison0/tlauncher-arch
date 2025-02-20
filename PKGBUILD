_pkgname=tlauncher

pkgname="${_pkgname}"
pkgrel=1
pkgdesc="The Launcher for Minecraft"
arch=('x86_64')
url="https://tlauncher.org"
license=('custom')
# makedepends=('7zip')
depends=('jdk-openjdk')
options=(!strip)
pkgver=1.13

source_x86_64=("${url}/jar" "${pkgname}.png::https://tlauncher.org/favicon-196x196.png" "${pkgname}.desktop" "${pkgname}_startup.desktop" "${pkgname}")
sha256sums_x86_64=('SKIP'
                   'f73ebca88c29fd48562a40c5fafbfcc149b4d4f02fafe4a4bca8fda6b3e35b2c'
                   '028ad46fb44fcffeee790e65263ce060fda7a0d17a4b12c9e7dde7f5c0df08fd'
                   '09fc501cd6905adf0cad715130eb6020b2c9d5b30bd4c9da8aad4f6eff92ddad'
                   'a3c1e3379628db705dd3bfa89e040ccbed078d827bb56a8177c056822164f236')

pkgver() {
    DOWNLOAD_NAME=$(curl -sIkL https://tlauncher.org/jar | sed -r '/filename=/!d;s/.*filename=(.*)$/\1/')
    printf "1.%.*s" 2 $(echo "${DOWNLOAD_NAME}" | sed -r 's|^.[a-zA-Z]+.v([0-9.]+).zip.|\1|g')
}

prepare() {
    chmod +x "${srcdir}/TLauncher.jar"
    chmod +x "${pkgname}"
}


package() {
    install -Dm755 "${srcdir}/TLauncher.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Installing Desktop files
    # (for the loading screen and the actual program as the icon won't work otherwise)
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "${srcdir}/${_pkgname}_startup.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}_startup.desktop"

    # Installing Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
