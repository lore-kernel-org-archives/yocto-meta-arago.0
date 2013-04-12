Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B86DC529C8
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:57:15 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKvD5s026450
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:57:14 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKvDnv019082
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:27:13 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:27:13 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKv9cW016412;
	Sat, 13 Apr 2013 02:27:12 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:57:06 -0500
Message-ID: <1365800227-25071-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365800227-25071-1-git-send-email-Chase.Maupin@ti.com>
References: <1365800227-25071-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] setup-defconfig: remove local copy
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
X-List-Received-Date: Fri, 12 Apr 2013 20:57:16 -0000
Content-Type: text/plain

* This is now available in meta-ti so there is no reason to
  keep a local copy in meta-arago

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-kernel/linux/setup-defconfig.inc       |   26 --------------------
 1 files changed, 0 insertions(+), 26 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc

diff --git a/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc
deleted file mode 100644
index fc5e18e..0000000
--- a/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-# Check the defconfig file and see if it points to an in kernel
-# defconfig that should be used, or if it is a complete config file
-
-addtask setup_defconfig before do_configure after do_patch
-do_setup_defconfig() {
-    # Always copy the defconfig file to .config to keep consistency
-    # between the case where there is a real config and the in kernel
-    # tree config
-    cp ${WORKDIR}/defconfig ${S}/.config
-}
-
-# define our own do_configure that will:
-#   1. Check the .config file and see if string use-kernel-config= is present
-#   2. If the use-kernel-config string is present parse out the config to use
-#      and run make ${config}
-#   3. else run yes '' | oe_runmake oldconfig like the default do_configure
-#      does
-do_configure() {
-    config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
-    if [ "x${config}" != "x" ]
-    then
-        oe_runmake ${config}
-    else
-        yes '' | oe_runmake oldconfig
-    fi
-}
-- 
1.7.0.4


