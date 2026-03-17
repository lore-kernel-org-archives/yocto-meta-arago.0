Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BD7FD706E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:17:01 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72567.1773742618616600765
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Vj+JrD/S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.9, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLNVdl7ihpWPtylCGrrtndB+C/Kiy2vgOA8zhtX6bvjl/sBXakT+KD/XrY1DwVYQIJZanXfn2m6s0VxvZiDKRVSb8Sy2VpOtpovMpQgu4XHX5/T95WA6q3+B+UEmhoY1e39L29ik24/pyhVX/x3sKHZsnNpFcIJQl0kZpGRH70yd2231ppQ1O912z6XJE8v8NBbtB90eM1QX3ggAp9sfJek2bY+4NjnlZuuBv/gcluimFEqy/a06l97hFqfNXKTpIGi4l8qeoPvYmZDbSe6t3twDYt0/A8KAKox2M3itCkSUuri9ziVaYZalF09PwxvLFEI1fYPs07BlQmZaH4qV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C07u2RFV1mncPkrhjsOS0eyVQAG6YLA/ErHC2kxtaqw=;
 b=gV7syeQbiWgIonxVzCvytzXO/8fLrge0GYd607DTGJaawaxYETnYRD+wzXvmThDqXwzNRKSOOigSbK7bnOvhGugZ9Jr07L6GH/bKdhjN+vuSFHf8aaQhB5ZmIOBHYtZxGFD6/AYB+nyAkMxBThEDONvbDrd7jLOkEmMdrdl32wazRn7Wn4r0ITzMMvRL2X118oa66YdTDt3XKmc9D8QMtzt7gAhrODPggWyMJyXRI4UMMOwXexhH4XK1GWDBb6saQ919aiF8XPoMksDPR+HZYnTYvXhqgIG7u4OKmWczaYhnJ3MsTa3LQIWRbmBX4zqRu4P73kXGHdSbQq+Cr/wCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C07u2RFV1mncPkrhjsOS0eyVQAG6YLA/ErHC2kxtaqw=;
 b=Vj+JrD/SHby8vPZS4CReij6U1n1ff21o+SVwWi98pyZGfjLaKJyrLNjkNdOsx3FlQ6y0c+YsPXpRnI1TUx0dq4L11Ga8+lTPI9Vyq3/xGBIX7+CvAqKIKOBKXDNxfwHyNROOF1HyeNTY1LuS8Fz3FrV7zIxecvvJR/o2qEDVEJQ=
Received: from PH7PR10CA0012.namprd10.prod.outlook.com (2603:10b6:510:23d::26)
 by LV8PR10MB7943.namprd10.prod.outlook.com (2603:10b6:408:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 10:16:55 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::67) by PH7PR10CA0012.outlook.office365.com
 (2603:10b6:510:23d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 10:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:16:55 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:55 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 05:16:54 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HAGqY12517054;
	Tue, 17 Mar 2026 05:16:52 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>
Subject: [meta-arago][master][PATCH v2 0/2] Update PCIe Endpoint Testing Application
Date: Tue, 17 Mar 2026 15:46:49 +0530
Message-ID: <20260317101651.273730-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|LV8PR10MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6977348c-6fbd-4594-f8d6-08de840e50ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6MxWoUClw3P60IyaOyPvEIBTJFUiP8hkgzlThOGz5vM8glKVytgBSRDsE7DV6bXa41nuibLKF7CGPgo/HdSWb+rVBEUCX50Pxjmup/yXVF461dQpMWuCYhW71KLWJD87h+XQfpaQjBiFPOHj74Mn1a5nr7mmw7wmkRRKktzQmgjgfTPpn5jDm44GfZ2RbfiIZ8VxuAT9UR6DM1x9AbH1v0vVn/JcHHu2fB0GujF39px77durw9kmn7o6aYM+WoemeV2Bbv4TS8VRQlfrDvF2EF/YxzjU0Nnh97Kwwa3HBMOkWvpCaNu59Lbd+WM2uha3zTgJDgmKgfBJKyhbMFl6Db2tCcoUlyz+xyaBZX3LjcbhbkAwvPFCcpn44Eah7KW3niCROU4FFtIgXyGjweVWeudtS9JwoxP4iVuZuoDE4Y6k5ec/lEXWv0n9XOzZ4vSNvb0aJA1evOerk7RHf1iEYMB7sIIQkQGGkrilzbz+c4CrLJyCMkHQmP8DAsv9YDoT93VKXNgDKJeC98JDjsLsnv8TbuBSqmrinVvyCV5QUQuNiPmFJK+Zx5q96N+cQ6eVVwhVtahPPcNMcYrK69x8p0FxLiiA7hfprQ1nutl+sPjg9U/b4o1FUtwodFbb92LstR7ums1tDqe1kmjh4OCFb6kpLC5cHI/KXeIQLAvYT5ek2MBroECjXFlymE4EZtBmEIvP8NxWI3kTGZ4Rs4rFdFV+ft2BOVKbAUJmsDR0+PItpc/fTtlwuBhqXIC0LYQ+6bBcXkg6tBSM/Lv/BiTckw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CJ/T9MRtgdB5HvR/V+tXFlyTGSo+wiajkiTN35Il4qW+BTRKHmguaKvcYwbwhZengUbAIcAHTaZHRs3QGXGwV54o29QqfT3VyUm+TqXB/QWPxV/p2uSGzxBSJFV0Xm7jOMLOiNiQGJz6Yg084BHWy2CfVJgegijaPtJPNtwsxAwNAKMbDNb8OdhSA2woBcek7/pr1oXahwpbfFDI/BrGgO8JHWpUdzIZyJR3Wbkp5EhGBMOx80DXLTg7XevS0Liw78G84VRqPbSYqhOyeojxTnWzMz8mFnBlxMbkY/x03WKH3hgFuQhFpxtwHNCPCwzv4p/WrtgGiX/67NGdhBFq+xt+jVDGWkt6NYNQ4voUKYR9yEQKc62rSOWCxL2vIDilnTbz3bgD914Ttbc2FBbMjJKO37/tkOLVlk8kh7g9/ztcW0SWlWFt6IhNiW9UR1qP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:16:55.4552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6977348c-6fbd-4594-f8d6-08de840e50ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7943
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:17:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17358

The 'pcitest' application is obsolete on the 6.18 kernel. Instead, the
'pci_endpoint' selftest is introduced to test functionalities for PCIe
in endpoint mode of operation.

This patch series updates the build for PCIe endpoint testing application
for 6.18 kernel.

Link to v1: https://lists.yoctoproject.org/g/meta-arago/message/17289

Aksh Garg (2):
  ti-test: Remove the pcitest application for 6.18 kernel build
  kernel-selftest: Add the pci_endpoint selftest application

 .../packagegroups/packagegroup-arago-bootstrap.bb             | 2 ++
 meta-arago-test/recipes-core/packagegroups/ti-test.bb         | 2 ++
 .../recipes-kernel/kernel-selftest/kernel-selftest-ti.inc     | 4 ++++
 3 files changed, 8 insertions(+)

--=20
2.34.1


