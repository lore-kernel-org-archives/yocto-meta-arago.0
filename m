Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E1E5752A6A
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:06:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16E62oL019212
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:06:02 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E62u8023457
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:06:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 08:06:01 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5p5V011240;
	Thu, 6 Feb 2014 08:06:00 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 09:34:46 -0600
Message-ID: <1391700887-26166-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391700887-26166-1-git-send-email-fcooper@ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/5] tisdk-install: Use updated environment variable
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 14:06:03 -0000
Content-Type: text/plain

* The current script depends on an environment variable that no longer exist.
* Update the script to use the latest environment variable.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tisdk-install/tisdk-install/sdk-install.sh     |    4 ++--
 .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index 39fbe82..86799c1 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -84,14 +84,14 @@ rm $install_dir/linux-devkit.sh
 # Update example applications CCS project files
 
 # Grab some essential variables from environment-setup
-TARGET_SYS=`sed -n 's/^export TARGET_SYS=//p' $install_dir/linux-devkit/environment-setup`
+REAL_MULTIMACH_TARGET_SYS=`sed -n 's/^export REAL_MULTIMACH_TARGET_SYS=//p' $install_dir/linux-devkit/environment-setup`
 TOOLCHAIN_SYS=`sed -n 's/^export TOOLCHAIN_SYS=//p' $install_dir/linux-devkit/environment-setup`
 SDK_SYS=`sed -n 's/^export SDK_SYS=//p' $install_dir/linux-devkit/environment-setup`
 
 # Grab toolchain's GCC version
 GCC_VERSION=`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/`
 
-TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$TARGET_SYS/usr/include"
+TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/usr/include"
 TOOLCHAIN_INCLUDE_DIR="linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"
 
 # Update CCS project files using important paths to headers
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
index 886a6a6..9548ee5 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
 
 SRC_URI = "file://sdk-install.sh"
 
-PR = "r1"
+PR = "r2"
 
 do_install () {
     install -d ${D}/
-- 
1.7.0.4


