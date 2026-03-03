Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6845CEDA69F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:48:50 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23268.1772556523424829384
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 08:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qZgYhHjP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.29, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0H+2XnnDkvhMuVMrTM0GK8RKqbDmE+Ihz/cxZQ5XUNmrqWwAMNdUu4eq850Yme5ogGxn5YmcdkHqoh19coLN7k+tSZRgRZv0RMJVIzz9EIE8sD6RAwIvlqMdbpkf2p3HoN7KF3nKlfa4FLtVJdRtMmGzLB7Q2yqpiTsMCzUpTt61MWNX8oR4k4ULDXpu/BtnReD0UZYfGjJLgi0fuqAOntdB0AwQFRwkd51M4kcXV2h2fC4IBSPfSwU6Qk3J2cTIkOlUEZccv5Z4BXLYVFpxRENluSDERIna5GiS4T1JzPxj8tc0/0XPK/Mc7gIsjP3ivck2xQNuHRJ7YkOoSAhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGztVIw7uK2n4jlS8H43mZ1s3Zx4cDdBFBXMBNglPuU=;
 b=J1QifWFcCXy0phm1NTrktMDss9wbV4phj7goGNR5/lr9MQOfX8LeB9IMjH5p0Gi52aUpTeD6reZ03JfEKeJoyEphlajfkw1+/VVE9ox+FlRh+ruGshNbXWQAmxNFpR+2gdP0GTFzGkgiUEDAvwXXMABCRPJFbfjopDTqMDwOFY2NNyTdrF7SjfJu9PDZ67JmhHmyj2cyytZRlqWxiD652ubJ/iSQRWM7YYrHd12lu6eukoUEJSK0BzDPGC+Qq9y8nhNgnbkYPgMEQpaGdodcFLfrV//BWzAjqRL5zMffrqQ1NQ3L56U6zQQQ76Yy+unzOKQjqwDG41FYFz3cuviNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGztVIw7uK2n4jlS8H43mZ1s3Zx4cDdBFBXMBNglPuU=;
 b=qZgYhHjPfJltJLAXGlNCELOZ6ZONY3zTZSLR3EuqHobGu/HOxrpwq9EJQOA/D5p7kg3fI1TStThqCRO3XQ988omyPwQKkfRPaPDGQWznscRdTQQiqPIghRYZBDckfEA3xnDwtSy95GwPdv6fNcsEBtjyGCR6PkZHk7h3KCxHK7o=
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by SA1PR10MB997559.namprd10.prod.outlook.com (2603:10b6:806:4b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Tue, 3 Mar
 2026 16:48:41 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::4a) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 16:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:48:40 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:48:30 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:48:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 10:48:30 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623GmTcE2467678;
	Tue, 3 Mar 2026 10:48:29 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxSv7-00000001Fus-3sZF;
	Tue, 03 Mar 2026 10:48:29 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] ti-test: Add ffmpeg and mpv to ti-test-multimedia
Date: Tue, 3 Mar 2026 10:48:29 -0600
Message-ID: <20260303164829.299398-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303164829.299398-1-reatmon@ti.com>
References: <20260303164829.299398-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SA1PR10MB997559:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f13ec6-ac95-4455-6e9c-08de7944b972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	o/tx7oQ6UL+upkTtVWT4fAY/7NlGCfEI1Yct15KSv4ujT7yHBBs0d70/aKw87GblSCshFYkBYfnEtgg2hrD+5UmZo+81Penb+2kxdHJlBlG9IZlC9Y9r+MsKoLuNISuBFx6+jP+TmhvXDhPNPL3pwxyssvnRYzSD3kXu2rp0oBIKdMkzrMotGwKI3XYB7/KWhalYNDFcl+/yLpSMkBchdRr1nDXFXfjGO/RSbUYArWNE0rR0I/deaVdrHYdHKxqi2XelCwCSw/jWgL0yBcYROwsBToY9XWjL0ObmNMQWqcBIxn9hz/EnhnjgbktGbfYMOWQVL8xyruvKhUgRpzyno3fj7WqVVFrYt0EUn1x31HV8AFVgg1LHJ5LXbvBvKbXxMd4kKW9MKyJ1/vrrjkTsfHijxhjleSjYEiQ9qcoDxPolkmDnCafh7VIvxyfY57JuAtpchgo7Ekm83h7YJa6FofQnd0SKUgD3RaL3085bHozJ2JB6TogedZHn1SBNKzO55d3kz0oNgKmS5fqR8vrXYlhWtEp15a4/0QZqi7cMtZ+SOnw8yW05/fjSBXIffNxWp5NBSkwGDEmYiIqsh1KZYr1jc1hpxhICZRayY9zQwCcE2OU4r2QcGZ+c2XtWw18ebP2JqGLNQeI72A8uxX8agL3Pus8haStcPZVMAP+v9fptB6vDdq4J+tB/zLNpYala1mc3TB8zAUNW36M/pDppQf20+/xQNziW/n53pt9nsDFVXJ5J6hVoUuomGhR1cjYhsOvFDK42zPVgQ0ZUO7Xo7BSHCqWumhtT1oJHiA/kugZEPs4iCpt+gjiZHzZXgjbIzVxsrM6YnQuHXnsmz00pMQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DIcoeh3iDOLELhX0hAsAN66Ejrq4GBQImKzqAVwC4sPx6Xp65f0GI/O/GNs/cshZ+rXMkKTdY0ZVTcitWcEvSofintToQ+KhdrBP3stt/tGQhGMnsmDZKJyH6BIsoTY25ai6bPg0xmw5ctqJaX/1/kuHWisyL6+p48qQr2e32rkzNFW60IgpJjrUhYHTFgzl81kaJR6PmB+XcJQcXILeG+srmlmLqDjbv5c7b4H5py8w44An0lnjyf/HjszPZnXTfdHBjCSvHDDwm4vwuHEOsC2qYgBi+4SkXfdfeTlT7NxareiAaV5DYyH5A6dTsssI1+mc0wKdDwDX1Sg/ZnyYUl3b8fi0fezdptnU6TI3ecmGamMv6o9cLZGi6R1QVJu2XaHJZjC5dZJwpo1jBDCPWTbLQXSCaxsun18vLyJs6Qma9AbTuttw9vvqmEQf1CK0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:48:40.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f13ec6-ac95-4455-6e9c-08de7944b972
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997559
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 16:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17201

FFMPEG and MPV are required during automated testing. Explicitly add
these to ti-test.

Also add the commercial_ffmpeg setting to LICENSE_FLAGS_ACCEPTED for the
layer.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/conf/layer.conf                       | 5 +++++
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
index ea0a3398..00b845ae 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -26,3 +26,8 @@ LAYERDEPENDS_meta-arago-test =3D " \
 BBFILES_DYNAMIC +=3D " \
     qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
 "
+
+# Codecs in ffmpeg with questionable patent status are not included by
+# default.  As this entire layer is purely optional for testing purposes o=
nly
+# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
+LICENSE_FLAGS_ACCEPTED =3D "commercial_ffmpeg"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index d3458b9d..deaf28c4 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -86,7 +86,9 @@ TI_TEST_GRAPHICS =3D " \
 "
=20
 TI_TEST_MULTIMEDIA =3D "\
+    ffmpeg \
     gst-devtools \
+    mpv \
     v4l-utils \
     yavta \
 "
--=20
2.43.0


