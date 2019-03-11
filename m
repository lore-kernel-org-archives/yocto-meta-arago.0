Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 50CB852A62
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 22:47:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BMkrJB101035
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 17:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552344413;
	bh=TiMHhaLIEF6OhGldaOU5BgJKAgz1sQLMoGtGstkyf/c=;
	h=From:To:Subject:Date;
	b=PCWBIbKWZwfBYVprqKURPwRDsLz2V26XXrYAp5RW4GrIAB4pODAaiSIWarFfe01+C
	Xpc648tCFtGtktdSRRPLLmyay01HFmT1BVBeFbOC+JQ1q7B/jdyIXYjDxdBBl7lZ+D
	hPVzvoFILSf2YkHtThmYt3vDJG8LVnHH5wnVzsEM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BMkrFr088419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 17:46:53 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 17:46:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 17:46:52 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BMkqTB016621
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 17:46:52 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 18:46:47 -0400
Message-ID: <1552344407-4932-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] packagegroup-arago-tisdk-target: include gtk sdk only if sgx is included
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
X-List-Received-Date: Mon, 11 Mar 2019 22:47:03 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 75c190d..a3c9377 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,12 +12,6 @@ QT_TOOLCHAIN_TARGET = "\
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
 
-GTK_TOOLCHAIN_TARGET = "\
-    packagegroup-arago-gtk-sdk-target \
-"
-GTK_TOOLCHAIN_TARGET_keystone = ""
-GTK_TOOLCHAIN_TARGET_omapl138 = ""
-
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
     packagegroup-arago-tisdk-multimedia-sdk-target \
@@ -32,7 +26,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
-    ${GTK_TOOLCHAIN_TARGET} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
-- 
1.9.1


