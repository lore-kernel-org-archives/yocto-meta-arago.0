Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 14DA952990
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 03:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B603A40C0D;
	Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o07W2eiGQbBZ; Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A308540BCF;
	Fri, 13 Sep 2019 03:11:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 68FDE173BBA;
	Thu, 12 Sep 2019 23:11:29 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 23:11:21 -0400
Message-Id: <1568344286-30548-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/6] matrix-lighttpd-config: properly defer postinst to run on target
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
X-List-Received-Date: Fri, 13 Sep 2019 03:12:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index f47b0e0..096b5ad 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -22,7 +22,7 @@ do_install() {
 FILES_${PN} = "${sysconfdir}/lighttpd.conf.matrix"
 RDEPENDS_${PN} = "lighttpd lighttpd-module-setenv"
 
-pkg_postinst_${PN} () {
+pkg_postinst_ontarget_${PN} () {
 if [ -f $D${sysconfdir}/lighttpd.conf ] ; then
 	cp $D${sysconfdir}/lighttpd.conf.matrix $D${sysconfdir}/lighttpd.conf
 else
-- 
2.7.4


