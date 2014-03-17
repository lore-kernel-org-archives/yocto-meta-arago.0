Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8075252A17
	for <meta-arago@arago-project.org>;
	Mon, 17 Mar 2014 20:59:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2HKxbj9024229
	for <meta-arago@arago-project.org>; Mon, 17 Mar 2014 15:59:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2HKxbZQ003765
	for <meta-arago@arago-project.org>; Mon, 17 Mar 2014 15:59:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 17 Mar 2014 15:59:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix demos
	for keystone 2 platforms
Thread-Index: AQHPQhsgi0yHR9KAeES2AM4xgKlwGJrlwMYA
Date: Mon, 17 Mar 2014 20:59:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C667CEB@DFLE08.ent.ti.com>
References: <1393876893-10013-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015CF27ECA@DLEE11.ent.ti.com>
	<20140317184834.GQ12929@edge>
	<7D46E86EC0A8354091174257B2FED1015CF370DD@DLEE11.ent.ti.com>
	<20140317195720.GS12929@edge>
In-Reply-To: <20140317195720.GS12929@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] matrix-demos: Recipes for Matrix demos for keystone 2 platforms
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
X-List-Received-Date: Mon, 17 Mar 2014 20:59:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, March 17, 2014 2:57 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix demos =
for
> keystone 2 platforms
>=20
> On Mon, Mar 17, 2014 at 03:46:17PM -0400, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: Dmytriyenko, Denys
> > >Sent: Monday, March 17, 2014 1:49 PM
> > >To: Maupin, Chase
> > >Cc: Nelson, Sam; meta-arago@arago-project.org
> > >Subject: Re: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix
> > >demos for keystone 2 platforms
> > >
> > >On Fri, Mar 14, 2014 at 12:43:17PM +0000, Maupin, Chase wrote:
> > >> >-----Original Message-----
> > >> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >> >bounces@arago-project.org] On Behalf Of Nelson, Sam
> > >> >Sent: Monday, March 03, 2014 2:02 PM
> > >> >To: meta-arago@arago-project.org
> > >> >Subject: [meta-arago] [PATCH] matrix-demos: Recipes for Matrix
> > >> >demos for keystone 2 platforms
> > >> >
> > >> >- Recipes bring images and menus needed for keystone2 demos
> > >>
> > >> NAK
> > >>
> > >> These should be pushed to the shared matrix repositories.  There
> > >is no
> > >> reason to duplicate all these recipes and include files.  The
> > >purpose of
> > >> matrix being modular is to enable you to share and not fork.  If
> > >you add
> > >> these to the shared repo then you can create simple recipes to
> > >package you
> > >> individual demos and install those for ks2 devices.  Please
> > >refer to how
> > >> this is done for other devices.
> > >
> > >I don't get it. Specifically due to matrix being modular, it should
> > >be possible to have additional demos in separate repositories - the
> > >way it's done here. And the corresponding recipes that pull from
> > >those additional repositories and package them up for matrix to use.
> > >I don't see this as being a fork, I see this as being an out-of-tree
> > >extenstion. Getting those extensions in to the main tree has some
> > >benefits, but reduces control...
[Franklin] We generally have this only occur when there is a non SDK team t=
hat owns their application and Matrix demo that is pulled into an SDK. A go=
od example would be the Wilink demos. But there is no reasons why any team =
that owns their own sdk can't sure the Matrix repo.
> >
> > It also tends to reduce re-use.  I think it is first worth looking
> > into adding to the shared repo first.
>=20
> Then we should outline the process to get 3rd-party changes to the matrix
> repositories (patches, pull requests). Is Franklin the current owner?
[Franklin] No issue in adding things to matrix or the matrix apps repo.=20
In terms of processes we can follow the same approach we have taken for all=
 of our scripts which is just sending patches to this mailing list.=20

>=20
>=20
> > Also, even if you want an external repo for additions it seems strange =
that
> > the .inc files needed to be copied as well.  For example:
>=20
> Indeed, I was not commenting on the recipes themselves, but on the method
> to
> add additional functionality to the matrix. Recipes do require more work.
>=20
>=20
> > Matrix-gui-apps-ks2-git.inc is almost a direct copy of
> > matrix-gui-apps-git.inc with the SRC_URI and SRCREV changed.  At a
> mimimum
> > why not inherit matrix-gui-apps-git.inc and change those few settings f=
or
> > your demos, images, submenu, etc recipes to inherit.
> >
> > For matrix-gui-apps-ks2.inc there are also a few changes that could eit=
her
> > be common or look wrong and don't match the comments above the install
> > function.  I'll send some additional feedback on that section.  The mai=
n
> > changes I see are:
> > 	1. changing the .sh scripts to be installed into the
> > 	${MATRIX_APP_DIR}/$appdir/ directory instead of ${bindir}.  This is
> > 	contrary to all other matrix apps.
> > 	2. there seem to be .cgi files added and they are being installed into
> > 	the root of the ${MATRIX_APP_DIR} even though the directory
> > 	${MATRIX_APP_DIR}/$appdir/cgi-bin was created.
> >
> > These changed could be rolled into the generic .inc instead of forking.
> >
> > >
> > >
> > >> As a side note, if you were going to do tis you should break
> > >this up into
> > >> separate patches for the different recipes, not one mega patch
> > >adding
> > >> everything.  Also, you have recipes like matrix-gui-demos-demos
> > >which
> > >> doesn't seem right.
> > >>
> > >> >
> > >> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >> >---
> > >> > .../matrix/matrix-gui-apps-ks2-git.inc             |   13
> > >+++++
> > >> > .../matrix/matrix-gui-apps-ks2-images_2.0.bb       |   19
> > >> >++++++++
> > >> > .../recipes-core/matrix/matrix-gui-apps-ks2.inc    |   51
> > >> >++++++++++++++++++++
> > >> > .../matrix/matrix-gui-demos-demos_2.0.bb           |   18
> > >+++++++
> > >> > .../matrix/matrix-gui-submenus-ks2_2.0.bb          |   38
> > >> >+++++++++++++++
> > >> > .../matrix/matrix-gui-utility-demos_2.0.bb         |   18
> > >+++++++
> > >> > 6 files changed, 157 insertions(+)
> > >> > create mode 100755 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-apps-ks2-git.inc
> > >> > create mode 100644 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-apps-ks2-images_2.0.bb
> > >> > create mode 100755 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-apps-ks2.inc
> > >> > create mode 100755 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-demos-demos_2.0.bb
> > >> > create mode 100755 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-submenus-ks2_2.0.bb
> > >> > create mode 100755 meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-utility-demos_2.0.bb
> > >> >
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >apps-ks2-git.inc b/meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-apps-ks2-git.inc
> > >> >new file mode 100755
> > >> >index 0000000..4a7b21d
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> > >ks2-
> > >> >git.inc
> > >> >@@ -0,0 +1,13 @@
> > >> >+LICENSE =3D "CC-BY-SA"
> > >> >+#By default all Matrix v2 applications use the same license.
> > >> >+LICENSE_CHECKSUM =3D
> > >"LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> > >> >+LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> > >> >+
> > >> >+BRANCH ?=3D "master"
> > >> >+# commit corresponds to DEV.MATRIX.APPS.01.00.00.02
> > >> >+SRCREV =3D "7af0ec5ad5ca9464a981b1c9683ec66bb075331d"
> > >> >+SRC_URI =3D "git://git.ti.com/keystone-demos/matrix-
> > >> >apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> > >> >+INC_PR =3D "r0"
> > >> >+
> > >> >+# Pull in the base package for installing matrix applications
> > >> >+require matrix-gui-apps-ks2.inc
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >apps-ks2-images_2.0.bb b/meta-arago-extras/recipes-
> > >> >core/matrix/matrix-gui-apps-ks2-images_2.0.bb
> > >> >new file mode 100644
> > >> >index 0000000..cf69d81
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> > >ks2-
> > >> >images_2.0.bb
> > >> >@@ -0,0 +1,19 @@
> > >> >+DESCRIPTION =3D "Images package for Matrix GUI v2 Applications
> > >for
> > >> >Keystone II"
> > >> >+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
> > >> >demos/matrix-apps.git"
> > >> >+LICENSE =3D "CC-BY-SA"
> > >> >+
> > >> >+require matrix-gui-apps-ks2-git.inc
> > >> >+require matrix-gui-paths.inc
> > >> >+
> > >> >+PR =3D "${INC_PR}.0"
> > >> >+
> > >> >+inherit allarch
> > >> >+
> > >> >+S =3D "${WORKDIR}/git/images"
> > >> >+
> > >> >+do_install(){
> > >> >+    install -d ${D}${MATRIX_APP_DIR}
> > >> >+    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
> > >> >+}
> > >> >+
> > >> >+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >apps-ks2.inc b/meta-arago-extras/recipes-core/matrix/matrix-
> > >gui-
> > >> >apps-ks2.inc
> > >> >new file mode 100755
> > >> >index 0000000..fb3c866
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> > >> >ks2.inc
> > >> >@@ -0,0 +1,51 @@
> > >> >+require matrix-gui-paths.inc
> > >> >+
> > >> >+MATRIX_FILES_DIR ?=3D "${S}"
> > >> >+
> > >> >+# Append a generic function to the do_install step that will
> > >look
> > >> >in the
> > >> >+# MATRIX_FILES_DIR for .desktop files and then:
> > >> >+#   1.  Install all non-script files into the MATRIX_APP_DIR
> > >> >+#   2.  Install all script files into ${bindir}
> > >> >+do_install_append(){
> > >> >+    cd ${MATRIX_FILES_DIR}
> > >> >+    applist=3D`find . -name "*.desktop"`
> > >> >+
> > >> >+    for app in $applist
> > >> >+    do
> > >> >+        appdir=3D`dirname $app`
> > >> >+        install -d ${D}${MATRIX_APP_DIR}/$appdir
> > >> >+
> > >> >+        # Get the matrix metadata
> > >> >+        matrix_desktop=3D`find $appdir -type f -name
> > >"*.desktop"`
> > >> >+        for m in $matrix_desktop
> > >> >+        do
> > >> >+            install -m 0644 ${MATRIX_FILES_DIR}/$m
> > >> >${D}${MATRIX_APP_DIR}/$appdir/
> > >> >+        done
> > >> >+
> > >> >+        matrix_html=3D`find $appdir -type f -name  "*.html"`
> > >> >+        for m in $matrix_html
> > >> >+        do
> > >> >+            install -m 0644 ${MATRIX_FILES_DIR}/$m
> > >> >${D}${MATRIX_APP_DIR}/$appdir/
> > >> >+        done
> > >> >+
> > >> >+        # Get the script files as executables
> > >> >+        scripts=3D`find $appdir -type f -name "*.sh"`
> > >> >+        for s in $scripts
> > >> >+        do
> > >> >+            install -m 0755 ${MATRIX_FILES_DIR}/$s
> > >> >${D}${MATRIX_APP_DIR}/$appdir/
> > >> >+        done
> > >> >+
> > >> >+        # Get the cgi files as executables
> > >> >+        matrix_cgi=3D`find $appdir -type f -name "*.cgi"`
> > >> >+
> > >> >+        for c in $matrix_cgi
> > >> >+        do
> > >> >+            install -d ${D}${MATRIX_APP_DIR}/$appdir/cgi-bin
> > >> >+            install -m 0755 ${MATRIX_FILES_DIR}/$c
> > >> >${D}${MATRIX_APP_DIR}/$c
> > >> >+        done
> > >> >+    done
> > >> >+
> > >> >+    # Go back to the directory we started from in case there
> > >are
> > >> >+    # other appends.
> > >> >+    cd -
> > >> >+}
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >demos-demos_2.0.bb b/meta-arago-extras/recipes-
> > >core/matrix/matrix-
> > >> >gui-demos-demos_2.0.bb
> > >> >new file mode 100755
> > >> >index 0000000..eb89cca
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-demos-
> > >> >demos_2.0.bb
> > >> >@@ -0,0 +1,18 @@
> > >> >+DESCRIPTION =3D "Demo description for Matrix v2"
> > >> >+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
> > >> >demos/matrix-apps.git"
> > >> >+LICENSE =3D "CC-BY-SA"
> > >> >+
> > >> >+require matrix-gui-apps-ks2-git.inc
> > >> >+
> > >> >+PR =3D "${INC_PR}.0"
> > >> >+
> > >> >+inherit allarch
> > >> >+
> > >> >+S =3D "${WORKDIR}/git/demo_apps"
> > >> >+
> > >> >+PACKAGES +=3D "${PN}-demos"
> > >> >+
> > >> >+# Make sure crypto submenu and app images has been installed.
> > >> >Also make sure openssl is available
> > >> >+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images matrix-gui-
> > >> >submenus-ks2-demos"
> > >> >+
> > >> >+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >submenus-ks2_2.0.bb b/meta-arago-extras/recipes-
> > >> >core/matrix/matrix-gui-submenus-ks2_2.0.bb
> > >> >new file mode 100755
> > >> >index 0000000..2936ad1
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >submenus-
> > >> >ks2_2.0.bb
> > >> >@@ -0,0 +1,38 @@
> > >> >+DESCRIPTION =3D "Submenu packages for Matrix GUI v2 for Keystone
> > >> >II"
> > >> >+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
> > >> >demos/matrix-apps.git"
> > >> >+LICENSE =3D "CC-BY-SA"
> > >> >+
> > >> >+require matrix-gui-apps-ks2-git.inc
> > >> >+require matrix-gui-paths.inc
> > >> >+
> > >> >+# This package does not use a subdirectory as ${S} so we need
> > >to
> > >> >+# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-
> > >> >git.inc file
> > >> >+LIC_FILES_CHKSUM =3D
> > >> >"file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> > >> >+
> > >> >+PR =3D "${INC_PR}.0"
> > >> >+
> > >> >+# These packages make submenus in matrix and are not
> > >architecture
> > >> >specific
> > >> >+inherit allarch
> > >> >+
> > >> >+S =3D "${WORKDIR}/git"
> > >> >+
> > >> >+# List of submenus to build packages for
> > >> >+SUBMENUS =3D "utilities_submenu demos_submenu"
> > >> >+
> > >> >+do_install(){
> > >> >+    install -d ${D}${MATRIX_APP_DIR}
> > >> >+
> > >> >+    for x in ${SUBMENUS}
> > >> >+    do
> > >> >+        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
> > >> >+    done
> > >> >+}
> > >> >+
> > >> >+PACKAGES +=3D "${PN}-utility ${PN}-demos"
> > >> >+
> > >> >+# Make sure app images has been installed
> > >> >+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images"
> > >> >+
> > >> >+# Add the files for each submenu package
> > >> >+FILES_${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
> > >> >+FILES_${PN}-demos =3D "${MATRIX_APP_DIR}/demos_submenu/*"
> > >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> > >> >utility-demos_2.0.bb b/meta-arago-extras/recipes-
> > >> >core/matrix/matrix-gui-utility-demos_2.0.bb
> > >> >new file mode 100755
> > >> >index 0000000..8f769e9
> > >> >--- /dev/null
> > >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-
> > >> >demos_2.0.bb
> > >> >@@ -0,0 +1,18 @@
> > >> >+DESCRIPTION =3D "Utility app demo descriptions for Matrix v2"
> > >> >+HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-
> > >> >demos/matrix-apps.git"
> > >> >+LICENSE =3D "CC-BY-SA"
> > >> >+
> > >> >+require matrix-gui-apps-ks2-git.inc
> > >> >+
> > >> >+PR =3D "${INC_PR}.0"
> > >> >+
> > >> >+inherit allarch
> > >> >+
> > >> >+S =3D "${WORKDIR}/git/utility_apps"
> > >> >+
> > >> >+PACKAGES +=3D "${PN}-utility"
> > >> >+
> > >> >+# Make sure crypto submenu and app images has been installed.
> > >> >Also make sure openssl is available
> > >> >+RDEPENDS_${PN} +=3D "matrix-gui-apps-ks2-images matrix-gui-
> > >> >submenus-ks2-utility"
> > >> >+
> > >> >+FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> > >> >--
> > >> >1.7.9.5
> > >> >
> > >> >_______________________________________________
> > >> >meta-arago mailing list
> > >> >meta-arago@arago-project.org
> > >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >> _______________________________________________
> > >> meta-arago mailing list
> > >> meta-arago@arago-project.org
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

