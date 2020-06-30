Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B1B13529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 17:09:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UH7MWv099695
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593536842;
	bh=jQvAjCYluhxHE/pfoUk4f+tAoQkLU+hoK5iWp4KNYyY=;
	h=From:To:CC:Subject:Date;
	b=hbeA1EL8HRs/WTcNmL0bWU24wo4JEk6b5FH2jm0TmHKeWgh0ON8WyyVIrwa8aFa6a
	LxMss9MGv8jWz8A6QtbIqZv8lizB6NP8cPPnU5xossCmo6GzDfAuuWu/Nh0JRzplqr
	P82CY739b+EBfMyd01mmGT7qKXPrbhkHAC9pcEkA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UH7MKd011884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jun 2020 12:07:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 12:07:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 12:07:21 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UH7Jt1001406;
	Tue, 30 Jun 2020 12:07:20 -0500
From: <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Tue, 30 Jun 2020 22:37:17 +0530
Message-ID: <20200630170717.27124-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: prao@ti.com
Subject: [master/dunfell] packagegroup: tisdk-addons-sdk-host: Include gpu driver source based on MACHINE_FEATURES
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
X-List-Received-Date: Tue, 30 Jun 2020 17:10:00 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Check for gpu in MACHINE_FEATURES and include the source package
for img rogue driver for j7-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index adfcfa3e..7200e9f2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -43,6 +43,7 @@ UTILS_append_k3 = " \
 "
 
 UTILS_append_j7 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'ti-img-rogue-driver-src', '', d)} \
     pru-icss-src \
 "
 
-- 
2.17.1


