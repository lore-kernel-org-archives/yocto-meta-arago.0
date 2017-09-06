Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0CFAF5297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 18:52:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86IqtPr003872
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 13:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504723975;
	bh=Gwm4hMfksfzBpaoNgNgtrlXhkH3zAYYbZtMTn2Z5jhA=;
	h=From:To:CC:Subject:Date;
	b=yJiSBQ7LRv/uwy3jb08NScRrWfPXQqgbd/wMo7oGyJN2OT72Kt/beIxEawRq46l6c
	Qm98Mr08geUVMmeRafQI2s0/dpiyQDQjOKfSGdvgDill9xEOjzNKeqB60XUfyMf6bi
	OinK1Ew0RdPvqt/BeXs50fVh6rRAgWek8o7TT+kU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Iqs0R026700
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 13:52:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 13:52:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 13:52:54 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Iqs5I013386;
	Wed, 6 Sep 2017 13:52:54 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 14:52:50 -0400
Message-ID: <1504723970-21950-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] ti-tisdk-makefile: add am572x-idk-pru-excl-uio.dtb to linux-dtbs
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
X-List-Received-Date: Wed, 06 Sep 2017 18:52:55 -0000
Content-Type: text/plain

* Add am572x-idk-pru-excl-uio.dtb here since KERNEL_DEVICETREE from
  machine configuration is currently not including this dtb.

* All pru-uio dtbs can be removed from ti-tisdk-makefile after the
  upstream meta-ti layer is moved to 2017.05, which has all pru-uio
  dtbs in KERNEL_DEVICETREE from machine configuration.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 97c4c22..5ae819d 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk45"
+PR_append = ".tisdk46"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -57,7 +57,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 
 KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_ti43x = " ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am571x-idk-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_k2g-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 KERNEL_DEVICETREE_append_am57xx-evm = " \
-- 
1.9.1


