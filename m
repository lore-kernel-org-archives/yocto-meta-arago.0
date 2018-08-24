Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8C7F652A0B
	for <meta-arago@arago-project.org>;
	Fri, 24 Aug 2018 19:37:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OJbaap066157
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535139456;
	bh=w4t4+TeLj2+PQ2IQBAiya5P5niogQze9o8i3lErQO2c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MUj3ZRYi1tXgFihEzJ9pRpf09sFrRZ2OmjP6Vgvu0KzqASxT9mh0McQJgWBmeN2Nx
	eCISXCvTVgCJG8yXqdbgAGlktBFJM8AJNj6IokaksXeOmxUswX1ciZBHuo1nRNo/id
	+5ypf3hhJlvVBw6mQpW/NWyulE/3uH/uqBA4ut5w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbab6027207
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 14:37:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 14:37:36 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbZ0s004368;
	Fri, 24 Aug 2018 14:37:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Aug 2018 15:25:18 -0400
Message-ID: <1535138718-6772-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
References: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 4/4] ti-tisdk-makefile: k3: fix installation of kernel and DTBs
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
X-List-Received-Date: Fri, 24 Aug 2018 19:37:45 -0000
Content-Type: text/plain

* Install overlays in addition to base DTBs
* The DTBs and overlays may be in a subdirectory of .../boot/dts
* Fix more places where KERNEL_ARCH was not abstracted.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux    | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs             | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 100a225..faa905a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -17,7 +17,7 @@ linux_install: __DTB_DEPEND_INSTALL__
 		exit 1; \
 	fi
 	install -d $(DESTDIR)/boot
-	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/__KERNEL_BUILD_CMDS__ $(DESTDIR)/boot
+	install $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/__KERNEL_IMAGE_TYPE__ $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/System.map $(DESTDIR)/boot
 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index 1ecaf5e..2697772 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -18,7 +18,7 @@ linux-dtbs_install:
 		exit 1; \
 	fi
 	install -d $(DESTDIR)/boot
-	@cp -f $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/dts/*.dtb $(DESTDIR)/boot/
+	@cp -f `find $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/dts/ -regex '.*\.dtbo?'` $(DESTDIR)/boot/
 
 linux-dtbs_clean:
 	@echo =======================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 6932616..aba71d9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -249,6 +249,7 @@ do_install () {
     fi
 
     sed -i -e "s/__KERNEL_ARCH__/${ARCH}/" ${D}/Makefile
+    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGE_TYPE}/" ${D}/Makefile
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
     sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
 
-- 
2.7.4


