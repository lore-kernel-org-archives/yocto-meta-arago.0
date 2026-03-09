Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33481EF36E0
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:13:20 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8202.1773036791863192096
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 23:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=j68FQVck;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.22, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eni9wHCkFM3nLzXRhhEmY52vfHoJuCcFnTQiNNNYoaM3dRA7DaI0efo843f6eFl7uFyE3rc0QbH2+q3pT9flOT+mhnp9FyPCJISKF1WWiEV5Sot433UXQ13govq1BRNZtTqBd857lTrMXejKQg8rly/M60XVvJTQJwEsHrXFD7vs1+bbJ65660Egw2GRclea1OpFfTMCYz8at02URfCV2u862qeFS9lvtB/kpwm9UAcqfGSs0FubS5KiPXZY8hB7s9SdHDzqcINb+wLBOIA7ZiZZNgSG0T4emRiHlEmUP6G7NzncYPifBfZze6JNtA4J7LFwYtmqqc59fgH+Zk17gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odpVgRdBIwAlrPxislUKD8j63aGqR/MBqGBFnp3+uJA=;
 b=Bt892GVqNypVOU1nCrGxeM309y5u1cinHuBK6JLHf/Uh1ans30H2JsO/ibTrAEzbBxAXgTpSxPiocmxxWDAGj6wpvD6PolGzDBu1OOvawzG7KBYvORU3KiuizYjU86L6MdPyQcBwNxmC1F8m2XlWmK+v+t3jPD9N14SUFWo6TNbSqhCFo2OTzVFOpy92tzJJUTil+r+/bHSphZ4Cw5J8AY7Ha57LiEv50dHIyM4j+uA6bth5ZcXIfGlJ0yJRIATC23phnaaBFwusvl/7P9wXewVed7qzaZfQRop0x6o577pI5Hy1PwSpXkNorHxss+6EtMLYNJ7roZLZ3rALIZBpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odpVgRdBIwAlrPxislUKD8j63aGqR/MBqGBFnp3+uJA=;
 b=j68FQVcki4iRjPeZHLeTiC+xtOqEccWl5ySembBlTNGp5I58JbUpvF9WC7WsOT6BqZlbN+0pVrUTpgQMxcjkcDFvT8hqM0ATzLJZUXcRW0uzB8g2zOWApwhkZt0wxdRNdDLH/RR29WJWwdHSAAIvGF1YWT/4MnxCgQHein4W4xg=
Received: from BYAPR06CA0028.namprd06.prod.outlook.com (2603:10b6:a03:d4::41)
 by SJ1PR10MB5908.namprd10.prod.outlook.com (2603:10b6:a03:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Mon, 9 Mar
 2026 06:13:09 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::93) by BYAPR06CA0028.outlook.office365.com
 (2603:10b6:a03:d4::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 06:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:13:06 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:13:02 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:13:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:13:02 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6296CxHn550296;
	Mon, 9 Mar 2026 01:13:00 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 0/1] nnstreamer: Fix buildpaths QA failure
Date: Mon, 9 Mar 2026 11:42:53 +0530
Message-ID: <20260309061254.3942533-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|SJ1PR10MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dae694c-ac02-4d5b-87b8-08de7da2ee65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	RYWRGjnGcV+hlInQSQHccfrztzVFgEpL23TtFXD6cEZqMDq4DbwCHoheonmRIijWhca8rto/7Dj8AaXYo9dY08v2miWCp8jo6Zy6BCmUIqvd0QrjQ54S+z7E+5soHfCJpF7BYzTVXyICs/FR3JoeCxHzcnSb7Zw0SuCuqtm7uiZGNabTjvUKt1mXYlfM0RpUmAiczckn7J+IS4xY/HXAl9Yp58Am18J/tKaHRTyMIY1ZLcqiV9mUE+H6/RdO8p1E6lWeQGF8QP8OOzmELxxTXy2DhUqRUcb5g5E5q8ET9g7hFuhesV/hP3SY3pc2sTjU+TAZ7sLz5gHCfK9MR6whjeFaVi6hhc5GXr/9n/poOsUEk8icFK6eq5x5HdIcVAXIJ038BsFTxOI42b4nQDt4uERg0hNhnsitD3YWSiWpUQcNWqbRu45L4O8m37lqKLGoqQiFFhl16DBGmBavDIv6a0cB6ZkKzhBO/co5Sr3V+NP32dI4IThjfty9WszzFQSfNfO8XLJvThi9Dc4sE4n45CT3BwkAnc4HOXNCOYwSpOhqbtCR1KjhPapTMhdmrqAyfZmolZE1DBDC766gyHDqwy8YZVEsX1HYL7ApUpM5wBEpXlz0UcsKOAHJ4mL/kM0b91IPPD3Y9bUyQOiuqDminv7CjZcLFi/NKxmYErer5GjYTWs/+uAZy3YwvSldSxe5AIZtgvQQ8nUKBnRT5MR8WaCLiwIs1PBIeQHtOy0IlHdnLejrTgt803wL84Rxkxmb7Y+fCxSS7Mz8/QqarpQuuw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U72mf3wPWWi8mvNRpXrItM9+tpZ2Q/YCQXsDTYwazn78771OAehtpf7p2TIEnBWT6JCR6ryDTK2msY4HpjBBzQl+AQOdTaWxEl+AYa52nx2/yHSc67Adk7fhzax1JIIagDzeeiFnOpES56F2B6cmPIpim24NjJuO1aecXDWpwDBCyYFScFP1OP2qj00b+G1gAUCWC0+RBLm8YtcvlLKBJYPDJgFHcjx9TcCEygdC3xGDEnpQxOS1fW+TZSgI3Rfc6CRGIVaTpsOZLfjMvPX1iKHNA6012mKy1BbMsh/HBuUkkIBAexxNy1Jr8pw2Akw7z3oEpPonhIiF0bdzbIbXLJFVbvQZfB00HMrIad5G1J3KE1+6D5INeeoV8g+xGkTo441SGP1/tDcsLazxYnfjQJIQ0BuCeLQd5GAkjeLs7rAwx0jGU0ovbi4AsIEDGCuv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:13:06.9632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dae694c-ac02-4d5b-87b8-08de7da2ee65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5908
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17285

This patch fixes a QA buildpaths failure in nnstreamer that was preventing
successful builds. The nnstreamer-src package contains debug source files
with references to TMPDIR paths, which triggers the buildpaths QA check.

Pratham Deshmukh (1):
  nnstreamer: Skip buildpaths QA check for source package

 .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

--=20
2.34.1


