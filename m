Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7EB5652AAA
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 00:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91F102091B;
	Thu, 22 Dec 2016 00:03:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pHi4OUosu0nP; Thu, 22 Dec 2016 00:03:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 73377207BD;
	Thu, 22 Dec 2016 00:03:50 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id A4FFA1621E2;
	Wed, 21 Dec 2016 19:03:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 19:03:49 -0500
Message-Id: <1482365029-17573-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master/morty][PATCH] sourceipk: re-enable now fully, including copying tisdk defconfig
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
X-List-Received-Date: Thu, 22 Dec 2016 00:03:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                           | 2 +-
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a31d578..a87a495 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -118,7 +118,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 require conf/distro/include/arago-prefs.inc
 
 # Enable generation of source packages for SDKs
-#require arago-source-ipk.conf
+require arago-source-ipk.conf
 
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index f8f3cff..6ae4bd7 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -2,4 +2,4 @@ MACHINE_KERNEL_PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-#require copy-defconfig.inc
+require copy-defconfig.inc
-- 
2.7.4


