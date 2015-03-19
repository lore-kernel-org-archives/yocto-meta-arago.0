Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 14DB552099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 18:53:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JIrPqO025593
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 13:53:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JIrOUQ001986
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 13:53:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 13:53:24 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JIrNjQ020158;
	Thu, 19 Mar 2015 13:53:24 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YYfZL-00068J-EQ;
	Thu, 19 Mar 2015 14:53:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Mar 2015 14:53:22 -0400
Message-ID: <1426791202-23545-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
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
X-List-Received-Date: Thu, 19 Mar 2015 18:53:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../tisdk-install/tisdk-install/sdk-install.sh     |    6 ++++++
 .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index cf90089..65c5b69 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -102,6 +102,12 @@ then
     sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/unshallow-repositories.sh
 fi
 
+# Modify create-sdcard.sh to have user-supplied installation directory
+if [ -f "${install_dir}/bin/create-sdcard.sh" ]
+then
+    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g" ${install_dir}/bin/create-sdcard.sh
+fi
+
 # Update CCS project files using important paths to headers
 
 find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
index 83efd61..a3b88d9 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
 
 SRC_URI = "file://sdk-install.sh"
 
-PR = "r4"
+PR = "r5"
 
 do_install () {
     install -d ${D}/
-- 
1.7.9.5


