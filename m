Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 5279252BBF
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 17:10:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GHBC4p120233;
	Fri, 16 Apr 2021 12:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618593072;
	bh=prKv6h/N2rEZES3SQegbswMcAH3F2lmMSPHrRX8q7g4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fKEZ7OaIehk3wAq9fH2BA0qHcjnerrE/rsrueMId9AJzbj9UE7JEEABLnquDrfgzi
	GTOj81nRiUDmSsuHRvBpt4HSyWhJv29Ch2ZPggdv4ZFYFtQ6pwNfWIHDMPKY4OzGFc
	KcaEjkto84dMag+/VEA3QuKAreB9QYCLqtOkNveE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GHBCKb035906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 12:11:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Apr 2021 12:11:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 16 Apr 2021 12:11:12 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GHBBta031770;
	Fri, 16 Apr 2021 12:11:12 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	13GHBBiV095039; Fri, 16 Apr 2021 12:11:11 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Date: Fri, 16 Apr 2021 12:11:07 -0500
Message-ID: <20210416171107.24234-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210416171107.24234-1-g-tammana@ti.com>
References: <20210416171107.24234-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH 2/2] ti-tisdk-makefile: remove jailhouse target
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
X-List-Received-Date: Fri, 16 Apr 2021 17:10:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

jailhouse is not yet ready for kernel 5.10, remove it from the sdk
makefile targets for now.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb           | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 48ed961e..d2201675 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -53,11 +53,10 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
     file://Makefile_tiovx-app-host \
     file://Makefile_ti-ipc \
-    file://Makefile_jailhouse \
     file://Makefile_ti-img-rogue-driver \
 "
 
-PR = "r104"
+PR = "r105"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -187,7 +186,6 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         cryptodev \
                         sysfw-image \
                         ti-ipc \
-                        jailhouse \
 "
 
 MAKEFILES_append_am65xx = " \
@@ -254,10 +252,6 @@ IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}
 IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"
 IPC_TOOLS_PATHS_append_k3 = "${IPC_TOOLS_PATHS_R5F}"
 
-# Populate Jailhouse config header
-JH_PLATFORM = "${MACHINE}"
-JH_PLATFORM_k3 = "k3"
-
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
 
@@ -323,7 +317,6 @@ do_install () {
     sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
     sed -i -e "s/__PRU_ICSS_INSTALL_TARGET__/${PRU_ICSS_INSTALL_TARGET}/g" ${D}/Makefile
     sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
-    sed -i -e "s/__JH_PLATFORM__/${JH_PLATFORM}/" ${D}/Makefile
     sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
-- 
2.31.1


