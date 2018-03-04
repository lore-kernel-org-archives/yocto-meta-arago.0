Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3895152986
	for <meta-arago@arago-project.org>;
	Sun,  4 Mar 2018 03:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3EA882099F;
	Sun,  4 Mar 2018 03:32:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pBp0ho3RScI4; Sun,  4 Mar 2018 03:32:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A64B2086C;
	Sun,  4 Mar 2018 03:32:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D21D1632F0;
	Sat,  3 Mar 2018 22:32:21 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat,  3 Mar 2018 22:32:21 -0500
Message-Id: <1520134341-1345-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] stress-ng: upstreamed to meta-oe, remove locally
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
X-List-Received-Date: Sun, 04 Mar 2018 03:33:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/stress-ng/stress-ng_0.09.09.bb    | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb

diff --git a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb
deleted file mode 100644
index c6ac793..0000000
--- a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "A tool to load and stress a computer system"
-HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "zlib libaio"
-
-SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "6e4df71095e780654ccc0a713b8423fe"
-SRC_URI[sha256sum] = "e993fddb1d990a0cdb23b2af6cf6c417a1c09e155ada7c558ad80eae8a5feed3"
-
-CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
-
-do_install() {
-	oe_runmake DESTDIR=${D} install
-	chown -R root:root ${D}
-}
-- 
2.7.4


