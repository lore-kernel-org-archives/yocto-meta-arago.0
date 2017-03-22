Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6A85552A90
	for <meta-arago@arago-project.org>;
	Wed, 22 Mar 2017 01:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 178CD20B7B;
	Wed, 22 Mar 2017 01:37:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VBj_qyxGqTyN; Wed, 22 Mar 2017 01:37:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB503208E3;
	Wed, 22 Mar 2017 01:37:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 80A19162412;
	Tue, 21 Mar 2017 21:37:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 21 Mar 2017 21:37:42 -0400
Message-Id: <1490146662-37726-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libnl: update bbappend for 3.2.29
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
X-List-Received-Date: Wed, 22 Mar 2017 01:37:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend | 8 --------
 meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
 create mode 100644 meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
deleted file mode 100644
index db716cc..0000000
--- a/meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR_append = ".arago0"
-
-do_install_append() {
-#   Install private files to allow libnl extensions
-    install -d ${D}${includedir}/netlink-private
-    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
-    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
-}
diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend
new file mode 100644
index 0000000..db716cc
--- /dev/null
+++ b/meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+do_install_append() {
+#   Install private files to allow libnl extensions
+    install -d ${D}${includedir}/netlink-private
+    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
+    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
+}
-- 
2.7.4


