Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2226.1643826393828618543
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Od2nPXc8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVjq102080;
	Wed, 2 Feb 2022 12:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826391;
	bh=8JxlOjOxOrPMz5Z0GUIVHG/6HeJHcd6S9FNoqAJDXfs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Od2nPXc8HYpgPNSVwHoXwvHpkfnJVcn0oycOVJyiaEgjkh9jm0kuMNt8ZjPinZlon
	 VlhOLESApqBkmbepq400PNQYdARrnaQkPkWLjOWcZ7X6N/DnWEzEwnenSkBMS+5JbI
	 QvlZL4vz/7P7tnIoRVhqRf9Z156lpMxIvYSCMfms=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQVKP018422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:31 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVMV110271;
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007YB-87; Wed, 02 Feb 2022 12:26:31 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 06/12] recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
Date: Wed, 2 Feb 2022 12:26:24 -0600
Message-ID: <20220202182630.28943-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Dont forget the alternate-target as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 6315bef6..d932acf1 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -225,7 +225,6 @@ TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
 TARGET_C66_0_j7 = "j7-c66_0-fw"
 TARGET_C66_1_j7 = "j7-c66_1-fw"
 TARGET_C7X_0_j7 = "j7-c71_0-fw"
-TARGET_C7X_1_j7 = "j7-c71_1-fw"
 
 TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
@@ -237,6 +236,15 @@ TARGET_MCU_R5FSS0_1_j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7200-hs-evm = "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1_j7200-hs-evm = "j7200-main-r5f0_1-fw"
 
+TARGET_MCU_R5FSS0_0_j721s2-evm = "j721s2-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j721s2-evm = "j721s2-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j721s2-evm = "j721s2-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j721s2-evm = "j721s2-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j721s2-evm = "j721s2-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j721s2-evm = "j721s2-main-r5f1_1-fw"
+TARGET_C7X_0_j721s2-evm = "j721s2-c71_0-fw"
+TARGET_C7X_1_j721s2-evm = "j721s2-c71_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
@@ -296,6 +304,15 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
 
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
+
 ALTERNATIVE_PRIORITY = "10"
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.17.1

