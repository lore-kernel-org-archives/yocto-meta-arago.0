Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C4A4B5299E
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 18:01:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJI15Yv003133
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 12:01:05 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI15uL023153
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 12:01:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 12:01:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI0wlD010497;
	Tue, 19 Nov 2013 12:01:03 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Nov 2013 13:02:03 -0600
Message-ID: <1384887728-8628-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1384887728-8628-1-git-send-email-fcooper@ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/7] board-port-labs: Remove board port labs recipe
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
X-List-Received-Date: Tue, 19 Nov 2013 18:01:06 -0000
Content-Type: text/plain

* Since the board port labs will no longer be bundled within the SDK there is no
  need to keep these recipes around.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs-linux_git.bb   |   35 --------------------
 .../board-port-labs/board-port-labs-u-boot_git.bb  |   35 --------------------
 2 files changed, 0 insertions(+), 70 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
deleted file mode 100644
index 4ed1adf..0000000
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Git repositories containing sample board port code"
-HOMEPAGE = "https://gitorious.org/sitara-board-port"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit allarch
-
-CREATE_SRCIPK = "1"
-SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-linux"
-SRCIPK_PRESERVE_GIT = "true"
-
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH}"
-
-SRCREV = "30df33e7134ab507a339b89a864256cabfbddea1"
-
-S = "${WORKDIR}/git"
-
-adjust_git_prepend() {
-
-    # Checkout a specific branch instead of a commit that is used by default
-    git checkout ${BRANCH}
-}
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
deleted file mode 100644
index 5e68d30..0000000
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Git repositories containing sample board port code"
-HOMEPAGE = "https://gitorious.org/sitara-board-port"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-inherit allarch
-
-CREATE_SRCIPK = "1"
-SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-u-boot"
-SRCIPK_PRESERVE_GIT = "true"
-
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH}"
-
-SRCREV = "43a81af5ccddc67f9ed5f11664e5478f59574102"
-
-S = "${WORKDIR}/git"
-
-adjust_git_prepend() {
-
-    # Checkout a specific branch instead of a commit that is used by default
-    git checkout ${BRANCH}
-}
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-- 
1.7.0.4


