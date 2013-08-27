Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 812AB52090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 19:18:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RJIEo3023811
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJIEDj023094
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 14:18:14 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJHxou028646;
	Tue, 27 Aug 2013 14:18:13 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Aug 2013 14:51:32 -0500
Message-ID: <1377633092-29917-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377633092-29917-1-git-send-email-fcooper@ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/6] board-port-labs: Remove old board-port-labs recipe
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
X-List-Received-Date: Tue, 27 Aug 2013 19:18:15 -0000
Content-Type: text/plain

* This recipe has been replaced by the new board-port-labs recipe

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs/LICENSE        |   16 ----------
 .../board-port-labs/board-port-labs_git.bb         |   32 --------------------
 2 files changed, 0 insertions(+), 48 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs/LICENSE
 delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb

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


