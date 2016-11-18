Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 20260529F8
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F253208E7;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mW6AIglK9TOM; Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 057FD2084E;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id EE2201621AB;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:49 -0500
Message-Id: <1479506990-10407-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 7/8] omapconf: fix build with any toolchain, pass CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 697ef34..8ae572c 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -1,11 +1,11 @@
-DESCRIPTION = "Diagnostic tool for TI OMAP processors"
+SUMMARY = "Diagnostic tool for TI OMAP processors"
 HOMEPAGE = "https://github.com/omapconf/omapconf"
 
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
 PV = "1.73"
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
 
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
 do_compile () {
-    oe_runmake CROSS_COMPILE=${TARGET_PREFIX} install
+    oe_runmake CC="${CC}" all
 }
 
 do_install () {
-- 
2.7.4


