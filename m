Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38075CEDDA1
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 14:40:41 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13999.1763476831329339329
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 06:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EBorlJJB;
 spf=pass (domain: list.ti.com, ip: 40.93.195.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN3c38hVtkL2LuFo9jKJW2ZqPujVtOjbjncURTMJPThXJNep8NZhZwrYuW7HqzGmaHZ3OK4FQb//ImyT/bsYTC52sdESIeEtoqnsyvXLwzVdYJcpI4FAc2F1nMQJqcQ9dK094Ea6LGuzUJbW17GYtJp6ralI3qTcmZHcsXDgpyz+R0uLQiER6EA6XoD6/QSL2nwQpnTSV2qpMB2cFUDZvipEXYCefGigoW5rKtNesMjpFjWSch/iBb8/vVuqf1dOgeub8c7IUeojGAYamyq6ws4amk/oo8ZIV1vPktOnDUluZ+Nw5Q3nEHT0pIXRcbskLAwzJ3KnCac5uNrxtCPqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glYHcde5uGa5oQEkQ4hfv8tHwlr4+jM7pUpJXv14GuQ=;
 b=hyCa3AZAaI46T+bUsQzlnLrDxxKUlM2lOzRGTQhOqjM6WiQMJCq5NomvbeWJq2I9pWTM1GhAhNjjZx70Qt4qk3k9OipapGdaHxAwHr8m2DojER45bpoP2b/9eiXNpf+0yRTFn0GSN3IbJUg1tJmkvS7sgDzUJOych6eHYSxqk5C5H+dOkvC/0W8wOe0G0fa3u6Mp7HSNPMuuYwCOJiZ8Rfwwctz6v/2DsJJegJ7hOzIOY0SU8mUznV/R1UecgJXgYIOL14QkhUo7t0ieiatkcBj0q4p1Rb5VAGoBMZXPyJXDket3fTRIB8JUZlrWMlx1xHcm8kaK2ZQpJRjZHHQLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glYHcde5uGa5oQEkQ4hfv8tHwlr4+jM7pUpJXv14GuQ=;
 b=EBorlJJBvXwuY1mKBvLxMs7oh6kld4QTzBgz15MN46xkyG11lhjJe6MUyZsGIN55pxCtQ1Vbn+qHSEsB7V9ZlHbjt36VHc33Y+yBZ+kGU0jSmYKXX7LRIDRsnkVFevGpSFJ2rWICuRzABXmsBMXWMw5Z9reaM0GNhvh3snOEm+h4Mg3KdkogXiN0xUFoZZw6CRWgaiadDMPrAy2Imx6DBotE6wiUno4u6T7mpIfopoim/3ZahQ9qXZOxZ2DDdx7tF1qBg8i07ZZIiqvcwlbeI+6ubOWsygce9n0czDwfvSbOta3et42gWp8rBjtRGhF11Gsr4WefVXLa7vXmGOkdpw==
Received: from CH2PR10CA0008.namprd10.prod.outlook.com (2603:10b6:610:4c::18)
 by BLAPR10MB5042.namprd10.prod.outlook.com (2603:10b6:208:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:40:28 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::d3) by CH2PR10CA0008.outlook.office365.com
 (2603:10b6:610:4c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 14:40:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:40:28 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 08:40:22 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 08:40:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 08:40:22 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIEeM9s252869;
	Tue, 18 Nov 2025 08:40:22 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3EF90D6F28; Tue, 18 Nov 2025 08:40:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v4] meta-arago-test: Add CoreMark CPU benchmark
Date: Tue, 18 Nov 2025 08:40:22 -0600
Message-ID: <20251118144022.2540277-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251118143523.875103-1-s-sadik@ti.com>
References: <20251118143523.875103-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|BLAPR10MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4d80b2-999a-489f-7bc9-08de26b06ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3BdET13KFYuCfeqVPkLTkNZubSdMEqxoOxnq+NQbXTaN5mi+arAmFnMFikqz?=
 =?us-ascii?Q?j9DWxi9A5HypvX9809eeIBQm3XvyO4XUs23oUg0ppHe3q0nOGA1NYKhNlHph?=
 =?us-ascii?Q?ab/gsh4zukKWAvr/t0LSjbxwszCcjDQefzlbFmN4IhqPfwKyK+xKDHxQey59?=
 =?us-ascii?Q?AF2ihNRPkVA1wgrNwTYcJ/QxwizjPXMti9T81QWaOVw+myO1i47S+roHSR5V?=
 =?us-ascii?Q?nw8NygbEuuq6+QOSz0SKubx4fOY5zgBa/OGJFUI6lc2r9FebWydqEit3Knco?=
 =?us-ascii?Q?z2znvYofaLqxgspjihoAJzpNYYLlpwTVWWZ0hjJW27eKMHmvRX1kNeTpW/jT?=
 =?us-ascii?Q?ekv6pJpTDOE68h15BK6P9/mLr5E6YzIPM+BfU+qZL7UKFU3b+CEGWeqos3dC?=
 =?us-ascii?Q?N94wi48tdqASs/KYUIXbgd0m473qVLPm44Y9SaiUo6LAN3ulZDgymYSySIOT?=
 =?us-ascii?Q?FpdrA/SQ6SYg3EVDOrh1mJc+2yJQanpiW/oE1zpuW8i3rmll8trYFKZAej49?=
 =?us-ascii?Q?j63KllCmSk76xYHybLgQnH35gFTkpyNypegNV7x/xB+zTA2G8NRY7ISb8E3m?=
 =?us-ascii?Q?Z9v/xCmIStFDmHnzKOvsDrhqxAUrB8mHnb3QcXnums1Q3rPMeigsM+piLMw5?=
 =?us-ascii?Q?Y34vdEPSi2YyaArkItBiV92fFYyZ+S3V4W/hzK6SXYCNYBYEU/+UmnGJEDGr?=
 =?us-ascii?Q?+5ZNrdZO6m7nb371urPgEtlX4epVzj3oWs8ZL/rd9G8X4b2mowqFW+ZJWlGo?=
 =?us-ascii?Q?6Qf9ioKmNMyeusP0YL0ggmk0e4dmSEOF5gMl65v0MTVZRfF3VfvPaTlA45uX?=
 =?us-ascii?Q?PqYjsD5s6VWzHtEC7eFnSF6LkvV5K/xEU4eXMjWB8t+W5Iud/NSyxku1Y1uE?=
 =?us-ascii?Q?QgMCQBQJJyB8do/mJsCG6hGYgZlVU3LM68+tMAbe0ujiZQ5wltgwEQMjWILV?=
 =?us-ascii?Q?6B+QpXvSMAhnULYTBY+yLy98D0SEc0gZE00FG0e91EF6cUj3xHqF4hAuhqAN?=
 =?us-ascii?Q?RK8zi2MUmOeR3wweTy2VW++bRaZq+E6/JaHkCqEgbvAa81JMbFjju07IxFqT?=
 =?us-ascii?Q?xtjhfEf6NVB/YEr6QSz/mkZwPtnwh0LbALG/Lv92hJoiHTGkTiNkIecRhUrE?=
 =?us-ascii?Q?cWAwuM6rgaWJLrF76tG593DxQI1B1yxPPLPjVxV7PZGlgnzW1zCCIa0FGLJ3?=
 =?us-ascii?Q?8MTAeoJNMi6qQuMhP9aTWK2QtTScIx5rMtBI+fg4xzqMNRijjpcWGfE/v5Y8?=
 =?us-ascii?Q?gWDKvWomCwGqI+MxaVcoK3yJCycsMNOFKQaili5DdFclVIxmQSCHOE9UcCHx?=
 =?us-ascii?Q?co6mfEwW8kl/87KDwFrJ++HqKiwj/3+oa9vrO3tLgYUkBIo24d0xMoqyXDsy?=
 =?us-ascii?Q?h0UH1mDioIi7FXUn57cUoaG0ZJ9P4yJVOQvWJwKePMdjyIY0+4O17t8Oo4hk?=
 =?us-ascii?Q?L/xyZmnFkVg+a5ydLCaqdmE2yGq0mW4rU/6C5UwZo8At95+m0/4kY+d99zbS?=
 =?us-ascii?Q?11ztKl6msaXsRL40q8MA1JEhsa4/JB8pVRNNQDtFFOZ0Lwj+m6bljkCxmyzr?=
 =?us-ascii?Q?YFezSBDp+MnTwWvWzuQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:40:28.1261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4d80b2-999a-489f-7bc9-08de26b06ade
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5042
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 14:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16785

meta-arago / na / 20251118143523.875103-1-s-sadik

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
WARN - [meta-arago][scarthgap][PATCH v4] meta-arago-test: Add CoreMark CPU =
benchmark
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add CoreMark CPU benchmark.
              meta-arago-test: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v4] meta-arago-test: Add Core=
Mark CPU benchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Tue, 18 Nov 2025 20:05:23 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d8b2c2faad644dc70da7eb9edda8712e5=
7ea244c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-arago-test/recipes-benchmark/coremark/coremark.bb:1
            SUMMARY =3D "An industry-standard benchmark that measures the p=
erformance of CPUs and embedded MCUs."
   =20
   =20
    Code Summary
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    SUMMARY-2
    -------------------------------------------
      The max length of the SUMMARY must be no more than 72 characters.




