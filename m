Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4A08D52A86
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINX6I024508
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709413;
	bh=6BSE5sKT2+te7luPaOXJmf7anb//l0OGqNivkAzaUWw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=q7IYH8e8Sne4h9VxoJvGXy7VALP3NP+pCVyxWtgDsrKLjrAPEdOLfa3kdGV6GLnPs
	bK18XGkF1r0aIgLx++ccXY3wgXwOL8h6BjxBc3hzrN4Eha6RGEtirRqzM36V3GGEYG
	4jdnzYOSfbIDu0PMgLZDkVf9E6RfsKcpCovUsthM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINXiS010182
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8Q006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:32 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:05 -0400
Message-ID: <1506709407-16448-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 01/ branding-processor-sdk.inc: select xsgx-ddk for X11 build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:37 -0000
Content-Type: text/plain

- select provider of egl/libgles1/libgles2 based on MACHINE_FEATURES (xsgx vs. sgx)
- enable SRCIPK for ti-xsgx-ddk-km (SGX DDK for X11)
- set X11 as the default build
  - remove waylad, sgx
  - add xsgx

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 43faa26..8f4aaf9 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -11,9 +11,19 @@ PREFERRED_PROVIDER_virtual/kernel_omapl137 = "linux-dummy"
 #PREFERRED_PROVIDER_virtual/kernel_keystone = "linux-processor-sdk${ARAGO_KERNEL_SUFFIX}"
 PREFERRED_VERSION_linux-processor-sdk = "4.4%"
 
+# Use xsgx-ddk for X11 build
+PREFERRED_PROVIDER_virtual/egl = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-um', 'ti-sgx-ddk-um', d)}"
+PREFERRED_PROVIDER_virtual/libgles1 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-um', 'ti-sgx-ddk-um', d)}"
+PREFERRED_PROVIDER_virtual/libgles2 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-um', 'ti-sgx-ddk-um', d)}"
+
 # Remove wayland from keystone DISTRO_FEATURES.
 DISTRO_FEATURES_remove_keystone = "wayland opengl"
 
+# Set X11 as default build
+DISTRO_FEATURES_remove = "wayland"
+MACHINE_FEATURES_remove = "sgx"
+MACHINE_FEATURES_append = " xsgx"
+
 # CMEM reserved memory
 RESERVE_CMEM_dra7xx = "1"
 RESERVE_CMEM_keystone = "1"
@@ -96,3 +106,6 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging-rt = "400"
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
+
+CREATE_SRCIPK_pn-ti-xsgx-ddk-km = "1"
+SRCIPK_INSTALL_DIR_pn-ti-xsgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
-- 
1.9.1


