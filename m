Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940DEFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:52 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4079.1777434466201802584
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 20:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qI270IJv;
 spf=pass (domain: list.ti.com, ip: 52.101.62.5, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvJgP4ypLecEOHattgwZSYUfQ1+XAwLTUjHEfMgIf7XLMvVZH9l/TM0tSdC6x3NkTvyNLpUsPhR70+m1qIGNGJ7vZFDrk1OQMCXF9JkFwRKbezN2BhLdtXy83m/2cjCup1m5S1X36JK4F4gBGpaeRy8yEehJpUABz1vZPPzi6iHUkmwA3BDJF9/0LJ/ZaWvDLBMaiuDLglklu2FEJFoFT2NmXf/UomRzA+u38119J6q7gq9/eeABuMZhUzFG9BXL3aPckKQrgp5N9JSvZn0PDEdVjAQp7kkq3p0pSrTqeDNdOKS9rumeRIHGa9ZrEmq9JMII3oNaDT+90FYfbqk/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIkpqTtGxfHWzzNAUCo5WXZsJ6Yme0QoYCNAZHMdnb4=;
 b=KkK7voPnAMlZrzp1BWhiWtrCbzNKUWKO7wSmjfBAk7cf3m/ObATsRT1473cKJXmArr63qq/UNeAA1yl41dO0j7g0Y5bNwMjmpJ94U4qj7IGpuE2u7X+WiLXQntDZ1S9/3mj2rXbE9LSHpy6xfoCbV9D3DicczhAoXBGSlDVEcrq75QQihj3upGzJf4XW/0YWIKr9LDbwh4GcezOdbrsSy7uxvI+caHKcNd7SEl56NMOqLBqVaWx731GW6fpeWz9ONjDMh5rZq2vphK1PeQgqd9l8y9QI9ST/41lXMviWUJiNFxSLoHsYwTW9ROvAeh3moBODoWjkwvRTQWCTB4DJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIkpqTtGxfHWzzNAUCo5WXZsJ6Yme0QoYCNAZHMdnb4=;
 b=qI270IJvQMPFQ/PS6Kot8KCRacb333AKQCc2f7EWERrMF09iKJxCd8T8yofEG+dWMsrdcXlQCIIbpVsksL87IqqAwylhHnSfROvZisF+t5eEC1Dstgwp81Zmq7xxw+3PuCJ/unj8ogW1B5xWQHbY2nErGuqbB5r3g7NUakDN3Q52lJiGg4Gedz5jXoX9jRk2iDtl81vokJjxXxDNtBiYb8rJ2XqGQZlYlDh0UBu+WeB17vW3eqs7L/271JLs00nvmUEV6Vmw8QvJJaIPcYvUCvzA1kG4wPEDV869QSw4ntSQVS878+3hzECnZIxLwBkiQgYW0AUujhi13EnXKlBJWQ==
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by DS7PR10MB4895.namprd10.prod.outlook.com (2603:10b6:5:3a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 03:47:42 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::3e) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 03:47:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 03:47:40 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 22:47:39 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 22:47:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 22:47:39 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63T3ldo62285203;
	Tue, 28 Apr 2026 22:47:39 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 13C292A61; Tue, 28 Apr 2026 22:47:39 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202604281800
Date: Tue, 28 Apr 2026 22:47:39 -0500
Message-ID: <20260429034739.3842536-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|DS7PR10MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: cccefd4e-a586-4c82-1547-08dea5a21026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	33IYkTV3Aq/MWr0+fQ5GHFtEpFEmvIqi8SrNnCRohVOtmuZ9qAPIhObF7KVCYsCPoPIEZT0JpaCBCb7Q49T7P8HuSzCINf1C6emnq8mhmNHb2cuaDsOogNZVq+3LzWH87nne4RwZXLg5hlk4FSIP5JFDz7YMoKbvi+vJ1aJUFRoaip2JSZzU9DPWUF1nh5JCVRj18NqOG9DbilAkPLpKgXbSsvTfsxZviR8UsLjldg1PTyZ1J6jn/E6VJwh3V2EAHHWEg5JCxonxxMMJcBLZw91RcwCHG3QJyoJuN+ssnkfOrmvvLS2x7MN9xZq5gN60Fg6F3QXsRZRDrh138bTqphYhRdf33YtAkyZr50gKkQkyEnNwIVVofLJu1RxqEo5uvB6oQT+rynJr73jt6w9QEU9MgRTpS6bCQ/wkBTAQqk/sWpWYQ1iLsx/IwozwUV0KTdjx3imRZMYfgWnbw48QAggZYfJ5dMxlc88FFfuKQIoe4O1E94mNqaXPkPHC9M4qTH4EIN3cmf/5TIltqR9ggLL9EL73LxPS8Ilqoaec8ifcB/aZ9lokQkfJeYTnrWS54r6PjFW2sEgamsNxF5+W3BChE8UmFr8GOg1P2wdb+wK4sYAjODV3fXNMP3RLNm1nvmGjckhalExmLuFbFmILxbnzmwnzvujnSRxrEDypzq7CSIkRpkRNuRzJqoh6WAQwuPK4aIv4Z7s+0Gskju3P2g/fYeLcATSurYCDu729/DVR2hHcWRunTb9HWyl84BJzQYW8HrvWx00l7SaeSkhlrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	srKr4kbpwZMBJbysc32KrZ2Mt0xb/kbThQrXxVV2ZUUtA1ldy3Egvoug8VF1SKTJxdELpH4HpvpUX028G/BRXAd/VNzoFh26qrfqSfWwF+K5iHCHo31N5nXkBbRqGtSB+7/BG9MvQ77ZgGUb2fSqKcS1wSa7Ttx8wMp04cZP9vashDYiwj+EOlnGJ6u6MVqksNcpQsL6Cknv60S8Ifvx4s9wYmi8L9kqOAk3XHkMHUA/sBcNgRtgg0sAGY29VVCGK9DiVZAqWIm4JbgBW+QKpyfISlN8pwrYmDX1PsgGiY/uL52m4nOYVDzC8UHSG8w59mrAZXkjkGgj0O3aU/oxpViE+xnbL9qLI0dEfr6k0RzBB4i9lOVvJBNZkAA05xi2NUtKpstphKSg3wbDsBHjp444XomBUggkh/CUen3B+ql+FyqOpAGz+UEBE8qv/KDI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 03:47:40.6115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cccefd4e-a586-4c82-1547-08dea5a21026
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4895
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 03:47:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17505

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D8c6d7c033f2523450068ec128ce6375a0e2afa80..6a1c144a4bde8cd26c6cb4ce76e12=
ac1ca1ce079

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 0168d125..8f008695 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "8c6d7c033f2523450068ec128ce6375a0e2afa80"
+SRCREV =3D "6a1c144a4bde8cd26c6cb4ce76e12ac1ca1ce079"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


