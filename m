Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B3146529DC
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2020 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E7FB240A52;
	Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fD3c3P6ND4Rk; Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B886E40C10;
	Wed,  5 Feb 2020 16:24:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6E27B1743DA;
	Wed,  5 Feb 2020 11:24:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  5 Feb 2020 11:24:46 -0500
Message-Id: <1580919886-43718-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580919886-43718-1-git-send-email-denis@denix.org>
References: <1580919886-43718-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 3/3] ti-opecl: make alias machine-specific and depend on "dsp" feature
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
X-List-Received-Date: Wed, 05 Feb 2020 16:26:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb | 2 ++
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb  | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
index b962779..20abf17 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
@@ -2,6 +2,8 @@
 
 LICENSE = "MIT"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 PACKAGES += "${PN}-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index c9aad1f..e46a1b4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl ti-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
@@ -55,5 +55,4 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-misc \
     ti-analytics \
     ti-demos \
-    ti-opencl \
 "
-- 
2.7.4


