Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E4F6852A61
	for <meta-arago@arago-project.org>;
	Mon, 17 Mar 2014 19:58:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2HJw2JA001484
	for <meta-arago@arago-project.org>; Mon, 17 Mar 2014 14:58:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2HJw2cJ023354
	for <meta-arago@arago-project.org>; Mon, 17 Mar 2014 14:58:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Mon, 17 Mar 2014 14:58:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix demos
	for	keystone 2 platforms
Thread-Index: AQHPNxtmt2sDUzCL20CGU2uKM74OEZrlxQDA
Date: Mon, 17 Mar 2014 19:58:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF371D8@DLEE11.ent.ti.com>
References: <1393876893-10013-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1393876893-10013-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-demos: Recipes for Matrix demos for	keystone 2 platforms
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
X-List-Received-Date: Mon, 17 Mar 2014 19:58:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, March 03, 2014 2:02 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix
>demos for keystone 2 platforms
>
>- Recipes bring images and menus needed for keystone2 demos
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../matrix/matrix-gui-apps-ks2-git.inc             |   13 +++++
> .../matrix/matrix-gui-apps-ks2-images_2.0.bb       |   19
>++++++++
> .../recipes-core/matrix/matrix-gui-apps-ks2.inc    |   51
>++++++++++++++++++++
> .../matrix/matrix-gui-demos-demos_2.0.bb           |   18 +++++++
> .../matrix/matrix-gui-submenus-ks2_2.0.bb          |   38
>+++++++++++++++
> .../matrix/matrix-gui-utility-demos_2.0.bb         |   18 +++++++
> 6 files changed, 157 insertions(+)
> create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-
>gui-apps-ks2-git.inc
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
>gui-apps-ks2-images_2.0.bb
> create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-
>gui-apps-ks2.inc
> create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-
>gui-demos-demos_2.0.bb
> create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-
>gui-submenus-ks2_2.0.bb
> create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-
>gui-utility-demos_2.0.bb
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-ks2-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-
>gui-apps-ks2-git.inc
>new file mode 100755
>index 0000000..4a7b21d
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-
>git.inc
>@@ -0,0 +1,13 @@
>+LICENSE =3D "CC-BY-SA"
>+#By default all Matrix v2 applications use the same license.
>+LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>+LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>+
>+BRANCH ?=3D "master"
>+# commit corresponds to DEV.MATRIX.APPS.01.00.00.02
>+SRCREV =3D "7af0ec5ad5ca9464a981b1c9683ec66bb075331d"
>+SRC_URI =3D "git://git.ti.com/keystone-demos/matrix-
>apps.git;protocol=3Dgit;branch=3D${BRANCH}"
>+INC_PR =3D "r0"

Why not re-use matrix-gui-apps-git.inc for most of this file and change onl=
y the SRCREV and SRC_URI settings?

>+
>+# Pull in the base package for installing matrix applications
>+require matrix-gui-apps-ks2.inc

Re-use the matrix-gui-apps.inc file.  See comments below.

>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-ks2-images_2.0.bb b/meta-arago-extras/recipes-
>core/matrix/matrix-gui-apps-ks2-images_2.0.bb
>new file mode 100644
>index 0000000..cf69d81
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-
>images_2.0.bb
>@@ -0,0 +1,19 @@
>+DESCRIPTION =3D "Images package for Matrix GUI v2 Applications for
>Keystone II"
>+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
>demos/matrix-apps.git"
>+LICENSE =3D "CC-BY-SA"
>+
>+require matrix-gui-apps-ks2-git.inc
>+require matrix-gui-paths.inc
>+
>+PR =3D "${INC_PR}.0"
>+
>+inherit allarch
>+
>+S =3D "${WORKDIR}/git/images"
>+
>+do_install(){
>+    install -d ${D}${MATRIX_APP_DIR}
>+    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
>+}
>+
>+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-ks2.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-ks2.inc
>new file mode 100755
>index 0000000..fb3c866
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>ks2.inc
>@@ -0,0 +1,51 @@
>+require matrix-gui-paths.inc
>+
>+MATRIX_FILES_DIR ?=3D "${S}"
>+
>+# Append a generic function to the do_install step that will look
>in the
>+# MATRIX_FILES_DIR for .desktop files and then:
>+#   1.  Install all non-script files into the MATRIX_APP_DIR
>+#   2.  Install all script files into ${bindir}

These comments do not match the function below.

>+do_install_append(){
>+    cd ${MATRIX_FILES_DIR}
>+    applist=3D`find . -name "*.desktop"`
>+
>+    for app in $applist
>+    do
>+        appdir=3D`dirname $app`
>+        install -d ${D}${MATRIX_APP_DIR}/$appdir
>+
>+        # Get the matrix metadata
>+        matrix_desktop=3D`find $appdir -type f -name  "*.desktop"`

Isn't the .desktop file already known as $app at this point?

>+        for m in $matrix_desktop
>+        do
>+            install -m 0644 ${MATRIX_FILES_DIR}/$m
>${D}${MATRIX_APP_DIR}/$appdir/
>+        done
>+
>+        matrix_html=3D`find $appdir -type f -name  "*.html"`
>+        for m in $matrix_html
>+        do
>+            install -m 0644 ${MATRIX_FILES_DIR}/$m
>${D}${MATRIX_APP_DIR}/$appdir/
>+        done
>+
>+        # Get the script files as executables
>+        scripts=3D`find $appdir -type f -name "*.sh"`
>+        for s in $scripts
>+        do
>+            install -m 0755 ${MATRIX_FILES_DIR}/$s
>${D}${MATRIX_APP_DIR}/$appdir/
>+        done

Why change these from being installed in ${bindir} like other matrix app he=
lper scripts?  This way user's can easily run the scripts as they are alrea=
dy in the PATH.

>+
>+        # Get the cgi files as executables
>+        matrix_cgi=3D`find $appdir -type f -name "*.cgi"`
>+
>+        for c in $matrix_cgi
>+        do
>+            install -d ${D}${MATRIX_APP_DIR}/$appdir/cgi-bin

Why create this directory and not use it?

>+            install -m 0755 ${MATRIX_FILES_DIR}/$c
>${D}${MATRIX_APP_DIR}/$c

Is this the right place for your cgi files?

>+        done
>+    done
>+
>+    # Go back to the directory we started from in case there are
>+    # other appends.
>+    cd -

Overall it seems like if your only addition is that you may have cgi files =
you would be better off adding that support to the orignal .inc file

>+}
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>demos-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-
>gui-demos-demos_2.0.bb
>new file mode 100755
>index 0000000..eb89cca
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-demos-
>demos_2.0.bb
>@@ -0,0 +1,18 @@
>+DESCRIPTION =3D "Demo description for Matrix v2"
>+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
>demos/matrix-apps.git"
>+LICENSE =3D "CC-BY-SA"
>+
>+require matrix-gui-apps-ks2-git.inc
>+
>+PR =3D "${INC_PR}.0"
>+
>+inherit allarch
>+
>+S =3D "${WORKDIR}/git/demo_apps"
>+
>+PACKAGES +=3D "${PN}-demos"
>+
>+# Make sure crypto submenu and app images has been installed.
>Also make sure openssl is available
>+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images matrix-gui-
>submenus-ks2-demos"
>+
>+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>submenus-ks2_2.0.bb b/meta-arago-extras/recipes-
>core/matrix/matrix-gui-submenus-ks2_2.0.bb
>new file mode 100755
>index 0000000..2936ad1
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-
>ks2_2.0.bb
>@@ -0,0 +1,38 @@
>+DESCRIPTION =3D "Submenu packages for Matrix GUI v2 for Keystone
>II"
>+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
>demos/matrix-apps.git"
>+LICENSE =3D "CC-BY-SA"
>+
>+require matrix-gui-apps-ks2-git.inc
>+require matrix-gui-paths.inc
>+
>+# This package does not use a subdirectory as ${S} so we need to
>+# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-
>git.inc file
>+LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>+
>+PR =3D "${INC_PR}.0"
>+
>+# These packages make submenus in matrix and are not architecture
>specific
>+inherit allarch
>+
>+S =3D "${WORKDIR}/git"
>+
>+# List of submenus to build packages for
>+SUBMENUS =3D "utilities_submenu demos_submenu"
>+
>+do_install(){
>+    install -d ${D}${MATRIX_APP_DIR}
>+
>+    for x in ${SUBMENUS}
>+    do
>+        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
>+    done
>+}
>+
>+PACKAGES +=3D "${PN}-utility ${PN}-demos"
>+
>+# Make sure app images has been installed
>+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images"
>+
>+# Add the files for each submenu package
>+FILES_${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
>+FILES_${PN}-demos =3D "${MATRIX_APP_DIR}/demos_submenu/*"
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>utility-demos_2.0.bb b/meta-arago-extras/recipes-
>core/matrix/matrix-gui-utility-demos_2.0.bb
>new file mode 100755
>index 0000000..8f769e9
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-
>demos_2.0.bb
>@@ -0,0 +1,18 @@
>+DESCRIPTION =3D "Utility app demo descriptions for Matrix v2"
>+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
>demos/matrix-apps.git"
>+LICENSE =3D "CC-BY-SA"
>+
>+require matrix-gui-apps-ks2-git.inc
>+
>+PR =3D "${INC_PR}.0"
>+
>+inherit allarch
>+
>+S =3D "${WORKDIR}/git/utility_apps"
>+
>+PACKAGES +=3D "${PN}-utility"
>+
>+# Make sure crypto submenu and app images has been installed.
>Also make sure openssl is available
>+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images matrix-gui-
>submenus-ks2-utility"
>+
>+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

