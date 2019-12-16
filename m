Return-Path: <sam.nelson@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 69264529CE
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2019 21:38:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGLbIcB022811
	for <meta-arago@arago-project.org>; Mon, 16 Dec 2019 15:37:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576532238;
	bh=+ZhMzyLDRcUSmzQ0YnFiKqIYty0xTLb2GYXnQyrM7D0=;
	h=From:To:CC:Subject:Date;
	b=qGKIsSvdYM3vuKglU4cQD8l3thiSUgyeLnAYqa57R3NsHf8jV6GmtGaFYXlwIg/kS
	rLfg1YGo6IgV0dTZIPTtmECYhfYEkg4cgjsK5yleMyTsU9amBB/Rw+XivbHvRR5QKz
	ITsYKtsQVsSfNT1tay5UBVcTFuTqXHddtwZNX1Sc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGLbIod044119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 16 Dec 2019 15:37:18 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 16 Dec 2019 15:37:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 16 Dec 2019 15:37:18 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGLbIUw077622;
	Mon, 16 Dec 2019 15:37:18 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Dec 2019 16:37:15 -0500
Message-ID: <1576532235-40823-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add IPCDEV packages for am65xx
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
X-List-Received-Date: Mon, 16 Dec 2019 21:38:55 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7ba5143..fb12772 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -192,6 +192,7 @@ IPCDEV = " \
 EXTRA_PACKAGES_append_omap-a15 = " ${IPCDEV}"
 EXTRA_PACKAGES_append_keystone = " ${IPCDEV}"
 EXTRA_PACKAGES_append_omapl138 = " ${IPCDEV}"
+EXTRA_PACKAGES_append_am65xx = " ${IPCDEV}"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.9.1


