Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3DB4B52AA7
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D74920B52;
	Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zELv3_yQveZK; Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 566B220B55;
	Mon, 13 Feb 2017 23:07:23 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C00A1162374;
	Mon, 13 Feb 2017 18:07:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:07:17 -0500
Message-Id: <1487027238-101793-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487027238-101793-1-git-send-email-denys@ti.com>
References: <1487027238-101793-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 4/5] matrix-gui: add omapl138 exception
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
X-List-Received-Date: Mon, 13 Feb 2017 23:07:26 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 9928df7..aecc3be 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -54,6 +54,7 @@ do_install(){
 
 GUIDEPS = "matrix-gui-browser refresh-screen"
 GUIDEPS_keystone = ""
+GUIDEPS_omapl138 = ""
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.7.4


