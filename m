Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1FFD0529EE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 19:10:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SJA5oM119622
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535483405;
	bh=vr8hH+7eJ/J46oIlFKLTgcePK0IWm2AvsIa4lLsOQdU=;
	h=From:To:CC:Subject:Date;
	b=EHFKizZ9X07o/hjILDSenmVDGelTWNyehbnMEf1dVweHhMPCgSKJA51ppD9DUNE6c
	/qVSTQ5hEz1yk0ape+khiiOWhQAx0PrIT/dXd4IKxe7ZsIYtR8usLg8xYJxZTMZqya
	KVHyqLjO79r/GFZtei8W1CLvJyZ2WLsa6rvl+bM8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJA51H021544
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 14:10:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 14:10:04 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJA4cq003290;
	Tue, 28 Aug 2018 14:10:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 14:57:44 -0400
Message-ID: <1535482668-18232-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 1/5] ti-tisdk-makefile: fix KERNEL_IMAGETYPE replacement
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
X-List-Received-Date: Tue, 28 Aug 2018 19:10:13 -0000
Content-Type: text/plain

* KERNEL_IMAGE_TYPE was used when the correct variable name is
  KERNEL_IMAGETYPE.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index aba71d9..f83713a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -249,7 +249,7 @@ do_install () {
     fi
 
     sed -i -e "s/__KERNEL_ARCH__/${ARCH}/" ${D}/Makefile
-    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGE_TYPE}/" ${D}/Makefile
+    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGETYPE}/" ${D}/Makefile
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
     sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
 
-- 
2.7.4


