Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6C8CB529B0
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2013 15:10:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r77FAXPr032099
	for <meta-arago@arago-project.org>; Wed, 7 Aug 2013 10:10:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r77FAXdu011163
	for <meta-arago@arago-project.org>; Wed, 7 Aug 2013 10:10:33 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 7 Aug 2013 10:10:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK
	installation	script
Thread-Index: AQHOky8ugicT/Z8ZtUWSynCrPieT05mJ2brA
Date: Wed, 7 Aug 2013 15:10:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5164AF@DFLE08.ent.ti.com>
References: <1375819133-1835-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596963C9@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596963C9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] ti-tisdk-install: Move SDK installation	script
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
X-List-Received-Date: Wed, 07 Aug 2013 15:10:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The script wasn't doing anything special or clever so I figured I stick wit=
h a simply MIT license. Are you asking to add that license or a similar BSD=
 license to the script anyway or do you want the Copyright version I initia=
lly had?

> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, August 07, 2013 12:30 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK installat=
ion
> script
>=20
> Any issue with putting the license text in the shell script header?
>=20
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Wednesday, August 07, 2013 1:29 AM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH v2] ti-tisdk-install: Move SDK
> >installation script
> >
> >Several steps are required before an SDK image is ready to be used.
> >1. Extract toolchain sdk (linuxdevkit.sh) 2. Update Rules.make
> >variables.
> >3. Update CCS project information
> >
> >The script that sdk-install.sh is based on was previously packaged and
> >ran by the SDK installed (based on InstallJammer).
> >
> >By moving the logic outside of the installer. OE users can now create a
> >fully functioning SDK without any outside dependencies by simply
> >running sdk-install located in the root of the SDK image.
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> >Version 2 changes:
> >Remove debug mode (set -x)
> >Remove license since script is simple
> >
> > .../ti-tisdk-install/sdk-install.sh                |   85
> >++++++++++++++++++++
> > .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 ++++
> > 2 files changed, 100 insertions(+), 0 deletions(-)  create mode 100644
> >meta-arago-distro/recipes-tisdk/ti-tisdk-
> >install/ti-tisdk-install/sdk-install.sh
> > create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
> >install/ti-tisdk-install_1.0.bb
> >
> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
> >tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/ti-
> >tisdk-install/ti-tisdk-install/sdk-install.sh
> >new file mode 100644
> >index 0000000..a7cd1a7
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> >install/sdk-install.sh
> >@@ -0,0 +1,85 @@
> >+
> >+#!/bin/sh
> >+
> >+# Process command line...
> >+while [ $# -gt 0 ]; do
> >+  case $1 in
> >+    --install_dir)
> >+      shift;
> >+      install_dir=3D$1;
> >+      ;;
> >+     *)
> >+      shift;
> >+      ;;
> >+  esac
> >+done
> >+
> >+if [ "x$install_dir" =3D "x" ]; then
> >+    # Verify that the script is being called within untar SDK
> >directory
> >+    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ];
> >then
> >+        echo "Script must be called within untarred sdk
> >directory"
> >+        exit 1
> >+    else
> >+        install_dir=3D"$PWD"
> >+    fi
> >+fi
> >+
> >+# Get full path to SDK directory
> >+cd "$install_dir"
> >+install_dir=3D"$PWD"
> >+cd -
> >+
> >+if [ ! -d $install_dir ]; then
> >+	echo "Installation directory does not exist"
> >+	exit 1
> >+fi
> >+
> >+# Remove any .svn directories that were packaged by the
> >sourceipks
> >+rm -rf `find $install_dir -name ".svn"`
> >+
> >+
> >+# Update Rules.make variables
> >+
> >+sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D
> >$install_dir/Rules.make
> >+
> >+# Find the linux directory name
> >+linux=3D`find $install_dir/board-support -maxdepth 1 -name
> >"linux*"`
> >+linux=3D`basename $linux`
> >+sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make cd -
> >+
> >+
> >+# Install toolchain sdk
> >+$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
> >+
> >+# Remove toolchain sdk
> >+rm $install_dir/linux-devkit.sh
> >+
> >+
> >+# Update example applications CCS project files
> >+
> >+# Grab some essential variables from environment-setup TARGET_SYS=3D`se=
d
> >+-n 's/^export TARGET_SYS=3D//p' $install_dir/linux-
> >devkit/environment-setup`
> >+TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p'
> >$install_dir/linux-devkit/environment-setup`
> >+SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' $install_dir/linux-
> >devkit/environment-setup`
> >+
> >+# Grab toolchain's GCC version
> >+GCC_VERSION=3D`ls $install_dir/linux-
> >devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
> >+
> >+TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-
> >devkit/sysroots/$TARGET_SYS/usr/include"
> >+TOOLCHAIN_INCLUDE_DIR=3D"linux-
> >devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/i
> >nclude"
> >+
> >+# Update CCS project files using important paths to headers
> >+
> >+find $install_dir/example-applications -type f -exec sed -i
> >"s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_
> DIR|g"
> >{} \;
> >+find $install_dir/example-applications -type f -exec sed -i
> >"s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
> >+
> >+
> >+if [ -f "$install_dir/sdk-install.sh" ]; then
> >+	# File is only able to run once so delete it from the SDK
> >+	rm "$install_dir/sdk-install.sh"
> >+fi
> >+
> >+echo "Installation completed!"
> >+exit 0
> >+
> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
> >tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
> >install/ti-tisdk-install_1.0.bb
> >new file mode 100644
> >index 0000000..1c96ae5
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
> >install_1.0.bb
> >@@ -0,0 +1,15 @@
> >+DESCRIPTION =3D "Contains script to properly extract and update
> >various files"
> >+LICENSE =3D "MIT"
> >+LIC_FILES_CHKSUM =3D
> >"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4
> >de20420"
> >+
> >+SRC_URI =3D "file://sdk-install.sh"
> >+
> >+PR =3D "r0"
> >+
> >+do_install () {
> >+    install -d ${D}/
> >+    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
> >+
> >+}
> >+
> >+FILES_${PN} =3D "/*"
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

