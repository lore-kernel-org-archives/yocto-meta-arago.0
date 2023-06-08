Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5380DC7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:41:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3678.1686253264505667027
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 12:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cK4qjP8u;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358Jf3K1018398
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686253263;
	bh=O/mLSZEXgc31K6FtdEbUWz6hjqUavlZ9hFXC2iVDxW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cK4qjP8uJytndgAppk0UQK24qsXrJ5u1qHrBfrXhf1/0CUSGIVXtTQqGWwlQmmyda
	 tIRHPsNz0MytMSbjQQU7m/ubXfoyC8gIywaxy2yXWPL6VKXy/Ss7HkekvHnQO84b6D
	 u6q2ILetHjspdjvBdMEJ3SSRp9CyTwDJZUj0Mi34=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Jf3tu011726
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 14:41:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 14:41:02 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358JewG6082933;
	Thu, 8 Jun 2023 14:41:01 -0500
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        <praneeth@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-install: Remove tisdk-install from meta-arago
Date: Fri, 9 Jun 2023 01:10:35 +0530
Message-ID: <20230608194036.906437-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608194036.906437-1-a-limaye@ti.com>
References: <20230608194036.906437-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 19:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14554

From: Aniket Limaye <a-limaye@ti.com>

- Same as ti-tisdk-setup scripts that were removed recently, this too
  should be removed from here...  Maintain in respctive SDK layers
  along with other SDK deliverables/scripts

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../tisdk-install/sdk-install.sh              | 129 ------------------
 .../tisdk-install/tisdk-install_1.0.bb        |  15 --
 2 files changed, 144 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
deleted file mode 100644
index d195d51e..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ /dev/null
@@ -1,129 +0,0 @@
-#!/bin/sh
-
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-# THE SOFTWARE.
-
-# Process command line...
-while [ $# -gt 0 ]; do
-  case $1 in
-    --install_dir)
-      shift;
-      install_dir=$1;
-      ;;
-     *)
-      shift;
-      ;;
-  esac
-done
-
-if [ "x$install_dir" = "x" ]; then
-    # Verify that the script is being called within untar SDK directory
-    if [ ! -d "$PWD/board-support" -a ! -f "$PWD/Rules.make" ]; then
-        echo "Script must be called within untarred sdk directory"
-        exit 1
-    else
-        install_dir="$PWD"
-    fi
-fi
-
-# Get full path to SDK directory
-cd "$install_dir"
-install_dir="$PWD"
-cd -
-
-if [ ! -d $install_dir ]; then
-	echo "Installation directory does not exist"
-	exit 1
-fi
-
-# Remove any .svn directories that were packaged by the sourceipks
-rm -rf `find $install_dir -name ".svn"`
-
-
-# Update Rules.make variables
-sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make 
-
-# Find the linux directory name
-linux=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
-linux=`basename $linux`
-sed -i -e s=__KERNEL_NAME__=$linux= $install_dir/Rules.make
-
-threads=`cat /proc/cpuinfo | grep -c processor`
-
-# Create a newline
-echo >> $install_dir/Rules.make
-# Set optimal value for the make file's -j option
-echo "MAKE_JOBS=$threads" >> $install_dir/Rules.make
-
-cd -
-
-
-# Install toolchain sdk
-$install_dir/linux-devkit.sh -y -d $install_dir/linux-devkit
-
-# Remove toolchain sdk
-rm $install_dir/linux-devkit.sh
-
-
-# Update example applications CCS project files
-
-# Grab some essential variables from environment-setup
-REAL_MULTIMACH_TARGET_SYS=`sed -n 's/^export REAL_MULTIMACH_TARGET_SYS=//p' $install_dir/linux-devkit/environment-setup`
-TOOLCHAIN_SYS=`sed -n 's/^export TOOLCHAIN_SYS=//p' $install_dir/linux-devkit/environment-setup`
-SDK_SYS=`sed -n 's/^export SDK_SYS=//p' $install_dir/linux-devkit/environment-setup`
-
-# Grab toolchain's GCC version
-GCC_VERSION=`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
-
-TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/usr/include"
-TOOLCHAIN_INCLUDE_DIR="linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"
-
-SDK_PATH_TARGET="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/"
-
-sed -i -e s=__SDK_PATH_TARGET__=$SDK_PATH_TARGET= $install_dir/Rules.make
-
-if [ -f "$install_dir/bin/unshallow-repositories.sh" ]
-then
-    sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/unshallow-repositories.sh
-fi
-
-if [ -f "$install_dir/bin/create-ubifs.sh" ]
-then
-    sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/create-ubifs.sh
-fi
-
-# Modify create-sdcard.sh to have user-supplied installation directory
-if [ -f "${install_dir}/bin/create-sdcard.sh" ]
-then
-    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g" ${install_dir}/bin/create-sdcard.sh
-fi
-
-# Update CCS project files using important paths to headers
-
-find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
-find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_INCLUDE_DIR>|$TOOLCHAIN_INCLUDE_DIR|g" {} \;
-
-
-if [ -f "$install_dir/sdk-install.sh" ]; then
-	# File is only able to run once so delete it from the SDK
-	rm "$install_dir/sdk-install.sh"
-fi
-
-echo "Installation completed!"
-exit 0
-
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
deleted file mode 100644
index da8ecce0..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Contains script to properly extract and update various files"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b89903784b8d154cd8b631388da4f0d"
-
-SRC_URI = "file://sdk-install.sh"
-
-PR = "r6"
-
-do_install () {
-    install -d ${D}/
-    install  ${WORKDIR}/sdk-install.sh ${D}/sdk-install.sh
-
-}
-
-FILES:${PN} = "/*"
-- 
2.34.1


