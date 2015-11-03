Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8F80A52A7D
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:32:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JWtLw000412
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:32:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JWtHf004340
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:32:55 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:32:55 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3JWtRE004017;	Tue, 3 Nov 2015 13:32:55 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:32:53 -0500
Message-ID: <1446579173-24829-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] strongswan: Update to install config file
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
X-List-Received-Date: Tue, 03 Nov 2015 19:33:06 -0000
Content-Type: text/plain

- Add install appedn to install pkcs11 plugin config file in
  strongswan.d

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../strongswan/strongswan_%.bbappend               |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
index 74829e7..aecaf1f 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 DEPENDS_remove = "gmp"
@@ -12,3 +12,7 @@ EXTRA_OECONF += "--disable-gmp \
 "
 
 SRC_URI += "file://pkcs11_plugin.conf"
+
+do_install_append () {
+	install -m 0644 ${WORKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongswan.d/
+}
-- 
1.7.9.5


