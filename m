Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EE0AD52A33
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 51A3040C2E;
	Sat, 29 Feb 2020 16:15:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4XUJIuVmgWRG; Sat, 29 Feb 2020 16:15:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C07740C20;
	Sat, 29 Feb 2020 16:15:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7532F174429;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:44 -0500
Message-Id: <1582992888-3508-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 5/9] ti-opencl: add aliases for opencl and opencl-runtime
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb | 12 ++++++++++++
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb  |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
new file mode 100644
index 0000000..20abf17
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
@@ -0,0 +1,12 @@
+# This is just an alias between debian and OE names
+
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES += "${PN}-runtime"
+
+RDEPENDS_${PN} = "opencl"
+RDEPENDS_${PN}-runtime = "opencl-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 1d5e286..95a8cca 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -37,7 +37,7 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl ti-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-- 
2.7.4


