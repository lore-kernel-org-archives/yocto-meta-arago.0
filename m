Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A4D6952A9D
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 21:38:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MLcm09001542
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLcl4s028226
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:38:47 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLca8g016403;
	Thu, 22 Aug 2013 16:38:46 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2013 17:10:33 -0500
Message-ID: <1377209433-10830-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377209433-10830-1-git-send-email-fcooper@ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] packagegroup-arago-tisdk-amsdk-sdk-host: Use new board-port-labs recipe
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
X-List-Received-Date: Thu, 22 Aug 2013 21:38:48 -0000
Content-Type: text/plain

* Switch from using the old board-port-labs recipe to the new recipes.
* Delete old recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    5 ++-
 .../board-port-labs/board-port-labs/LICENSE        |   16 ----------
 .../board-port-labs/board-port-labs_git.bb         |   32 --------------------
 3 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 70f767d..94d8288 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup
 
@@ -24,7 +24,8 @@ RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    board-port-labs-src \
+    board-port-labs-u-boot-src \
+    board-port-labs-linux-src \
     ti-tisdk-makefile \
     ${U-BOOT_SRC} \
     ${KERNEL_SRC} \
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
deleted file mode 100644
index 738cb23..0000000
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
+++ /dev/null
@@ -1,16 +0,0 @@
-The trees found within this directory are git trees for the Linux
-kernel and u-boot.  These trees are based on the AM335x part and
-are meant to serve as a reference for general tasks involved in a board
-port.  These trees go along with the training available at:
-
-http://processors.wiki.ti.com/index.php/Sitara_Linux_Training
-
-Inside of each directory is a full git repository.  These repositories
-have tags that make isolating the changes for each functionality easier.
-You can view the tag using the "git tag" command and use "gitk --all"
-to better view the git tree contents.
-
-The individual trees are licensed under the same license as the Linux
-kernel and u-boot sources which is the GPLv2 license. A copy of license
-for the kernel and u-boot can be found in a file called COPYING within
-each of the respective git repositories.
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
deleted file mode 100644
index b7f7d29..0000000
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Git repositories containing sample board port code"
-HOMEPAGE = "https://gitorious.org/sitara-board-port"
-LICENSE = "GPLv2"
-DEPENDS += "git-native"
-
-SRC_URI = "file://LICENSE"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
-
-inherit allarch
-
-CREATE_SRCIPK = "1"
-SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
-
-PR = "r5"
-
-REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
-          git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
-         "
-
-S = "${WORKDIR}"
-
-# Checkout the REPOS before the do_patch task so that it will be done prior
-# to the srcipk being made.
-do_repos_checkout() {
-    cd ${S}
-    for r in ${REPOS}
-    do
-        git clone $r
-    done
-}
-
-addtask repos_checkout after do_fetch before do_patch
-- 
1.7.0.4


