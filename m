Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3270252A49
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 21:04:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86L4Grb022438
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536267856;
	bh=Hu24huOEIUFakftufYKunMtS00gyabFcwDLjRAklz4k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ls+8qM1tgENPPN055rB2qMhD4JVPC5ze2WQIEgERiNd7V6HslFlvkixjSj+ody6nr
	61iV/aOU2tnKOgc7xfxxHhCSQhXcTpQKbZq1WB6eLZ1X3ErD1NutgPxbVuZ63elKha
	ECtLr46YoIs3Vh5fsQlVi2kXMtYPMj7+cjzXld9Y=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4GLR005069
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 16:04:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 16:04:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 16:04:15 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86L4Ehi009473;
	Thu, 6 Sep 2018 16:04:15 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Sep 2018 17:04:10 -0400
Message-ID: <1536267851-5510-5-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536267851-5510-1-git-send-email-a0271529@ti.com>
References: <1536267851-5510-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 4/5] ti-tisdk-makefile: add pru-adc demo and the required dtb
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
X-List-Received-Date: Thu, 06 Sep 2018 21:04:25 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../ti-tisdk-makefile/Makefile_pru-adc             | 34 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
new file mode 100644
index 0000000..4723879
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
@@ -0,0 +1,34 @@
+
+# PRU-ADC build targets
+pru-adc:
+	@echo =================================
+	@echo    Building PRU-ADC
+	@echo =================================
+	@cd example-applications; cd `find . -name "*pru-adc*"`; \
+		make PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru PRU_SSP=$(SDK_PATH_TARGET)/usr
+
+pru-adc_clean:
+	@echo =================================
+	@echo    Cleaning PRU-ADC
+	@echo =================================
+	@cd example-applications; cd `find . -name "*pru-adc*"`; \
+		make clean
+
+pru-adc_install:
+	@echo ===================================================
+	@echo   Installing PRU-ADC
+	@echo ===================================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@install -d $(DESTDIR)/lib/firmware/pru;
+	@install -d $(DESTDIR)/usr/bin;
+	@cd example-applications; cd `find . -name "*pru-adc*"`; \
+	install -m 0644 ./PRU_ADS8688_Controller/gen/PRU_ADS8688_Controller.out \
+		$(DESTDIR)/lib/firmware/pru; \
+	install -m 0644 ./PRU_ADS8688_Interface/gen/PRU_ADS8688_Interface.out \
+		$(DESTDIR)/lib/firmware/pru; \
+	install -m 755 ./ARM_User_Space_App/gen/ARM_User_Space_App.out $(DESTDIR)/usr/bin
+
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 76f4aff..80394a1 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk55"
+PR_append = ".tisdk56"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -10,6 +10,7 @@ SRC_URI_append = "\
     file://Makefile_protection-relays-hmi \
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
+    file://Makefile_pru-adc \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -42,6 +43,7 @@ MAKEFILES_append_ti43x = " evse-hmi"
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
+			   pru-adc \
 "
 
 MAKEFILES_append_am57xx-evm = " jailhouse \
@@ -60,7 +62,7 @@ MAKEFILES_remove_keystone = "hplib-mod ipsecmgr-mod"
 
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 
-KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
+KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb am335x-boneblack-pru-adc.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_ti43x = " ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_append_k2g-evm = "${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', ' keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
-- 
1.9.1


