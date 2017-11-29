Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BED125209B
	for <meta-arago@arago-project.org>;
	Wed, 29 Nov 2017 20:52:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vATKq3oC002851
	for <meta-arago@arago-project.org>; Wed, 29 Nov 2017 14:52:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511988723;
	bh=c80rJHYX1Mtfyc1Kac6M8nX+RIrqm4pdYhEsUwwjnLU=;
	h=From:To:CC:Subject:Date;
	b=dITwumVeFGeqn5iBJXgqLniUkFRSRtS9jItF+onbYh0+RK6a3QE7EHXG9KyGrsg+Q
	VrOusXjJUDyquGxqB0xyRDR4m/v/wnF7IegAzGGLRQwK7ViYSf+UMlt3O0vrR+Mk72
	TtLANS/KAlxPFCpdCmRfSsfHK0Fo14+4Uxem1cWM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATKq31g025848
	for <meta-arago@arago-project.org>; Wed, 29 Nov 2017 14:52:03 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 29 Nov 2017 14:52:03 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 29 Nov 2017 14:52:03 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vATKq26P001350;
	Wed, 29 Nov 2017 14:52:02 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Nov 2017 15:51:59 -0500
Message-ID: <1511988719-22825-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] ti-tisdk-makefile: add am574x-idk-pru-excl-uio.dtb to KERNEL_DEVICETREE list
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
X-List-Received-Date: Wed, 29 Nov 2017 20:52:04 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 1c79dd2..240f44b 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk47"
+PR_append = ".tisdk48"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -55,7 +55,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 
 KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_ti43x = " ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_k2g-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 KERNEL_DEVICETREE_append_am57xx-evm = " \
-- 
1.9.1


