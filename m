Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7FF0752A7E
	for <meta-arago@arago-project.org>;
	Mon, 16 Feb 2015 21:30:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1GLUWaT020302
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1GLUVXU027970
	for <meta-arago@arago-project.org>; Mon, 16 Feb 2015 15:30:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Feb 2015 15:30:31 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1GLUUYj009798;	Mon, 16 Feb 2015 15:30:31 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1GLUOpo030075;	Tue, 17 Feb 2015 03:00:29 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Feb 2015 15:30:18 -0600
Message-ID: <1424122222-26709-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424122222-26709-1-git-send-email-fcooper@ti.com>
References: <1424122222-26709-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/8] tisdk-install: Add the installed SDK path to unshallow-repositories script
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
X-List-Received-Date: Mon, 16 Feb 2015 21:30:34 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This will insure no matter what the unshallow-repositories script is called
  it will always know the proper place to look

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tisdk-install/tisdk-install/sdk-install.sh     |    6 +++++-
 .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index c0284c7..cf90089 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -56,7 +56,6 @@ rm -rf `find $install_dir -name ".svn"`
 
 
 # Update Rules.make variables
-
 sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make 
 
 # Find the linux directory name
@@ -98,6 +97,11 @@ SDK_PATH_TARGET="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/"
 
 sed -i -e s=__SDK_PATH_TARGET__=$SDK_PATH_TARGET= $install_dir/Rules.make
 
+if [ -f "$install_dir/bin/unshallow-repositories.sh" ]
+then
+    sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/unshallow-repositories.sh
+fi
+
 # Update CCS project files using important paths to headers
 
 find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
index 98304b4..83efd61 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
 
 SRC_URI = "file://sdk-install.sh"
 
-PR = "r3"
+PR = "r4"
 
 do_install () {
     install -d ${D}/
-- 
1.7.9.5


