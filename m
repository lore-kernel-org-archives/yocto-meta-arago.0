Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03382F3C24D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:02:06 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13642.1773061317749827963
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WKkXYW1g;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.45, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOGABtd/xc1CaBHkEFhgIglvyxWwjKcWQ+8WfoTlRZo791kSPaSd3yAA+WgpD0rbHGgdxXIEfxEDJJ7isxNhmZLbENGmdkyEy8mqOLZz7vYVHlsOdi6XC7n09XX+KKFBFxY+4hzDgsyTONxEvkzM3B2qgD3n7f7q4rbD0MAtdjIH5NSK2WecMcM+8F1C9LANMMjFgBmLRNMC48/d420Q5Pf8Sr1V7gInqBTmQuTKHdHAnuygiQ2V+f7kfqiJpJi1aR9fRWam9pclyVWdLHFP7xLmleh52Nq81CMDN/SKfU02oB71fXr1AiKTcrHN8UwLE+zC/nPo2YDk7Ok6IIAeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x0a3ulI/BqDCY3HYG0+L6WhUPEjtrHXIEec090EH5E=;
 b=CtwaHCT5MfzUfyG4CXZlroj9HWrJ0e39du8cZEQeP1xCaPwLdJgMzc2/tygOXIsUnEdjJw+BPbdJ9CyOE58XkNZvhGhciheO+nBIv9CcpqGkH0lY0A7MZAIycmONQS3WUNsIR5DPOo6VU+ADDBuv6EY/hqycti/+nb7luKg8pj9eZlnHuxu/yPIe1Aer3FjmSLQdS1bFsA/MgNaAS0jtsCTMDFomSo2P9j3ez/SPbm4TbUKbnZ6/kGiutpS2aV20B5vOu12S/BDR+IzUpMM60jJ3n+IX7aeuRDsGNNwfkDVyzOZzpyvBiuyn6PPxKxDc7OQ/2fb/BKFa+TSRCrZohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x0a3ulI/BqDCY3HYG0+L6WhUPEjtrHXIEec090EH5E=;
 b=WKkXYW1gPTu6aWb/q6RrDU93FewpvzjwwWiboQRMiBRNZqHOdZKClQ18muS6k7QMrhfu+aUA827tzEPQMq472zcJc9E1JKQbR1K+j9WU8LJWiWGyMEdQ8iZGFUvdJiw4YjTQ3auilkoH3YirmM8YRCb3reNl8WFRcDlo7q6myr4=
Received: from CH0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:610:119::20)
 by CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 13:01:51 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::dc) by CH0PR03CA0385.outlook.office365.com
 (2603:10b6:610:119::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:01:50 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:30 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:01:30 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629D1M1w625871;
	Mon, 9 Mar 2026 08:01:28 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, Aksh Garg <a-garg7@ti.com>
Subject: [meta-arago][master][PATCH 2/2] kernel-selftest: Add the pci_endpoint selftest application
Date: Mon, 9 Mar 2026 18:31:09 +0530
Message-ID: <20260309130109.52886-3-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309130109.52886-1-a-garg7@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH3PR10MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 0877ba4f-9913-4653-5a80-08de7ddc0783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	AE/Jmm5Jijfc1q+HEqlYMh77x6nBrRBTYorR4RIsJ6ug3SSWnFelAiW2yW4rC4Jmsi0gSN0Hngt67HwjRWO9HQ8h33NBIhk8I3RpB+tHruk1VSi7a6zjQA9hv4RDJJdjGPrQglmCF1TM3sEjtJgkemFuVsYfyu930/oJpHMDVyYpiQm3hmR0GbQi/H2cQ5jUrjD88FAHYabAhXWDDhVwsaxgk6SDgzPHXVyb6QGNpkl1pnYz7jFhjD490kseUS6oIuf29VcjLYqok5+c9m/VPW/MSRF3SfR1jFu41F6jdLGWmqN5mo5fhO8zn0dLf22aCMWvOfURMRflSr2pHljsZBRCMET61YhvkalQbQBaXxWNQRtBJE2DPPCJ2SOOQ74QgSE2bq56om/LTg/9w4BFWnWbUGAc2YjP21ni6L1OLiU/3nSdsh3rMU4NtXkNuX1U4dWBgOWGtyswQ1Wkl0bs/Tx1GHocgGz+mTdAwSHmsM7mjZwXD92USitrlkfn+YZWOMbfj/WVZ74srBIZ6MO+6/IJCnLkEW4M4Z6MnE5qnhWOj90PI8p0SKT1j1JLRrIEE6lluScWMMdMCsuqBeGi5UAQbst3gBgpIAW3ms5otRXALscTwotECyTM4cbrXwjsWPx1LCc5Sv+kVjSnf3ALr1ah9x0c3//VqDXOCkoy/MU2obnsT3h/PWCD2x1xdCyOI+9gXEw6vtNYHVlRfnn9K1MAXEaQSTlJAPyzt2qsetEs4bMmwGCMV3/BbBbSixAvGsUVGamFLEY4qskYEB7p1Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BIftFuUWFE8yme8hMqC9ELoMjI4lyMbdhp9QirvniCw+3/we8py/BBO9wAsNYyN0KAxaUwlnDA6tmLRHcPIts/mtdb2kxP8QS/pzdgNU/uX6SX4JfTT5yepkULiQIm3rv0Ry5wAjUphUBSlRy0XQ5qLcfpE82472SOzHKEr7alEmQUJvGLP8fqPwvbUp6r6bObPlhEkFXNFVHGGWZ42ujyAZaHAT4cd5SCvP9EopxCQB3YDXCOBscknccdSbeiVuKxQI7jaN/E7YYe0rM3KiXashHSt6cSD3Khmo/oK7yfjlG/Pmd+fJDYPZyvym6kS1lkSwhd/sZXd0pBW3WuSeu4QhffLerrH3ipPuBhIH6IBlBU7neSZdwHyCq8D9BBMU/6nuRiCX1X+O03wrA8wayOZ0lIDF9ALtAEvog9112n+kzblvybZjRsVzYmxleZ9Q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:01:50.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0877ba4f-9913-4653-5a80-08de7ddc0783
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7329
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:02:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17291

The 'pci_endpoint' selftest application is used to test the PCIe endpoint
functionality. Add this selftest to kernel-selftest-ti.inc

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest-ti.inc        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest=
-ti.inc b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti=
.inc
index df5ff68ddc90..9f543b126ab7 100644
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -31,6 +31,7 @@ TEST_LIST +=3D "\
     mincore \
     net \
     net/mptcp \
+    pci_endpoint \
     ptrace \
     resq \
     rtc \
--=20
2.34.1


