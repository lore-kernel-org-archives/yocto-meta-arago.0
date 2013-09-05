Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B5072529CA
	for <meta-arago@arago-project.org>;
	Thu,  5 Sep 2013 15:32:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r85FWCCn001345
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 10:32:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85FWCMk005061
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 10:32:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 5 Sep 2013 10:32:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r85FW7bY011625;
	Thu, 5 Sep 2013 10:32:11 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Sep 2013 11:08:35 -0500
Message-ID: <1378397315-14333-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1378397315-14333-1-git-send-email-fcooper@ti.com>
References: <1378397315-14333-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6 v3] board-port-labs-u-boot: Create new recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Thu, 05 Sep 2013 15:32:13 -0000
Content-Type: text/plain

* Do to the inability to keep the git repository intact the board port labs
  recipe manually ran git clone which took a long time every time the recipe was
  built.
* Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass the recipes
* can
  now be treated like any other recipe and allow OE to handle the cloning and
  unpacking.
* This will significantly shorten the amount of time required to rebuild this
  recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Use a specific commit instead of using AUTOREV

Version 2 changes:
Place recipe in its own patch.
Use U-boot's license.

 .../board-port-labs/board-port-labs-u-boot_git.bb  |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
new file mode 100644
index 0000000..5e68d30
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Git repositories containing sample board port code"
+HOMEPAGE = "https://gitorious.org/sitara-board-port"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+inherit allarch
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-u-boot"
+SRCIPK_PRESERVE_GIT = "true"
+
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "43a81af5ccddc67f9ed5f11664e5478f59574102"
+
+S = "${WORKDIR}/git"
+
+adjust_git_prepend() {
+
+    # Checkout a specific branch instead of a commit that is used by default
+    git checkout ${BRANCH}
+}
+
+do_configure() {
+    :
+}
+
+do_compile() {
+    :
+}
+
-- 
1.7.0.4


