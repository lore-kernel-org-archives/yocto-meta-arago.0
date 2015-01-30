Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6055E529A4
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 02:45:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U2jtZ7018004
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 20:45:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U2jsHv032219
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 20:45:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 20:45:54 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0U2jqZ9030183;	Thu, 29 Jan 2015 20:45:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 21:45:48 -0500
Message-ID: <1422585948-19345-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422585948-19345-1-git-send-email-sam.nelson@ti.com>
References: <1422585948-19345-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] strongswan: Add pkcs11 plugin
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
X-List-Received-Date: Fri, 30 Jan 2015 02:45:56 -0000
Content-Type: text/plain

- Enable pkcs11 plugin to add softhsm for secure store

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Updated using += option
---
---
 .../strongswan/files/strongswan_libsecstore.patch  |   16 ++++++++++++++++
 .../strongswan/strongswan_5.1.1.bbappend           |    9 ++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
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
index 9dbc509..de281eb 100644
--- a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
+++ b/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
@@ -1,7 +1,14 @@
 PR_append = "-arago0"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS_remove = "gmp"
 
 EXTRA_OECONF_remove = "--enable-gmp"
 
-EXTRA_OECONF += "--disable-gmp"
+EXTRA_OECONF += "--disable-gmp \
+        --enable-ctr \
+        --enable-pkcs11 \
+        --disable-tools \
+"
+
+SRC_URI += "file://strongswan_libsecstore.patch"
-- 
1.7.9.5


