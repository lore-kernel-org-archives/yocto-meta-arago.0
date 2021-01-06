Return-Path: <s-anna@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id C332B520EA
	for <meta-arago@arago-project.org>;
	Wed,  6 Jan 2021 17:11:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 106HBYML044100
	for <meta-arago@arago-project.org>; Wed, 6 Jan 2021 11:11:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609953094;
	bh=j+mLbyTzWWmGY7XnmkJ1CGhk0cSY6cv6pRpchdn0f3A=;
	h=From:To:CC:Subject:Date;
	b=YTYn4hsjBhxvvUjxyHwZTy+l3JZ5cpYfMxkMctCWCoM5Na5cf1VjJhY7pOTk4BtGX
	cXqJ7ZEhSW/zTnY7qOR4VbuktFJjwtgz0w3XDT7/OE90IU8t9LF9Wo1aBcA2DckWSC
	qS48pLE97d8w74peQKGsenwFtSzj8p1MUz/NpmnQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 106HBYxD034137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Jan 2021 11:11:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 6 Jan 2021 11:11:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 6 Jan 2021 11:11:34 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 106HBYi3076537;
	Wed, 6 Jan 2021 11:11:34 -0600
Received: from localhost ([10.250.66.86])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 106HBXxa069499;
	Wed, 6 Jan 2021 11:11:34 -0600
From: Suman Anna <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Date: Wed, 6 Jan 2021 11:11:30 -0600
Message-ID: <20210106171130.13631-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Aparna Balasubramanian <aparnab@ti.com>
Subject: [master/dunfell][PATCH] packagegroup-arago-tisdk-addons: Include ti-rtos-firmware for AM64xx
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
X-List-Received-Date: Wed, 06 Jan 2021 17:11:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Include the ti-rtos-firmware recipe for AM64xx machines so that the PDK
firmware images are included in the file system.

Reported-by: Aparna Balasubramanian <aparnab@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index c4260c5a0287..659f6c15ea8c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r78"
+PR = "r79"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -77,6 +77,7 @@ UTILS_append_k3 = " mmc-utils \
                     statcol \
 "
 
+UTILS_append_am64xx = " ti-rtos-firmware"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
-- 
2.29.2


