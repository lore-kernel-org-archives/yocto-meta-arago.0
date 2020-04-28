Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 516BE52A62
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2020 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7662B40C33;
	Tue, 28 Apr 2020 18:54:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZJjjcYizLW_B; Tue, 28 Apr 2020 18:54:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50D7A40BDF;
	Tue, 28 Apr 2020 18:54:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4182A172B16;
	Tue, 28 Apr 2020 14:54:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 28 Apr 2020 14:54:25 -0400
Message-Id: <1588100065-32645-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588100065-32645-1-git-send-email-denis@denix.org>
References: <1588100065-32645-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/2] uboot-config: sync up with upstream
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
X-List-Received-Date: Tue, 28 Apr 2020 18:56:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/uboot-config.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/uboot-config.bbclass b/meta-arago-distro/classes/uboot-config.bbclass
index 8f1ded4..89ff970 100644
--- a/meta-arago-distro/classes/uboot-config.bbclass
+++ b/meta-arago-distro/classes/uboot-config.bbclass
@@ -22,18 +22,18 @@ python () {
     ubootconfigflags.pop('doc', None)
     ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
 
-    if not ubootmachine and len(ubootconfig) == 0:
+    if not ubootmachine and not ubootconfig:
         PN = d.getVar("PN")
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
-        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
+        raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
-    if ubootmachine and len(ubootconfig) > 0:
-        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
+    if ubootmachine and ubootconfig:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
     if ubootconfigflags and ubootbinaries:
-        raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
     if len(ubootconfig) > 0:
         for config in ubootconfig:
@@ -41,7 +41,7 @@ python () {
                 if config == f: 
                     items = v.split(',')
                     if items[0] and len(items) > 3:
-                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
+                        raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
-- 
2.7.4


