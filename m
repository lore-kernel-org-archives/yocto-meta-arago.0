Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ECEA752A9D
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 21:38:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MLcjNb008253
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:45 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLcjE8028209
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:38:45 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLca8f016403;
	Thu, 22 Aug 2013 16:38:43 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2013 17:10:32 -0500
Message-ID: <1377209433-10830-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377209433-10830-1-git-send-email-fcooper@ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] board-port-labs: Use new SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
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
X-List-Received-Date: Thu, 22 Aug 2013 21:38:46 -0000
Content-Type: text/plain

* Do to the inability to keep the git repository intact the board port labs
  recipe manually ran git clone which took a very long time every time the
  recipe was built.
* Using the new SRCIPK_PRESERVE_GIT feature in sourceipk.bbclass the
  repositories can now be treated like any other recipe and allow OE to handle
  the cloning and unpacking.
* This will significantly shorten the amount of time required to rebuild this
  recipe.
* Separate board-port-labs recipes into two.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass        |    1 -
 .../board-port-labs/board-port-labs-linux_git.bb   |   36 ++++++++++++++++++++
 .../board-port-labs/board-port-labs-u-boot_git.bb  |   36 ++++++++++++++++++++
 .../recipes-tisdk/board-port-labs/files/LICENSE    |   16 +++++++++
 4 files changed, 88 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/files/LICENSE

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 0f0c633..1ea0577 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -61,7 +61,6 @@ SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
 SRCIPK_PRESERVE_GIT ?= "false"
 
-# Remove git repositories before packaging up the sources
 adjust_git() {
 
     orig_dir="$PWD"
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
new file mode 100644
index 0000000..a105128
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-linux_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Git repositories containing sample board port code"
+HOMEPAGE = "https://gitorious.org/sitara-board-port"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
+
+inherit allarch
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "board-support/board-port-labs/sitara-board-port-linux"
+SRCIPK_PRESERVE_GIT = "true"
+
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH} \
+           file://LICENSE"
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
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
new file mode 100644
index 0000000..a66eaa4
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs-u-boot_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Git repositories containing sample board port code"
+HOMEPAGE = "https://gitorious.org/sitara-board-port"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
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
+SRC_URI = "git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH} \
+           file://LICENSE"
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
diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/files/LICENSE b/meta-arago-distro/recipes-tisdk/board-port-labs/files/LICENSE
new file mode 100644
index 0000000..738cb23
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/files/LICENSE
@@ -0,0 +1,16 @@
+The trees found within this directory are git trees for the Linux
+kernel and u-boot.  These trees are based on the AM335x part and
+are meant to serve as a reference for general tasks involved in a board
+port.  These trees go along with the training available at:
+
+http://processors.wiki.ti.com/index.php/Sitara_Linux_Training
+
+Inside of each directory is a full git repository.  These repositories
+have tags that make isolating the changes for each functionality easier.
+You can view the tag using the "git tag" command and use "gitk --all"
+to better view the git tree contents.
+
+The individual trees are licensed under the same license as the Linux
+kernel and u-boot sources which is the GPLv2 license. A copy of license
+for the kernel and u-boot can be found in a file called COPYING within
+each of the respective git repositories.
-- 
1.7.0.4


