Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2DD4352A88
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3QTj052885
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555006;
	bh=IrU93pFGaIOjE3uAbwxk3HelRm9SgirFMmX7D08Yius=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KNTBi+KoZIc+u5lc65bVseqbOlo5MPFi6wkoP+MBGdO3yopnkabQGB+Yif7gab7EX
	HrqM8WPM8rdYR2VrCoqTLvBKN6f6pJayNzAMHyMmSSfGiFTocgrd3HKaqrivyHa0MG
	40G/tbW4dE6y1P+fXiDo0JEg13fUcWi5dp0FSkP4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3QD8007480
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiZ028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:20 -0400
Message-ID: <1535555000-25564-8-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 7/7] packagegroup-arago-qte-toolchain-target: replace qtwebenine with qtwebkit for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:37 -0000
Content-Type: text/plain

Note: qtwebengine-based browser does not work on k3 devices


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 88c5c6b..d9c47d5 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -65,6 +65,16 @@ QT5_DEV = " \
         qtwebengine-dev \
 "
 
+QT5_DEV_append_k3 = " \
+        qtwebkit-mkspecs \
+        qtwebkit-dev \
+"
+
+QT5_DEV_remove_k3 = " \
+        qtwebengine-mkspecs \
+        qtwebengine-dev \
+"
+
 RDEPENDS_${PN} += " \
         ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
 "
-- 
1.9.1


