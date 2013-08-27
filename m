Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6B94E52090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 19:18:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RJI95B008477
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:09 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJI91k023029
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 14:18:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJHxos028646;
	Tue, 27 Aug 2013 14:18:08 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Aug 2013 14:51:30 -0500
Message-ID: <1377633092-29917-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377633092-29917-1-git-send-email-fcooper@ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/6 v2] board-port-labs-u-boot: Create new recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Tue, 27 Aug 2013 19:18:10 -0000
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
Version 2 changes:
Place recipe in its own patch.
Use U-boot's license.

 .../board-port-labs/board-port-labs-u-boot_git.bb  |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
new file mode 100644
index 0000000..46e75bd
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
+SRCREV = "${AUTOREV}"
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


