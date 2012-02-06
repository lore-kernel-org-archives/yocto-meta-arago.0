Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id A1D8D52079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 04:25:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY00023EYA3JI0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 05 Feb 2012 22:25:24 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 61BCD203C6; Sun,
	05 Feb 2012 23:25:22 -0500 (EST)
Date: Sun, 05 Feb 2012 23:25:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120206042522.GC11841@denix.org>
References: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
	<1328040714-29036-5-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328040714-29036-5-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/4] matrix-gui: update to latest version
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 04:25:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 31, 2012 at 02:11:54PM -0600, Chase Maupin wrote:
> * Update to the latest version of matrix-gui and the matrix-gui
>   supporting recipes.  These use a git repository instead of
>   tarballs for the submenu and demo description files.
> * This support was ported from the arago project overlay
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> new file mode 100644
> index 0000000..c1e79b1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "3D demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +S = ${WORKDIR}/git/3d_apps
> +
> +# Make sure 3D submenu has been installed and app images has been installed
> +
> +# TODO: in the future we may want to consider putting this into the libgles
> +#       recipe directly.  Requires broad acceptance of matrix v2 though due
> +#       to the matrix-gui-submenus-3d dependency.  So if matrix v2 moves
> +#       into the same layer as libgles this may be acceptable, or perhaps
> +#       we can use an RRECOMMENDS instead.
> +RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> new file mode 100644
> index 0000000..c5d81c3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -0,0 +1,10 @@
> +LICENSE = "CC-BY-SA"
> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> +
> +SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "27e8eb76f4a405c123a9f816b1b389e20b06f30c"
> +BRANCH = "master"
> +INC_PR = "r0"
> +
> +# Pull in the base package for installing matrix applications
> +require matrix-gui-apps.inc
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
> new file mode 100644
> index 0000000..311d3a7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Image package for Matrix GUI v2 Applications"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +require matrix-gui-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = "${WORKDIR}/git/images"
> +
> +do_install(){
> +    install -d ${D}${MATRIX_APP_DIR}
> +    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
> +}
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
> new file mode 100644
> index 0000000..9449c06
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
> @@ -0,0 +1,40 @@
> +require matrix-gui-paths.inc
> +
> +MATRIX_FILES_DIR ?= ${S}
> +
> +# Append a generic function to the do_install step that will look in the
> +# MATRIX_FILES_DIR for .desktop files and then:
> +#   1.  Install all non-script files into the MATRIX_APP_DIR
> +#   2.  Install all script files into ${bindir}
> +do_install_append(){
> +    cd ${MATRIX_FILES_DIR}
> +    applist=`find . -name "*.desktop"`
> +
> +    for app in $applist
> +    do
> +        appdir=`dirname $app`
> +        install -d ${D}${MATRIX_APP_DIR}/$appdir
> +
> +        # Get the non-script files which are the matrix metadata
> +        matrix_apps=`find $appdir -type f ! -name "*\.sh"`
> +        for m in $matrix_apps
> +        do
> +            install -m 0644 ${MATRIX_FILES_DIR}/$m ${D}${MATRIX_APP_DIR}/$appdir/
> +        done
> +
> +        # Put the script files as executables in ${bindir}
> +        scripts=`find $appdir -type f -name "*\.sh"`
> +        for s in $scripts
> +        do
> +            if [ ! -d ${D}/${bindir} ]
> +            then
> +                install -d ${D}${bindir}
> +            fi
> +            install -m 0755 ${MATRIX_FILES_DIR}/$s ${D}${bindir}/
> +        done
> +    done
> +
> +    # Go back to the directory we started from in case there are
> +    # other appends.
> +    cd -
> +}
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
> new file mode 100644
> index 0000000..8e84753
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Arm Benchmarks Applications for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/arm_apps
> +
> +# Make sure arm submenu and app images has been installed
> +RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-arm arm-benchmarks lmbench
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
> new file mode 100644
> index 0000000..698b3d7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Camera loopback application for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +S = ${WORKDIR}/git/cameraloopback_apps
> +
> +# Make sure loopback application is compiled and app images has been installed
> +RDEPENDS +=  "matrix-gui-apps-images av-examples"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +
> +
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
> new file mode 100644
> index 0000000..282bd9c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "Clock setting descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/clocks_apps
> +
> +# Make sure power submenu and app images has been installed
> +RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-power
> +
> +# Break out the individual files into separate packages.  That way only the
> +# clocks supported for each device can be installed.  Prepend the list so
> +# that we can get the files in ${bindir} first
> +PACKAGES =+ "${PN}-300mhz ${PN}-600mhz ${PN}-800mhz ${PN}-1ghz"
> +
> +# Split the matrix files by clock
> +FILES_${PN}-300mhz += "${MATRIX_APP_DIR}/power_set_300mhz/*"
> +FILES_${PN}-600mhz += "${MATRIX_APP_DIR}/power_set_600mhz/*"
> +FILES_${PN}-800mhz += "${MATRIX_APP_DIR}/power_set_800mhz/*"
> +FILES_${PN}-1ghz += "${MATRIX_APP_DIR}/power_set_1ghz/*"
> +
> +# Split the ${bindir} files by clock
> +FILES_${PN}-300mhz += "${bindir}/setopp2.sh"
> +FILES_${PN}-600mhz += "${bindir}/setopp3.sh"
> +FILES_${PN}-800mhz += "${bindir}/setopp4.sh"
> +FILES_${PN}-1ghz += "${bindir}/setopp1.sh"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> new file mode 100644
> index 0000000..6ac9d45
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Cryptography demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/cryptos_apps
> +
> +# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
> +RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
> new file mode 100644
> index 0000000..963e906
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Display control descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/displaycontrol_apps
> +
> +# Make sure display submenu and app images has been installed
> +RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-display
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
> new file mode 100644
> index 0000000..bbfefd3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Multimedia demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/multimedia_apps
> +
> +# Make sure multimedia submenu and app images has been installed
> +RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-multimedia
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> new file mode 100644
> index 0000000..971c23b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Oprofile demo applications for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/oprofile_apps
> +
> +# Make sure profiling submenu and app images  has been installed
> +# Include am-sysinfo because that package has the sample
> +# executables for profiling.
> +RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-oprofile oprofile am-sysinfo"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc
> new file mode 100644
> index 0000000..8c6e568
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc
> @@ -0,0 +1,3 @@
> +export MATRIX_BASE_DIR = "${datadir}/matrix-gui-2.0"
> +export MATRIX_WEB_DIR = "${MATRIX_BASE_DIR}"
> +export MATRIX_APP_DIR = "${MATRIX_WEB_DIR}/apps"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> new file mode 100644
> index 0000000..a9ae00b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Power management demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/power_apps
> +
> +# Make sure power submenu and app images has been installed
> +RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-power
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
> new file mode 100644
> index 0000000..d4feca4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "PRU demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/pru_apps
> +
> +# Make sure pru submenu and app images has been installed
> +RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-pru
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
> new file mode 100644
> index 0000000..36b805d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Qt4 demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/qt4_apps
> +
> +# Make sure qt4 submenu and app images has been installed
> +RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-qt4
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
> new file mode 100644
> index 0000000..b93437a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Settings demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/settings_apps
> +
> +# Make sure setting submenu and app images has been installed
> +RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-settings am-sysinfo
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> new file mode 100644
> index 0000000..e391143
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> @@ -0,0 +1,50 @@
> +DESCRIPTION = "Submenu packages for Matrix GUI v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +require matrix-gui-paths.inc
> +
> +# This package does not use a subdirectory as ${S} so we need to
> +# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> +
> +PR = "${INC_PR}.8"
> +
> +# These packages make submenus in matrix and are not architecture specific
> +inherit allarch
> +
> +S = "${WORKDIR}/git"
> +
> +# List of submenus to build packages for
> +SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu"
> +
> +do_install(){
> +    install -d ${D}${MATRIX_APP_DIR}
> +
> +    for x in ${SUBMENUS}
> +    do
> +        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
> +    done
> +}
> +
> +PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
> +
> +# Make sure app images has been installed
> +RDEPENDS += matrix-gui-apps-images
> +
> +# Add the files for each submenu package
> +FILES_${PN}-arm = "${MATRIX_APP_DIR}/arm_submenu/*"
> +FILES_${PN}-3d = "${MATRIX_APP_DIR}/3d_submenu/*"
> +FILES_${PN}-cryptos = "${MATRIX_APP_DIR}/cryptos_submenu/*"
> +FILES_${PN}-display = "${MATRIX_APP_DIR}/display_submenu/*"
> +FILES_${PN}-ethernet = "${MATRIX_APP_DIR}/ethernet_submenu/*"
> +FILES_${PN}-multimedia = "${MATRIX_APP_DIR}/multimedia_submenu/*"
> +FILES_${PN}-power = "${MATRIX_APP_DIR}/power_submenu/*"
> +FILES_${PN}-pru = "${MATRIX_APP_DIR}/pru_submenu/*"
> +FILES_${PN}-qt4 = "${MATRIX_APP_DIR}/qt4_submenu/*"
> +FILES_${PN}-settings = "${MATRIX_APP_DIR}/settings_submenu/*"
> +FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb_submenu/*"
> +FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
> +FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
> new file mode 100644
> index 0000000..3801358
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "USB demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/usb_apps
> +
> +# Make sure usb submenu and app images has been installed
> +RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-usb bonnie++"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
> new file mode 100644
> index 0000000..687c9f8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "V4l2 demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/v4l2_apps
> +
> +# Make sure display submenu and app images has been installed
> +RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-display
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
> new file mode 100644
> index 0000000..bc02c25
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Wifi demo descriptions for Matrix v2"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +LICENSE = "CC-BY-SA"
> +PRIORITY = "optional"

No PRIORITY, please.

> +require matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = ${WORKDIR}/git/wifi_apps
> +
> +# Make sure wifi submenu and app images has been installed
> +RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-wifi
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> new file mode 100644
> index 0000000..349da53
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -0,0 +1,87 @@
> +#! /bin/sh
> +
> +matrixgui="/usr/bin/matrix_browser"
> +ROTATION=__MATRIX_ROT__
> +GUI_OPTS="-qws $ROTATION http://localhost:8080/"
> +PIDFILE="/var/run/matrix-gui-2.0.pid"
> +
> +test -x "$matrixgui" || exit 0
> +
> +export TSLIB_TSDEVICE=/dev/input/touchscreen0
> +export QWS_MOUSE_PROTO=Auto
> +tsfile=/etc/pointercal
> +
> +case "$1" in
> +  start)
> +    chvt 4
> +
> +    # ARM9 devices get a lot of alignment trap errors with the current
> +    # version of Qt (4.7.2) that we use.  The printing of these messages
> +    # is causing a severe slowdown with matrix and other Qt applications
> +    # that matrix launches.  The root cause is under investigation and an
> +    # issue is being filed in the Qt JIRA tracker.  For now using the
> +    # following command will do a software fixup of the alignment trap errors
> +    # in the kernel.  This should have no impact on cortex-A8 devices.
> +    echo 2 > /proc/cpu/alignment
> +
> +    # Do not try to calibrate the touchscreen if it doesn't exist.
> +    if [ -e /dev/input/touchscreen0 ]
> +    then
> +        export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> +        # Check if the SD card is mounted and the first partition is
> +        # vfat.  If so let's write the pointercal file there so that if
> +        # someone messes up calibration they can just delete the file from
> +        # any system and reboot the board.
> +        mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> +        if [ "$?" = "0" ]
> +        then
> +            tsfile=/media/mmcblk0p1/pointercal
> +            export TSLIB_CALIBFILE=$tsfile
> +        fi
> +
> +        if [ ! -f $tsfile ] ; then
> +            echo -n "Calibrating touchscreen (first time only)"
> +            ts_calibrate
> +            echo "."
> +            # If we create a pointercal file and it was not in /etc/pointercal
> +            # let's copy it there as well if it does not already exist.
> +            if [ ! -f /etc/pointercal -a -f $tsfile ]
> +            then
> +                cp $tsfile /etc/pointercal
> +            fi
> +        fi
> +    fi
> +
> +    #Clear out the the tmp and lock directory
> +    cd __MATRIX_WEB_DIR__
> +    rm -rf tmp/*
> +    rm -rf lock/*
> +    cd -
> +
> +	if [ -e $PIDFILE ]; then
> +      PIDDIR=/proc/$(cat $PIDFILE)
> +      if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${matrixgui}" ]; then
> +        echo "$DESC already started; not starting."
> +      else
> +        echo "Removing stale PID file $PIDFILE."
> +        rm -f $PIDFILE
> +      fi
> +    fi
> +
> +    echo -n "Starting Matrix GUI application"
> +    start-stop-daemon --start --quiet --background --exec $matrixgui -- $GUI_OPTS
> +	pidof ${matrixgui} > $PIDFILE
> +    echo "."
> +    ;;
> +
> +  stop)
> +    echo -n "Stopping Matrix GUI application"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-2.0.pid
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/matrix-gui-2.0 {start|stop}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini b/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
> new file mode 100644
> index 0000000..900a86b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
> @@ -0,0 +1,1342 @@
> +[PHP]
> +
> +;;;;;;;;;;;;;;;;;;;
> +; About php.ini   ;
> +;;;;;;;;;;;;;;;;;;;
> +; This file controls many aspects of PHP's behavior.  In order for PHP to
> +; read it, it must be named 'php.ini'.  PHP looks for it in the current
> +; working directory, in the path designated by the environment variable
> +; PHPRC, and in the path that was defined in compile time (in that order).
> +; Under Windows, the compile-time path is the Windows directory.  The
> +; path in which the php.ini file is looked for can be overridden using
> +; the -c argument in command line mode.
> +;
> +; The syntax of the file is extremely simple.  Whitespace and Lines
> +; beginning with a semicolon are silently ignored (as you probably guessed).
> +; Section headers (e.g. [Foo]) are also silently ignored, even though
> +; they might mean something in the future.
> +;
> +; Directives are specified using the following syntax:
> +; directive = value
> +; Directive names are *case sensitive* - foo=bar is different from FOO=bar.
> +;
> +; The value can be a string, a number, a PHP constant (e.g. E_ALL or M_PI), one
> +; of the INI constants (On, Off, True, False, Yes, No and None) or an expression
> +; (e.g. E_ALL & ~E_NOTICE), or a quoted string ("foo").
> +;
> +; Expressions in the INI file are limited to bitwise operators and parentheses:
> +; |        bitwise OR
> +; &        bitwise AND
> +; ~        bitwise NOT
> +; !        boolean NOT
> +;
> +; Boolean flags can be turned on using the values 1, On, True or Yes.
> +; They can be turned off using the values 0, Off, False or No.
> +;
> +; An empty string can be denoted by simply not writing anything after the equal
> +; sign, or by using the None keyword:
> +;
> +;  foo =         ; sets foo to an empty string
> +;  foo = none    ; sets foo to an empty string
> +;  foo = "none"  ; sets foo to the string 'none'
> +;
> +; If you use constants in your value, and these constants belong to a
> +; dynamically loaded extension (either a PHP extension or a Zend extension),
> +; you may only use these constants *after* the line that loads the extension.
> +;
> +;
> +;;;;;;;;;;;;;;;;;;;
> +; About this file ;
> +;;;;;;;;;;;;;;;;;;;
> +; This is the recommended, PHP 5-style version of the php.ini-dist file.  It
> +; sets some non standard settings, that make PHP more efficient, more secure,
> +; and encourage cleaner coding.
> +;
> +; The price is that with these settings, PHP may be incompatible with some
> +; applications, and sometimes, more difficult to develop with.  Using this
> +; file is warmly recommended for production sites.  As all of the changes from
> +; the standard settings are thoroughly documented, you can go over each one,
> +; and decide whether you want to use it or not.
> +;
> +; For general information about the php.ini file, please consult the php.ini-dist
> +; file, included in your PHP distribution.
> +;
> +; This file is different from the php.ini-dist file in the fact that it features
> +; different values for several directives, in order to improve performance, while
> +; possibly breaking compatibility with the standard out-of-the-box behavior of
> +; PHP.  Please make sure you read what's different, and modify your scripts
> +; accordingly, if you decide to use this file instead.
> +;
> +; - register_long_arrays = Off     [Performance]
> +;     Disables registration of the older (and deprecated) long predefined array
> +;     variables ($HTTP_*_VARS).  Instead, use the superglobals that were
> +;     introduced in PHP 4.1.0
> +; - display_errors = Off           [Security]
> +;     With this directive set to off, errors that occur during the execution of
> +;     scripts will no longer be displayed as a part of the script output, and thus,
> +;     will no longer be exposed to remote users.  With some errors, the error message
> +;     content may expose information about your script, web server, or database
> +;     server that may be exploitable for hacking.  Production sites should have this
> +;     directive set to off.
> +; - log_errors = On                [Security]
> +;     This directive complements the above one.  Any errors that occur during the
> +;     execution of your script will be logged (typically, to your server's error log,
> +;     but can be configured in several ways).  Along with setting display_errors to off,
> +;     this setup gives you the ability to fully understand what may have gone wrong,
> +;     without exposing any sensitive information to remote users.
> +; - output_buffering = 4096        [Performance]
> +;     Set a 4KB output buffer.  Enabling output buffering typically results in less
> +;     writes, and sometimes less packets sent on the wire, which can often lead to
> +;     better performance.  The gain this directive actually yields greatly depends
> +;     on which Web server you're working with, and what kind of scripts you're using.
> +; - register_argc_argv = Off       [Performance]
> +;     Disables registration of the somewhat redundant $argv and $argc global
> +;     variables.
> +; - magic_quotes_gpc = Off         [Performance]
> +;     Input data is no longer escaped with slashes so that it can be sent into
> +;     SQL databases without further manipulation.  Instead, you should use the
> +;     database vendor specific escape string function on each input element you
> +;     wish to send to a database.
> +; - variables_order = "GPCS"       [Performance]
> +;     The environment variables are not hashed into the $_ENV.  To access
> +;     environment variables, you can use getenv() instead.
> +; - error_reporting = E_ALL        [Code Cleanliness, Security(?)]
> +;     By default, PHP suppresses errors of type E_NOTICE.  These error messages
> +;     are emitted for non-critical errors, but that could be a symptom of a bigger
> +;     problem.  Most notably, this will cause error messages about the use
> +;     of uninitialized variables to be displayed.
> +; - allow_call_time_pass_reference = Off     [Code cleanliness]
> +;     It's not possible to decide to force a variable to be passed by reference
> +;     when calling a function.  The PHP 4 style to do this is by making the
> +;     function require the relevant argument by reference.
> +; - short_open_tag = Off           [Portability]
> +;     Using short tags is discouraged when developing code meant for redistribution
> +;     since short tags may not be supported on the target server.
> +
> +;;;;;;;;;;;;;;;;;;;;
> +; Language Options ;
> +;;;;;;;;;;;;;;;;;;;;
> +
> +; Enable the PHP scripting language engine under Apache.
> +engine = On
> +
> +; Enable compatibility mode with Zend Engine 1 (PHP 4.x)
> +zend.ze1_compatibility_mode = Off
> +
> +; Allow the <? tag.  Otherwise, only <?php and <script> tags are recognized.
> +; NOTE: Using short tags should be avoided when developing applications or
> +; libraries that are meant for redistribution, or deployment on PHP
> +; servers which are not under your control, because short tags may not
> +; be supported on the target server. For portable, redistributable code,
> +; be sure not to use short tags.
> +short_open_tag = Off
> +
> +; Allow ASP-style <% %> tags.
> +asp_tags = Off
> +
> +; The number of significant digits displayed in floating point numbers.
> +precision    =  14
> +
> +; Enforce year 2000 compliance (will cause problems with non-compliant browsers)
> +y2k_compliance = On
> +
> +; Output buffering allows you to send header lines (including cookies) even
> +; after you send body content, at the price of slowing PHP's output layer a
> +; bit.  You can enable output buffering during runtime by calling the output
> +; buffering functions.  You can also enable output buffering for all files by
> +; setting this directive to On.  If you wish to limit the size of the buffer
> +; to a certain size - you can use a maximum number of bytes instead of 'On', as
> +; a value for this directive (e.g., output_buffering=4096).
> +output_buffering = 4096
> +
> +; You can redirect all of the output of your scripts to a function.  For
> +; example, if you set output_handler to "mb_output_handler", character
> +; encoding will be transparently converted to the specified encoding.
> +; Setting any output handler automatically turns on output buffering.
> +; Note: People who wrote portable scripts should not depend on this ini
> +;       directive. Instead, explicitly set the output handler using ob_start().
> +;       Using this ini directive may cause problems unless you know what script
> +;       is doing.
> +; Note: You cannot use both "mb_output_handler" with "ob_iconv_handler"
> +;       and you cannot use both "ob_gzhandler" and "zlib.output_compression".
> +; Note: output_handler must be empty if this is set 'On' !!!!
> +;       Instead you must use zlib.output_handler.
> +;output_handler =
> +
> +; Transparent output compression using the zlib library
> +; Valid values for this option are 'off', 'on', or a specific buffer size
> +; to be used for compression (default is 4KB)
> +; Note: Resulting chunk size may vary due to nature of compression. PHP
> +;       outputs chunks that are few hundreds bytes each as a result of
> +;       compression. If you prefer a larger chunk size for better
> +;       performance, enable output_buffering in addition.
> +; Note: You need to use zlib.output_handler instead of the standard
> +;       output_handler, or otherwise the output will be corrupted.
> +zlib.output_compression = Off
> +;zlib.output_compression_level = -1
> +
> +; You cannot specify additional output handlers if zlib.output_compression
> +; is activated here. This setting does the same as output_handler but in
> +; a different order.
> +;zlib.output_handler =
> +
> +; Implicit flush tells PHP to tell the output layer to flush itself
> +; automatically after every output block.  This is equivalent to calling the
> +; PHP function flush() after each and every call to print() or echo() and each
> +; and every HTML block.  Turning this option on has serious performance
> +; implications and is generally recommended for debugging purposes only.
> +implicit_flush = Off
> +
> +; The unserialize callback function will be called (with the undefined class'
> +; name as parameter), if the unserializer finds an undefined class
> +; which should be instantiated.
> +; A warning appears if the specified function is not defined, or if the
> +; function doesn't include/implement the missing class.
> +; So only set this entry, if you really want to implement such a
> +; callback-function.
> +unserialize_callback_func=
> +
> +; When floats & doubles are serialized store serialize_precision significant
> +; digits after the floating point. The default value ensures that when floats
> +; are decoded with unserialize, the data will remain the same.
> +serialize_precision = 100
> +
> +; Whether to enable the ability to force arguments to be passed by reference
> +; at function call time.  This method is deprecated and is likely to be
> +; unsupported in future versions of PHP/Zend.  The encouraged method of
> +; specifying which arguments should be passed by reference is in the function
> +; declaration.  You're encouraged to try and turn this option Off and make
> +; sure your scripts work properly with it in order to ensure they will work
> +; with future versions of the language (you will receive a warning each time
> +; you use this feature, and the argument will be passed by value instead of by
> +; reference).
> +allow_call_time_pass_reference = Off
> +
> +;
> +; Safe Mode
> +;
> +safe_mode = Off
> +
> +; By default, Safe Mode does a UID compare check when
> +; opening files. If you want to relax this to a GID compare,
> +; then turn on safe_mode_gid.
> +safe_mode_gid = Off
> +
> +; When safe_mode is on, UID/GID checks are bypassed when
> +; including files from this directory and its subdirectories.
> +; (directory must also be in include_path or full path must
> +; be used when including)
> +safe_mode_include_dir =
> +
> +; When safe_mode is on, only executables located in the safe_mode_exec_dir
> +; will be allowed to be executed via the exec family of functions.
> +safe_mode_exec_dir =
> +
> +; Setting certain environment variables may be a potential security breach.
> +; This directive contains a comma-delimited list of prefixes.  In Safe Mode,
> +; the user may only alter environment variables whose names begin with the
> +; prefixes supplied here.  By default, users will only be able to set
> +; environment variables that begin with PHP_ (e.g. PHP_FOO=BAR).
> +;
> +; Note:  If this directive is empty, PHP will let the user modify ANY
> +; environment variable!
> +safe_mode_allowed_env_vars = PHP_
> +
> +; This directive contains a comma-delimited list of environment variables that
> +; the end user won't be able to change using putenv().  These variables will be
> +; protected even if safe_mode_allowed_env_vars is set to allow to change them.
> +safe_mode_protected_env_vars = LD_LIBRARY_PATH
> +
> +; open_basedir, if set, limits all file operations to the defined directory
> +; and below.  This directive makes most sense if used in a per-directory
> +; or per-virtualhost web server configuration file. This directive is
> +; *NOT* affected by whether Safe Mode is turned On or Off.
> +;open_basedir =
> +
> +; This directive allows you to disable certain functions for security reasons.
> +; It receives a comma-delimited list of function names. This directive is
> +; *NOT* affected by whether Safe Mode is turned On or Off.
> +disable_functions =
> +
> +; This directive allows you to disable certain classes for security reasons.
> +; It receives a comma-delimited list of class names. This directive is
> +; *NOT* affected by whether Safe Mode is turned On or Off.
> +disable_classes =
> +
> +; Colors for Syntax Highlighting mode.  Anything that's acceptable in
> +; <span style="color: ???????"> would work.
> +;highlight.string  = #DD0000
> +;highlight.comment = #FF9900
> +;highlight.keyword = #007700
> +;highlight.bg      = #FFFFFF
> +;highlight.default = #0000BB
> +;highlight.html    = #000000
> +
> +; If enabled, the request will be allowed to complete even if the user aborts
> +; the request. Consider enabling it if executing long request, which may end up
> +; being interrupted by the user or a browser timing out.
> +; ignore_user_abort = On
> +
> +; Determines the size of the realpath cache to be used by PHP. This value should
> +; be increased on systems where PHP opens many files to reflect the quantity of
> +; the file operations performed.
> +; realpath_cache_size=16k
> +
> +; Duration of time, in seconds for which to cache realpath information for a given
> +; file or directory. For systems with rarely changing files, consider increasing this
> +; value.
> +; realpath_cache_ttl=120
> +
> +;
> +; Misc
> +;
> +; Decides whether PHP may expose the fact that it is installed on the server
> +; (e.g. by adding its signature to the Web server header).  It is no security
> +; threat in any way, but it makes it possible to determine whether you use PHP
> +; on your server or not.
> +expose_php = On
> +
> +
> +;;;;;;;;;;;;;;;;;;;
> +; Resource Limits ;
> +;;;;;;;;;;;;;;;;;;;
> +
> +max_execution_time = 30     ; Maximum execution time of each script, in seconds
> +max_input_time = 60	; Maximum amount of time each script may spend parsing request data
> +;max_input_nesting_level = 64 ; Maximum input variable nesting level
> +memory_limit = 128M      ; Maximum amount of memory a script may consume (128MB)
> +
> +
> +;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
> +; Error handling and logging ;
> +;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
> +
> +; error_reporting is a bit-field.  Or each number up to get desired error
> +; reporting level
> +; E_ALL             - All errors and warnings (doesn't include E_STRICT)
> +; E_ERROR           - fatal run-time errors
> +; E_RECOVERABLE_ERROR  - almost fatal run-time errors
> +; E_WARNING         - run-time warnings (non-fatal errors)
> +; E_PARSE           - compile-time parse errors
> +; E_NOTICE          - run-time notices (these are warnings which often result
> +;                     from a bug in your code, but it's possible that it was
> +;                     intentional (e.g., using an uninitialized variable and
> +;                     relying on the fact it's automatically initialized to an
> +;                     empty string)
> +; E_STRICT          - run-time notices, enable to have PHP suggest changes
> +;                     to your code which will ensure the best interoperability
> +;                     and forward compatibility of your code
> +; E_CORE_ERROR      - fatal errors that occur during PHP's initial startup
> +; E_CORE_WARNING    - warnings (non-fatal errors) that occur during PHP's
> +;                     initial startup
> +; E_COMPILE_ERROR   - fatal compile-time errors
> +; E_COMPILE_WARNING - compile-time warnings (non-fatal errors)
> +; E_USER_ERROR      - user-generated error message
> +; E_USER_WARNING    - user-generated warning message
> +; E_USER_NOTICE     - user-generated notice message
> +;
> +; Examples:
> +;
> +;   - Show all errors, except for notices and coding standards warnings
> +;
> +;error_reporting = E_ALL & ~E_NOTICE
> +;
> +;   - Show all errors, except for notices
> +;
> +;error_reporting = E_ALL & ~E_NOTICE | E_STRICT
> +;
> +;   - Show only errors
> +;
> +;error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR
> +;
> +;   - Show all errors, except coding standards warnings
> +;
> +error_reporting = E_ALL
> +
> +; Print out errors (as a part of the output).  For production web sites,
> +; you're strongly encouraged to turn this feature off, and use error logging
> +; instead (see below).  Keeping display_errors enabled on a production web site
> +; may reveal security information to end users, such as file paths on your Web
> +; server, your database schema or other information.
> +;
> +; possible values for display_errors:
> +;
> +; Off          - Do not display any errors
> +; stderr       - Display errors to STDERR (affects only CGI/CLI binaries!)
> +; On or stdout - Display errors to STDOUT (default)
> +;
> +; To output errors to STDERR with CGI/CLI:
> +;display_errors = "stderr"
> +;
> +; Default
> +;
> +display_errors = Off
> +
> +; Even when display_errors is on, errors that occur during PHP's startup
> +; sequence are not displayed.  It's strongly recommended to keep
> +; display_startup_errors off, except for when debugging.
> +display_startup_errors = Off
> +
> +; Log errors into a log file (server-specific log, stderr, or error_log (below))
> +; As stated above, you're strongly advised to use error logging in place of
> +; error displaying on production web sites.
> +log_errors = On
> +
> +; Set maximum length of log_errors. In error_log information about the source is
> +; added. The default is 1024 and 0 allows to not apply any maximum length at all.
> +log_errors_max_len = 1024
> +
> +; Do not log repeated messages. Repeated errors must occur in same file on same
> +; line unless ignore_repeated_source is set true.
> +ignore_repeated_errors = Off
> +
> +; Ignore source of message when ignoring repeated messages. When this setting
> +; is On you will not log errors with repeated messages from different files or
> +; source lines.
> +ignore_repeated_source = Off
> +
> +; If this parameter is set to Off, then memory leaks will not be shown (on
> +; stdout or in the log). This has only effect in a debug compile, and if
> +; error reporting includes E_WARNING in the allowed list
> +report_memleaks = On
> +
> +;report_zend_debug = 0
> +
> +; Store the last error/warning message in $php_errormsg (boolean).
> +track_errors = Off
> +
> +; Turn off normal error reporting and emit XML-RPC error XML
> +;xmlrpc_errors = 0
> +; An XML-RPC faultCode
> +;xmlrpc_error_number = 0
> +
> +; Disable the inclusion of HTML tags in error messages.
> +; Note: Never use this feature for production boxes.
> +;html_errors = Off
> +
> +; If html_errors is set On PHP produces clickable error messages that direct
> +; to a page describing the error or function causing the error in detail.
> +; You can download a copy of the PHP manual from http://www.php.net/docs.php
> +; and change docref_root to the base URL of your local copy including the
> +; leading '/'. You must also specify the file extension being used including
> +; the dot.
> +; Note: Never use this feature for production boxes.
> +;docref_root = "/phpmanual/"
> +;docref_ext = .html
> +
> +; String to output before an error message.
> +;error_prepend_string = "<font color=#ff0000>"
> +
> +; String to output after an error message.
> +;error_append_string = "</font>"
> +
> +; Log errors to specified file.
> +;error_log = filename
> +
> +; Log errors to syslog (Event Log on NT, not valid in Windows 95).
> +;error_log = syslog
> +
> +
> +;;;;;;;;;;;;;;;;;
> +; Data Handling ;
> +;;;;;;;;;;;;;;;;;
> +;
> +; Note - track_vars is ALWAYS enabled as of PHP 4.0.3
> +
> +; The separator used in PHP generated URLs to separate arguments.
> +; Default is "&".
> +;arg_separator.output = "&amp;"
> +
> +; List of separator(s) used by PHP to parse input URLs into variables.
> +; Default is "&".
> +; NOTE: Every character in this directive is considered as separator!
> +;arg_separator.input = ";&"
> +
> +; This directive describes the order in which PHP registers GET, POST, Cookie,
> +; Environment and Built-in variables (G, P, C, E & S respectively, often
> +; referred to as EGPCS or GPC).  Registration is done from left to right, newer
> +; values override older values.
> +variables_order = "GPCS"
> +
> +; Whether or not to register the EGPCS variables as global variables.  You may
> +; want to turn this off if you don't want to clutter your scripts' global scope
> +; with user data.  This makes most sense when coupled with track_vars - in which
> +; case you can access all of the GPC variables through the $HTTP_*_VARS[],
> +; variables.
> +;
> +; You should do your best to write your scripts so that they do not require
> +; register_globals to be on;  Using form variables as globals can easily lead
> +; to possible security problems, if the code is not very well thought of.
> +register_globals = Off
> +
> +; Whether or not to register the old-style input arrays, HTTP_GET_VARS
> +; and friends.  If you're not using them, it's recommended to turn them off,
> +; for performance reasons.
> +register_long_arrays = Off
> +
> +; This directive tells PHP whether to declare the argv&argc variables (that
> +; would contain the GET information).  If you don't use these variables, you
> +; should turn it off for increased performance.
> +register_argc_argv = Off
> +
> +; When enabled, the SERVER and ENV variables are created when they're first
> +; used (Just In Time) instead of when the script starts. If these variables
> +; are not used within a script, having this directive on will result in a
> +; performance gain. The PHP directives register_globals, register_long_arrays,
> +; and register_argc_argv must be disabled for this directive to have any affect.
> +auto_globals_jit = On
> +
> +; Maximum size of POST data that PHP will accept.
> +post_max_size = 8M
> +
> +; Magic quotes
> +;
> +
> +; Magic quotes for incoming GET/POST/Cookie data.
> +magic_quotes_gpc = Off
> +
> +; Magic quotes for runtime-generated data, e.g. data from SQL, from exec(), etc.
> +magic_quotes_runtime = Off
> +
> +; Use Sybase-style magic quotes (escape ' with '' instead of \').
> +magic_quotes_sybase = Off
> +
> +; Automatically add files before or after any PHP document.
> +auto_prepend_file =
> +auto_append_file =
> +
> +; As of 4.0b4, PHP always outputs a character encoding by default in
> +; the Content-type: header.  To disable sending of the charset, simply
> +; set it to be empty.
> +;
> +; PHP's built-in default is text/html
> +default_mimetype = "text/html"
> +;default_charset = "iso-8859-1"
> +
> +; Always populate the $HTTP_RAW_POST_DATA variable.
> +;always_populate_raw_post_data = On
> +
> +
> +;;;;;;;;;;;;;;;;;;;;;;;;;
> +; Paths and Directories ;
> +;;;;;;;;;;;;;;;;;;;;;;;;;
> +
> +; UNIX: "/path1:/path2"
> +;include_path = ".:/php/includes"
> +;
> +; Windows: "\path1;\path2"
> +;include_path = ".;c:\php\includes"
> +
> +; The root of the PHP pages, used only if nonempty.
> +; if PHP was not compiled with FORCE_REDIRECT, you SHOULD set doc_root
> +; if you are running php as a CGI under any web server (other than IIS)
> +; see documentation for security issues.  The alternate is to use the
> +; cgi.force_redirect configuration below
> +doc_root =
> +
> +; The directory under which PHP opens the script using /~username used only
> +; if nonempty.
> +user_dir =
> +
> +; Directory in which the loadable extensions (modules) reside.
> +extension_dir = "./"
> +
> +; Whether or not to enable the dl() function.  The dl() function does NOT work
> +; properly in multithreaded servers, such as IIS or Zeus, and is automatically
> +; disabled on them.
> +enable_dl = On
> +
> +; cgi.force_redirect is necessary to provide security running PHP as a CGI under
> +; most web servers.  Left undefined, PHP turns this on by default.  You can
> +; turn it off here AT YOUR OWN RISK
> +; **You CAN safely turn this off for IIS, in fact, you MUST.**
> +; cgi.force_redirect = 1
> +
> +; if cgi.nph is enabled it will force cgi to always sent Status: 200 with
> +; every request.
> +; cgi.nph = 1
> +
> +; if cgi.force_redirect is turned on, and you are not running under Apache or Netscape
> +; (iPlanet) web servers, you MAY need to set an environment variable name that PHP
> +; will look for to know it is OK to continue execution.  Setting this variable MAY
> +; cause security issues, KNOW WHAT YOU ARE DOING FIRST.
> +; cgi.redirect_status_env = ;
> +
> +; cgi.fix_pathinfo provides *real* PATH_INFO/PATH_TRANSLATED support for CGI.  PHP's
> +; previous behaviour was to set PATH_TRANSLATED to SCRIPT_FILENAME, and to not grok
> +; what PATH_INFO is.  For more information on PATH_INFO, see the cgi specs.  Setting
> +; this to 1 will cause PHP CGI to fix it's paths to conform to the spec.  A setting
> +; of zero causes PHP to behave as before.  Default is 1.  You should fix your scripts
> +; to use SCRIPT_FILENAME rather than PATH_TRANSLATED.
> + cgi.fix_pathinfo=1
> +
> +; FastCGI under IIS (on WINNT based OS) supports the ability to impersonate
> +; security tokens of the calling client.  This allows IIS to define the
> +; security context that the request runs under.  mod_fastcgi under Apache
> +; does not currently support this feature (03/17/2002)
> +; Set to 1 if running under IIS.  Default is zero.
> +; fastcgi.impersonate = 1;
> +
> +; Disable logging through FastCGI connection
> +; fastcgi.logging = 0
> +
> +; cgi.rfc2616_headers configuration option tells PHP what type of headers to
> +; use when sending HTTP response code. If it's set 0 PHP sends Status: header that
> +; is supported by Apache. When this option is set to 1 PHP will send
> +; RFC2616 compliant header.
> +; Default is zero.
> +;cgi.rfc2616_headers = 0
> +
> +
> +;;;;;;;;;;;;;;;;
> +; File Uploads ;
> +;;;;;;;;;;;;;;;;
> +
> +; Whether to allow HTTP file uploads.
> +file_uploads = On
> +
> +; Temporary directory for HTTP uploaded files (will use system default if not
> +; specified).
> +;upload_tmp_dir =
> +
> +; Maximum allowed size for uploaded files.
> +upload_max_filesize = 2M
> +
> +
> +; Maximum number of files that can be uploaded via a single request
> +max_file_uploads = 20
> +
> +;;;;;;;;;;;;;;;;;;
> +; Fopen wrappers ;
> +;;;;;;;;;;;;;;;;;;
> +
> +; Whether to allow the treatment of URLs (like http:// or ftp://) as files.
> +allow_url_fopen = On
> +
> +; Whether to allow include/require to open URLs (like http:// or ftp://) as files.
> +allow_url_include = Off
> +
> +; Define the anonymous ftp password (your email address)
> +;from="john@doe.com"
> +
> +; Define the User-Agent string
> +; user_agent="PHP"
> +
> +; Default timeout for socket based streams (seconds)
> +default_socket_timeout = 60
> +
> +; If your scripts have to deal with files from Macintosh systems,
> +; or you are running on a Mac and need to deal with files from
> +; unix or win32 systems, setting this flag will cause PHP to
> +; automatically detect the EOL character in those files so that
> +; fgets() and file() will work regardless of the source of the file.
> +; auto_detect_line_endings = Off
> +
> +
> +;;;;;;;;;;;;;;;;;;;;;;
> +; Dynamic Extensions ;
> +;;;;;;;;;;;;;;;;;;;;;;
> +;
> +; If you wish to have an extension loaded automatically, use the following
> +; syntax:
> +;
> +;   extension=modulename.extension
> +;
> +; For example, on Windows:
> +;
> +;   extension=msql.dll
> +;
> +; ... or under UNIX:
> +;
> +;   extension=msql.so
> +;
> +; Note that it should be the name of the module only; no directory information
> +; needs to go here.  Specify the location of the extension with the
> +; extension_dir directive above.
> +
> +
> +; Windows Extensions
> +; Note that ODBC support is built in, so no dll is needed for it.
> +; Note that many DLL files are located in the extensions/ (PHP 4) ext/ (PHP 5)
> +; extension folders as well as the separate PECL DLL download (PHP 5).
> +; Be sure to appropriately set the extension_dir directive.
> +
> +;extension=php_bz2.dll
> +;extension=php_curl.dll
> +;extension=php_dba.dll
> +;extension=php_dbase.dll
> +;extension=php_exif.dll
> +;extension=php_fdf.dll
> +;extension=php_gd2.dll
> +;extension=php_gettext.dll
> +;extension=php_gmp.dll
> +;extension=php_ifx.dll
> +;extension=php_imap.dll
> +;extension=php_interbase.dll
> +;extension=php_ldap.dll
> +;extension=php_mbstring.dll
> +;extension=php_mcrypt.dll
> +;extension=php_mhash.dll
> +;extension=php_mime_magic.dll
> +;extension=php_ming.dll
> +;extension=php_msql.dll
> +;extension=php_mssql.dll
> +;extension=php_mysql.dll
> +;extension=php_mysqli.dll
> +;extension=php_oci8.dll
> +;extension=php_openssl.dll
> +;extension=php_pdo.dll
> +;extension=php_pdo_firebird.dll
> +;extension=php_pdo_mssql.dll
> +;extension=php_pdo_mysql.dll
> +;extension=php_pdo_oci.dll
> +;extension=php_pdo_oci8.dll
> +;extension=php_pdo_odbc.dll
> +;extension=php_pdo_pgsql.dll
> +;extension=php_pdo_sqlite.dll
> +;extension=php_pgsql.dll
> +;extension=php_pspell.dll
> +;extension=php_shmop.dll
> +;extension=php_snmp.dll
> +;extension=php_soap.dll
> +;extension=php_sockets.dll
> +;extension=php_sqlite.dll
> +;extension=php_sybase_ct.dll
> +;extension=php_tidy.dll
> +;extension=php_xmlrpc.dll
> +;extension=php_xsl.dll
> +;extension=php_zip.dll
> +
> +;;;;;;;;;;;;;;;;;;;
> +; Module Settings ;
> +;;;;;;;;;;;;;;;;;;;
> +
> +[Date]
> +; Defines the default timezone used by the date functions
> +;date.timezone =
> +
> +;date.default_latitude = 31.7667
> +;date.default_longitude = 35.2333
> +
> +;date.sunrise_zenith = 90.583333
> +;date.sunset_zenith = 90.583333
> +
> +[filter]
> +;filter.default = unsafe_raw
> +;filter.default_flags =
> +
> +[iconv]
> +;iconv.input_encoding = ISO-8859-1
> +;iconv.internal_encoding = ISO-8859-1
> +;iconv.output_encoding = ISO-8859-1
> +
> +[sqlite]
> +;sqlite.assoc_case = 0
> +
> +[Pcre]
> +;PCRE library backtracking limit.
> +;pcre.backtrack_limit=100000
> +
> +;PCRE library recursion limit.
> +;Please note that if you set this value to a high number you may consume all
> +;the available process stack and eventually crash PHP (due to reaching the
> +;stack size limit imposed by the Operating System).
> +;pcre.recursion_limit=100000
> +
> +[Syslog]
> +; Whether or not to define the various syslog variables (e.g. $LOG_PID,
> +; $LOG_CRON, etc.).  Turning it off is a good idea performance-wise.  In
> +; runtime, you can define these variables by calling define_syslog_variables().
> +define_syslog_variables  = Off
> +
> +[mail function]
> +; For Win32 only.
> +SMTP = localhost
> +smtp_port = 25
> +
> +; For Win32 only.
> +;sendmail_from = me@example.com
> +
> +; For Unix only.  You may supply arguments as well (default: "sendmail -t -i").
> +;sendmail_path =
> +
> +; Force the addition of the specified parameters to be passed as extra parameters
> +; to the sendmail binary. These parameters will always replace the value of
> +; the 5th parameter to mail(), even in safe mode.
> +;mail.force_extra_parameters =
> +
> +[SQL]
> +sql.safe_mode = Off
> +
> +[ODBC]
> +;odbc.default_db    =  Not yet implemented
> +;odbc.default_user  =  Not yet implemented
> +;odbc.default_pw    =  Not yet implemented
> +
> +; Allow or prevent persistent links.
> +odbc.allow_persistent = On
> +
> +; Check that a connection is still valid before reuse.
> +odbc.check_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +odbc.max_persistent = -1
> +
> +; Maximum number of links (persistent + non-persistent).  -1 means no limit.
> +odbc.max_links = -1
> +
> +; Handling of LONG fields.  Returns number of bytes to variables.  0 means
> +; passthru.
> +odbc.defaultlrl = 4096
> +
> +; Handling of binary data.  0 means passthru, 1 return as is, 2 convert to char.
> +; See the documentation on odbc_binmode and odbc_longreadlen for an explanation
> +; of uodbc.defaultlrl and uodbc.defaultbinmode
> +odbc.defaultbinmode = 1
> +
> +[MySQL]
> +; Allow or prevent persistent links.
> +mysql.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +mysql.max_persistent = -1
> +
> +; Maximum number of links (persistent + non-persistent).  -1 means no limit.
> +mysql.max_links = -1
> +
> +; Default port number for mysql_connect().  If unset, mysql_connect() will use
> +; the $MYSQL_TCP_PORT or the mysql-tcp entry in /etc/services or the
> +; compile-time value defined MYSQL_PORT (in that order).  Win32 will only look
> +; at MYSQL_PORT.
> +mysql.default_port =
> +
> +; Default socket name for local MySQL connects.  If empty, uses the built-in
> +; MySQL defaults.
> +mysql.default_socket =
> +
> +; Default host for mysql_connect() (doesn't apply in safe mode).
> +mysql.default_host =
> +
> +; Default user for mysql_connect() (doesn't apply in safe mode).
> +mysql.default_user =
> +
> +; Default password for mysql_connect() (doesn't apply in safe mode).
> +; Note that this is generally a *bad* idea to store passwords in this file.
> +; *Any* user with PHP access can run 'echo get_cfg_var("mysql.default_password")
> +; and reveal this password!  And of course, any users with read access to this
> +; file will be able to reveal the password as well.
> +mysql.default_password =
> +
> +; Maximum time (in seconds) for connect timeout. -1 means no limit
> +mysql.connect_timeout = 60
> +
> +; Trace mode. When trace_mode is active (=On), warnings for table/index scans and
> +; SQL-Errors will be displayed.
> +mysql.trace_mode = Off
> +
> +[MySQLi]
> +
> +; Maximum number of links.  -1 means no limit.
> +mysqli.max_links = -1
> +
> +; Default port number for mysqli_connect().  If unset, mysqli_connect() will use
> +; the $MYSQL_TCP_PORT or the mysql-tcp entry in /etc/services or the
> +; compile-time value defined MYSQL_PORT (in that order).  Win32 will only look
> +; at MYSQL_PORT.
> +mysqli.default_port = 3306
> +
> +; Default socket name for local MySQL connects.  If empty, uses the built-in
> +; MySQL defaults.
> +mysqli.default_socket =
> +
> +; Default host for mysql_connect() (doesn't apply in safe mode).
> +mysqli.default_host =
> +
> +; Default user for mysql_connect() (doesn't apply in safe mode).
> +mysqli.default_user =
> +
> +; Default password for mysqli_connect() (doesn't apply in safe mode).
> +; Note that this is generally a *bad* idea to store passwords in this file.
> +; *Any* user with PHP access can run 'echo get_cfg_var("mysqli.default_pw")
> +; and reveal this password!  And of course, any users with read access to this
> +; file will be able to reveal the password as well.
> +mysqli.default_pw =
> +
> +; Allow or prevent reconnect
> +mysqli.reconnect = Off
> +
> +[mSQL]
> +; Allow or prevent persistent links.
> +msql.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +msql.max_persistent = -1
> +
> +; Maximum number of links (persistent+non persistent).  -1 means no limit.
> +msql.max_links = -1
> +
> +[OCI8]
> +; enables privileged connections using external credentials (OCI_SYSOPER, OCI_SYSDBA)
> +;oci8.privileged_connect = Off
> +
> +; Connection: The maximum number of persistent OCI8 connections per
> +; process. Using -1 means no limit.
> +;oci8.max_persistent = -1
> +
> +; Connection: The maximum number of seconds a process is allowed to
> +; maintain an idle persistent connection. Using -1 means idle
> +; persistent connections will be maintained forever.
> +;oci8.persistent_timeout = -1
> +
> +; Connection: The number of seconds that must pass before issuing a
> +; ping during oci_pconnect() to check the connection validity. When
> +; set to 0, each oci_pconnect() will cause a ping. Using -1 disables
> +; pings completely.
> +;oci8.ping_interval = 60
> +
> +; Tuning: This option enables statement caching, and specifies how
> +; many statements to cache. Using 0 disables statement caching.
> +;oci8.statement_cache_size = 20
> +
> +; Tuning: Enables statement prefetching and sets the default number of
> +; rows that will be fetched automatically after statement execution.
> +;oci8.default_prefetch = 10
> +
> +; Compatibility. Using On means oci_close() will not close
> +; oci_connect() and oci_new_connect() connections.
> +;oci8.old_oci_close_semantics = Off
> +
> +[PostgresSQL]
> +; Allow or prevent persistent links.
> +pgsql.allow_persistent = On
> +
> +; Detect broken persistent links always with pg_pconnect().
> +; Auto reset feature requires a little overheads.
> +pgsql.auto_reset_persistent = Off
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +pgsql.max_persistent = -1
> +
> +; Maximum number of links (persistent+non persistent).  -1 means no limit.
> +pgsql.max_links = -1
> +
> +; Ignore PostgreSQL backends Notice message or not.
> +; Notice message logging require a little overheads.
> +pgsql.ignore_notice = 0
> +
> +; Log PostgreSQL backends Notice message or not.
> +; Unless pgsql.ignore_notice=0, module cannot log notice message.
> +pgsql.log_notice = 0
> +
> +[Sybase]
> +; Allow or prevent persistent links.
> +sybase.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +sybase.max_persistent = -1
> +
> +; Maximum number of links (persistent + non-persistent).  -1 means no limit.
> +sybase.max_links = -1
> +
> +;sybase.interface_file = "/usr/sybase/interfaces"
> +
> +; Minimum error severity to display.
> +sybase.min_error_severity = 10
> +
> +; Minimum message severity to display.
> +sybase.min_message_severity = 10
> +
> +; Compatibility mode with old versions of PHP 3.0.
> +; If on, this will cause PHP to automatically assign types to results according
> +; to their Sybase type, instead of treating them all as strings.  This
> +; compatibility mode will probably not stay around forever, so try applying
> +; whatever necessary changes to your code, and turn it off.
> +sybase.compatability_mode = Off
> +
> +[Sybase-CT]
> +; Allow or prevent persistent links.
> +sybct.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +sybct.max_persistent = -1
> +
> +; Maximum number of links (persistent + non-persistent).  -1 means no limit.
> +sybct.max_links = -1
> +
> +; Minimum server message severity to display.
> +sybct.min_server_severity = 10
> +
> +; Minimum client message severity to display.
> +sybct.min_client_severity = 10
> +
> +[bcmath]
> +; Number of decimal digits for all bcmath functions.
> +bcmath.scale = 0
> +
> +[browscap]
> +;browscap = extra/browscap.ini
> +
> +[Informix]
> +; Default host for ifx_connect() (doesn't apply in safe mode).
> +ifx.default_host =
> +
> +; Default user for ifx_connect() (doesn't apply in safe mode).
> +ifx.default_user =
> +
> +; Default password for ifx_connect() (doesn't apply in safe mode).
> +ifx.default_password =
> +
> +; Allow or prevent persistent links.
> +ifx.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +ifx.max_persistent = -1
> +
> +; Maximum number of links (persistent + non-persistent).  -1 means no limit.
> +ifx.max_links = -1
> +
> +; If on, select statements return the contents of a text blob instead of its id.
> +ifx.textasvarchar = 0
> +
> +; If on, select statements return the contents of a byte blob instead of its id.
> +ifx.byteasvarchar = 0
> +
> +; Trailing blanks are stripped from fixed-length char columns.  May help the
> +; life of Informix SE users.
> +ifx.charasvarchar = 0
> +
> +; If on, the contents of text and byte blobs are dumped to a file instead of
> +; keeping them in memory.
> +ifx.blobinfile = 0
> +
> +; NULL's are returned as empty strings, unless this is set to 1.  In that case,
> +; NULL's are returned as string 'NULL'.
> +ifx.nullformat = 0
> +
> +[Session]
> +; Handler used to store/retrieve data.
> +session.save_handler = files
> +
> +; Argument passed to save_handler.  In the case of files, this is the path
> +; where data files are stored. Note: Windows users have to change this
> +; variable in order to use PHP's session functions.
> +;
> +; As of PHP 4.0.1, you can define the path as:
> +;
> +;     session.save_path = "N;/path"
> +;
> +; where N is an integer.  Instead of storing all the session files in
> +; /path, what this will do is use subdirectories N-levels deep, and
> +; store the session data in those directories.  This is useful if you
> +; or your OS have problems with lots of files in one directory, and is
> +; a more efficient layout for servers that handle lots of sessions.
> +;
> +; NOTE 1: PHP will not create this directory structure automatically.
> +;         You can use the script in the ext/session dir for that purpose.
> +; NOTE 2: See the section on garbage collection below if you choose to
> +;         use subdirectories for session storage
> +;
> +; The file storage module creates files using mode 600 by default.
> +; You can change that by using
> +;
> +;     session.save_path = "N;MODE;/path"
> +;
> +; where MODE is the octal representation of the mode. Note that this
> +; does not overwrite the process's umask.
> +;session.save_path = "/tmp"
> +
> +; Whether to use cookies.
> +session.use_cookies = 1
> +
> +;session.cookie_secure =
> +
> +; This option enables administrators to make their users invulnerable to
> +; attacks which involve passing session ids in URLs; defaults to 0.
> +; session.use_only_cookies = 1
> +
> +; Name of the session (used as cookie name).
> +session.name = PHPSESSID
> +
> +; Initialize session on request startup.
> +session.auto_start = 0
> +
> +; Lifetime in seconds of cookie or, if 0, until browser is restarted.
> +session.cookie_lifetime = 0
> +
> +; The path for which the cookie is valid.
> +session.cookie_path = /
> +
> +; The domain for which the cookie is valid.
> +session.cookie_domain =
> +
> +; Whether or not to add the httpOnly flag to the cookie, which makes it inaccessible to browser scripting languages such as JavaScript.
> +session.cookie_httponly =
> +
> +; Handler used to serialize data.  php is the standard serializer of PHP.
> +session.serialize_handler = php
> +
> +; Define the probability that the 'garbage collection' process is started
> +; on every session initialization.
> +; The probability is calculated by using gc_probability/gc_divisor,
> +; e.g. 1/100 means there is a 1% chance that the GC process starts
> +; on each request.
> +
> +session.gc_probability = 1
> +session.gc_divisor     = 1000
> +
> +; After this number of seconds, stored data will be seen as 'garbage' and
> +; cleaned up by the garbage collection process.
> +session.gc_maxlifetime = 1440
> +
> +; NOTE: If you are using the subdirectory option for storing session files
> +;       (see session.save_path above), then garbage collection does *not*
> +;       happen automatically.  You will need to do your own garbage
> +;       collection through a shell script, cron entry, or some other method.
> +;       For example, the following script would is the equivalent of
> +;       setting session.gc_maxlifetime to 1440 (1440 seconds = 24 minutes):
> +;          cd /path/to/sessions; find -cmin +24 | xargs rm
> +
> +; PHP 4.2 and less have an undocumented feature/bug that allows you to
> +; to initialize a session variable in the global scope, albeit register_globals
> +; is disabled.  PHP 4.3 and later will warn you, if this feature is used.
> +; You can disable the feature and the warning separately. At this time,
> +; the warning is only displayed, if bug_compat_42 is enabled.
> +
> +session.bug_compat_42 = 0
> +session.bug_compat_warn = 1
> +
> +; Check HTTP Referer to invalidate externally stored URLs containing ids.
> +; HTTP_REFERER has to contain this substring for the session to be
> +; considered as valid.
> +session.referer_check =
> +
> +; How many bytes to read from the file.
> +session.entropy_length = 0
> +
> +; Specified here to create the session id.
> +session.entropy_file =
> +
> +;session.entropy_length = 16
> +
> +;session.entropy_file = /dev/urandom
> +
> +; Set to {nocache,private,public,} to determine HTTP caching aspects
> +; or leave this empty to avoid sending anti-caching headers.
> +session.cache_limiter = nocache
> +
> +; Document expires after n minutes.
> +session.cache_expire = 180
> +
> +; trans sid support is disabled by default.
> +; Use of trans sid may risk your users security.
> +; Use this option with caution.
> +; - User may send URL contains active session ID
> +;   to other person via. email/irc/etc.
> +; - URL that contains active session ID may be stored
> +;   in publically accessible computer.
> +; - User may access your site with the same session ID
> +;   always using URL stored in browser's history or bookmarks.
> +session.use_trans_sid = 0
> +
> +; Select a hash function
> +; 0: MD5   (128 bits)
> +; 1: SHA-1 (160 bits)
> +session.hash_function = 0
> +
> +; Define how many bits are stored in each character when converting
> +; the binary hash data to something readable.
> +;
> +; 4 bits: 0-9, a-f
> +; 5 bits: 0-9, a-v
> +; 6 bits: 0-9, a-z, A-Z, "-", ","
> +session.hash_bits_per_character = 5
> +
> +; The URL rewriter will look for URLs in a defined set of HTML tags.
> +; form/fieldset are special; if you include them here, the rewriter will
> +; add a hidden <input> field with the info which is otherwise appended
> +; to URLs.  If you want XHTML conformity, remove the form entry.
> +; Note that all valid entries require a "=", even if no value follows.
> +url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"
> +
> +[MSSQL]
> +; Allow or prevent persistent links.
> +mssql.allow_persistent = On
> +
> +; Maximum number of persistent links.  -1 means no limit.
> +mssql.max_persistent = -1
> +
> +; Maximum number of links (persistent+non persistent).  -1 means no limit.
> +mssql.max_links = -1
> +
> +; Minimum error severity to display.
> +mssql.min_error_severity = 10
> +
> +; Minimum message severity to display.
> +mssql.min_message_severity = 10
> +
> +; Compatibility mode with old versions of PHP 3.0.
> +mssql.compatability_mode = Off
> +
> +; Connect timeout
> +;mssql.connect_timeout = 5
> +
> +; Query timeout
> +;mssql.timeout = 60
> +
> +; Valid range 0 - 2147483647.  Default = 4096.
> +;mssql.textlimit = 4096
> +
> +; Valid range 0 - 2147483647.  Default = 4096.
> +;mssql.textsize = 4096
> +
> +; Limits the number of records in each batch.  0 = all records in one batch.
> +;mssql.batchsize = 0
> +
> +; Specify how datetime and datetim4 columns are returned
> +; On => Returns data converted to SQL server settings
> +; Off => Returns values as YYYY-MM-DD hh:mm:ss
> +;mssql.datetimeconvert = On
> +
> +; Use NT authentication when connecting to the server
> +mssql.secure_connection = Off
> +
> +; Specify max number of processes. -1 = library default
> +; msdlib defaults to 25
> +; FreeTDS defaults to 4096
> +;mssql.max_procs = -1
> +
> +; Specify client character set.
> +; If empty or not set the client charset from freetds.comf is used
> +; This is only used when compiled with FreeTDS
> +;mssql.charset = "ISO-8859-1"
> +
> +[Assertion]
> +; Assert(expr); active by default.
> +;assert.active = On
> +
> +; Issue a PHP warning for each failed assertion.
> +;assert.warning = On
> +
> +; Don't bail out by default.
> +;assert.bail = Off
> +
> +; User-function to be called if an assertion fails.
> +;assert.callback = 0
> +
> +; Eval the expression with current error_reporting().  Set to true if you want
> +; error_reporting(0) around the eval().
> +;assert.quiet_eval = 0
> +
> +[COM]
> +; path to a file containing GUIDs, IIDs or filenames of files with TypeLibs
> +;com.typelib_file =
> +; allow Distributed-COM calls
> +;com.allow_dcom = true
> +; autoregister constants of a components typlib on com_load()
> +;com.autoregister_typelib = true
> +; register constants casesensitive
> +;com.autoregister_casesensitive = false
> +; show warnings on duplicate constant registrations
> +;com.autoregister_verbose = true
> +
> +[mbstring]
> +; language for internal character representation.
> +;mbstring.language = Japanese
> +
> +; internal/script encoding.
> +; Some encoding cannot work as internal encoding.
> +; (e.g. SJIS, BIG5, ISO-2022-*)
> +;mbstring.internal_encoding = EUC-JP
> +
> +; http input encoding.
> +;mbstring.http_input = auto
> +
> +; http output encoding. mb_output_handler must be
> +; registered as output buffer to function
> +;mbstring.http_output = SJIS
> +
> +; enable automatic encoding translation according to
> +; mbstring.internal_encoding setting. Input chars are
> +; converted to internal encoding by setting this to On.
> +; Note: Do _not_ use automatic encoding translation for
> +;       portable libs/applications.
> +;mbstring.encoding_translation = Off
> +
> +; automatic encoding detection order.
> +; auto means
> +;mbstring.detect_order = auto
> +
> +; substitute_character used when character cannot be converted
> +; one from another
> +;mbstring.substitute_character = none;
> +
> +; overload(replace) single byte functions by mbstring functions.
> +; mail(), ereg(), etc are overloaded by mb_send_mail(), mb_ereg(),
> +; etc. Possible values are 0,1,2,4 or combination of them.
> +; For example, 7 for overload everything.
> +; 0: No overload
> +; 1: Overload mail() function
> +; 2: Overload str*() functions
> +; 4: Overload ereg*() functions
> +;mbstring.func_overload = 0
> +
> +; enable strict encoding detection.
> +;mbstring.strict_detection = Off
> +
> +[FrontBase]
> +;fbsql.allow_persistent = On
> +;fbsql.autocommit = On
> +;fbsql.show_timestamp_decimals = Off
> +;fbsql.default_database =
> +;fbsql.default_database_password =
> +;fbsql.default_host =
> +;fbsql.default_password =
> +;fbsql.default_user = "_SYSTEM"
> +;fbsql.generate_warnings = Off
> +;fbsql.max_connections = 128
> +;fbsql.max_links = 128
> +;fbsql.max_persistent = -1
> +;fbsql.max_results = 128
> +
> +[gd]
> +; Tell the jpeg decode to libjpeg warnings and try to create
> +; a gd image. The warning will then be displayed as notices
> +; disabled by default
> +;gd.jpeg_ignore_warning = 0
> +
> +[exif]
> +; Exif UNICODE user comments are handled as UCS-2BE/UCS-2LE and JIS as JIS.
> +; With mbstring support this will automatically be converted into the encoding
> +; given by corresponding encode setting. When empty mbstring.internal_encoding
> +; is used. For the decode settings you can distinguish between motorola and
> +; intel byte order. A decode setting cannot be empty.
> +;exif.encode_unicode = ISO-8859-15
> +;exif.decode_unicode_motorola = UCS-2BE
> +;exif.decode_unicode_intel    = UCS-2LE
> +;exif.encode_jis =
> +;exif.decode_jis_motorola = JIS
> +;exif.decode_jis_intel    = JIS
> +
> +[Tidy]
> +; The path to a default tidy configuration file to use when using tidy
> +;tidy.default_config = /usr/local/lib/php/default.tcfg
> +
> +; Should tidy clean and repair output automatically?
> +; WARNING: Do not use this option if you are generating non-html content
> +; such as dynamic images
> +tidy.clean_output = Off
> +
> +zlib.output_compression = On
> +
> +[soap]
> +; Enables or disables WSDL caching feature.
> +soap.wsdl_cache_enabled=1
> +; Sets the directory name where SOAP extension will put cache files.
> +soap.wsdl_cache_dir="/tmp"
> +; (time to live) Sets the number of second while cached file will be used
> +; instead of original one.
> +soap.wsdl_cache_ttl=86400
> +
> +; Local Variables:
> +; tab-width: 4
> +; End:
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> new file mode 100644
> index 0000000..9d9fce8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION = "Matrix GUI Application launcher"
> +HOMEPAGE = "https://gforge.ti.com/gf/project/matrix-gui-v2/"
> +
> +LICENSE = "BSD MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
> +
> +SECTION = "multimedia"
> +
> +PR = "r7"
> +
> +INITSCRIPT_NAME = "matrix-gui-2.0"
> +INITSCRIPT_PARAMS = "defaults 97"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit update-rc.d
> +
> +BRANCH ?= "master"
> +SRCREV = "87825c8598a2b42432e2817d1d9dba6082062249"
> +
> +SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
> +           file://init \
> +           file://php.ini"
> +
> +require matrix-gui-paths.inc
> +
> +S = "${WORKDIR}/git"
> +
> +MATRIX_CONFIG = "800x480_config.ini"
> +MATRIX_CONFIG_am3517-evm = "480x272_config.ini"
> +MATRIX_CONFIG_am180x-evm = "480x272_config.ini"
> +MATRIX_CONFIG_am37x-evm = "640x480_config.ini"
> +MATRIX_CONFIG_beagleboard = "640x480_config.ini"
> +
> +MATRIX_ROT = ""
> +MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
> +
> +do_install(){
> +	install -d ${D}${MATRIX_BASE_DIR}
> +	install -d ${D}${MATRIX_WEB_DIR}
> +	cp -rf ${S}/* ${D}${MATRIX_WEB_DIR}
> +
> +    # Install our php.ini file
> +    install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
> +
> +    # Set the proper path in the init script
> +    sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
> +    sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/init
> +
> +    # Install the init script
> +    # TODO: replace init script with systemd files
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
> +
> +    # Install the matrix config file to configure the screen resolution
> +    install -m 0644 ${S}/matrix_config/${MATRIX_CONFIG} ${D}${MATRIX_WEB_DIR}/matrix_config.ini
> +}
> +
> +RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli matrix-gui-browser refresh-screen"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

