Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2A09C52090
	for <meta-arago@arago-project.org>;
	Mon, 19 Jan 2015 20:14:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0JKEXRt025017
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 14:14:33 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JKEXlu014206
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 14:14:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 Jan 2015 14:14:33 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0JKEWc3003333;	Mon, 19 Jan 2015 14:14:32 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Jan 2015 15:14:30 -0500
Message-ID: <1421698470-3651-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] vtun: Add new recipe for vtun
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
X-List-Received-Date: Mon, 19 Jan 2015 20:14:34 -0000
Content-Type: text/plain

- Provides Virtual Tunnels over TCP/IP networks with
  traffic shaping, compression and encryption

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- removed priority variable
- removed sed scripts and replaced with patches
---
---
 .../vtun/vtun/Add_search_path.patch                |   11 +++++++++++
 .../vtun/vtun/remove_strip.patch                   |    9 +++++++++
 .../recipes-connectivity/vtun/vtun_3.0.3.bb        |   20 ++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
new file mode 100644
index 0000000..ebf8331
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
@@ -0,0 +1,11 @@
+--- vtun-3.0.3/configure.orig
++++ vtun-3.0.3/configure
+@@ -5680,7 +5680,7 @@
+     echo "$as_me:$LINENO: checking \"for blowfish.h\"" >&5
+ echo $ECHO_N "checking \"for blowfish.h\"... $ECHO_C" >&6
+     ac_hdr_found=no
+-    for p in $BLOWFISH_HDR_DIR /usr/include/ssl /usr/include/openssl /usr/include /usr/local/include /usr/local/ssl/include  /usr/include/crypto; do
++    for p in $BLOWFISH_HDR_DIR /usr/include/ssl $SSL_HDR_DIR /usr/include/openssl /usr/include /usr/local/include /usr/local/ssl/include  /usr/include/crypto; do
+ 	if test -n "$p"; then
+ 	  dir="$p"
+ 	else
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
new file mode 100644
index 0000000..4e12393
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
@@ -0,0 +1,9 @@
+--- vtun-3.0.3/Makefile.orig.in
++++ vtun-3.0.3/Makefile.in
+@@ -99,6 +99,5 @@
+ 	$(INSTALL) -d -m 755 $(INSTALL_OWNER) $(DESTDIR)$(LOCK_DIR)
+ 	$(INSTALL) -d -m 755 $(INSTALL_OWNER) $(DESTDIR)$(SBIN_DIR)
+ 	$(INSTALL) -m 755 $(INSTALL_OWNER) vtund $(DESTDIR)$(SBIN_DIR)
+-	$(BIN_DIR)/strip $(DESTDIR)$(SBIN_DIR)/vtund
+
+ # DO NOT DELETE THIS LINE -- make depend depends on it.
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
new file mode 100644
index 0000000..bf3ced1
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Virtual Tunnels over TCP/IP networks with traffic shaping, compression and encryption."
+HOMEPAGE = "http://vtun.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+DEPENDS = "zlib lzo openssl"
+LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400239e0de40cde8"
+
+SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
+
+SRC_URI += "file://remove_strip.patch \
+	    file://Add_search_path.patch"
+
+SRC_URI[md5sum] = "f3becf2a0270910a841060c08d1db824"
+SRC_URI[sha256sum] = "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
+
+inherit autotools
+
+do_configure() {
+	oe_runconf --with-lzo-headers=${STAGING_INCDIR}/lzo --with-lzo-lib=${STAGING_LIBDIR} --with-ssl-headers=${STAGING_INCDIR}/openssl --with-ssl-lib=${STAGING_LIBDIR}
+}
-- 
1.7.9.5


