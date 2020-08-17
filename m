Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D748752972
	for <meta-arago@arago-project.org>;
	Mon, 17 Aug 2020 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1ABBE40C36;
	Mon, 17 Aug 2020 21:20:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 75deJApRYZSw; Mon, 17 Aug 2020 21:20:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EAA4B40AB7;
	Mon, 17 Aug 2020 21:20:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3BF9017339B;
	Mon, 17 Aug 2020 17:20:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2020 17:20:17 -0400
Message-Id: <1597699217-11625-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] tisdk-core-bundle: only deploy sysfw.itb separately for "legacy" SPL image platforms
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
X-List-Received-Date: Mon, 17 Aug 2020 21:23:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index f618555..f11721b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -8,7 +8,10 @@ DEPLOY_SPL_NAME_k2e = ""
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
 DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
+DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
+DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
+DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " ti-sci-firmware-j721e-gp.bin"
 
-- 
2.7.4


