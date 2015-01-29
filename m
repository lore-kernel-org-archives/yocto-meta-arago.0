Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 75B0C52A5A
	for <meta-arago@arago-project.org>;
	Thu, 29 Jan 2015 19:00:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TJ0qP0026852
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 13:00:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TJ0p58028158
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 13:00:51 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 13:00:51 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0TJ0l4h002469;	Thu, 29 Jan 2015 13:00:50 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 14:00:45 -0500
Message-ID: <1422558045-17124-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422558045-17124-1-git-send-email-sam.nelson@ti.com>
References: <1422558045-17124-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] strongswan: Add pkcs11 plugin
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
X-List-Received-Date: Thu, 29 Jan 2015 19:00:57 -0000
Content-Type: text/plain

- Enable pkcs11 plugin to add softhsm for secure store

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../strongswan/files/strongswan_libsecstore.patch  |   16 ++++++++++++++++
 .../strongswan/strongswan_5.1.1.bbappend           |    6 ++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch

diff --git a/meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch b/meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch
new file mode 100644
index 0000000..c16b05e
--- /dev/null
+++ b/meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch
@@ -0,0 +1,16 @@
+--- strongswan-5.0.0/src/strongswan.conf	2010-10-22 10:33:30.000000000 -0400
++++ strongswan-5.0.0.libsecstore/src/strongswan.conf	2014-04-03 18:31:17.228569896 -0400
+@@ -31,4 +31,13 @@
+ 
+ 	#  set to no, the DH exponent size is optimized
+ 	#  dh_exponent_ansi_x9_42 = no
++  plugins {
++    pkcs11 {
++      modules {
++        secstore {
++          path = /usr/lib/softhsm/libsecstore.so.1
++        }
++      }
++    }
++  }
+ }
diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
index ca19b68..22c8550 100644
--- a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
+++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
@@ -1,8 +1,14 @@
 PR_append = "-arago0"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS = "openssl flex-native flex bison-native"
 
+SRC_URI += "file://strongswan_libsecstore.patch"
+
 EXTRA_OECONF = "--disable-gmp \
         --enable-openssl \
         --without-lib-prefix \
+        --enable-ctr \
+        --enable-pkcs11 \
+        --disable-tools \
 "
-- 
1.7.9.5


