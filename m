Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CD4BA52974
	for <meta-arago@arago-project.org>;
	Thu, 15 Oct 2015 12:38:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9FCcait013231
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 07:38:37 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FCcanK010130
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 07:38:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Oct 2015 07:38:36 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FCcaoZ011575;
	Thu, 15 Oct 2015 07:38:36 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zmhno-00007k-2v; Thu, 15 Oct 2015 08:38:36 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Oct 2015 08:38:33 -0400
Message-ID: <1444912713-439-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] unshallow-repositories: Fix for 64-bit nativesdk
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
X-List-Received-Date: Thu, 15 Oct 2015 12:38:38 -0000
Content-Type: text/plain

* Generalize sysroot pattern to match native sysroot regardless of
  whether it is 32 or 64 bit.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Use a more general pattern to match native sysroot instead of
  modifying the script in the recipe.

 .../unshallow-repositories/unshallow-repositories.sh                    | 2 +-
 .../recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
index f20a9b5..7e578be 100755
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
@@ -35,7 +35,7 @@
 install_dir="__SDK_INSTALL_DIR__"
 
 # Find git binary within the host native bin directory
-sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"
+sdk_git_bin="$install_dir/linux-devkit/sysroots/*86*-linux/usr/bin/git"
 sdk_git_bin=`which $sdk_git_bin`
 
 if [ "$sdk_git_bin" = "" ]
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
index f1ea414..7873587 100644
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;m
 
 SRC_URI = "file://unshallow-repositories.sh"
 
-PR = "r0"
+PR = "r1"
 
 do_install () {
     install -d ${D}/
-- 
1.9.1


