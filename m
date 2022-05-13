Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD10DC4332F
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:49:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.5612.1652428189536774458
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Rf3bxZm4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nlmn028802;
	Fri, 13 May 2022 02:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428187;
	bh=aeUA3aQDQJIxr7BgDCng8uDdcPvRkQwPMOJxUc8FwGI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rf3bxZm4zCJhJNCjMtn9Iv4Ph+9p6rVTSZF1JJpsXHdb5rAzs+Rf6Mz4c8KwEhhwx
	 upP8qcvWEp4BTJm8dWO+wYjJSu3REFM9Vw1TxqMUqdMjUqa6UjejyK3A6MD6PJNfNj
	 3KrQXWIg8P3I4Muvu61DTT5700uGGYEK7bTVwL1c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7nlm9025465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:47 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSq0019975;
	Fri, 13 May 2022 02:49:45 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 2/5] ti-tisdk-makefile:
 Makefile_linux-fitimage: Add support to build fitImage.itb for am64xx-hs-evm
Date: Fri, 13 May 2022 13:19:20 +0530
Message-ID: <20220513074923.28761-3-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513074923.28761-1-a-m1@ti.com>
References: <20220513074923.28761-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13857

Add toplevel Makefile support for building fitImage.itb for
am64xx-hs-evm.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linux-fitimage | 32 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  6 ++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-fitimage

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-fitimage b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-fitimage
new file mode 100644
index 00000000..d2d49ccf
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-fitimage
@@ -0,0 +1,32 @@
+# linux-fitimage build targets
+
+linux-fitimage: ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh linux linux-dtbs
+	@echo =============================
+	@echo    Creating fitImage with signed binaries
+	@echo =============================
+	cd $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/dts; \
+		for DTB in __KERNEL_DEVICETREE__; do \
+			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $$DTB $$DTB.sec; \
+		done;
+	cd $(LINUXKERNEL_INSTALL_DIR); \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh arch/arm64/boot/Image.gz linux.bin.sec
+	cd $(LINUXKERNEL_INSTALL_DIR); \
+		cp $(TI_SDK_PATH)/board-support/prebuilt-images/fitImage-its.its .; \
+		mkimage -f fitImage-its.its -r fitImage
+
+linux-fitimage_clean:
+	@echo =============================
+	@echo    Cleaning signed images and fitImage
+	@echo =============================
+	cd $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/dts; \
+		for DTB in __KERNEL_DEVICETREE__; do \
+			rm -rf $$DTB.sec; \
+		done;
+	cd $(LINUXKERNEL_INSTALL_DIR); rm -rf linux.bin.sec fitImage
+
+linux-fitimage_install:
+	@echo ================================================
+	@echo    Installing fitImage
+	@echo ================================================
+	install -m 0644 $(LINUXKERNEL_INSTALL_DIR)/fitImage $(DESTDIR)/boot/
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f0a044f7..1cdd5345 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_ti-ipc \
     file://Makefile_ti-img-rogue-driver \
+    file://Makefile_linux-fitimage \
 "
 
 PR = "r106"
@@ -198,10 +199,15 @@ MAKEFILES_append_am65xx = " \
 MAKEFILES_append_j7 = " pru-icss \
                             ti-img-rogue-driver \
 "
+
 MAKEFILES_append_am64xx = " \
                         pru-icss \
 "
 
+MAKEFILES_append_am64xx-hs-evm = " \
+                        linux-fitimage \
+"
+
 MAKEFILES_append_am62xx = " \
                         pru-icss \
 "
-- 
2.17.1


