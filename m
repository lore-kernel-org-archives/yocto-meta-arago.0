Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBC21099B5B
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 01:46:24 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4230.1774057577730704167
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 18:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DhMio2gd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.62, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjhkaBoL3SqwUxUOy+yI13Rh1wLxw+elkQ1gIw3DjNKxfWeSlHTthFSYugHx8AhSRC1ShB8xhw+9qnqRP1uDk9qgftmoBffAfS1ERKhGA5ECrltwyQGR4Eo2jm72zEBEK7ek5T6knQDlAGZ+42OJhCH66x8onWxnJExmhffmymAOgqC4Mbjdunor4WG01izSc6sucpQXYHBcaRB2sgcwRGddhrpeZjsQ/VdcNyMVT5OnCETUhMxp0N6DcwRK3XcdoWEAZFiKKN2unJB5HWZEgUWt3k4IE+kbIiKs9XVQYZZdKLK0VoKPi9SOz3nQaMSx6J/06hpNQOTuQhlEpUq3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mzazc9bSm9c8Tawi5kwHRwvMzLF23GMXaUbrBsepgss=;
 b=ydHoMFepgBksk2osnbyf0XSV4c4WvemJBaf8FBl5AXyfN8VNZ+Kaf9KDPrq+57Om1cxJDLFppDVlF6alYc0urW255wEBjyGlQe7Dp4KSDSyGi/46CxEV2FE0PKTBgO8ObKYdY3K9hBpwic9gbjOFlrA7QdFpEJCbI1YTGwn56EeV2xtMadHc02HJ+QZgldyJ0wza7bTn7OthlAnA7Xm0W9873I71Ed/FdIwPaW+NSIt8FC9BbONlaC3rqcNR+6iX4MGfwJtNlJzeJHWENYFd8JJvn/yIexDyq3EFur06rGz14bdi3EpHJlbSEgR/Ah3ZP5lowkEfdj16pKAAKBXApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mzazc9bSm9c8Tawi5kwHRwvMzLF23GMXaUbrBsepgss=;
 b=DhMio2gdSyrAkuiDLxVIGYdM11C+vxFhlpjXj2rELUo+fAbyBkib9JKLNnot9ri+ll4HpxpBc5sBe374jeK80cAmOSuDNBBFcspoTi0y6dASRDT0SmAd8IeisQvuo0/RG9LKC7BqDvmRlwqyNQP13tJvEroolq7KSyTPi5A2a04=
Received: from BL1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:208:256::18)
 by SJ0PR10MB4702.namprd10.prod.outlook.com (2603:10b6:a03:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Sat, 21 Mar
 2026 01:46:15 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::50) by BL1PR13CA0013.outlook.office365.com
 (2603:10b6:208:256::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Sat,
 21 Mar 2026 01:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Sat, 21 Mar 2026 01:46:14 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 20:46:11 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 20:46:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 20:46:11 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62L1kBVq1029152;
	Fri, 20 Mar 2026 20:46:11 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3lPn-0000000HPhr-21kf;
	Fri, 20 Mar 2026 20:46:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libsdl2: Remove unneeded setting
Date: Fri, 20 Mar 2026 20:46:11 -0500
Message-ID: <20260321014611.4150384-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|SJ0PR10MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: d59680c9-6c84-4450-aa63-08de86eba30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9ISrDQdBe1YEFubaRlccX0EFGlxmAkvLAhJIYUr80mX3sbkBoITa8tV3nDhuAjfp+gw0BCn7xAdSnVmnpC+9yOao2cH38HwisAIICIqgAECt9+1rAQrlI7/5GLXk3ifpalzeMvdjQzMtvk18usdMHYaFVotCyrux2yRAaIGS9/PlUE9cZQvruz5Yh/9g3XFJJTASCRvUEnOBuMPQXeGd3656hrMQhs00oYfQtCI3U3b5d1xfpqw8IrTnHH+M6Z/kFoBycxnJbtlS9KjNiTTs6bZzPkGrKxvhA1lLgO7QT5fdLlxr79IMUcaDwxgqR5z9yMH4pxlO5c3O3KhmgB+D9bvLPfrqxcWkawi6HOk7AKDOoBBhFMi47xpLNZYGuUx4i+jS04pFwpwoWGOs7CqO4Mka/yhcb/DW2fsxVLqxM5uJvMCef7tpHOcv4FnjNd5wHmNseluQADT+0xS7WB2Z6W548mxnk5F0ojk35e3+gV2+3FHtPzd602aQW80RniCua/zm1+VL1HVAuvly0EPCcYinWnGzRcsCdjWO3ZvVsqvLKpo9PH9nF/kxEg0HSCh9KoVfeBxXJQSROCmFTVRRpFNgPZH+cAAlfT7sVjw9DYFSZdtXa/zf7ud/j/gbN6J2FC+BniKFVLopLSak8D5NKZu4IVSi4ydLl6RRFLKZvB18yOV/G7F8vDgBikuRCEHzV36waFf5QYKpiFSOwMYin4mkn8AHMLTpmaVrrcDRYH3v2whmJ8VnyJhOo+buMrMYvchdwvf2PW7olGEGrcdLvQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	83uGvCguPd1/JlJJeOEJhGl5Bnx6oGvrNnA4FdUfkZboU0UPq3vnW/BgKWD7EvITMmbtM3p8QRpLgpfl6yKCTMvcw+Q3e2Tsc9vVMRa1t1H39MjVikjmvhqE8f7hBux0fB7gouManwXr8mH5QlmoayzbvaNR63/uNnGZnCeDddEQXRKBsH7bTvlzJ9pTcWwuJhMLh6M+OscfKzn5/jJtQPl6+RgURysbWlTWyUN0jj0NXgxJjCJm8/lS+VD8clI13xHG5brYJu35l4BfU4nOQ5qQpxScaym9zhjh84wozLm1blhXgwJYW1FslDRArDtVxblYLmUKU/Tb9JqLmVw2QcaedsWAPR3HyiWuD3Xo13oXPV1S0rEjvhmwYEpEkfKjX0n1JarHkhl+xbBlB1GLMJ+JPWsyK9+17XIm2CzkzfBhQ/7FclV7l4z6mBRmy6S5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 01:46:14.2889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59680c9-6c84-4450-aa63-08de86eba30a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4702
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Mar 2026 01:46:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17414

When we added the FILES:${PN}-tests:class-nativesdk setting it felt
wrong, but it fixed a QA issue in scarthgap.  That issue appears to not
be present in master so we can remove it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta=
-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
index e28f42b5..33ff0632 100644
--- a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -3,4 +3,3 @@ EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
                  "
 PACKAGE_BEFORE_PN =3D "${PN}-tests"
 FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tests/SDL2"
-FILES:${PN}-tests:class-nativesdk +=3D "${libexecdir} ${datadir}/installed=
-tests/SDL2"
--=20
2.43.0


