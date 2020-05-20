Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3A62E529FF
	for <meta-arago@arago-project.org>;
	Wed, 20 May 2020 21:55:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KLqjwt086574
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 16:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590011565;
	bh=BWH7qDKD7KLi2eNJiZO6w3WEnCUOs7zjzwA/khhVDIs=;
	h=From:To:CC:Subject:Date;
	b=noLoXB3nnPDvwPWegSnKtxGv0FdQqEZtr13TuHWIAspkEHhOX0jvvmOh4r+9NmZgH
	2r7MMeR0BcHHAbeHMY1q0b3pu0ku2yJIAUcjw7W6fGYTg8FXeMTtPkV/L1ad4vuXBb
	DM2mX9ISAD81C3LCCW0IyWFD+yfMijMMgIy78bHw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KLqjwO125076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 16:52:45 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 20 May 2020 16:52:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 20 May 2020 16:52:45 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KLqj0x033341;
	Wed, 20 May 2020 16:52:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 May 2020 17:52:40 -0400
Message-ID: <1590011560-17361-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH] tisdk-core-bundle: add both sr1 and sr2 sysfw.itb
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
X-List-Received-Date: Wed, 20 May 2020 21:55:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 64ee906..7f5371e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -9,6 +9,7 @@ DEPLOY_SPL_NAME_k2g-hs-evm = ""
 DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
+DEPLOY_IMAGES_NAME_append_am65xx = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin"
 DEPLOY_IMAGES_NAME_append_j7-evm = " ti-sci-firmware-j721e-gp.bin"
 
-- 
2.7.4


