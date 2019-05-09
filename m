Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E6D98529C2
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 099CC40024;
	Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UU8On-3Vy5-x; Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E5D8E40BAD;
	Thu,  9 May 2019 04:15:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A774216EAF4;
	Thu,  9 May 2019 00:15:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:25 -0400
Message-Id: <1557375331-41998-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375331-41998-1-git-send-email-denys@ti.com>
References: <1557375331-41998-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 3/9] arago-core-tisdk-image: make SYSFW GP image specific to am65xx-evm
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
X-List-Received-Date: Thu, 09 May 2019 04:16:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 529d9de..263c265 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -8,7 +8,8 @@ DEPLOY_SPL_NAME_k2e = ""
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
 DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb ti-sci-firmware-am65x-gp.bin"
+DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
+DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin"
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.7.4


