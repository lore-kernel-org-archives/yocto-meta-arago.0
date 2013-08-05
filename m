Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7BAFC52998
	for <meta-arago@arago-project.org>;
	Mon,  5 Aug 2013 19:50:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r75JowAv011037
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 14:50:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r75Jow6h022034
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 14:50:58 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 5 Aug 2013 14:50:57 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r75JosrY009238;
	Mon, 5 Aug 2013 14:50:56 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Aug 2013 15:17:13 -0500
Message-ID: <1375733834-21322-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] ti-tisdk-install: Move SDK installation script
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
X-List-Received-Date: Mon, 05 Aug 2013 19:51:05 -0000
Content-Type: text/plain

Several steps are required before an SDK image is ready to be used.
1. Extract toolchain sdk (linuxdevkit.sh)
2. Update Rules.make variables.
3. Update CCS project information

The script that sdk-install.sh is based on was previously packaged and ran by
the SDK installed (based on InstallJammer).

By moving the logic outside of the installer. OE users can now create
a fully functioning SDK without any outside dependencies by simply running
sdk-install located in the root of the SDK image.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-install/sdk-install.sh                |   93 ++++++++++++++++++++
 .../ti-tisdk-install/ti-tisdk-install_1.0.bb       |   15 +++
 2 files changed, 108 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
new file mode 100644
index 0000000..ce34001
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install/sdk-install.sh
@@ -0,0 +1,93 @@
+#!/bin/sh
+
+set -x
+#
+#  (C) Copyright 2010 Texas Instrument Inc.  All rights reserved.
+#
+#  Author: Schuyler Patton, Texas Instrunents Inc.
+#
+#  Script to install TI SDK on User Platform
+#
+
+# Process command line...
+while [ $# -gt 0 ]; do
+  case $1 in
+    --install_dir)
+      shift;
+      install_dir=$1;
+      ;;
+     *)
+      shift;
+      ;;
+  esac
+done
+
+if [ "x$install_dir" = "x" ]; then
+    # Verify that the script is being called within untar SDK directory
+    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ]; then
+        echo "Script must be called within untarred sdk directory"
+        exit 1
+    else
+        install_dir="$PWD"
+    fi
+fi
+
+# Get full path to SDK directory
+cd "$install_dir"
+install_dir="$PWD"
+cd -
+
+if [ ! -d $install_dir ]; then
+	echo "Installation directory does not exist"
+	exit 1
+fi
+
+# Remove any .svn directories that were packaged by the sourceipks
+rm -rf `find $install_dir -name ".svn"`
+
+
+# Update Rules.make variables
+
+sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make 
+
+# Find the linux directory name
+linux=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
+linux=`basename $linux`
+sed -i -e s=__KERNEL_NAME__=$linux= $install_dir/Rules.make
+cd -
+
+
+# Install toolchain sdk
+$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
+
+# Remove toolchain sdk
+rm $install_dir/linux-devkit.sh
+
+
+# Update example applications CCS project files
+
+# Grab some essential variables from environment-setup
+TARGET_SYS=`sed -n 's/^export TARGET_SYS=//p' $install_dir/linux-devkit/environment-setup`
+TOOLCHAIN_SYS=`sed -n 's/^export TOOLCHAIN_SYS=//p' $install_dir/linux-devkit/environment-setup`
+SDK_SYS=`sed -n 's/^export SDK_SYS=//p' $install_dir/linux-devkit/environment-setup`
+
+# Grab toolchain's GCC version
+GCC_VERSION=`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
+
+TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$TARGET_SYS/usr/include"
+TOOLCHAIN_INCLUDE_DIR="linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"
+
+# Update CCS project files using important paths to headers
+
+find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
+find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
+
+
+if [ -f "$install_dir/sdk-install.sh" ]; then
+	# File is only able to run once so delete it from the SDK
+	rm "$install_dir/sdk-install.sh"
+fi
+
+echo "Installation completed!"
+exit 0
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb
new file mode 100644
index 0000000..1c96ae5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-install/ti-tisdk-install_1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Contains script to properly extract and update various files"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://sdk-install.sh"
+
+PR = "r0"
+
+do_install () {
+    install -d ${D}/
+    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
+
+}
+
+FILES_${PN} = "/*"
-- 
1.7.0.4


