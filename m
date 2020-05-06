Return-Path: <a0866189local@ula0866189>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 02CE352A15
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 19:30:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046JS68X070256
	for <meta-arago@arago-project.org>; Wed, 6 May 2020 14:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588793286;
	bh=2hjilu+Z/3cE7GIqbwhdRkwEq9hcz+tb3Q+r02sINLg=;
	h=From:To:CC:Subject:Date;
	b=lJAChOsacubm1e98oNCfl1glGtvw9LBLZbkQxFeJ7Eb1/fKx6udUZO2LxFNp4rycr
	BXSoXGP7ETKVOtVW7Dfj5vaqJxUt0lFTqyGsJcP9yshzWvCureeiAbd3pxTFmnB6lC
	PqW6g26wdGN9xnryJ1KMfE7dJxT9o3oX5TKlqXN8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046JS6BF067579
	for <meta-arago@arago-project.org>; Wed, 6 May 2020 14:28:06 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 6 May 2020 14:28:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 6 May 2020 14:28:06 -0500
Received: from ula0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046JS63I066969;
	Wed, 6 May 2020 14:28:06 -0500
Received: from a0866189local by ula0866189 with local (Exim 4.90_1)
	(envelope-from <a0866189local@ula0866189>)
	id 1jWPi9-0007qi-Qq; Wed, 06 May 2020 14:28:05 -0500
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 May 2020 14:27:56 -0500
Message-ID: <20200506192756.30113-1-angelabaker@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: s-anna@ti.com
Subject: [master][PATCH] packagegroup-arago-tisdk-addons: remove ti-ipc build for am65xx
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
X-List-Received-Date: Wed, 06 May 2020 19:30:31 -0000
Content-Type: text/plain

ipc-lld is used for am65xx.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb             | 1 -
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 3 +--
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb       | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index dfc37414..083c85f8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -205,7 +205,6 @@ IPCDEV = " \
 EXTRA_PACKAGES_append_omap-a15 = " ${IPCDEV}"
 EXTRA_PACKAGES_append_keystone = " ${IPCDEV}"
 EXTRA_PACKAGES_append_omapl138 = " ${IPCDEV}"
-EXTRA_PACKAGES_append_am65xx = " ${IPCDEV}"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2c5f7e5e..d69f221a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -74,7 +74,7 @@ UTILS_append_k3 = " mmc-utils \
                     jailhouse \
 "
 
-UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
+UTILS_append_am65xx = " ipc-lld-examples-rtos pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
@@ -141,7 +141,6 @@ EXTRA_PACKAGES_omapl138 = " \
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
-EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
 EXTRA_PACKAGES_append_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-linux big-data-ipc-demo-linux-firmware','',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index c3517748..2e089cb5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -67,10 +67,6 @@ ARAGO_TI_TEST_append_k3 = " \
     k3conf \
 "
 
-ARAGO_TI_TEST_append_am65xx = " \
-    ti-ipc-test \
-"
-
 ARAGO_TI_TEST_append_j7 = " \
     viddec-test-app \
     videnc-test-app \
-- 
2.17.1


