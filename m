Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0E17552092
	for <meta-arago@arago-project.org>;
	Thu,  8 Feb 2018 23:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C5DA20A4B;
	Thu,  8 Feb 2018 23:26:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Lp9AcyMVZSTf; Thu,  8 Feb 2018 23:26:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 776402006D;
	Thu,  8 Feb 2018 23:26:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 08CDA163283;
	Thu,  8 Feb 2018 18:26:56 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  8 Feb 2018 18:26:55 -0500
Message-Id: <1518132415-16658-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ti-tisdk-makefile: don't use / in sed as KERNEL_DEVICETREE may contain those
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
X-List-Received-Date: Thu, 08 Feb 2018 23:27:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 29e74b0..698f599 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -247,7 +247,7 @@ do_install () {
 
     if [ "$?" == "0" ]
     then
-        sed -i -e "s/__KERNEL_DEVICETREE__/${KERNEL_DEVICETREE}/" ${D}/Makefile
+        sed -i -e "s|__KERNEL_DEVICETREE__|${KERNEL_DEVICETREE}|" ${D}/Makefile
         sed -i -e "s/__DTB_DEPEND__/linux-dtbs/" ${D}/Makefile
         sed -i -e "s/__DTB_DEPEND_INSTALL__/linux-dtbs_install/" ${D}/Makefile
     else
-- 
2.7.4


