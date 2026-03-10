Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1CAFCC9BC
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 04:36:13 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33076.1773117369465403081
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 21:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jtS7zcej;
 spf=pass (domain: list.ti.com, ip: 52.101.52.32, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+MexpY+ydOIDp15JJgEkNHT2JogEHmpPdJSYg2IwplWxZ16DI0IndzP2NmONzZ9tcFuAHcuZalWltas3aAHLU6Kzav5Xiy6Yblg3XFvmXKEnghZszL7IIDhi19mEN8gToGVJyh1pNIxqqHA8F2ODneXBww2ecXXh6FjoLO3AuaWFwUnIUh8UqyOCSBntiJ6J7vDkJQGu5gUfwgZ93tcJmWNUL8tR8YnPv5dSHuum9lnbA6UVtabmVwWjvhBQUBUaaItI2SFapE+7O3+FV8nr7jMiNobA5Fhpx5ejxA5+f9gzyvOdRw5jCgJWVyXG8njVG6zcOklOoakGF2pEo6LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1A1mDNLTfVZLFITbIYaJLfyFAfloLsCmwL+FBRQJI0=;
 b=kq423XBDsYMgHsf+V4EEW/zu1QW3HzWp/nhBMhAIdR2IzwalG7UNhfuX5EAQTfjslSIPIwwQjvdz1mlsxiuort+mxakfPjW05SmMHGWn0ooJfdnX1CZdha549e8yVP3q3aomJkaM8POSeFLM5bz87q6TcYeNX1tWAdgBXlzJBCgA0lBkV9tI1YbzmFO6yxnU47WiBeRLIMq6Zbh73EWoss0wxRECqrEey94Oh+G/9kxHcuBGGU9PFYcSOGy7LzOZtscO1SX9gN32qXeMPL4KsgQTJ+7mThJ4vfnhMZFmTy/RmCT2jSe6Q69+DsjbO94fX9PWNfvATfvnjiJYNIepPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1A1mDNLTfVZLFITbIYaJLfyFAfloLsCmwL+FBRQJI0=;
 b=jtS7zcej9in4yZuYYLSucAz3Tz/+VCDbzbs+va29lHalgtSwBfmYuoZh1ruh2b0fcGBbXQbarGAERKNoLuD4Oa5aCdlonetJ9bmUK7W34cPb+X8Kz7ugwk5Uy+TcEy0tRHrNuE18/zUDQSXy+8kfW2GrfRZOu2+2hr7a8SXGsUMUeOxr2ExPVWb/IAi7ZAJbwjYOukkQFVG6sLb71YjtX5+xBaCFhQkVdCxXovQ1HhkT7vu78UYFZZlnrlblXJ3w4Huh+cztyE8T9eLHPzSFeiCj791LvWah/2Js7/H9iaXugY7GG+Msy8eLuTOdPui1hzq73rG2OsocRFaI7Crcsg==
Received: from PH7PR13CA0017.namprd13.prod.outlook.com (2603:10b6:510:174::13)
 by SA1PR10MB997580.namprd10.prod.outlook.com (2603:10b6:806:4b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Tue, 10 Mar
 2026 04:36:06 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::f9) by PH7PR13CA0017.outlook.office365.com
 (2603:10b6:510:174::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 04:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 04:36:06 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:36:05 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:36:05 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 23:36:05 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62A4a5Fm2951519;
	Mon, 9 Mar 2026 23:36:05 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 64A1D2A61; Mon,  9 Mar 2026 23:36:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202603091800
Date: Mon, 9 Mar 2026 23:36:05 -0500
Message-ID: <20260310043605.3034415-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SA1PR10MB997580:EE_
X-MS-Office365-Filtering-Correlation-Id: 990695c6-512f-4531-cbd6-08de7e5e8b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	ZdD7X+FSmTv0tDM3i4SE87KVNvlkTdoT0rUPKM4Zn+5JOsyKtKj3p3qxw5iDubQEpC1TQywiaFrqOqvZPNypjuRdJ1aR1fiJ6K0SLFrKBttDht6DIeQQdvkU0u9bpPMOz8k2oZXXD9/41htKHZ97RwR+/bMdwXzD1C1GFDMMFL/ok/NCtGyYGFjKwv6Or42GWFKdPW+bczjJ7G4wImsb7qTDktaAnN1o9NgLYb0CZR3oQDxPdxP9o+cxDE+UjK/Bxevoj1jisReROYPWDQ5p5YP1fnqjbJv7Pv7JywqkA4VBWe5H6hhpPzJpVjMO5LNaD+guvSNBicoWoPrEGKI9rwHci/hO48mq8OUN1x2l/P+ayKCYrK8h243PldO7LMfIvu8s17cPp9elRGlymwk4H35I/AnFxfEvaLSSCsTR/rhdz9TOukMVfC3TtPN+PrhcyZfHFXZOhP5BbnJSsrrMy5BTHdaAvZ8LeFPErRV8wOCcvaFLc3d8fv/r2jWGQTcFMTpPWmoO1w7nsattYEFzUOp7kJEzOCfJCRl8TOS3buKw2i2s+h39bGEJ2medMaUKDaKN2ai3eNipTp7Q6rgaa2uzDcY9IQ9mOten8fw1NTxt9xjBskjB0BKji7sSNR3y+tmxKHutjt2YR3f7wxXuQ+le7UsV2X8LG50ghNl38ob5xhhk0PoWLK1kusbs8qZUbpMWxJtGB/mcdWoXps5C9CLUQGq0c+gCF4Chxm/YksfIz48COTaMn8jy+ISR7IqgPRTJS3O39H8aT9tA1vG+pw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Q/bpdc+gJJBic9zJfxuGLdgTNwCS6QynHc04di7C3AUFuWn43w34witBcLQclX3q8vlSVoxMD5ZY8WLWOSRzt4jOjsWVvwffxfr3p/Z/PSF4g2CyL21aOjKqakW52WAQEvFJBTpFRWyeHDwFk8qwjWvEItOeVuZr0J0rZd4EG6OHeaD3DZhcyu7BYSZ89T7Kak5ULDyOp5QqhdfEEhluBemEi4RENVdCgGFSb9AWwczcp4KvIltSyuQm3bCEtvmpyIsm1Wz71R4lkJR4VdCIFZFUOQnLMtjNNgDHWcYysIWPxm2xZKGlycZLzlMfnDcjYgP4Y3hNJesZbN5GBNZgAqdY7do7B7jWDzfeEaxVRx42/+nGb5nXMRXfhKiO3i6Zrg4mTvjquqa9+H9bIDvw730ccpC6nU88hOKlKzxqFk5x4CsrzqXJ5KMEgAioAumr
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:36:06.0452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990695c6-512f-4531-cbd6-08de7e5e8b3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997580
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Mar 2026 04:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17300

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Deb329df837fc17f5f543dcf0b45cd7a1b6ab0140..fcd503b5a59bce64c89dabf41ce95=
2c2704d33ea

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 3a32225e..642efcd9 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "eb329df837fc17f5f543dcf0b45cd7a1b6ab0140"
+SRCREV =3D "fcd503b5a59bce64c89dabf41ce952c2704d33ea"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


