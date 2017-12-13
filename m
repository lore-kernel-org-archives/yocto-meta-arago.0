Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7AFDD52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 22:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 08F04208CC;
	Wed, 13 Dec 2017 22:05:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Hd33le9GWNLJ; Wed, 13 Dec 2017 22:05:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E35C9207BA;
	Wed, 13 Dec 2017 22:05:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A5045162853;
	Wed, 13 Dec 2017 17:05:16 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 13 Dec 2017 17:05:16 -0500
Message-Id: <1513202716-15983-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] vtun: don't pre-create /var/lock
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
X-List-Received-Date: Wed, 13 Dec 2017 22:05:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index 7b31421..18cec3c 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -22,4 +22,5 @@ do_configure() {
 
 do_install_append() {
 	rm -rf ${D}${localstatedir}/run
+	rm -rf ${D}${localstatedir}/lock
 }
-- 
2.7.4


