Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9351E529A5
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2020 18:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D89440C2B;
	Fri, 13 Mar 2020 18:53:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id N4B7SGzS5XMf; Fri, 13 Mar 2020 18:53:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74397409E7;
	Fri, 13 Mar 2020 18:53:49 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D1FFB174446;
	Fri, 13 Mar 2020 14:53:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 13 Mar 2020 14:53:48 -0400
Message-Id: <1584125628-57210-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] matrix-lighttpd-config: correct installation of config file
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
X-List-Received-Date: Fri, 13 Mar 2020 18:55:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

1. lighttpd moved its config from /etc to /etc/lighttpd
2. pkg_postinst_ontarget should not use $D

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/matrix/matrix-lighttpd-config.bb              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index 096b5ad..8a89aa3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -15,16 +15,16 @@ SRC_URI += "file://COPYING"
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd.conf.matrix
+	install -d ${D}${sysconfdir}/lighttpd
+	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
 }
 
-FILES_${PN} = "${sysconfdir}/lighttpd.conf.matrix"
+FILES_${PN} = "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
 RDEPENDS_${PN} = "lighttpd lighttpd-module-setenv"
 
 pkg_postinst_ontarget_${PN} () {
-if [ -f $D${sysconfdir}/lighttpd.conf ] ; then
-	cp $D${sysconfdir}/lighttpd.conf.matrix $D${sysconfdir}/lighttpd.conf
+if [ -f ${sysconfdir}/lighttpd/lighttpd.conf ] ; then
+	cp ${sysconfdir}/lighttpd/lighttpd.conf.matrix ${sysconfdir}/lighttpd/lighttpd.conf
 else
 	echo "No lighttpd.conf found, aborting"
 	exit 1
-- 
2.7.4


