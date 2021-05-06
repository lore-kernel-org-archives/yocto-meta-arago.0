Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id CC6AE52CB2
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wIGs091222;
	Wed, 5 May 2021 21:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269898;
	bh=pTpUCWXo4p5wdV0W3BNEr1LWeq2coHM6WHLZZjJZ8Nc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zDylt375d8vUjHNnkhfz/e2vhST1kMUmBbauvRKMm9jjbN8aQKWqY/a+oeAnqTp00
	TQ+hCoPALmJnpIkVnhpv9MU+ZoAGyHuoHeYt7fQ1+gx0qd0YNh0mQSER63t6F1mfKh
	DUkP0miJMqlSAwehVaBuOWd8cmiAfxyygtUavVrM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wI5Z113429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:18 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wI6n081882;
	Wed, 5 May 2021 21:58:18 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHR9003287; Wed, 5 May 2021 21:58:18 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:07 -0500
Message-ID: <20210506025812.25256-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 1/6] ti-demos: Add feature check for pdm demos
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
X-List-Received-Date: Thu, 06 May 2021 02:57:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`pdm-anomaly-detection` needs qt which in turns is dependent on gpu
machine feature. Add the corresponding feature check to capture
dependencies correctly.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../recipes-core/packagegroups/ti-demos.bb             | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 054c2f53..6141799f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -5,11 +5,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+PDM_ANOMALY_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection', '', d)}"
+
 PDM_ANOMALY = ""
-PDM_ANOMALY_ti33x = "pdm-anomaly-detection"
-PDM_ANOMALY_ti43x = "pdm-anomaly-detection"
-PDM_ANOMALY_omap-a15 = "pdm-anomaly-detection"
-PDM_ANOMALY_am65xx = "pdm-anomaly-detection"
+PDM_ANOMALY_ti33x = "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY_ti43x = "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY_omap-a15 = "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY_am65xx = "${PDM_ANOMALY_PKG}"
 
 RDEPENDS_${PN} = "\
     ${PDM_ANOMALY} \
-- 
2.31.1


