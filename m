Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4B8106F303
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:39:00 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42932.1774514334893636327
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=INC9szXP;
 spf=pass (domain: list.ti.com, ip: 40.107.201.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFQUzpAPSziQEMFJXAOm9iHQe3bzZwfNy0Xw5yJjfVyRj4NDIUhMItYXVI2feOtfbWuPTl+1qBShmn3Z4xy+XVEohBG2pWw8Rj3TM46O/yzuReOH9NQy2GH0XEHvFQ1DuzN6xHP2/7n/qxYHMkvOG1qzPjZh0j9qseg4y1Hqyj8yJQWWy3eEqHPvCPk5MFcyNJtATVrDn7y90rgQzJZauJIN+Z78Tuh9F36epIz2wgSIesgxYi2oeyXB32zi7RORGehXPL6wPhemlBv1iLmd10/6ExRJEp9mV75CE+AHmIIzjNNPBY5HFMLHOXwHNgkB0c3ICzpoc7U+rgWO07gS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckHxSOrKD5WFY1tPxzu7L0uO7E4EInLWQTqE8uWu7do=;
 b=QX2XBPFJFVLPNb0L/98ljiI3bsHewZ7X8T4o/dEt7xe4yE2/+ayt/kuiW7r72oyMulq4uT+rqWRIHn4saCbaoE0EiGJw8nPPDqYwieKng8HPuVtWXyj2CP5jnV3A8w3iynAJkWq+pgxa56DrcM63W1BEYtvSZK4UvXpzv1/txRz+6KjBw2W2XIHlUf8BLdQGgySJnh0Z/4rfBVCdEIjMt7uqEpjC6Clwm491T8xNUXT4bLSh972kIhj+vTx8sasbQ9sb8YZE5BRPOeKqpMkT0HmksWZqMkxxZvXMqTFLUoiMSEC0dPXwBIT2uUzTyYDA8DZB8ANZSlXSMxDxemVXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckHxSOrKD5WFY1tPxzu7L0uO7E4EInLWQTqE8uWu7do=;
 b=INC9szXPGwiRSSRJLob4AAfmMjXu1Fx89BWVR1CJzk1bqORjI3RQHS5CqFwqSp1+2eD4a2nIx3H6zPEAMSA/KrPIyTqYshDk0GNaBIQ5mJlM3e/hKWrwS/wC42rMxQwoPj9QwsaQCr4ZPAk2vbA+n8pJy1/dfqD3XR4lZXS7O7d+UIQ2z4n4ZhHhEm89As6uFLv4Vj/d9dewQT4KG11vkykayKAJq9tGbch2PJjhgENZAO7E4fzGa+xwoo7YM753uyp9ctMoa8EuElTSiRC/DxeIUTAFBSJ/SqzCmANIz7azh5U6GVhjZu3U/Ssd9TqiyeiXvswD5+8tLmeW5AIU3A==
Received: from BYAPR06CA0007.namprd06.prod.outlook.com (2603:10b6:a03:d4::20)
 by CO1PR10MB4548.namprd10.prod.outlook.com (2603:10b6:303:97::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:38:52 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::fd) by BYAPR06CA0007.outlook.office365.com
 (2603:10b6:a03:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 08:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:38:50 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:38:19 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:38:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:38:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8cJOn1834888;
	Thu, 26 Mar 2026 03:38:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 051CC9ACF4; Thu, 26 Mar 2026 03:38:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v3 0/3] ARMv7 support across ML frameworks
Date: Thu, 26 Mar 2026 03:38:18 -0500
Message-ID: <20260326083818.2670146-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260326081151.1214749-1-p-deshmukh@ti.com>
References: <20260326081151.1214749-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|CO1PR10MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: ad543755-d624-4b8e-8f87-08de8b131afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jqJieij3aYQErtKTWxV6vIeQ9QnRHf4OezvlfzUUF02Gbnw/WioFbe10Ljy6tXxAkth/T6OaZDoWXuTQ3b3+qw/VGimop3CCCx4QdDR8Uc7yGF1gbxwza57SJnbXsT65zp1ONtDWjcrkHw0s4Z9gY+dVeRWy+a3NI1e6IOHdZVvqayRnZj1QYhJHiyfxTv/BUUo16oTa1MhRQjSZ24sPV1IX+u3DxAoZUVrQwsptyO+Y8ZPkKJv4uJ3QH5346mj7DBBsJD/q7CN6srYi14W5a/wa7QFWwsBAlYtUpZPhn5lHRWxj0ZLqzUlGuXBxk0mduDgsTvx7SZZgYRB9KQfRNkBwF8ggtNhuNcGsCIHbPRXhqEdy036CAgjY/8UAJeiDb84Uqklm2I5K+k9WYutWIEON9F4NXAppgzXE3cfsxOfPYO6sCtwCAm35sitaWcu2NsdSz0S0aX3BDGz5vOaSyJUEJscStSTRLAKawvkWTeXwdFaS/IcGQDUmQV5u5uqQvPem9k/u6fxuwA53hXXwphekh8AjegFLgZHome/PeKIobdqBJIySLFDLugdoq2gp/60Io8agW2onWAcsAgm6LXzBn0sb1o5/QP/ghg0Ujmru9cy3GyLDXiC7JndHOplxhbkAESNuBBNeIhvznEVzWlzpcMCaCg2P5CPknx8fE0fLHTiZ4nu5ANVcHUhBN2tiDxDmqjBpc4ZMFUmyx7Iw1ZLwFy8lSphPupaPCA0SOPC6VzXoGP7zcXu3+qNBvOe8SoR9qczeblXXfO+aOHUqig==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	taCen3b9MTnbv0zlCFc6oRRKzo4VjRUBwQQmJBfJhqvB3LtBTMx5C561rbFDbIwGgosj9ZiCWZBGO7DUwLvRVDlqmLl1QwPo6Bx/ptNGpzZIAb78II01Rq+5r8E6beIY2VmASbJEm4L5yvR58ZRV9HUbqftOy1KAoQxaUZn1+hLLBIkOhPVGnCxdKEKj1ms3Ow48dWKkuYXHSaDb4pD1jqwMINM0SFgogf8TvD9ha7L/5YN9DvL2GRap0j+AkcccWxzjzBxgGfRL2bsdRpjMm2kM8BMRj7Nzg24pmCvGvvaLeY0F4vl6GjZjqiBA+A57FT3oF5Y9owHUlPCN2jelGaqdVxkA6Qh8hWJ48Z+MMjKwgJmKwHycagUkxKmKLVC8y6i29neEremI11xWL5yUYoGpEUTcE4ccwiICY/flIynjii1/LzO/oHz/KIIrFb4P
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:38:50.5224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad543755-d624-4b8e-8f87-08de8b131afb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4548
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17450

meta-arago / na / 20260326081151.1214749-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v3 0/3] ARMv7 support across ML =
frameworks
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 26 Mar 2026 13:41:48 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: d2e0787e7099ca9adeb20a60d92d0a58c=
dd859fa

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago-prefs: Remove old settings
- Commit SHA: 6a3e3ddaca8ccea3590b072ad7fd1f2cae50df35

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




