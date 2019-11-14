Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C1A8852A47
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 01:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A090F40BF3;
	Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RPHrbyJRVbkd; Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 769C940BF4;
	Thu, 14 Nov 2019 01:19:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 453C51742F1;
	Wed, 13 Nov 2019 20:19:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2019 20:18:58 -0500
Message-Id: <1573694338-30083-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573694338-30083-1-git-send-email-denis@denix.org>
References: <1573694338-30083-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 5/5] packagegroup-ti-world: list of packages to populate feeds
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
X-List-Received-Date: Thu, 14 Nov 2019 01:20:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-ti-world.bb         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
new file mode 100644
index 0000000..8457908
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Task to install graphics packages"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+CHROMIUM = ""
+CHROMIUM_append_omap-a15 = "\
+    chromium-wayland \
+"
+
+CHROMIUM_append_k3 = "\
+    chromium-wayland \
+"
+
+RDEPENDS_${PN} = "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    packagegroup-arago-test \
+    packagegroup-arago-test-addons \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
+    packagegroup-arago-tisdk-qte \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
+    packagegroup-arago-tisdk-connectivity \
+    packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
+    packagegroup-arago-tisdk-multimedia \
+    packagegroup-arago-tisdk-amsdk \
+    packagegroup-arago-tisdk-addons \
+    packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-tisdk-hmi \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
+"
-- 
2.7.4


