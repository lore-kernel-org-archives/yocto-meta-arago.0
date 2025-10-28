Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F14CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 19:07:40 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.9])
 by mx.groups.io with SMTP id smtpd.web10.20647.1761678453906973787
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 12:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Gnnoey5q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.9, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwnbql7ET3KyoGDrPAUFK2HxTcfH4WVwaEyxTbVBFNfKsa9SW67UgLwvq+lpPXBFg28OUKduUzcM6sMWXZ/qxv5ZQ8CKXwkAQuXUY0Ch70ZqexpBO8rNP+xhqVt8sw4JYrUFnaSZD+SHcmw+WUQ5FxUnuRiys85Em+LppUHCWxXs3+t7ax6Xq0IjYHyjvYdK3hxQgJoi0MTD8apQjWNZMvKDZ49L3n9V49pIxlviq/JCyB/IBNpqpFU9O8erA7QDaZ6qme3eaEROycEPDBF+zoY1c9WdJF8FJrxsqtk+esykHoCVIkY7CeLVUM1lzx7RNfqknpcyLYHeFOHCAh1mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMt8TmYOH91c4fe8H5YcSH7m+xMdGYAsfQwTxcPTe3k=;
 b=FvDAbLzSaYUa9IBYlfVjUrpaJ2sj6GPPa2Qo5HuYkU9GIydsoicHVXLqwQyz7sXFsHqK+4PtKbA0sj64XXJFAh+UbNs8CIgpMuZHaGV5esNSLrpfK2Mm4m2n2OL3loS252sbAnjT7N8j9bSZa4kXhdCaKm6QZ5c34xHO/xuOoIzTnWxHf630Z0JxviEK4tMZHKPeJsfZ3oMucY/MrjLN6Ije+HNvxp3uPml8iuB8HkFR0vsLRZNDhEGe4f5uLuUXE8G3HmJMSklbhs6zSh1Yw6tkkL2qOqBvJakCAiJFUKP90x6tkmS1BeoXChWrQThjVqA2IX6fS21IaoBHAaPKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMt8TmYOH91c4fe8H5YcSH7m+xMdGYAsfQwTxcPTe3k=;
 b=Gnnoey5qrp7hQUOXIr58+t6YGiRERI3Vgfl4pSNotmMAnxTWgNkb/wxOcxlE2xVcCS82MyM/Yrg8oc6AFJTyUOukROkixj73Sk6A0Z3Yg9o37+4rXUrr7y7z9eQINr8PqzGzXYJVVTNMUhmXHmFW4FPUPzvRqY/7msNkLYxDV6Y=
Received: from BL0PR1501CA0009.namprd15.prod.outlook.com
 (2603:10b6:207:17::22) by CH3PR10MB6715.namprd10.prod.outlook.com
 (2603:10b6:610:148::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 19:07:30 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::93) by BL0PR1501CA0009.outlook.office365.com
 (2603:10b6:207:17::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Tue,
 28 Oct 2025 19:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 19:07:28 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 14:07:11 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 14:07:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 14:07:11 -0500
Received: from sneezy (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SJ7BC32782874;
	Tue, 28 Oct 2025 14:07:11 -0500
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vDp2F-00083o-A9; Tue, 28 Oct 2025 14:07:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] ti-test: Add pciutils
Date: Tue, 28 Oct 2025 14:07:11 -0500
Message-ID: <20251028190711.30762-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|CH3PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddf21ad-6ac4-40f5-2177-08de16553d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|34070700014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Krs0/hiChj5DPrpH0dJCjzktIBDkPC88Vw99HPg/NptSCLxzckn+iwvbs4YB?=
 =?us-ascii?Q?agEvuB04LvPG6n3+Wyy2O5LDMHgq/ql9mNo4iwWEjfmOi6nKI0HeZsIffcL6?=
 =?us-ascii?Q?eu0sqc9MWT7eylG227VaRY+0C5fGYM2kOlSaL8kQm1YSSADO/kb/cMZmIXcW?=
 =?us-ascii?Q?dozgcEQ8qz1x7yf09N9lAw1PzVwcf15M5U8chp3qtxAJ+gHLLzlF9VkGMbVq?=
 =?us-ascii?Q?4qkVgswRemh0FW9iJ8mg+fbpOPqzYPkt0p7L4UX2nyWEQL4R4Blzz8eZYDvi?=
 =?us-ascii?Q?uQ7CSgeoaP0Pdxd8il8iTXz8I/kkhj8kdd4ZFH5YwPJvsYIqoAGTEAKHlqdf?=
 =?us-ascii?Q?7Bv6CCdCEdDb6jGL3S1ovcxnOwfXr22Yp/m7DTS2cT1rBQg9egyvoJDeesCu?=
 =?us-ascii?Q?Y3kH596CI/IKPTCS6/Nin6E+G671u83KZhWtPRLXkgVUI1GUkir12iiRVMGz?=
 =?us-ascii?Q?0I+4zTAsVwsIhkpwCZ03VsdyI2HIrDkOfLBLJwuJWjofGvLQH39mTglI488u?=
 =?us-ascii?Q?bNfysJBgheBLNs5CTJjvMXPm2cfmFbaZKP8l6ljiRQQ1/zr53ZhHiv9xurOF?=
 =?us-ascii?Q?44uqjc4Xh79EJTZtUP9TncQA3xEkEp1X59T9MRlvE1/Ayf0fiUyUxQRTd4Ms?=
 =?us-ascii?Q?O8wS/H73aZfNYD90Enc9s2TqFCRAqbh5nTFHXcJsQtZu1uXe5oVUJiU8hQs6?=
 =?us-ascii?Q?gAKEaVLGnKd6QEhEY0LrKPGteOzdQsH+u505oFojkNNuyscw4kzF9mgyyW6+?=
 =?us-ascii?Q?03BHgXp5hl8Ozx3iaBX16n9+49JZCERJWueBuK4iB3QWc1t5UohBvsFHAdev?=
 =?us-ascii?Q?7JqY4f9Qm6c2HQLnwdXrFByEON5QvFZehaVMz6ETa0+yTVWaW1aqp1EI3UkD?=
 =?us-ascii?Q?l4K4GMLw3g+Sv742lXzyfI+5H8+75vdql6OUBdppGSIGRnNaVTV99Wbx7dI9?=
 =?us-ascii?Q?512hVtiQGxXdDRMKEB6EKqfYjalRETUtBQhdRt4LSFy84zAMcn/qnNwrDfym?=
 =?us-ascii?Q?jpZRbt6am1m43A8Q7Mr5ry32vH1Oh3vpM9U9sEhhXkLEL4790T7qHQSbeoXt?=
 =?us-ascii?Q?QJ8cY6O/DYg1fhTLdk/ytqbjZWHMhj4TuBXgdimjnUHE36IpRWVX7b1UUK90?=
 =?us-ascii?Q?+BkH2IZiYAdB4s3QOvJeLbV/jY6Co0YNviViUSkID1tICdUWmNEvRwQHMmeI?=
 =?us-ascii?Q?kRN3mrUo5aSlAI0s/KeWrj+sOSJC1cchC8yN3Ewvzu0tMnd3vbskM9Q0j8CX?=
 =?us-ascii?Q?afzzFWfBp5X3ZVYagYXMp+CcEIcnosXvHf036IWcAd23Xi0Mvm/QHjLSWC4i?=
 =?us-ascii?Q?bJhR0L1eOkJknUw4vKxQ7A3TRnuOVmRxDwe69vJq55CB0WFdyq+AuqmITlp6?=
 =?us-ascii?Q?5LP3TqJwxOfAxQm0j+eG8PgVO0RDrhVydp8VANvgtRu7myWAweSS1xpsM5oB?=
 =?us-ascii?Q?9MW7P2RRdED/ihILm/efrVEv2CsJRUWXjTCH3P1GWuLRNVP5oiGTJsuv0L5a?=
 =?us-ascii?Q?fBQY90h9/KwLu7OEnwoPyCYb9cqMHF6o0wxHDGYRfUHTdNuYMo3GHoMbNVWm?=
 =?us-ascii?Q?QgcO2nsdvkfu34pLMXE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(34070700014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:07:28.5133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddf21ad-6ac4-40f5-2177-08de16553d13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6715
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Oct 2025 19:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16711

We need to call lspci in some of our tests.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 71122d78..03ec9063 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -44,6 +44,7 @@ TI_TEST_BASE = "\
     openntpd \
     ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
     pcitest \
+    pciutils \
     perf \
     powertop \
     procps \
-- 
2.17.1


