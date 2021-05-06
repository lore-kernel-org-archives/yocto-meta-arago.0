Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id EBE6452D23
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wLNo091255;
	Wed, 5 May 2021 21:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269901;
	bh=RzQIM7aUWwNk6AXriclq471YTrt2TS/H13yjLaXYRLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l/VUTI+owjbTGOeLldJT+73OEEavE88C38Blt6CAQmYh7sG1WF1Spaa2L2oNZ+C4k
	MooypvtIeiEqi6QwaQLgBpNkrjcUE1VLUd4nHpw2RCKeDAsm/dvO+trvujImS8rOop
	7uGIajrrm8VX/gamcqopuJOk8NWkyApZ57vtbYHY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wLv3128739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:21 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:21 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wLY4004722;
	Wed, 5 May 2021 21:58:21 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHRD003287; Wed, 5 May 2021 21:58:21 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:11 -0500
Message-ID: <20210506025812.25256-6-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 5/6] tisdk-core-bundle: Conditionally install the hmi demos
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
X-List-Received-Date: Thu, 06 May 2021 02:57:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

hmi demos have qt dependency, so install them on corresponding machine
feature condition.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index d8fd9d2d..9f0e65db 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -47,7 +47,7 @@ IMAGE_INSTALL = "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-hmi-sdk-host \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi-sdk-host','',d)} \
     packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte-sdk-host','',d)} \
 "
-- 
2.31.1


