Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4DB02529CE
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 20:30:28 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TKURJq021143
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:30:27 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKURtl020651
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 15:30:27 -0500 (CDT)
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:30:27 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKURZj014090	for
	<meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:30:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:30:26 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7TKUQKc023211;	Wed, 29 Aug 2012 15:30:26 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6p8X-00085c-6u; Wed, 29 Aug 2012 15:45:17 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 15:45:16 -0500
Message-ID: <1346273116-31057-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] sourceipk: Adding and enabling sourceipk
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
X-List-Received-Date: Wed, 29 Aug 2012 20:30:28 -0000
Content-Type: text/plain

* Porting sourceipk class from arago to meta-arago
* Porting arago-source-ipk.conf which contains a list of all the recipes
  that should generate ipks from the source.
* Include the sourceipk conf inside of arago.conf

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass        |  155 ++++++++++
 .../conf/distro/arago-source-ipk.conf              |  314 ++++++++++++++++++++
 meta-arago-distro/conf/distro/arago.conf           |    2 +
 3 files changed, 471 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/classes/sourceipk.bbclass
 create mode 100644 meta-arago-distro/conf/distro/arago-source-ipk.conf

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
new file mode 100644
index 0000000..09d6eb8
--- /dev/null
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -0,0 +1,155 @@
+# sourceipk.bbclass enables the creation of an ipk file that contains the
+# sources used during the build.  The sources contained in the ipk are the
+# patched sources before configuration has been done.
+#
+# This class is used to provide an easy method to ship the corresponding
+# sources for a package to end users so that they can install them on their
+# host or target systems.
+#
+# This package uses the following variables to control its operations:
+#   - CREATE_SRCIPK         = When set to 1 this variable indicates that 
+#                             a source ipk should be generated for the package.
+#   - SRCIPK_INSTALL_DIR    = This variable indicates the directory to install
+#                             the sources into.
+#   - SRCIPK_PACKAGE_ARCH   = This variable allows specific recipies to
+#                             specify an architecture for the sourcetree
+#                             package is "all" is not appropriate
+#   - SRCIPK_INC_EXTRAFILES = When set to 1 this variable indicates that
+#                             the source ipk should contain extra files
+#                             such as the README file and recipe.
+#
+# The default installation directory for the sources is:
+#   /usr/src/${PN}-src
+#
+# By setting the SRCIPK_INSTALL_DIR this default can be changed to any
+# location desired.  When combined with the opkg -o option this allows for the
+# system building to specify a relative package install location to the
+# install root given to opkg.  Each source ipk can have a different directory.
+# 
+# Creation of the source ipk can be controlled per package by setting
+# CREATE_SRCIPK = "1" in the package recipe or by setting
+# CREATE_SRCIPK_pn-<package name> = "1" in your local.conf
+#
+#TODO: 
+# Need to figure out how to use opkg-build in this class.
+# I tried adding it as a dependency for the do_create_srcipk
+# task using:
+#   do_create_srcipk[depends] += "opkg-utils-native:do_populate_sysroot"
+# But then there is a circular dependency between sourcipk.bbclass and
+# opkg-utils-native.  Until I can figure out how to resolve this
+# circular dependency I am extracting the needed pieces from opkg-build
+# into this class and building the source ipk myself.
+
+
+# Default is to not create the source ipk
+CREATE_SRCIPK ?= "0"
+
+# Default installation prefix
+SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
+
+# Default PACKAGE_ARCH for sources is "all"
+SRCIPK_PACKAGE_ARCH ?= "all"
+
+# Default section matches the recipe section
+SRCIPK_SECTION ?= "${SECTION}"
+
+# Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
+SRCIPK_INCLUDE_EXTRAFILES ?= "1"
+
+# Create a README file that describes the contents of the source ipk
+sourceipk_create_readme() {
+    readme="$1/README.${PN}-src"
+    touch $readme
+    echo 'This package contains the patched sources for ${PN} that' >> $readme
+    echo 'were used to generate the ${PN} binary ipk package(s).' >> $readme
+    echo 'This package does not build or generate the binaries' >> $readme
+    echo 'directly.  To build the binaries you must either' >> $readme
+    echo 'configure and build the sources yourself or use:' >> $readme
+    echo '    bitbake ${PN}' >> $readme
+    echo '' >> $readme
+    echo 'NOTE: The patches applied to the sources can be found in' >> $readme
+    echo "      the \"patches\" directory" >> $readme
+}
+
+# Create the source ipk file.  The ipk is manually created here instead
+# of using the normal ipk system because some recipes will over write
+# the PACKAGES variable.  Thus if this class added a -src package
+# to the list of packages to be created that package would be lost.
+# See the linux kernel recipe for an example of this issue.
+sourceipk_do_create_srcipk() {
+    if [ ${CREATE_SRCIPK} != "0" ]
+    then
+        tmp_dir="${WORKDIR}/sourceipk-tmp"
+        srcipk_dir="${WORKDIR}/sourceipk-data"
+        mkdir -p $tmp_dir/CONTROL
+        mkdir -p $srcipk_dir
+        control_file="$tmp_dir/CONTROL/control"
+
+        # Write the control file
+        echo "Package: ${PN}-src" > $control_file
+        echo "Version: ${PV}-${PR}" >> $control_file
+        echo "Description: Patched sources for ${PN}" >> $control_file
+        echo "Section: ${SRCIPK_SECTION}" >> $control_file
+        echo "Priority: Optional" >> $control_file
+        echo "Maintainer: ${MAINTAINER}" >> $control_file
+        echo "License: ${LICENSE}" >> $control_file
+        echo "Architecture: ${SRCIPK_PACKAGE_ARCH}" >> $control_file
+        srcuri="${SRC_URI}"
+        if [ "$srcuri" = "" ]
+        then
+            srcuri="OpenEmbedded"
+        fi
+        echo "Source: $srcuri" >> $control_file
+        #Write the control tarball
+        tar -C $tmp_dir/CONTROL --owner=0 --group=0 -czf $srcipk_dir/control.tar.gz .
+
+        # Get rid of temporary control file
+        rm -rf $tmp_dir/CONTROL
+
+        # Copy sources for packaging
+        mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
+        if [ -e ${S} ]; then
+	    if [ "${S}" = "${WORKDIR}" ]; then
+		excludes='--exclude ./temp --exclude ./sourceipk-tmp --exclude ./sourceipk-data'
+	    fi
+            tar -C ${S} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
+        fi
+
+        if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
+        then
+            sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
+            cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        fi
+
+        #Write the data tarball
+        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
+
+        # Create the debian-binary file
+        echo "2.0" > $srcipk_dir/debian-binary
+
+        #Write the ipk file
+        mkdir -p ${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}
+        pkg_file=${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
+        rm -f $pkg_file
+        ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./data.tar.gz ./control.tar.gz )
+
+        # Remove the temporary directory
+        rm -rf $tmp_dir
+    fi
+}
+
+EXPORT_FUNCTIONS do_create_srcipk
+
+do_create_srcipk[deptask] = "do_patch"
+
+addtask create_srcipk after do_patch before do_configure
+
+python () {
+    if d.getVar('do_compileconfigs', False):
+	deps = d.getVarFlag('do_compileconfigs', 'deps') or []
+	deps.append('do_create_srcipk')
+	d.setVarFlag('do_compileconfigs', 'deps', deps)
+}
+
+#Add source packages to list of packages OE knows about
+PACKAGES_DYNAMIC += "${PN}-src"
diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
new file mode 100644
index 0000000..7a36f1f
--- /dev/null
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -0,0 +1,314 @@
+#===============================================================================
+# BOM Configuration file
+#
+# Syntax:
+#   Select one of available providers (recipes) for a package.
+#   Usually used for virtual/xyz style packages. i.e virtual/kernel
+#       PREFERRED_PROVIDER_<pkg> = "recipe"
+#       PREFERRED_PROVIDER_<pkg>_<mach> = "recipe"
+#   i.e.
+#       PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
+#       PREFERRED_PROVIDER_virtual/kenrel_omap3evm = "linux-omap3"
+#
+#   Select one of the available versions for a package
+#       PREFERRED_VERSION_<pkg> = "X.Y.Z"
+#       PREFERRED_VERSION_<pkg>_<mach> = "X.Y.Z"
+#   i.e.
+#       PREFERRED_VERSION_udev = "141"
+#       PREFERRED_VERSION_udev_omap3evm = "124"
+#
+#   Enable source ipk creation for a package
+#       CREATE_SRCIPK_pn-<pkg> = "1"
+#   i.e.
+#       CREATE_SRCIPK_pn-u-boot = "1"
+#
+#   Change install diretory of source ipk for a package
+#       SRCIPK_INSTALL_DIR_pn-<pkg> = "<install dir>"
+#   i.e.
+#       SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-source"
+#
+#   Change source ipk architecture for a package
+#       SRCIPK_PACKAGE_ARCH_pn-<pkg> = "<arch>"
+#   i.e.
+#       SRCIPK_PACKAGE_ARCH_pn-u-boot = "${MACHINE_ARCH}"
+#===============================================================================
+
+# Enable the creation of source ipks
+INHERIT += "sourceipk"
+
+# Disable including README and recipe files in sourceipks for SDK builds.
+SRCIPK_INCLUDE_EXTRAFILES = "0"
+
+# Set source ipk packages and install directories
+CREATE_SRCIPK_pn-ti-tisdk-licenses = "1"
+SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses = "docs/licenses"
+
+CREATE_SRCIPK_pn-matrix-gui = "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-qml-carinfo = "1"
+SRCIPK_INSTALL_DIR_pn-qml-carinfo = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-qml-playground = "1"
+SRCIPK_INSTALL_DIR_pn-qml-playground = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-qt-catalog = "1"
+SRCIPK_INSTALL_DIR_pn-qt-catalog = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-qt-patientcare = "1"
+SRCIPK_INSTALL_DIR_pn-qt-patientcare = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-qt-tstat = "1"
+SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-matrix-gui-browser = "1"
+SRCIPK_INSTALL_DIR_pn-matrix-gui-browser = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-refresh-screen = "1"
+SRCIPK_INSTALL_DIR_pn-refresh-screen = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-am-sysinfo = "1"
+SRCIPK_INSTALL_DIR_pn-am-sysinfo = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-arm-benchmarks = "1"
+SRCIPK_INSTALL_DIR_pn-arm-benchmarks = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-ti-pru-sw-examples = "1"
+SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples = "example-applications/pru-${PV}"
+
+CREATE_SRCIPK_pn-ti-ocf-crypto-module = "1"
+SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-bt-enable = "1"
+SRCIPK_INSTALL_DIR_pn-bt-enable = "board-support/extra-drivers/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-bt-firmware = "1"
+SRCIPK_INSTALL_DIR_pn-bt-firmware = "board-support/extra-drivers/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-ti-compat-wireless-wl12xx = "1"
+SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl12xx = "board-support/extra-drivers/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-ti-compat-bluetooth = "1"
+SRCIPK_INSTALL_DIR_pn-ti-compat-bluetooth = "board-support/extra-drivers/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-wl1271-wlan-cli = "1"
+SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli = "example-applications/wlan"
+
+CREATE_SRCIPK_pn-av-examples = "1"
+SRCIPK_INSTALL_DIR_pn-av-examples = "example-applications/av-examples-${PV}"
+
+CREATE_SRCIPK_pn-u-boot = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-${UVER}-psp${PSPREL}"
+# For beagleboard we use the git version which doesn't define UVER
+SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard = "board-support/${P}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-x-load = "1"
+SRCIPK_INSTALL_DIR_pn-x-load = "board-support/x-load-${XVER}-psp${PSPREL}"
+# For beagleboard we use the git version which doesn't define XVER
+SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
+SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-omap3 = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap3 = "board-support/linux-${KVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omap3 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-am335x = "1"
+SRCIPK_INSTALL_DIR_pn-linux-am335x = "board-support/linux-${KVER}"
+SRCIPK_PACKAGE_ARCH_pn-linux-am335x = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-omap = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap = "board-support/linux-${PV}-${PR}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omap = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux = "1"
+SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}-${PR}"
+SRCIPK_PACKAGE_ARCH_pn-linux = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-stable = "1"
+SRCIPK_INSTALL_DIR_pn-linux-stable = "board-support/linux-${PV}-${PR}"
+SRCIPK_PACKAGE_ARCH_pn-linux-stable = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-omap4 = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omap4 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-davinci = "1"
+SRCIPK_INSTALL_DIR_pn-linux-davinci = "board-support/linux-${KVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-linux-davinci = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-omapl1 = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
+
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl = "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl = "example-applications/linux-driver-examples-${PV}"
+
+CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 = "example-applications/linux-driver-examples-${PV}"
+
+CREATE_SRCIPK_pn-ti-framework-components = "1"
+SRCIPK_INSTALL_DIR_pn-ti-framework-components = "component-sources/framework_components_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-framework-components = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codec-engine = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codec-engine = "component-sources/codec_engine_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codec-engine = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-omap3530 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 = "codecs-omap3530_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omap3530 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-linuxutils = "1"
+SRCIPK_INSTALL_DIR_pn-ti-linuxutils = "component-sources/linuxutils_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-linuxutils = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-xdctools = "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdctools = "component-sources/xdctools_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-xdctools = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dmai = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dmai = "dmai_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dmai = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-xdais = "1"
+SRCIPK_INSTALL_DIR_pn-ti-xdais = "component-sources/xdais_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-xdais = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-local-power-manager = "1"
+SRCIPK_INSTALL_DIR_pn-ti-local-power-manager = "local-power-manager_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-local-power-manager = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-dm355 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 = "codecs-dm355_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm355 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dvsdk-demos = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos = "dvsdk-demos_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dvsdk-demos = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dvtb = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dvtb = "dvtb_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dvtb = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-dm365 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 = "codecs-dm365_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm365 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dm365mm-module = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module = "dm365mm-module_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dm365mm-module = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-dm6446 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 = "codecs-dm6446_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm6446 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-dm6467 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 = "codecs-dm6467_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm6467 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-omapl137 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 = "codecs-omapl137_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omapl137 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-codecs-omapl138 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 = "codecs-omapl138_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omapl138 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-cgt6x = "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt6x = "dsp-devkit/cgt6x_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-cgt6x = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-cgt470 = "1"
+SRCIPK_INSTALL_DIR_pn-ti-cgt470 = "media-controller-devkit/cgt470_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-cgt470 = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dspbios = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dspbios = "dspbios_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dspbios = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-sysbios = "1"
+SRCIPK_INSTALL_DIR_pn-ti-sysbios = "component-sources/bios_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-sysbios = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-biosutils = "1"
+SRCIPK_INSTALL_DIR_pn-ti-biosutils = "biosutils_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-biosutils = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dsplink = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsplink = "dsplink_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dsplink = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-syslink = "1"
+SRCIPK_INSTALL_DIR_pn-ti-syslink = "component-sources/syslink_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-syslink = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-edma3lld = "1"
+SRCIPK_INSTALL_DIR_pn-ti-edma3lld = "component-sources/edma3lld_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-edma3lld = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-c6accel = "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6accel = "component-sources/c6accel_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-c6accel = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-biospsp = "1"
+SRCIPK_INSTALL_DIR_pn-ti-biospsp = "biospsp_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-biospsp = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-audio-soc-example = "1"
+SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example = "audio-soc-example_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-audio-soc-example = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-libgles-omap3 = "1"
+SRCIPK_INSTALL_DIR_pn-libgles-omap3 = "component-sources/graphics-sdk_${PV}"
+
+CREATE_SRCIPK_pn-ti-c6run = "1"
+SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-c6run = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-osal = "1"
+SRCIPK_INSTALL_DIR_pn-ti-osal = "component-sources/osal_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-osal = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-ipc = "1"
+SRCIPK_INSTALL_DIR_pn-ti-ipc = "component-sources/ipc_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-ipc = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-dsp-benchmark = "1"
+SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark = "example-applications/dsp-benchmark_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-dsp-benchmark = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-gstreamer-ti = "1"
+SRCIPK_INSTALL_DIR_pn-gstreamer-ti = "gstreamer-ti_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-gstreamer-ti = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-omx = "1"
+SRCIPK_INSTALL_DIR_pn-ti-omx = "component-sources/omx_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-omx = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-uia = "1"
+SRCIPK_INSTALL_DIR_pn-ti-uia = "component-sources/uia_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-uia = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-media-controller-utils = "1"
+SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils = "board-support/media-controller-utils_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-media-controller-utils = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-firmware-dm816x = "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x = "board-support/prebuilt-images/dm816x-firmware_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-firmware-dm816x = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-firmware-dm814x = "1"
+SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x = "board-support/prebuilt-images/dm814x-firmware_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-firmware-dm814x = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-slog = "1"
+SRCIPK_INSTALL_DIR_pn-ti-slog = "component-sources/slog_${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ti-slog = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ti-c674x-aaclcdec = "1"
+SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}${PVExtra}"
+SRCIPK_PACKAGE_ARCH_pn-ti-c674x-aaclcdec = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index cfef500..6a48b0a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -18,3 +18,5 @@ PREFERRED_VERSION_qt4-embedded = "4.8.0"
 PREFERRED_VERSION_qt4-native = "4.8.0"
 PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
 
+# Enable generation of source packages for SDKs
+require arago-source-ipk.conf
-- 
1.7.0.4


