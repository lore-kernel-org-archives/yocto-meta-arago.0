Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 19B75529CC
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2013 15:28:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BFSEmO020460
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFSDeq006913
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 11 Oct 2013 10:28:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFS8rt014685;
	Fri, 11 Oct 2013 10:28:12 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Oct 2013 11:16:25 -0500
Message-ID: <1381508186-30546-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1381508186-30546-1-git-send-email-fcooper@ti.com>
References: <1381508186-30546-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2 3/4] tisdk-install: Set MAKE_JOBS variable during SDK installation
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
X-List-Received-Date: Fri, 11 Oct 2013 15:28:15 -0000
Content-Type: text/plain

* At runtime determine the host's processor count and set MAKE_JOBS based on
  that value.
* This will allow building software within the SDK as fast as possible.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Instead of doing a variable replacement to set MAKE_JOBS append the MAKE_JOBS
string with the optimal value.

 .../tisdk-install/tisdk-install/sdk-install.sh     |    8 ++++++++
 .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
index b19b65f..39fbe82 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
@@ -63,6 +63,14 @@ sed -i -e s=__SDK__INSTALL_DIR__=$install_dir= $install_dir/Rules.make
 linux=`find $install_dir/board-support -maxdepth 1 -name "linux*"`
 linux=`basename $linux`
 sed -i -e s=__KERNEL_NAME__=$linux= $install_dir/Rules.make
+
+threads=`cat /proc/cpuinfo | grep -c processor`
+
+# Create a newline
+echo >> $install_dir/Rules.make
+# Set optimal value for the make file's -j option
+echo "MAKE_JOBS=$threads" >> $install_dir/Rules.make
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


