Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C835AE6BF3F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 22:29:07 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4529.1769812137556651542
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 14:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=d9hyVqp2;
 spf=pass (domain: list.ti.com, ip: 40.107.208.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgtSJzwprTWU9iyvYeUn9gppglydUNkyh6QLNow4neY3mVQ75yk02WE440ogiEFFa4bZEtvs7pIyifz1sl9PRbfuHjbmblmBOhIknITz4gIeYMrVNDW+uVMnmyQ35Nb7oVp1nebNci9wVZ7hJsbwC2ODC2vnpZ93ogwStE6Aw9BR7AoQxjcJi/LzaafKt4oQR/mhBC2yC+kduA/kG0bgmLV6tbZnXkTjTc4kE+Y7jwaxDiU1BGUgSoo/z2ILaS5KFpMqp18fQBpt+2jRCHOVyMkjvz2V0+tOCOJudFh7cHa67iMEpnellMKRFovCCRkSmC97PBcponJWyeQy2shhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTcy4eK0AAKgqkWpakh/vPwv1QbnY6/ZbaWcSyAstjk=;
 b=OQBGl7zC9s7tnBTNreFb0IBMyfAaCgeXN0fn2zU3zxbdqdwj9+JQsT7+TAjUde69fMBhlMEuxukz+VeuB+qnoaDvow7Tx+hZrhCpIIRVVAdBwCNpRL63C81Q4vXIhG3xA7vX4HGdr+OryFg6HuvYZCKGhSx4RIu+C+2t8IY43bl05+I4bu3a38Wokxvh3kQsDmWll1utJNu7/qMXlYNl8MI/AwMGhWvnM2+wZ4rTpX2wt8oSNBlUuNQd6vvKSgRbSWA+k8ROYoakigjw6vawGnO+hK84EhDyAB/tJp8H0xs1hL/CMHupSu8kvOMWWbm7gYxvMSqy7obS/Hf2MIAjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTcy4eK0AAKgqkWpakh/vPwv1QbnY6/ZbaWcSyAstjk=;
 b=d9hyVqp2l5rSjCfK4fIDYuLAR9fnQfXgAaG0YW9a2LZ7t4XT8sAS+oOo4wE40WNc76ch/n7iW7of+1pL9qAAtCnMC7gOSQaW09l69ivcZkyJFvTH4bhG0+7qqshSJ6FzvmmYHZygBjV4F8kQy2u0Sc+4eNNMAqx/ZuT5EIw+M4zmfhPQzS8a1gIathLkHQHsCRip7X9QuQQuUTuWeYmFPRqi4t9RhxcMqabOMLykNCVWgPgTN3KULDkopYhh3XU9CEGeZhRnk0r9JOd4kIBN2D7Rj9QLwnL2jmQhp0jONWJ9cgZYFrppibbb92HpnXRAc7DslvohQA+fZ/4yqB9fog==
Received: from BN9PR03CA0925.namprd03.prod.outlook.com (2603:10b6:408:107::30)
 by DS0PR10MB997552.namprd10.prod.outlook.com (2603:10b6:8:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 22:28:54 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::9f) by BN9PR03CA0925.outlook.office365.com
 (2603:10b6:408:107::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 22:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 22:28:52 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:28:35 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:28:35 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 16:28:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UMSZ023194805;
	Fri, 30 Jan 2026 16:28:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 258E82A55; Fri, 30 Jan 2026 16:28:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2 0/2] Arago image names
Date: Fri, 30 Jan 2026 16:28:35 -0600
Message-ID: <20260130222835.3676016-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130220830.2173125-1-afd@ti.com>
References: <20260130220830.2173125-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DS0PR10MB997552:EE_
X-MS-Office365-Filtering-Correlation-Id: ec750678-3af0-4c75-fcdb-08de604ef2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yOTAoF2jXYyio2Bt4+D0s273CPSoLFZfXIk3mjPp/+6qkgwL8jdcAbLqenui?=
 =?us-ascii?Q?/NI+syoomuB51rqLS2nygsvYCjgNeNUxm373AQ9dCXGGTwve+kU5hJXdIA21?=
 =?us-ascii?Q?X5B6oisWnPsUgOStAX4ufIe8oVn5EoTrgbenuLw1p/OXPTO5tFVUzQRi18fM?=
 =?us-ascii?Q?+6Lopw+Lj7FAbrnEyEz0FfuRPIV+a2yh+WaoiTpznPBxrZKQk4NzANl3rGnF?=
 =?us-ascii?Q?dtotVZvXAHNZZbM+8A19dOxKPk1NHR6mRQC3sYuWn5XPW5nPfNAhBbOl5omF?=
 =?us-ascii?Q?a3nI/+fPrTIkcBmf8Npfw5/PD2HUlr7wB700SoTKPR3Y/srF5poyONDxWlaZ?=
 =?us-ascii?Q?SoG+4fLgr5ogT/4AZuG8BJ4oeGJJH0qXi/A8XuPelkHXd6cthu6MuzP4DolC?=
 =?us-ascii?Q?0F5lIfrQDxT4brGAxxe+5RTRoZ7ZPI2xrgIbj/ihfGCyK9o/hDvFxn3raYvo?=
 =?us-ascii?Q?+T7Df/Yy2fihkqiu/gRZq4vESINuv73Ur4ei6mWOaV3Vgj2itOR44/1cxVXa?=
 =?us-ascii?Q?pNqlOTTfBB8uw+eLRSigzTYK27N7XQWjUo6j07ZQn10kITL4DcKidvyCRWeb?=
 =?us-ascii?Q?9KqnMF7oN9E7mTrx0qTO6N79YnpJrMYNUdIqnILDzaLFMFsY6LxEgvQ8c+AM?=
 =?us-ascii?Q?Y6VwumkXlpTpdISrxgWnkQDFl061hjk9R+V9XCoEQQ4EGezO2yMJWRxMDWCF?=
 =?us-ascii?Q?rucduuLxFaTsNJSDSzgJuwgqlLY5yXCZDckwK0aPYCfZNml5nDqASIlVVY2p?=
 =?us-ascii?Q?Pvs/bfb5iMgVugpPQgyLheR9CpBbOONpoVaAM9JxhL5mWDADUMrw4mFoNHBy?=
 =?us-ascii?Q?9MtB0Pe2rJtiWWPiKki2f7vY8nPdeqm1fpTzA9NtIvf4QTK4PAUZ9xDC/20/?=
 =?us-ascii?Q?naFnzPCt5+iHu7VmcBjLK1ET6R9rHPXVzkuGjaobSj6/NInSMKMV9G69iJqp?=
 =?us-ascii?Q?oETiaw9pf5lpYxIrxvbi8dBMtQTzjJWG9WS72CzJ5OYAXYEL+phEV4+CTjQx?=
 =?us-ascii?Q?8feMQvv+PhX4v6vbI+hM25ZNRdX+4VflWo3h75EgkzUmTBBsX+5cn7ld9mop?=
 =?us-ascii?Q?QXQUc+yJgkk8X1pJZhl5nBvKViaXtvFu+Pj5SJb9TsRjikB7h6ngshq6wBtO?=
 =?us-ascii?Q?hMJVmHU3917EjojJ+TWlAhYiA8yOkHfHqmcUeBUT1gtKvy7UXGkDanQ5Phhz?=
 =?us-ascii?Q?1IlMTGIc2F4o4LXqC+Xct4GKc1fO4XxPvhNdWN5GRihgHbucL13AKkdYHqJt?=
 =?us-ascii?Q?lwtzPEISCGOtWO1j0AlQ8SdY664+gj6otJIZkpXR71kiz0en9QLKMkFODpyL?=
 =?us-ascii?Q?mEruQH0wSkZeizwksuCvZ+sHa3qCxwcCOEyb1VJtKJ3ILK4P51bZDUvvK/Rs?=
 =?us-ascii?Q?yp2E8fcIP9s3sZ1XkKB8CXJ3tJmKqT/fmsBesjUqhvZ+04EhU+T3wdWqsQag?=
 =?us-ascii?Q?QolNyv5bI8FO1sRo+EdkPE3m81d0hngawsEZlx+5KgGVH4tQeoEbIYuSjpBB?=
 =?us-ascii?Q?JE1LUMNefyAh2S63rXfjgO1ZGD98Z4vH9sCiQAqevgJAD6PjxS8zdoEfDfpP?=
 =?us-ascii?Q?Mp8FMBAnswatu71AhdNVaiTD2pFIa4rQ979w81B2IW9JesWF6fultnq6nYMF?=
 =?us-ascii?Q?Eobc/8LmEorb1lS9na1KYNOwmGyVFst3fXXoW1t/EdVg/OC7CFjaF2rT2/Id?=
 =?us-ascii?Q?rR1p4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+FjcdTtbBRVqLl2Lv8nFYrx+hfeTeqQ3A+Xl/Ozptf1CpOuQQDdet58EeQFOoKaE/E1UnvLcrHdgcX9uWnvs+GmfnEa0pWH2vOj2PxNyQN922ojbDLDWa8+pWflrsI2lDMJSNpLJcfBLb+6YMCW96QbSeDXfbOi2sPq92925jnX0QDgqvmeb5xhSXETCaGvnkZ+C22WWteAveVfnm5CT2ALD9ozFGcnAL3BC3R+2beWYbEwmNEymUKIo4DYyn8ipOaS1qEqBPvAFuV8aMDfXjXCvm1/kjGy/qi9j2WMU7VUC3FXzXWnqv1wOKyahoIxHJeOuH1Mn+t/b7IWtc5XpZAZERWckw3GXDmW2XbFN4+ju0J/FzSB0Lw9XAFNzeqizvKrcx3I8OY8v2DZtGBhO2gdd2bckvbl8NuM4fBcDUoMLQeVWdjdNpyXyaTj9B+bL
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:28:52.9962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec750678-3af0-4c75-fcdb-08de604ef2d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997552
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 22:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17060

meta-arago / na / 20260130220830.2173125-1-afd

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH v2 1/2] meta-arago-distro: Remove TI SDK =
branding from Arago images
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Remove TI SDK branding from Arago images.
              meta-arago-distro (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove tisdk n=
ame from Arago packagegroups
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Remove tisdk name from Arago packagegroups.
              meta-arago-distro (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2 0/2] Arago image names
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 30 Jan 2026 16:08:28 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: f8274c7f742d74a33c1712b9acda8d03f=
60a4ce0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




