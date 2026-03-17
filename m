Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01995FF6E72
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:34:26 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86515.1773779658626497545
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QzEVbm+L;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.9, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdosdDonczD9v1r9F2bhrJ5l42g+EHvMXQR9CxOxOSzmWUvUIaZ8sT2+Uq6vDxK6A2XVtWqZusHIP7mKStxX9ExL88zSOxTh97sdiMGBaImt49SJXJWxWzOaPT8NSvGDHslsZuMC0SlRNT/26UAwl0/Z5V08XX8RPDV1ilIXaFXWcuaBWdHMDHEA3s+URwOfm+BYeXMpefh7ODS5wLaHVElHFI/PaaWt08QeWKJRQwZO8j0NLoyg6B1NcLQkoUJBQlzH118+HTE5QjKSdjTTDvLStrcjcP3DOeXUkYSCRY96nrzlpYxRTJpKN56wUNqLYpdQ7Tquq4Fib6zmV3NUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCl8HCp5s7A3uXiYCnu2nK6A7w0tTBmCLYzdsVtIXcE=;
 b=fcQmf8iQOKzFXu4bps7EL2LkSGGr7mK4dFev3rfagmy03FVLn7eaJM2/JW+XO6AtgrWVaFeQEh4Qe9rHcWmRXnfFkVVGxl03AjgAEzELnsjR2wBChYmahUNBUlMgl/vWShoWVLIBKarN/v4JGViIPiudNbPWOf1tvh3D9pISlahNERpcHMTaUAlZn/brXtD6SkYV1GijqhOzPy/nW4OCqltwyz5xQng/XSpdNqvJxJVnlscIxGqILLZYFaHmczoIVwZ5xGqRe1smvVa+F2BiCQhokocEguH6bqHPq59V5kD58JX7absESiuDuaTQx7HsYy3OeWVFQ9yGMALXVdLdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCl8HCp5s7A3uXiYCnu2nK6A7w0tTBmCLYzdsVtIXcE=;
 b=QzEVbm+L7HotaPYsNhDDaRHtQTQx9aPyL+lztwblpr0aY9RM1SLHz///BTobrPMRUOCdkrW/85faTrIQJrrcnHOOvTyTI7/YNStnDFD1IAZ2COHskwqmszpg9Ca2v03YI/n9MSKGUvQBoniEEbrYhCR3ILNrKrwpAglcMwsNy/8=
Received: from BN9PR03CA0710.namprd03.prod.outlook.com (2603:10b6:408:ef::25)
 by CH3PR10MB7258.namprd10.prod.outlook.com (2603:10b6:610:124::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 20:34:16 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::db) by BN9PR03CA0710.outlook.office365.com
 (2603:10b6:408:ef::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 20:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:34:15 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:14 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:34:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:34:14 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HKYEl73802963;
	Tue, 17 Mar 2026 15:34:14 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 0/2] Add libsdl2 test support
Date: Tue, 17 Mar 2026 15:34:12 -0500
Message-ID: <20260317203414.43798-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CH3PR10MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bdf1a3-5974-4c25-b7a3-08de84648e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	NPeVvz7kcU8SQWhyzikiEYK3DI/Z4w4SQWKZHAterLHBWkj6EqDCjJIPJzQTmTGbyAlIsSNayQI1NwHjkApzB68gEvcwZYgxKZnz5doFD9CO5lGvHVHX/oZzHn5vSC7hTTEvTqDYGshnbyGZbJbMV7yfyXKHYLM9eLhGHukBMUEK/j9jr0P06wRJTO93IQbaNtcu3ciJKtjzv8uNmMlO/OC31vWmxRqNu8BYmlXFQqvHoqMpHpS7JGSv6GC+5s4nAMmZzQ6DVcSzLrurYDQvnpDrUNW5v21Wcrs2pQXqjOXuZ5qfyURHEwB0HOhxi9X+xrdT7bhMsxJdM42YtlyqmPdOxyVR1n8WR7/X284iEi8InxJve6TFLqd99kzom8B3gyAYqdXTySClhB4ySCkmHGAxnRDyLqPsmzq3q6/PzxyWjXM9Ko/GT8bOEQdjoJ0dTZQ00QF2MGNcmBW16Gi4n3ZbIEnkG8hXE7MJ+KvXWbOkyazGxrPi80H3yrz6WuFhoinHEKccWxfIog0j6vSuxn1tRq4L018ky+Cx67LQ725Xo4jWF++gYpDahDv7I41ibT/14u13X4aMGJvoou35Onk4ud4UrEtJ0j7tzhKHjDcuzI2ldGsCP+owkY2sO4KA7JA/NYo5WruwMrI/STpEYjjrNk0MiAS97N/o2JTey7ft4+U0TvBDcBg40eIsUtouNXeeO0ShKPgm0dnc7ULHcFzdT6EL+eDWlSi9GSYJPg3Tuoe/EkUiGRjK4OgcGBJ+UtXnTodKnKVUT9q8CrvtOQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9yIZ7MJsTk6pH38uNbQ1dkdn4vd52Z6Ek/EtNshdXsS6bsUabpcDHhFJHpV2cO/UW6i9DgkMZ5F0+8/SFx8YvEcd/uFK0Cq07vwl2Tv3B7JP1feuGqwHLpMiThEAUWUAvpAOjtg8OtIct/CZVz1Yxgoz9teQdDeJSLNIHnp2KySg2JV9tSbmV0/LhDgjKEvdaKSsF4zSZkcrWHGsvSTRAa2vewgPvIlSFTn0OcQXvSvCRVqk4CWnwVolmFbMHvd5A2liUTGIM0pWgPyMvjYQvSIxrezrhmJyamQZ4OFhVVs0G+1CpeN8fbpfBxDUFIojM9jM2wcezYr+X+79zvvTqQhZssxF++x1tGrfZbDMWzTkTKcV2JuZr2gm+Cp8I9lYfHQJhp2GgeT2wbdM0nl+JCkF/qikuu7B77rkSxASnHVws7/ZI2pZMTTqVrpJQvg9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:34:15.4026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bdf1a3-5974-4c25-b7a3-08de84648e79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7258
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17380

From: Antonios Christidis <a-christidis@ti.com>

Build and package libsdl2 tests.

Working on merging similar changes to oe-core master, but in the
meantime the tests are needed.

Kind Regards,
Antonios

Antonios Christidis (2):
  libsdl2: Add tests package
  ti-test: Add libsdl2-tests to packagegroup

 meta-arago-test/recipes-core/packagegroups/ti-test.bb       | 1 +
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbap=
pend

--=20
2.34.1


