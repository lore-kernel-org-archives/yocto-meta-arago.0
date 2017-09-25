Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3D2B752A0C
	for <meta-arago@arago-project.org>;
	Mon, 25 Sep 2017 19:03:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8PJ33J2032668
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 14:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506366183;
	bh=VkLYXDPVB7WQSG3prxQzyvVbh5i4oG+Lzw8Bi1TdDqw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B1FU6ow0XgsEPyvtkyNfByu9fhJJVZSDVp4nHPzrAPS4/GYOlgYX9J76JkOK6nFv0
	Yk9vKwLRX2aSxnmzq6JhZwEkCYWpO8rl5B3v4PzQjQSdaFYcK89RVJhpCzrpnalXhx
	rDHDNVJVD1AbK7zaQxJe9pVi53355jE4Qkto9/vI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PJ33Q5013248
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 14:03:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 25 Sep 2017 14:03:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 25 Sep 2017 14:03:03 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PJ2vWY011340;
	Mon, 25 Sep 2017 14:03:02 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Sep 2017 15:02:53 -0400
Message-ID: <1506366173-17907-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506366173-17907-1-git-send-email-a0271529@ti.com>
References: <1506366173-17907-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 2/2] packagegroup-arago-tisdk-addons: add ccief-basic
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
X-List-Received-Date: Mon, 25 Sep 2017 19:03:03 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 3e26a5a..a3944bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r64"
+PR = "r65"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -124,6 +124,7 @@ EXTRA_PACKAGES = " \
     nodejs \
     nodejs-npm \
     protobuf \
+    ccief-basic \
 "
 
 EXTRA_PACKAGES_omapl138 = " \
-- 
1.9.1


