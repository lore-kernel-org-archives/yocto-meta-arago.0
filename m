Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5458152980
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2014 05:25:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1A5PLb6002684
	for <meta-arago@arago-project.org>; Sun, 9 Feb 2014 23:25:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1A5PL12023804
	for <meta-arago@arago-project.org>; Sun, 9 Feb 2014 23:25:21 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 9 Feb 2014 23:25:21 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1A5PLWG017464;	Sun, 9 Feb 2014 23:25:21 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Feb 2014 00:25:19 -0500
Message-ID: <1392009919-696-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libnl: Update bug fix patch and Add install append
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
X-List-Received-Date: Mon, 10 Feb 2014 05:25:22 -0000
Content-Type: text/plain

- Bug fix patch for handling non-standard net mask
  ( netmask not % 8)
- Add symbolic links for netlink & libraries

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../libnl/files/fix_for_masking_addr.patch         |   40 ++++++++++++++++++++
 .../libnl/libnl_3.2.21.bbappend                    |   16 ++++++++
 2 files changed, 56 insertions(+)
 create mode 100755 meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
 create mode 100755 meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch b/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
new file mode 100755
index 0000000..1c139a2
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
@@ -0,0 +1,40 @@
+From a8e7c2270ef4dea85bb2f4f83951e240cc636417 Mon Sep 17 00:00:00 2001
+From: Jingting Zhou <a0221004@ares-ubuntu>
+Date: Fri, 11 Jan 2013 16:03:30 -0500
+Subject: [PATCH] fix for addr masking
+
+---
+ lib/addr.c |   13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 lib/addr.c
+
+diff --git a/lib/addr.c b/lib/addr.c
+old mode 100644
+new mode 100755
+index 3acd9e4..1d1c6c7
+--- a/lib/addr.c
++++ b/lib/addr.c
+@@ -526,11 +526,16 @@ int nl_addr_cmp_prefix(struct nl_addr *a, struct nl_addr *b)
+ 
+ 		d = memcmp(a->a_addr, b->a_addr, bytes);
+ 		if (d == 0) {
+-			int mask = (1UL << (len % 8)) - 1UL;
++           if ((len % 8) != 0)
++		   {
++
++                int mask = (0xFFFFFFFF << (8 - (len % 8)));
++
++                d = (a->a_addr[bytes] & mask) -
++                    (b->a_addr[bytes] & mask);
++            }
++        }
+ 
+-			d = (a->a_addr[bytes] & mask) -
+-			    (b->a_addr[bytes] & mask);
+-		}
+ 	}
+ 
+ 	return d;
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend b/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend
new file mode 100755
index 0000000..4af3918
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "\
+	file://fix_for_masking_addr.patch \
+"
+
+do_install_append() {
+    cd ${D}${includedir}
+    ln -sf libnl3/netlink netlink
+    cd ${D}${libdir}
+    ln -sf libnl-3.so.200 libnl.so
+    ln -sf libnl-3.so.200 libnl.so.3
+    ln -sf libnl-genl-3.so.200 libnl-genl.so
+    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
+}
+
-- 
1.7.9.5


