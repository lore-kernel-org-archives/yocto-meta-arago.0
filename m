Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2853A1067040
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:44:32 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23312.1773326663341923419
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=dk37hxEC;
 spf=pass (domain: list.ti.com, ip: 52.101.56.62, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVb6UE4PZCt8jTPtUzjb5UXzP1l6FrIqyQRswNdWrUVjCj709db7BlWuirFnCQU5/Bj9lHUrvA5lnvbeR+pudJeE7GQftJKOckP9ZWZcqnsyXUXLJiij+t7ghjBbtj1rdBF8bZanfMjkKIVoJRm4Q48Phb9wxTzc2rgkWpcyKMxFsFLyQgy40nqcFaQ673SyJ3+iXLJ+6pzPmVG+OsHaHYLnCglbBNRqgn8Ndc1V54mTNmzm2jH+XZJSY64mKMgcfTtvHi8ssY6jjIwONNThX/wGm+1rAZevD4+pD4/rX881Lp4JQ4AKl4pD5F06MT5IwmuJBb/vIxur2YBNQloDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZnt7CoK4YNn0JShQlM9jo94vl9INt+ybbolR1R5UYo=;
 b=EpLElQmDJM9YT2IrbE4Mahm4aHR358O118vg73+j39lAIXKtIEZHgVCUJ6Tooub+WN3AU1ZGT6M1joALUP5p5VPF9gvtIMwLzRev7WH8zafLbnS0+psgkpMJvEe1X5NlmdHpuyxQ3ghh0g8uUJ7LkGRHhLC2H6Thbm1g3JJ+x2KFRonuFTauv/YCBOCpBGei3UahMBY/o2rmmbO4yPnZRjDF3KgNDJfD04IaJnlQGiQF9NpCgUduLbC20pJ43NAGxG7ZlQXQZpu4wqArZWfNZ6w1SE/7fC3px0AUqwkR87zL+qFmNEDF8p7/UECPtHBMQommPrtfSJH78OHipcavhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZnt7CoK4YNn0JShQlM9jo94vl9INt+ybbolR1R5UYo=;
 b=dk37hxECzLeg4Spz2a5h22KLu1IDIeNN66SkCuCOuor3KdgytT0MEvkTjhuxk96vN53dC+7Wof8jWTFzkWNLp6sfxCEa+a37NZDH6XD7j77M7jfron+V7D4YYF+pA/i3+EuV4C6qswJ9/bRnLlwSFSzKGmvQR3/eaaqcnt+ZdMyp3NHtPu3X7FIIxMnxywzA/E0HSxPuiSWgTwE7bVguXg704lnv+hrtRB38rSKW+KKj0N6faTxUqJbk68neIph2Z8kxhMKgbMaKfWbGumcmnIoPmfP+mh57Yhk7h1ZBUk3kn4WfN7hx9SAwbnxvcxARC22Z/VyvC5lEWwt7W/isBQ==
Received: from SJ0PR03CA0141.namprd03.prod.outlook.com (2603:10b6:a03:33c::26)
 by DS7PR10MB4941.namprd10.prod.outlook.com (2603:10b6:5:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 14:44:19 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::23) by SJ0PR03CA0141.outlook.office365.com
 (2603:10b6:a03:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 14:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:44:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:44:17 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:44:17 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:44:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEiHKM1565603;
	Thu, 12 Mar 2026 09:44:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1610D9ACF4; Thu, 12 Mar 2026 09:44:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite GStreamer pipeline failures
Date: Thu, 12 Mar 2026 09:44:17 -0500
Message-ID: <20260312144417.4125208-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260312141948.1002945-1-p-deshmukh@ti.com>
References: <20260312141948.1002945-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DS7PR10MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: c7812c95-2c40-4f84-2298-08de8045d752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ptKBEV3EvlBkX2hxCLnkmk8Z9ZAnmE8pOQldMsBYBZlqhZCvWK2477eoSjf2byXOdtgzqG1OT2bQHZGWMao5Y8IP15p9NJJ6YGTp/9iXxjKwmcENJzC9poQS1mEVTdQ/JfKmE0ONCe+Ja0O36EdgeY0rWle+B1KHNXKalV8NY9fRTUP1akCznENa3GjEcjElpZ9c74SAHe9GtQQ2rYoTgrl7XUl53ub45HMFiduJFy2d1NK8+cLkccOi7yzYh3Xw6uC6uS61j07NqsWqrWcz+roOxaIGZMSGuEvFc7AkRO6UxV6AXLL5D6ymy8W/qJU7we5cIt7/dHRYt+a1MBJ5NE0gMvVbHBVC/hYpBKphdSBIf+RQQKwB9nlzQNs+EkoIPM3rK94ziPY5DtxPwz9IZ06/m7a8CwixWkG2TBERSgGuMClaXE/Nqclsfypxvk1HOSmTbj7D2Wr0p9Pmf0GG/Xkkuo3ZGBqWKuPPfYq4xEzB7yj0U9KbZKyIV3K/xPtddtOlfVxC1TK+R8yHSlhPlgkk+hREM3ocU9KrovL1D5NgEJTDSLDt1KCwDk1T/CpJ2+4JFHTvKvOm6fH+CZ0cCbBfhtGMveoBkGYvjbf5/bSw4zv6ZXUTRxG/gRlorxQHese4odeg9OyKiQ25Xr2theK69LzPnyqQVUG34GAXnkvlkrABRLz1k8IOOFWGiNpGViJ0eNDkAwaqSPosaYFRcKrnxXaLU1GPv7QDyKDVVcu/NzvlgKENPUG+ivsUsfyumVjC0nIDcQWI65isIa34DQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9lytd38jpAqU5NCBiiEP7+Ik2vICrOyuECqf248p9SIMVNe518B7KBNhIUlMzlWdrnvlqChiK17DVBQjIjf4MY/OqhY6lQ3c5mHspkcXWn1j5Ce9SpOUV/cmMZNxsUPVPNoi0ieFV8/kqSoqZw/a8XMBCVx3+GzP7+iPRW6f+km7G2P4fvuBHZvOb62G+ntoxRmJ7tRny/wf9GgSDvEVZy8YYl+4jMJIqJmn++OtlAMmQvVXGECoEUU4f1AT2FPUw0GWjteuoVjwSQuQYe5tnnRLMUOBEUAARMIRbq34tyWlONKwGjiLED2V/RXGGjmGoHVecIjbWk8a6DsAPAnEfeRFdMlR2TARF9iHg5kcZNAEwXb9pRHe46/BrAtvnjHaTo/ZTEsTIjhSQ97txFt0EZ8u82IvtSQQNdin7+s8342P/aXXfEhYnNzVYpktWk6R
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:44:18.5546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7812c95-2c40-4f84-2298-08de8045d752
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4941
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:44:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17324

meta-arago / na / 20260312141948.1002945-1-p-deshmukh

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



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
- Patch Series: [meta-arago][master][PATCH 0/1] Fix TensorFlow Lite GStream=
er pipeline failures
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 12 Mar 2026 19:49:47 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a4780a735e32eb31e3fda078f561ecff4=
e7f2adf

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: bf13de211888bc29ca4b2882630cb6c0135cdc8d

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-examples' (but <build-dir>/sources/meta-ar=
ago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphic=
s.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)




