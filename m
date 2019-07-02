Return-Path: <jbergsagel@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BC8E1520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 23:01:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62N11Xo031017
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 18:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562108461;
	bh=x6KKJNWZoJxyTYbgob8JPYPeUqFNLqXJPHDb4Mziihk=;
	h=From:To:CC:Subject:Date;
	b=D9CLgnrIn6hnVLncS4x3OnyXg0rhrZuEA6NEWf0c0Xolr2b+h5trblyLtgY5pMh9H
	PZYr93gx/+MkKfo2Ai1jgN2uh7N/Zs3jdOQO9XtDZxckCtfN1fa2oacCUTQ2bOOK+5
	cYakxfwo+317N5GdvEKxQ4RneESKdzc8JAcHpos8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62N1194077888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 18:01:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 18:01:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 18:01:00 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62N10Uk086835;
	Tue, 2 Jul 2019 18:01:00 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x62N10m13821; Tue, 2 Jul 2019 18:01:00 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2019 17:59:33 -0500
Message-ID: <20190702225933.19550-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Santosh Jha <sjha@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-addons: add ipc-lld-fw
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
X-List-Received-Date: Tue, 02 Jul 2019 23:01:47 -0000
Content-Type: text/plain

Add the firmware binaries from ipc-lld-fw for j7-evm
builds.

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 25213829a2da..824dcf6d60cd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -76,6 +76,8 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
+UTILS_append_j7-evm = " ipc-lld-fw"
+
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
 UTILS_append_dra7xx = " can-utils \
-- 
2.17.1


