Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6F56552998
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2013 04:12:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r764CoWY020205
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 23:12:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r764CoZe016320
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 23:12:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 5 Aug 2013 23:12:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] ti-tisdk-install: Move SDK
	installation	script
Thread-Index: AQHOkhUj9pEIT23NP0C/Lc52F76v1ZmHkf2A
Date: Tue, 6 Aug 2013 04:12:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159693928@DLEE11.ent.ti.com>
References: <1375733834-21322-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1375733834-21322-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ti-tisdk-install: Move SDK installation	script
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
X-List-Received-Date: Tue, 06 Aug 2013 04:12:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Any particular reason for the set -x?  Also, why not throw the licensing he=
ader in at the top?  Aside from that this is OK by me.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 06, 2013 1:47 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 1/2] ti-tisdk-install: Move SDK
>installation script
>
>Several steps are required before an SDK image is ready to be
>used.
>1. Extract toolchain sdk (linuxdevkit.sh)
>2. Update Rules.make variables.
>3. Update CCS project information
>
>The script that sdk-install.sh is based on was previously packaged
>and ran by
>the SDK installed (based on InstallJammer).
>
>By moving the logic outside of the installer. OE users can now
>create
>a fully functioning SDK without any outside dependencies by simply
>running
>sdk-install located in the root of the SDK image.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-install/sdk-install.sh                |   93
>++++++++++++++++++++
> .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 +++
> 2 files changed, 108 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
>install/ti-tisdk-install/sdk-install.sh
> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
>install/ti-tisdk-install_1.0.bb
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
>tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/ti-
>tisdk-install/ti-tisdk-install/sdk-install.sh
>new file mode 100644
>index 0000000..ce34001
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
>install/sdk-install.sh
>@@ -0,0 +1,93 @@
>+#!/bin/sh
>+
>+set -x
>+#
>+#  (C) Copyright 2010 Texas Instrument Inc.  All rights reserved.
>+#
>+#  Author: Schuyler Patton, Texas Instrunents Inc.
>+#
>+#  Script to install TI SDK on User Platform
>+#
>+
>+# Process command line...
>+while [ $# -gt 0 ]; do
>+  case $1 in
>+    --install_dir)
>+      shift;
>+      install_dir=3D$1;
>+      ;;
>+     *)
>+      shift;
>+      ;;
>+  esac
>+done
>+
>+if [ "x$install_dir" =3D "x" ]; then
>+    # Verify that the script is being called within untar SDK
>directory
>+    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ];
>then
>+        echo "Script must be called within untarred sdk
>directory"
>+        exit 1
>+    else
>+        install_dir=3D"$PWD"
>+    fi
>+fi
>+
>+# Get full path to SDK directory
>+cd "$install_dir"
>+install_dir=3D"$PWD"
>+cd -
>+
>+if [ ! -d $install_dir ]; then
>+	echo "Installation directory does not exist"
>+	exit 1
>+fi
>+
>+# Remove any .svn directories that were packaged by the
>sourceipks
>+rm -rf `find $install_dir -name ".svn"`
>+
>+
>+# Update Rules.make variables
>+
>+sed -i -e s=3D__SDK__INSTALL_DIR__=3D$install_dir=3D
>$install_dir/Rules.make
>+
>+# Find the linux directory name
>+linux=3D`find $install_dir/board-support -maxdepth 1 -name
>"linux*"`
>+linux=3D`basename $linux`
>+sed -i -e s=3D__KERNEL_NAME__=3D$linux=3D $install_dir/Rules.make
>+cd -
>+
>+
>+# Install toolchain sdk
>+$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
>+
>+# Remove toolchain sdk
>+rm $install_dir/linux-devkit.sh
>+
>+
>+# Update example applications CCS project files
>+
>+# Grab some essential variables from environment-setup
>+TARGET_SYS=3D`sed -n 's/^export TARGET_SYS=3D//p' $install_dir/linux-
>devkit/environment-setup`
>+TOOLCHAIN_SYS=3D`sed -n 's/^export TOOLCHAIN_SYS=3D//p'
>$install_dir/linux-devkit/environment-setup`
>+SDK_SYS=3D`sed -n 's/^export SDK_SYS=3D//p' $install_dir/linux-
>devkit/environment-setup`
>+
>+# Grab toolchain's GCC version
>+GCC_VERSION=3D`ls $install_dir/linux-
>devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
>+
>+TOOLCHAIN_TARGET_INCLUDE_DIR=3D"linux-
>devkit/sysroots/$TARGET_SYS/usr/include"
>+TOOLCHAIN_INCLUDE_DIR=3D"linux-
>devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/i
>nclude"
>+
>+# Update CCS project files using important paths to headers
>+
>+find $install_dir/example-applications -type f -exec sed -i
>"s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g"
>{} \;
>+find $install_dir/example-applications -type f -exec sed -i
>"s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
>+
>+
>+if [ -f "$install_dir/sdk-install.sh" ]; then
>+	# File is only able to run once so delete it from the SDK
>+	rm "$install_dir/sdk-install.sh"
>+fi
>+
>+echo "Installation completed!"
>+exit 0
>+
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-
>tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>install/ti-tisdk-install_1.0.bb
>new file mode 100644
>index 0000000..1c96ae5
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-
>install_1.0.bb
>@@ -0,0 +1,15 @@
>+DESCRIPTION =3D "Contains script to properly extract and update
>various files"
>+LICENSE =3D "MIT"
>+LIC_FILES_CHKSUM =3D
>"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4
>de20420"
>+
>+SRC_URI =3D "file://sdk-install.sh"
>+
>+PR =3D "r0"
>+
>+do_install () {
>+    install -d ${D}/
>+    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
>+
>+}
>+
>+FILES_${PN} =3D "/*"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

