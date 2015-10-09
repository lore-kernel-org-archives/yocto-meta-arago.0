Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8149352961
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 13:47:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99Dl2rU025288
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:47:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Dl2fC026960
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:47:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 08:47:02 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Dl1cS021157;
	Fri, 9 Oct 2015 08:47:02 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkY0j-0005Sa-Fi; Fri, 09 Oct 2015 09:47:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 09:47:00 -0400
Message-ID: <1444398420-20954-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] unshallow-repositories: Fix for 64-bit nativesdk
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
X-List-Received-Date: Fri, 09 Oct 2015 13:47:03 -0000
Content-Type: text/plain

* Use SDKMACHINE to obtain the location of the nativesdk git
  executable.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../unshallow-repositories/unshallow-repositories.sh                 | 2 +-
 .../unshallow-repositories/unshallow-repositories_1.0.bb             | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
index f20a9b5..61bdb88 100755
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
@@ -35,7 +35,7 @@
 install_dir="__SDK_INSTALL_DIR__"
 
 # Find git binary within the host native bin directory
-sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"
+sdk_git_bin="$install_dir/linux-devkit/sysroots/__SDKMACHINE__*/usr/bin/git"
 sdk_git_bin=`which $sdk_git_bin`
 
 if [ "$sdk_git_bin" = "" ]
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
index f1ea414..12fd4f2 100644
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
@@ -4,12 +4,15 @@ LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;m
 
 SRC_URI = "file://unshallow-repositories.sh"
 
-PR = "r0"
+PR = "r1"
 
 do_install () {
     install -d ${D}/
     install -d ${D}/bin
     install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
+
+    sed -i -e "s|__SDKMACHINE__|${SDKMACHINE}|g" \
+        ${D}/bin/unshallow-repositories.sh
 }
 
 FILES_${PN} = "/*"
-- 
1.9.1


