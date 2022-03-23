Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846CAC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 21:07:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2809.1648069672562692500
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RhGHwoFg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7pDg058072;
	Wed, 23 Mar 2022 16:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648069671;
	bh=V7p6sh370qI0XVy59FVhlSsG7sma14ZW68aWLcxvGmI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RhGHwoFgXSQV428SIBc033WGSNxRK9y/hv4XcUBr/yLOmUFH5G3cupxlYGvR7sv1X
	 NovhpITFY1Bxd6+TsT0Iu96vA17luKke0q0b6DQBBO2qZ3M2Zs25fvaZkS7jhmlyu8
	 aId4qM535uJvhcOaH17yBCl1MIJHg3nfFIC6+/cY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NL7pEo095758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 16:07:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 16:07:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 16:07:50 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7om0075189;
	Wed, 23 Mar 2022 16:07:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nX8Cs-00013c-Ma; Wed, 23 Mar 2022 16:07:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v2 1/2] ti-tisdk-makefile: adding
 uboot r5 config variable for am62xx
Date: Wed, 23 Mar 2022 16:07:49 -0500
Message-ID: <20220323210750.3959-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323210750.3959-1-reatmon@ti.com>
References: <20220323210750.3959-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 21:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13732

From: Nishanth Menon <nm@ti.com>

lets add support for the latest of TI SoC.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 4 ++++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
 .../ti-tisdk-makefile/Makefile_sysfw-image                  | 1 +
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 6 ++++++
 4 files changed, 12 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c44f95ca..062948d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -57,6 +57,10 @@ UTILS_append_am64xx = " \
     pru-icss-src \
 "
 
+UTILS_append_am62xx = " \
+    pru-icss-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 099817c3..094c47a2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -65,6 +65,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
+UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index aaf1f112..316483df 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -12,6 +12,7 @@ SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x
 SYSFW_SOC_am64xx-hs-evm = am64x
+SYSFW_SOC_am62xx-evm = am62x
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 7bda8eed..f0a044f7 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -202,6 +202,10 @@ MAKEFILES_append_am64xx = " \
                         pru-icss \
 "
 
+MAKEFILES_append_am62xx = " \
+                        pru-icss \
+"
+
 # Use this to export kernel arch to ARCH
 #
 # We need to be very careful here. This class will also overwrite UBOOT_ARCH
@@ -239,6 +243,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
 PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
+PRU_ICSS_INSTALL_TARGET_am62xx = "pru-icss_install_am62x"
 
 # Path to toolchains for the various cores in TI SOCs
 #
@@ -363,6 +368,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
+K3_UBOOT_MACHINE_R5_am62xx-evm = "am62xx_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1


