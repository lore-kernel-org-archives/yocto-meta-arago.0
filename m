Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 31C7352960
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 10:11:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KA9xv6043631
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 05:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568974199;
	bh=/ReUXAg7pL/v5r/7Cq9XDOoEgpeBIdsdln+piTD57VM=;
	h=From:To:CC:Subject:Date;
	b=tfeRjUlGnYBwPHCvNoE2V6ri1TGEawRNmnqw9jOzgTQzaJ1p+IaxbcIzdILXsZpSL
	tAh/6gfI5DDYWLCnGCzf7U1tiKcnAa7LWO3p80vX8NLjz9VXljHynUQx179ZnZbzd8
	6dg0ZE0uWaF9GGTCsR7oKhDz2X57tf2NHmthLGSI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KA9w3l110119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 05:09:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 05:09:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 05:09:58 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KA9u45049563; 
	Fri, 20 Sep 2019 05:09:57 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <denys@ti.com>, <j-stiffler@ti.com>
Date: Fri, 20 Sep 2019 15:39:26 +0530
Message-ID: <1568974166-97757-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [thud/master PATCH v3] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Fri, 20 Sep 2019 10:11:07 -0000
Content-Type: text/plain

Add source packages for ATF and external kernel modules
Also define the src package proprties for these
---

Changes from v1:
* Remove ivshmem addition

 meta-arago-distro/conf/distro/include/arago-source-ipk.inc     | 10 ++++++++++
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb  |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 6e56c77..9e105b8 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -142,6 +142,10 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
 
+CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
+SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
+
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
@@ -181,6 +185,7 @@ SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
 
 CREATE_SRCIPK_pn-cryptodev-module = "1"
 SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
+SRCIPK_PRESERVE_GIT_pn-cryptodev-module = "true"
 
 CREATE_SRCIPK_pn-cmem-mod = "1"
 SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
@@ -196,6 +201,11 @@ SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
+
+CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
+SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
 
 CREATE_SRCIPK_pn-ti-gc320-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index fbdc735..ba2df44 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -39,6 +39,12 @@ UTILS_append_k2g = " \
 UTILS_append_k3 = " \
     jailhouse-src \
     ti-sci-fw-src \
+    arm-trusted-firmware-src \
+"
+
+UTILS_append_j7-evm = " \
+    ti-img-encode-decode-src \
+    ti-img-rogue-driver-src \
 "
 
 UTILS_append_am65xx = " \
-- 
1.9.1


