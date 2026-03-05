Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960F8F3D31B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:06:20 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47813.1772726772404695370
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 08:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vbMaLvCc;
 spf=pass (domain: list.ti.com, ip: 52.101.48.70, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+bQwoZgZ4t+/FrRVKREtfX2yRUy2SlyUIQ6QO4Jux3KhtUr3bjd6t+v/rrxiUuDpP4lqCPA7sTjQDdJ5ZkWtuCCi3JYRzvsDp7PIOBiEWnV6MN+EmDnLsvhEVmG4Ls1RtQTJY0ahLB78YZFw7x1vkFcoyHsPdinAE+WbHwJjvL7UGk20lGzuPxxlTFE7i4bVvBtueexWiyUU/FW6nQox/nDuhdTVwH29CFm2K58tLNVqedSr4KpDrJTt0HPzVi1MZdWeZjTOkrmngUMPJk/Q7oxc6eeohIszBLwWyiCbVgGPoKe0wI6JTXopwDGHDrahRQi5YsJpxsv7Dcapmf36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzYn5A0Y6fIiEjIyDeh4vXZd03ysQXbwjXi1Q0JCOdM=;
 b=jz/rde3ZjqAbXB086eWz/ovzsEvcJnvFlaHo2+kFEKKYu+OvttlZ2uXAAH6KvJkDGKt9KmEkO8znXXlZdtXx+LHEoB+DnKq5+9AOXeUEvOaMT+NXi1Pn5jMwEAbion9UTUSgP+yVLrEZyg4JLWW9uxtLS/ZphnBy1PuFbe0Avgu3SW2XrAli4tnnKR7S8kDM9AVLlJf2xD0x/4taIPmWntsSXZlSlS3afdbTJC8T2OQyYNGxI8RRkYxwAGH/VH77t0o5eP+qXzwFqJMzC7HqzZ2q6lQHpMeraxO+a9/PlJyheRd3ahLg9XjH5b0U81+GrF7fRhum9Mgnzhd6IRNFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzYn5A0Y6fIiEjIyDeh4vXZd03ysQXbwjXi1Q0JCOdM=;
 b=vbMaLvCchueSbfotsCmQTz6+9eDBYvwAQQk3swHYYlLkDSBrzwjGxZCFqBm8ywBJ4Mc77b4xjhIHZWxU9z3QUfYVVMHrTPitUUcnk1EK/LkRljZPSBomVYg1E5fgvILsnvstMOqlQBvBCAy8qlaz5G1PjH5vZmqHDbJdfpuk7RLrY5dyz5sVjxptPsrHagFt8uNxOfGV8GJkJ0+eDhwb7dXSYBNyE8qM955IbB1AWEArxQB1oqujuh2M0RMw7uByl2Q1iaJAmSMOThJGJXlOs4poQ3vPDigQtWkxQDGuVJUH/wsZQxLU6ZdOiws+OkU4jNscoqBsLYaLxprx9BmS8A==
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by BN0PR10MB5175.namprd10.prod.outlook.com (2603:10b6:408:115::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 16:06:10 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b2) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 16:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 16:06:08 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 10:05:26 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 10:05:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 10:05:25 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625G5PZZ2627665;
	Thu, 5 Mar 2026 10:05:25 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id AF2DB142E1D; Thu,  5 Mar 2026 10:05:25 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v4 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Thu, 5 Mar 2026 10:05:25 -0600
Message-ID: <20260305160525.267676-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305154820.1461983-1-p-deshmukh@ti.com>
References: <20260305154820.1461983-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|BN0PR10MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 07060ce1-bba5-4a50-4870-08de7ad11cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info: 
	sVCcEeRNgc9auv1cx7Bn1GXdYnJAkE6fe1zext3XGKVRwA2SVZfatm7bzIRUx1HRKTedURLsN41Bb5oJKDsPcc+HSrj2GsXbWC1IiOyGeMH4PFa8OBux82g11kZPKzlt2p2+v5ZVGmdRs3oRVXkqArVuJVzFsApUkGoCqjWU0Fk2wYCb1KnESmlpqJ+y6ucwJMNzWllXsJt42EruMhYfXXgFdWMaJ/tS0uOD0pGbD2r/9uOmNO36N55GorZHA+pgC4qrpFP5EIjQEItauQilRgfQGajKWmPMEC57bE82aXJTirgi/AsZLFb/uiYzftZlP9G/cwG1Z7SAqAIkjxp/wivtZ6l6rvBgxXOPBmEQMNylRVbMst9LpUP8VjLOfl6H5UZJ/NmQdz/0Uv3T97SnnvYMhrEIXkWNezuYa00F3ENqyiu4tkWQ4lmgYzkbt0l1VeSDMFpGbsHOosRVU2qOftEn8oanpAU+mgNFo0nrUY/6spFVElxXZFn4+ydX6AB3ntrSl8iHkWMdZoA90lR9hOty/F88w8TIbzluUqdUEINWTya2GCCfyfGhYL8OJmBcyz98zaLuQVIULvAECyf7sqIgUw/LPCBtR9wZCYDkzQEoeBhb8uVv8hwEk4Jxnz1poUSieBwMl4lMuA6ppqdvjrN0cqY2xr0t50lgVxXrEdTVOZA8kM1USzmV0esusc9I8QVMWrk/RvZIHY59rkN1MX7PU9Dmmm5i4QUJ2wc8RjyXGK5SUrsrkZrf7OVCy6LpFsP5XeDQ1EAAL8LfJU13xQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TED8rIojSstUK1dulHC5gXS+6mNxGOyFZhKClPk1N7ce5Vs6WuMj/se57aG1i9C0TSHfkdGg2yRqwuKE97YaqvBAdyh3mv//PtdH4jGDnPw/LSV3Jgm7519hFzzz0+Z4gucseMEr2BcusCeog0w/WoJBGF/g3R6kZMt7MjrjVr8KrePWTihq/QmBKwvBALqAScHZQvytdm4Tg57MjBSSRxCmCLienLt777xIHnrbn4D6HzkacuDjaefklAhCNN4gNFueukm/V/w7qQDMNu3mvmnaCWnm4e0w6yOJMXAkFum8vx94tPu9Nytg216DY+grfjsxQpaBwnNJHGcoebApsjGoEin8/0LEqHbqNxOpwHWiOmSok+hyY4MVtsrBnLu1rjZS7s9wmS4/c0+uQofZBe8Fdhe6jjqlE4PPOGNx3DoJXBwPgfGCpG2WAMLWGF4J
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 16:06:08.4939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07060ce1-bba5-4a50-4870-08de7ad11cfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5175
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 16:06:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17242

meta-arago / na / 20260305154820.1461983-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v4 0/2] Migrate ONNX framework v=
1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 5 Mar 2026 21:18:18 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 4c7155c4edab52811b1af99df55eb0396=
b23e968

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add iproute2-bridge
- Commit SHA: 538a04f7f91be5e391fe5613f298d6689ac3a2c0

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
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




