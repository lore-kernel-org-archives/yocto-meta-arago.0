Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id ADA5252AAA
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 00:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 885932091B;
	Thu, 22 Dec 2016 00:42:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1lbU2bXiff0C; Thu, 22 Dec 2016 00:42:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6893E208B1;
	Thu, 22 Dec 2016 00:42:51 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id B65601621E2;
	Wed, 21 Dec 2016 19:42:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 19:42:50 -0500
Message-Id: <1482367370-4570-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] openobex: drop old bbappend that no longer works with version 1.7.2
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
X-List-Received-Date: Thu, 22 Dec 2016 00:42:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/obex/openobex_%.bbappend     | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
deleted file mode 100644
index 5af0b4c..0000000
--- a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-PR_append = ".arago2"
-
-# Add apps/obex_test for testing
-do_configure_prepend() {
-	sed -i -e 's:bin_PROGRAMS = irxfer obex_tcp irobex_palm3:bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test:g' ${S}/apps/Makefile.am
-	( cd ${S}; autoreconf -f -i -s )
-}
-
-# tell the openobex configure script NOT to enable syslog and dump.
-# enabling log and dump prints lots of debug messages and hex dump value during BT
-# file transfer using openobex, due to which BT transfer get slow.
-
-EXTRA_OECONF_remove = "--enable-syslog"
-EXTRA_OECONF_remove = "--enable-dump"
-
-# WiLink Bluetooth application build depends on libmisc.a.
-do_install_append() {
-	install -m 644 ${B}/apps/libmisc.a ${D}/${libdir}
-}
-- 
2.7.4


