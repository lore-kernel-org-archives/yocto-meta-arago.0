Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9C1E452A9D
	for <meta-arago@arago-project.org>;
	Sat,  8 Oct 2016 04:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0A84202B9;
	Sat,  8 Oct 2016 04:36:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aPMhMeNrQjrE; Sat,  8 Oct 2016 04:36:56 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 995CF2099C;
	Sat,  8 Oct 2016 04:36:55 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id EE9AF16216F;
	Sat,  8 Oct 2016 00:36:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat,  8 Oct 2016 00:36:54 -0400
Message-Id: <1475901414-2167-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475901414-2167-1-git-send-email-denis@denix.org>
References: <1475901414-2167-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/2] sourceipk: python3 fixes
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
X-List-Received-Date: Sat, 08 Oct 2016 04:37:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

sourceipk is still causing breakage even after parsing, so disable for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass                        | 6 +++---
 meta-arago-distro/conf/distro/arago.conf                           | 2 +-
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index d8da195..1e49489 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -328,9 +328,9 @@ addtask create_srcipk after do_patch before do_configure
 
 python () {
     if d.getVar('do_compileconfigs', False):
-	deps = d.getVarFlag('do_compileconfigs', 'deps') or []
-	deps.append('do_create_srcipk')
-	d.setVarFlag('do_compileconfigs', 'deps', deps)
+        deps = d.getVarFlag('do_compileconfigs', 'deps') or []
+        deps.append('do_create_srcipk')
+        d.setVarFlag('do_compileconfigs', 'deps', deps)
 }
 
 #Add source packages to list of packages OE knows about
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 256d904..4190aa8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -108,7 +108,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 require conf/distro/include/arago-prefs.inc
 
 # Enable generation of source packages for SDKs
-require arago-source-ipk.conf
+#require arago-source-ipk.conf
 
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 6ae4bd7..f8f3cff 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -2,4 +2,4 @@ MACHINE_KERNEL_PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-require copy-defconfig.inc
+#require copy-defconfig.inc
-- 
2.7.4


