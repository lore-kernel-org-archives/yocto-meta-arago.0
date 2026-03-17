Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98EBFEDA0D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:57:42 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83919.1773773852492253711
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 11:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xGVYJBYv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.42, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWGCAGr3g40T6ME//JMEN+YdvVrgllTkdT8i0bJDnD1PvcmlKRXkkE5Qe7tBVduEzB7b0DQiTKhtpDmALqSBNfc1iwpRA+HKwWRn8irFQap5qfYLJxUEN83C+uhT6+rYW/OpzfMU2GoSZBw/uRuh9VmE2309yVp7432G8aumFmGjaT1sT8iX+T2rsCa8B7XU5xl64aUQABUZBHpfixn63sE7shyQLAS6vooLrnY5dOfojslSoKuBEqyFTQ694JSOk41LSMHkPCdrn9LzVpdG0j6ywZTPQS7UiNi+R6YMrAUvXGMSkJNxp9oazqtBgZTQ4jZEqbehQtRFsdRkw59f4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCl8HCp5s7A3uXiYCnu2nK6A7w0tTBmCLYzdsVtIXcE=;
 b=n4a7Yqyn+Tkec81Z5FYQNkMYHeRJKFDcmeI8JSpy98hMWDQo+komlh+dHk411n+2wzUUkRChBDhjrKmVhm/u4+GJ8oVZNllLcJBUWRoiPlwNdY4XQ0Vd5PaJWf5iUABGIaoGGzW/pTQqllGCMW5hp6Ri9WCxQUgeBmfibXvf9kdYf5xOo7/jdawYsqW/bgcBkP8INPa725geWg3v8vHmQuJotJwD+l1LeHROLYJoh0WH081EtkvwmCCqFu5dOXEs2W90R4IafOqAMI/Ukctp9yI6BxnFBPWnwB96EoPLhzChg7OyYnoB2RTH5cWl9/HhJ+PrxKsiPeQhrmoC1CgznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCl8HCp5s7A3uXiYCnu2nK6A7w0tTBmCLYzdsVtIXcE=;
 b=xGVYJBYvRdlOBTKF+5CEGR4Rjy1H+5YsJHCH1arpBZ8pAbl112XJEwNyKNB17ce/1NUEUWBRpoKg8j1aXQ/AjQAEvsAAOTKkUUaA3kuqPLipRsIVDSUlRCWfJcN71g4uwdlZEVfYZKG5LW9mU0Uo3lQXD3q7o9r/3iG178rbTPk=
Received: from BN1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:408:e2::23)
 by BY5PR10MB4257.namprd10.prod.outlook.com (2603:10b6:a03:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 18:57:29 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::d9) by BN1PR13CA0018.outlook.office365.com
 (2603:10b6:408:e2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 18:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 18:57:28 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 13:57:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 13:57:24 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HIvOHj3199956;
	Tue, 17 Mar 2026 13:57:24 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/2] Add libsdl2 test support
Date: Tue, 17 Mar 2026 13:57:22 -0500
Message-ID: <20260317185724.34717-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|BY5PR10MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bfea96-dcbb-4aef-e0d6-08de84570947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jIFf4YjlFOFkYcOjzN5G3Ufuy/h7zVuIy2JRtvvjOBt5pVtDGHRZzff4UFRg03oiFMpaYQo4UNPvppWUaWHagxIi++tLrT6QdEXtBdRBub3L4F7Y9XJgQ6mlBZdaGTdcOzy9MKEQgmlqSUOPv9/XtjQbglw8SCju+jAuw/TK7vImkTEuqdaC8Rtb0B2ISY0Fd5iJ/QC5SSV7diRbYjQm9GgNUuAgQv+jcWSLfi5G+SMfQNvolJtyrfKDwV8ndkZ5ZQh9ioFM2PByPUi4Of+Vu8XJaw5+twMH+BWbZzN/RaHavFknKK0t+OmW+lBz3Fo9eVPk7Bj0Cmd//JfbPe7YMHPzj8STc1EwwVtYiQCsKWjBG/4FA6WoJt/meOSId9Z81TVZ3JNW4YNmBauT1JmIbN74RYpVv1b5AJ/MVzP0WHKW9516H1BxdLspjzDhLhsWsyIUuvDtcZD7qPnQXyqiA+gGpuSCeOlzBzvrX0mDGzjzO9W/yggm7l0Kf9Xt3W8f+u62+pUHqlr6WpG4oAJTFE3k9d5fnErmmagiJ0oa7uHz5vrJfkMfHqObyTckyOtz7nJAgx8Kz+7cbWmmhjThpbt0Z1Ub+P9SMQwNLzb9p5vMMxoVgjueAQuy5C5tAn+lb08vDESzsXxBs60FcXMf7FAUlcp99pOPHCbZNEkFykeNT0g6Wba208qpZwstVLc/bwBZ7E5T1XmgKvFdUavjrkhAJ9/q7VE3jPIOubzTGBA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3JoDQtP3v0lxOh6mI/Z3HCif4HJrgz7pyCeoAos+fE+lfW6jrORTUhvhXx0EKfisAx07zOQwZKHzmpf5W/gb3lwMUtGLYLv8mwbjW5l8igow2q/oiddPkxymeB2JpSzRQrenXHBafg31cVXwTrJKiofV1wKTMFicAjbkiTbSCwLNwt3uPwo811cOTr8WXMSXhNOW/3jGjyZ8WlrglwQr2BWwTeG9FbyerymauPYHQ/7JCWWseN0nPbgjxSXyiXCCK0pXUKe87P5W1oOT35kg5LdjhtZwzD7noQ9kwC26Be9O5BqDq5jo/iW1sfeG3D5InTIuwGcdN0dCEqY64qnxQrSZvGDX6Z5waLPv6Q99IXjjoDH/oggBm4lHvYqRNBtNWALWbwHwjLJSB2HOc4ZDV3AQ5bA4LbdG1xBVTRFY9/bxeO5WVNodjszkD1u3M0Sl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:57:28.4780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bfea96-dcbb-4aef-e0d6-08de84570947
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4257
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 18:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17366

From: Antonios Christidis <a-christidis@ti.com>

Build and package libsdl2 tests.

Working on merging similar changes to oe-core master, but in the
meantime the tests are needed.

Kind Regards,
Antonios

Antonios Christidis (2):
  libsdl2: Add tests package
  ti-test: Add libsdl2-tests to packagegroup

 meta-arago-test/recipes-core/packagegroups/ti-test.bb       | 1 +
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbap=
pend

--=20
2.34.1


