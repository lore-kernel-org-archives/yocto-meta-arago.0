Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9FDFA52A0A
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 20:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88C9B20C09;
	Fri,  9 Jun 2017 20:02:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YB9-D1V8GXL5; Fri,  9 Jun 2017 20:02:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 688B2207AF;
	Fri,  9 Jun 2017 20:02:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 001CC1624D4;
	Fri,  9 Jun 2017 16:02:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Jun 2017 16:02:21 -0400
Message-Id: <1497038541-71848-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] arago-core-tisdk-image: disable deployment of MLO only for k2g HS device
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
X-List-Received-Date: Fri, 09 Jun 2017 20:02:23 -0000

Be specific and only unset it for k2g HS device, as k2g GP does provide MLO/SPL

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 974db93..d361c3d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -4,7 +4,8 @@ DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_k2hk = ""
 DEPLOY_SPL_NAME_k2l-evm = ""
 DEPLOY_SPL_NAME_k2e = ""
-DEPLOY_SPL_NAME_k2g = ""
+# Only unset it for HS device, as k2g GP does provide MLO/SPL
+DEPLOY_SPL_NAME_k2g-hs-evm = ""
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.7.4


