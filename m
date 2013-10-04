Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A16375296F
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 22:53:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94MrxR3032288
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 17:53:59 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94Mrxb9026262
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 17:53:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 17:53:58 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94MroGT012407;
	Fri, 4 Oct 2013 17:53:57 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Oct 2013 18:39:55 -0500
Message-ID: <1380929996-30089-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1380929996-30089-1-git-send-email-fcooper@ti.com>
References: <1380929996-30089-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] tisdk-install: Set MAKE_JOBS variable during SDK installation
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
X-List-Received-Date: Fri, 04 Oct 2013 22:53:59 -0000
Content-Type: text/plain

* At runtime determine the host's processor count and set MAKE_JOBS based on
  that value.
* This will allow building software within the SDK as fast as possible.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tisdk-install/tisdk-install/sdk-install.sh     |    4 ++++
 .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index b19b65f..f5b7d55 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -63,6 +63,10 @@ sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make
 linux=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
 linux=`basename $linux`
 sed -i -e s=__KERNEL_NAME__=$linux= $install_dir/Rules.make
+
+threads=`cat /proc/cpuinfo | grep -c processor`
+sed -i -e s=__MAKE_JOBS__=$threads= $install_dir/Rules.make
+
 cd -
 
 
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
index 26a6966..886a6a6 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
 
 SRC_URI = "file://sdk-install.sh"
 
-PR = "r0"
+PR = "r1"
 
 do_install () {
     install -d ${D}/
-- 
1.7.0.4


