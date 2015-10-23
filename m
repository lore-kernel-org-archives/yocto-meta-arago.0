Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2C3D952A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2015 22:26:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9NMQ33h010719
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2015 17:26:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9NMQ3TU017420
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2015 17:26:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 23 Oct 2015 17:26:03 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9NMQ29e024397;	Fri, 23 Oct 2015 17:26:02 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Oct 2015 18:25:40 -0400
Message-ID: <1445639140-9135-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] strongswan: Add back config patch for pkcs11 in 5.2.1 format
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
X-List-Received-Date: Fri, 23 Oct 2015 22:26:15 -0000
Content-Type: text/plain

- 5.2.1 version of strongswan expects config in changed format.
  This patch adds the pkcs11_plugin.conf file to adapt to that.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../strongswan/files/pkcs11_plugin.conf            |   15 +++++++++++++++
 .../strongswan/files/strongswan_libsecstore.patch  |   16 ----------------
 .../strongswan/strongswan_%.bbappend               |    4 ++--
 3 files changed, 17 insertions(+), 18 deletions(-)
 create mode 100644 meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.conf
 delete mode 100644 meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch

diff --git a/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.conf b/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.conf
new file mode 100644
index 0000000..6d8c1cb
--- /dev/null
+++ b/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.conf
@@ -0,0 +1,15 @@
+# strongswan.conf - strongSwan configuration file
+libstrongswan {
+
+	#  set to no, the DH exponent size is optimized
+	#  dh_exponent_ansi_x9_42 = no
+  plugins {
+    pkcs11 {
+      modules {
+        secstore {
+          path = /usr/lib/softhsm/libsecstore.so.1
+        }
+      }
+    }
+  }
+}
diff --git a/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch b/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch
deleted file mode 100644
index c16b05e..0000000
--- a/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- strongswan-5.0.0/src/strongswan.conf	2010-10-22 10:33:30.000000000 -0400
-+++ strongswan-5.0.0.libsecstore/src/strongswan.conf	2014-04-03 18:31:17.228569896 -0400
-@@ -31,4 +31,13 @@
- 
- 	#  set to no, the DH exponent size is optimized
- 	#  dh_exponent_ansi_x9_42 = no
-+  plugins {
-+    pkcs11 {
-+      modules {
-+        secstore {
-+          path = /usr/lib/softhsm/libsecstore.so.1
-+        }
-+      }
-+    }
-+  }
- }
diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index f065a63..74829e7 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS_remove = "gmp"
@@ -11,4 +11,4 @@ EXTRA_OECONF += "--disable-gmp \
         --disable-tools \
 "
 
-#SRC_URI += "file://strongswan_libsecstore.patch"
+SRC_URI += "file://pkcs11_plugin.conf"
-- 
1.7.9.5


