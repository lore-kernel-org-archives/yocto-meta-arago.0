Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D51C052961
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 16:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4D4920BA9;
	Mon, 26 Jun 2017 16:27:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eYdBvnHxdKNz; Mon, 26 Jun 2017 16:27:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4F12207AF;
	Mon, 26 Jun 2017 16:27:31 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 27DDD1624E5;
	Mon, 26 Jun 2017 12:27:31 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 26 Jun 2017 12:27:30 -0400
Message-Id: <1498494450-129353-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] kernel-fitimgae: depend on deployment of optee image if OPTEEMACHINE is set
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
X-List-Received-Date: Mon, 26 Jun 2017 16:27:34 -0000

FITIMAGE_OPTEE never got defined and isn't a correct variable for this condition

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 1cfa8d1..3a4da6d 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -39,7 +39,7 @@ python __anonymous () {
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 
-        if d.getVar('FITIMAGE_OPTEE', True):
+        if d.getVar('OPTEEMACHINE', True):
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' optee-os:do_deploy')
 }
 
-- 
2.7.4


