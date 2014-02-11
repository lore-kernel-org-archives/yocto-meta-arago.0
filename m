Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 98C9F5299C
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 17:52:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BHq3DA027530
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 11:52:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BHq3tc000443
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 11:52:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Feb 2014 11:52:03 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1BHq3A4021679;	Tue, 11 Feb 2014 11:52:03 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Feb 2014 12:51:57 -0500
Message-ID: <1392141117-22223-1-git-send-email-sam.nelson@ti.com>
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
X-List-Received-Date: Tue, 11 Feb 2014 17:52:04 -0000
Content-Type: text/plain

- Virtual Tunnels over TCP/IP networks with
   traffic shaping, compression and encryption

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
* Updated LIC_FILES_CHECKSUM to use just the copyright lines
---
---
 .../recipes-connectivity/vtun/vtun_3.0.3.bb        |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
new file mode 100755
index 0000000..bb4d69d
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Virtual Tunnels over TCP/IP networks with traffic shaping, compression and encryption."
+HOMEPAGE = "http://vtun.sourceforge.net/"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "zlib lzo openssl"
+PR = "r0"
+LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400239e0de40cde8"
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
-- 
1.7.9.5


