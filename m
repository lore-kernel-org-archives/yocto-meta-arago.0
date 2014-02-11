Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7C88E52A0A
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 00:59:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1B0x22P013950
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 18:59:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1B0x2xt019322
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 18:59:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 10 Feb 2014 18:59:02 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1B0x2m4005281;	Mon, 10 Feb 2014 18:59:02 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Feb 2014 19:59:01 -0500
Message-ID: <1392080341-18735-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] vtun: Add new recipe for vtun
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
X-List-Received-Date: Tue, 11 Feb 2014 00:59:03 -0000
Content-Type: text/plain

- Virtual Tunnels over TCP/IP networks with
   traffic shaping, compression and encryption

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-connectivity/vtun/vtun_3.0.3.bb        |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
new file mode 100755
index 0000000..dc2f79e
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Virtual Tunnels over TCP/IP networks with traffic shaping, compression and encryption."
+HOMEPAGE = "http://vtun.sourceforge.net/"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "zlib lzo openssl"
+PR = "r0"
+LIC_FILES_CHKSUM = "file://vtun.h;md5=72742635d461c045fdd3a1710f9f71be"
+
+SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f3becf2a0270910a841060c08d1db824"
+SRC_URI[sha256sum] = "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
+
+inherit autotools
+
+do_configure() {
+	sed -i "s/\$BLOWFISH_HDR_DIR \/usr\/include\/ssl/\$BLOWFISH_HDR_DIR \/usr\/include\/ssl \$SSL_HDR_DIR/" configure
+	oe_runconf --with-lzo-headers=${STAGING_INCDIR}/lzo --with-lzo-lib=${STAGING_LIBDIR} --with-ssl-headers=${STAGING_INCDIR}/openssl --with-ssl-lib=${STAGING_LIBDIR}
+	sed '102d' Makefile > Makefile.new
+	mv Makefile.new Makefile
+}
+
+
+
-- 
1.7.9.5


