Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 06DC45299E
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25CE42084E;
	Fri, 18 Nov 2016 22:09:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4R_eT_6gqcCu; Fri, 18 Nov 2016 22:09:56 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F0AC204AF;
	Fri, 18 Nov 2016 22:09:54 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 05D671621AC;
	Fri, 18 Nov 2016 17:09:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:50 -0500
Message-Id: <1479506990-10407-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 8/8] screenshot: fix build with any toolchain, pass CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
index c10dc25..d43ffd1 100644
--- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
@@ -1,10 +1,10 @@
-DESCRIPTION = "Screenshot"
+SUMMARY = "Screenshot"
 HOMEPAGE = "https://gitorious.org/screenshot"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
 SECTION = "graphics"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
 SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
@@ -17,7 +17,7 @@ do_compile() {
     export CROSS_COMPILE=${TARGET_PREFIX}
     export CFLAGS='${TARGET_CC_ARCH}'
     # build the release version
-    make release
+    make release CC="${CC}"
 }
 
 do_install() {
-- 
2.7.4


