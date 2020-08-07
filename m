Return-Path: <m-karicheri2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2C023520E0
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2020 18:24:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 077ILPOI021667
	for <meta-arago@arago-project.org>; Fri, 7 Aug 2020 13:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596824485;
	bh=BFMVojuHcXS6iUCSI4XZrzhV8P0t1TwTNTFN4vGv9Fo=;
	h=From:To:Subject:Date;
	b=gyxvF/kuNC1GCpCrAVarz8Puh/kk5VP/H1VDyuJHQX1xG8bJkvOl96OLdkpFF/k41
	8wef52PAX/yu3xreYZzczOyyj4g5DSfEi2if/om9sdXIY+HdKPItkzxKEi/x4TYcyM
	GVSVDYbnOgNn/wt/dzTNN9Ia+OTfKGYMR6X7V7mQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 077ILPKV019029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Aug 2020 13:21:25 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 7 Aug 2020 13:21:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 7 Aug 2020 13:21:25 -0500
Received: from uda0868495.fios-router.home (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 077ILOCw124828;
	Fri, 7 Aug 2020 13:21:25 -0500
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Fri, 7 Aug 2020 14:21:24 -0400
Message-ID: <20200807182124.2824-1-m-karicheri2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup-*-connectivity: include net-snmp-server-snmpd
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
X-List-Received-Date: Fri, 07 Aug 2020 18:24:12 -0000
Content-Type: text/plain

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 66442348dc32..3b848efc2694 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -59,6 +59,7 @@ CONNECTIVITY_RDEPENDS = " \
     iproute2 \
     iproute2-tc \
     net-snmp \
+    net-snmp-server-snmpd \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti33x = "\
-- 
2.17.1


