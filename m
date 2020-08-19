Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2D4B752972
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2020 12:51:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JCn963045017
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2020 07:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597841349;
	bh=XQlKQEDVkJ9dslAJwzpAsgiMOw4t+Hkxpk+AApxmBUE=;
	h=From:To:CC:Subject:Date;
	b=c27tGaREqN9dS4z4tAMj620toV41bBOWEQk+nRksOe+tJzkzERYeFIGMNIcU2WbRY
	D3PaUBvf1E4FqOmC3lVdtqitpnistaf3N5m5qZbC7lmBy9tKOSKwpni76D1Ur7bRDs
	Sgf6jjxywUP4GzrwkZCGkvjtiXOo3JaOaEwjABbM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JCn9MR043257
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2020 07:49:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 19 Aug 2020 07:49:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 19 Aug 2020 07:49:08 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JCn8fk065176;
	Wed, 19 Aug 2020 07:49:08 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	07JCn89o123170; Wed, 19 Aug 2020 07:49:08 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 19 Aug 2020 07:48:48 -0500
Message-ID: <20200819124848.32363-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] nativesdk-packagegroup-arago-tisdk-host: add nativesdk-wayland-dev package
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
X-List-Received-Date: Wed, 19 Aug 2020 12:51:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

wayland-scanner is part of native wayland dev package and is needed for
building wayland dependency code against the devkit. Include it in the
nativesdk.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 5a453b6d..1ced42c1 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -26,6 +26,7 @@ EXTRA_TI_TOOLS = " \
 
 RDEPENDS_${PN} = "\
     nativesdk-packagegroup-sdk-host \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-dev', '', d)} \
     nativesdk-python3-distutils \
     nativesdk-git \
     nativesdk-mtd-utils-ubifs \
-- 
2.17.1


