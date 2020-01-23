Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B90D252995
	for <meta-arago@arago-project.org>;
	Thu, 23 Jan 2020 23:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 659DB409EB;
	Thu, 23 Jan 2020 23:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZyhzYdmwQ6_N; Thu, 23 Jan 2020 23:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4CAA4409DE;
	Thu, 23 Jan 2020 23:47:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F2A7A1743A7;
	Thu, 23 Jan 2020 18:47:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Jan 2020 18:47:15 -0500
Message-Id: <1579823235-3986-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] build-essential: add a debian-named alias for OE packagegroup
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
X-List-Received-Date: Thu, 23 Jan 2020 23:49:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/build-essential.bb | 7 +++++++
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb        | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/build-essential.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/build-essential.bb b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
new file mode 100644
index 0000000..c50053a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
@@ -0,0 +1,7 @@
+# This is just an alias between debian and OE names
+
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "packagegroup-core-buildessential"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index fb20b89..c1b69ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install graphics packages"
+SUMMARY = "TI World packagegroup"
 LICENSE = "MIT"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -18,7 +18,7 @@ CHROMIUM_append_k3 = "\
 
 DEVTOOLS = " \
     linux-libc-headers-dev \
-    packagegroup-core-buildessential \
+    build-essential \
     packagegroup-core-tools-debug \
     git \
 "
-- 
2.7.4


