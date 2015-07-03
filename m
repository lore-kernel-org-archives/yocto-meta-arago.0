Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 913C452A4E
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:28 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00J3W5S32S40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=JgEUblkjxpBZJVzEseQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 174E9161AE4;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:54 -0400
Message-id: <1435892533-6046-36-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 35/54] openobex: make bbappend version-agnostic, fix build when B != S
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{openobex/openobex_1.5.bbappend => obex/openobex_%.bbappend}  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-arago-distro/recipes-connectivity/{openobex/openobex_1.5.bbappend => obex/openobex_%.bbappend} (83%)

diff --git a/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
similarity index 83%
rename from meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
rename to meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
index 458e1d4..468489f 100644
--- a/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
+++ b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
@@ -1,11 +1,9 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 # Add apps/obex_test for testing
 do_configure_prepend() {
 	sed -i -e 's:bin_PROGRAMS = irxfer obex_tcp irobex_palm3:bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test:g' ${S}/apps/Makefile.am
-	aclocal
-	automake --add-missing
-	autoreconf
+	( cd ${S}; autoreconf -f -i -s )
 }
 
 # tell the openobex configure script NOT to enable syslog and dump.
@@ -17,5 +15,5 @@ EXTRA_OECONF_remove = "--enable-dump"
 
 # WiLink Bluetooth application build depends on libmisc.a.
 do_install_append() {
-	install -m 644 ${S}/apps/libmisc.a ${D}/${libdir}
+	install -m 644 ${B}/apps/libmisc.a ${D}/${libdir}
 }
-- 
2.2.0


