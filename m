Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B195E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 23:32:21 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3037.1771457538851969891
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 15:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RLmJiR9E;
 spf=pass (domain: list.ti.com, ip: 52.101.48.25, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBP8ERm8cZXWjAhocWQ0v90ukFGbRy66twjMjyI/+0+UQOWDI9fxg5ZaF3BQrGzbqrpZfpViQUx07j85/HiKNcKqYRtqI2h1OjxrS/zyyEkTUpKeiWeopUdN05akK987LemyJ1r7X6A/IGe3G8z6weGcU1SZPMusHtP6emOkSyVbxZ0uHbLwzpoCOaVa4BimGH7+oZBAdtoREctwJFVfNhK638p55ecOif9T2MUQaz6FjP+RTK5B8x4zqCEpEnG3hCpiUiLC5lYm1WzvQ7FmTVxze46OlsRiKO46ap05FiF+XJeozGvb1eVuKag1W4M8XrDxtfjotN1KM4xYBHPFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Sr6hR/HKI3gUcS/B6uCi+ECYfRTJ6QGiE06j3RIMm8=;
 b=Co0jW/zYS1n7y5sCE3mmP54tFqna/o5LUIfHR4Rp4xnW4DxiiOj+IAjEbXwwbSD6aMArtmWo4LiisV8tIrCS1M2O8M8GOU5JtIsQJ1DY8QLvNfnwLMwNLrpoWai5YtfMKKAISE4KPKSBKcKyAawpZiShsWW3O4h8WVf/i7jweC5iSI8td7UHLu+RwqD/CzQ1cHltkT5r7Vpyhpd/3RxbHp+kq6uULNdNTeoHjMXQzBgeMD9eUAU3NsZd9kr+dA6Z3+SvDShv2GTb5pEL69ngtmw3XdX8H5ceGExQeKbsEyU72dvTvb1wAGA1dmpvT3qa9A0/NPTc4QhbFwl81s1Vkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Sr6hR/HKI3gUcS/B6uCi+ECYfRTJ6QGiE06j3RIMm8=;
 b=RLmJiR9E1JKmU5GPwSQlWP9X1qbs3XkY7lCDhjfw/8Zy70oGExQBJYmxQgmfjLprHT9VNfPVpMjx/EMaVSrqz5a1CN6mPlGUlDGbg/sbbpGw0EuJrab14eEfXqoLw3oh25mPCLHy3V2QFy3nOyn8c4O5eqZM3B+7nWpGrS88LcrIkgOIwtC7h43Q1nce+khtD2WabQRpPKgBALTBHnGIcIqFQ+S1LSfVlVKTi14J5Tv5iCXZbUd/8Yg2TuSvVmofMZ2/c/9+nzRzk2KS4pd9SuAMj/d1pbJnYMu963uHjiLrQxw0xHGLyFKe6LRiZB8eLsvS3Haok2foY9MS3Y1kew==
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 23:32:12 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a5) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 23:32:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 23:32:11 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 17:32:11 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 17:32:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 17:32:11 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61INWB5F1647048;
	Wed, 18 Feb 2026 17:32:11 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0FF02142E1D; Wed, 18 Feb 2026 17:32:11 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>, Devarsh Thakkar <devarsht@ti.com>, "Thorsten
 Lannynd" <t-lannynd@ti.com>
Subject: Re: [meta-arago][master][PATCH] gstreamer: Fix CMA Exhaustion in latest gstreamer
Date: Wed, 18 Feb 2026 17:32:11 -0600
Message-ID: <20260218233211.1815770-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260218230526.2371291-1-b-brnich@ti.com>
References: <20260218230526.2371291-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7157b5-90ac-41ab-a3f0-08de6f45f0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/5tdmhrhFcGwrV7GjoUT/kowjrXM1NjzJ3FcT3UjtbhFOlfqCetnBQKgLrgC?=
 =?us-ascii?Q?ZUZaEQ+cg+1VOPdCdSWMTXB0BmpczGh5u3PS7QivORzhxvgcUR6lVke40DP1?=
 =?us-ascii?Q?b4Nl5ovLfbDKoBbIYFxtqDWVWVVdbg9h0KRXRtdTr+sNQEn9NjKgAcFwdzwP?=
 =?us-ascii?Q?A/bU7YeIUjs1XTK3GbNkwh+iw6G/NkE4wRuQd+uG3QxILE2FNCbkHpQKyCGo?=
 =?us-ascii?Q?QO9lrUbvR9x/n5yTbzwlMBERgOBm8UK3FUfZff5aJSOJmx7MOLCf1X86VqSI?=
 =?us-ascii?Q?iKtYam933ERphVE6e5p6ZEqhlY5rZDyUEpqyYXfvLhL3HADcqD/2dyUCyOeW?=
 =?us-ascii?Q?ITWLmloecDeItYyF4YIknYDKbvmy2IFWk4dtHdQm/drq5Vs5p87gLo9bWCR/?=
 =?us-ascii?Q?M9ZY8pCemHm5+DNIfYs3w2zAA1GjY4LzXD2ap4wuC9VadeoBYGyH9NhDctzt?=
 =?us-ascii?Q?+iXqfuMrb2FriGSVYhGtWKN1aZUh/dAycqxZLRduTyOQ5z7+UsxnGimWuRX0?=
 =?us-ascii?Q?v3jBf7a2g7EqeQfzAMcADBALse2tYWhCowgowHQnqr8FMBfFkTnYCxLmLAT4?=
 =?us-ascii?Q?2Zhn6Piy+wTW98fex8g/qrtko8egRdOoFzL152US/ume0fYFlwO0zuqttp/G?=
 =?us-ascii?Q?3osUJ9EYRYfZZjelbIoV+0XkjVWtwrOPIOE+gQghYOX+Y45m6+iecjrkZzkQ?=
 =?us-ascii?Q?j+P4PG5xtX76Zc9RFm76vv0kFS5ocv6t0gxE247M1kDzJXXLBsu+iteKRm0w?=
 =?us-ascii?Q?oIMNAPK0IXMHkFeQ5cnZJGcIJPZQH94Z6bts9MQxLrLT0M6pMKVS4Ny0iERJ?=
 =?us-ascii?Q?C52BK4BullVMWlepP1bc9kolTNFdjNVSKQO0S7/QryK3mLQX8WdDbQjKsbZi?=
 =?us-ascii?Q?RqH3rPNsxJSkD1bzzEa9YD2ngrswsQNRasndikx52olerNx3hQVOS+6UEkSU?=
 =?us-ascii?Q?v86j8iAG6dPjHsjDduhyVfYwt32imLzTWqYhZMptRbmC+RAzMDc9j1gATFSM?=
 =?us-ascii?Q?KLXao4m21wA5LypUAq1xnSF3CsnIGsTP7WmJYzBfj3AbxD98YhdV5pRf8BPU?=
 =?us-ascii?Q?JGPUZhRpHr8FLgLIlu4xyVPYmPBvp6cnPEosUF+mIJoWLu6kpdYLnODAVi0i?=
 =?us-ascii?Q?MatilziNeLL5EHe7RVl06xwMlqqoIj0DIY4Sls3HbKzm/N+cnZJ9BIH/g7Ot?=
 =?us-ascii?Q?FV16w2PvKooUAxe9ueWf96mUA+VW22zrByVUdbe2U+7YVhy1Vfqkw3Lhk3Qa?=
 =?us-ascii?Q?af6zTNJPt8yZoNcff04DwE/mX0Owjnj/ciBC15g+t+k4b7Rvy4mKqCxXOdJ/?=
 =?us-ascii?Q?0sMgqdePl/rvcVajJzpXYBLUCw683oRtfjzMt3gZllUbfW0T1V7XHRrXG1eF?=
 =?us-ascii?Q?GTBXaWoAH5vl+0ifDGsxSNo54ZFGdK4eGhqQk6gKePtJdCB4iLYzpB0bE4oZ?=
 =?us-ascii?Q?3M2I5zzf115fyFBzsI59EUcfyvazvtLmLmB1PVsoPsWj75lL3+hFomgbnAgw?=
 =?us-ascii?Q?rRdlvyTE4SwZUZYY+HnbveY7xPjIUtudrhW6bc7SXUzrEeAR9jDBSwywLYk5?=
 =?us-ascii?Q?04oEGoum9+BcrSezUF7HWZ44MySWdjiciL5IXxcbrrF82ECPj39NksqXvZMy?=
 =?us-ascii?Q?85OoWlrKZPCoGr99XZaKsiW1PTfzkueUvUnfgTDOjaHK?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jgCnPohJ/H41SLa/ai8NKlSCDyN8w75MhlvZbczgsOGlqNbDk2Vb9orPhQ3p2BvfuneJOLc0wwgxsw/3hfno+mpsZcEIa/GK8e++IxTdYQ27dy7sSh0gzwcp/j6Oz+JvXUKzcs2uTqLFw1gmbxisAEu/DGbG7QnKxquM5tXiDEoYzJ5D9XGozkwt7y/KtXLQvKiqLsap/rtVpPCxngmYGpFY0T+gRXZ3TxWbnDi9ILm5GLsBmhFjOmDB1o6ydBzi60fcitubeq9vfTeqqOCteYHjv8PfBQVL6dxZRGWMugE6J2kKPABVv+SkWij6NlMVYrnZ/9DFqmpMXXJyktTGLfcoaaSxH2QSPicHdBkVarSnM5x63tPLLbcRqzcLiGfHkqmR9cKbI3302lOkpmOIfe590ElS0hoC5eBJMUSi4GuejiIABosOR+F0hgQRNU54
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 23:32:11.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7157b5-90ac-41ab-a3f0-08de6f45f0fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 23:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17125

meta-arago / na / 20260218230526.2371291-1-b-brnich

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
- Patch Series: [meta-arago][master][PATCH] gstreamer: Fix CMA Exhaustion i=
n latest gstreamer
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
+From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Wed, 18 Feb 2026 17:05:25 -0600
+Date: Wed, 18 Feb 2026 13:10:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3df04f29d1fdff84c5c94cc31b0a106cd=
b7c92d2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
- Commit SHA: 4b03497bfdf846e6f71a4d222849e2a1e7d6d618

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




