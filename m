Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBDCF33A8B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:17:25 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46619.1772723838195864913
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AM85Tu2n;
 spf=pass (domain: list.ti.com, ip: 40.107.209.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEIRRY2/ab4CeZqFgzzMfttN5dDxhl9n3Q5DtNOih1GamFtzkly/U9/c6Lto8l0OjoN6XnCSVRKg3kw0YnAEN2++TVWyExwkmgtyx3vsIBUKHdVFADJ9em3+2uME10IUWLzMIUZHM5/qNik5RzWpSC8N6GJxuO0dSyU2IBxyIhZmNB5Hva8F/9OHHdxTSOSQwFjXDcnLYk3MYR5eRGSaYIL6OGWTq4+KrYyQn/oPfl1v+tIKsz18LMgQwMtD1eZYdyDzV8ghldTbW94JmqDmjvcJLmkLNw94X5q32Syj8jNUbJF7Q4vUabeiPdMYrFCsNSTjL6nMHHLxudUK/73yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsqBuVw2HbX0IvrJ/gte6bE5/4m+YPbiOwRLwKaBVQQ=;
 b=PiktBp5w5eFY8o8C6c+3Cf9xJrV953qt/BLwh6JTOktTwFE9Q1J5vHwWvpSZipiKGfHaBs/eGqULvq0g0jIjSVjofW7mIISlISna/YIWKZTiax6U7M/rSHMeXiAMP63dV5bQL9ohoBThd+04DqXxfJMuHY28esrYcoy5sMTGO5gpT/MstnSs4gaMzcUlTY5vG9Mu5PIt42ckUq+9BbNixqTFXU94uVvuvAjUyOv/3Ic/M39bBxYQtVQhoAIA8x2RgMEgU5QsI+v1eftjc393D1vd2YFFrtnLXubEDegl7ogQsM7mrRWrqTgfMZ4l05K7R48FWG8VSUiVDug7lNWYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsqBuVw2HbX0IvrJ/gte6bE5/4m+YPbiOwRLwKaBVQQ=;
 b=AM85Tu2nhOd2wKolWbZ8jdwYBAaVVwqFetkivUlm89KQ1X0h1R5nzsYJdnkJx1MqRegTfuDHM0FZ+13qvQwJZh2/jQX3hliqS5euiBeJz+AA2+hBN9EVQr3A576aih8CNgKvujubyqZFw3I1vlGidobWfCMXIp1YG8e8//yX5K/U7Xmahww3iPhMRb1Bmt6Suj2o5+Of83SjKVy+9iVBGMyMLGHenwxdRd+ueatO5cA2e1gZX51o+5tYNG2nX/0fB8VNZCD/+NX3hu3IG57BSSEHo/9995RMeOLTr/s1GGDQQpxKZAY9mW3QLlpicyOp+qlOQAEMGjf0rhY4P8eFPQ==
Received: from SJ0PR05CA0190.namprd05.prod.outlook.com (2603:10b6:a03:330::15)
 by SJ2PR10MB6963.namprd10.prod.outlook.com (2603:10b6:a03:4cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:17:12 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::bf) by SJ0PR05CA0190.outlook.office365.com
 (2603:10b6:a03:330::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Thu,
 5 Mar 2026 15:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:17:11 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:16:54 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:16:54 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:16:54 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FGsnF1894320;
	Thu, 5 Mar 2026 09:16:54 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5A0499ACF4; Thu,  5 Mar 2026 09:16:54 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] packagegroup-arago-connectivity: Add iproute2-bridge
Date: Thu, 5 Mar 2026 09:16:54 -0600
Message-ID: <20260305151654.1169866-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305151405.460115-1-reatmon@ti.com>
References: <20260305151405.460115-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|SJ2PR10MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef3aec2-b120-4797-1418-08de7aca467b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	52QuQ1xzCpiZ6IO8jREjNMMA3L0bz1bJ+0B6Swwp/Dq133uvKeIozkbeykPDMvcITKcGwz+Whb+snnx63BtJRlzqAmaNWohqOazlEsbHwoE8WeNwQQxxPPb+WzFBfe2S+N0133C8g+6NnG6eG84FqgoeiSzb9zaoE8hDdVl8tgq16URBq9hYgQLS9UEu2C3bjeWCkAXhdLynDEUHb4b6CuQuk19LBbuogIy6qwEG0ZpHaMc1fPt5T03o5F8sKHtlhTPS5OEAmAHDPlxjk9UX0NrLp4zJYZFR3lLWD9MalC/hjlP4Suk7T+Il4thGBChkaCdbDdioloVRbCtyexyJf37vGcosfcHCw+dB61kZKbX/fBk5CRoZO8kj7k22R4l/HwnWtxLQVgqyIymKSYD50u86CARbPDxEJxGuoPmGtpLn/5QFKeDolKldUR3gx2uuPnxNFYSh7+Rd/FZTfCgqNHLzfjbymYGam6TGvEFWH80DTwXU4GTe9Tss0fao+/eu9cXUt8d3iPENUDdb4n7CdXdKDrPc0v7rsT5D3ID4YT1lYXkdkxgNUfbNyreEjUapy3SlqElkn3Am8peLikT1777DusnyR5p5kC2iwqf0rKUQEwaLsN3OxCq1jXM9m4CzbjpR1m2Qm3LrpxRbCMIpApVY277JJqHQfg6vSFz/oM7n7ozvjSIqiBlJLRYb9q26f6PrOrz7pXrkNeu9UOs0HQdRMUT2l4w9puJPhROt8mEpaI03ajkG6R0PzqlGCrY8xo+vD2fWVtXwzzHcfZrOkg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2ElUzP9S7rJ9KQbaDRhQUtWJuX9j8KDmAHcIeeQAibKGnwzrTaI8Df9U5IJesmAoddm0d5GNKepkIAckLGAnBWL3B+nS/gvOx9jCHeELwUhIsZVuAummSG+55OgKkRJI19Lu9gdvQpawnHqu4xirPpIkJbM/3i71LT+F+ejMgadV7UvW23QUydMjzkRAXIIbAeeiePDmld3b6edk7k3l2DE/KVSWxABPVwF4mWsPOdydQKTizLiUvcyd3mBD66p8NjnJtNUsZq1UvZjlLW5aili/s+1qtt/yxDajgImpv8RjagpEh+3jYsvriADHlapDI8WXbUxvkwnth/lDBs+TOozvSgmZIBo8Tg+k6KMO6CRjIZjzM78OD83cnjK20PlqHIIsMjeR48mc9xfncjSFIBj0mAZEPVaV5MB5CH841GjMGmwFIXFrt9dAaJEbaHOK
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:17:11.6265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef3aec2-b120-4797-1418-08de7aca467b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6963
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:17:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17237

meta-arago / na / 20260305151405.460115-1-reatmon

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH 1/2] packagegroup-arago-connecti=
vity: Add iproute2-bridge
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 5 Mar 2026 09:14:04 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 49e883fea1b355189363417816cb3a72a=
8828d40

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH 2/2] ti-test: Add iproute2-bridge
    error: patch failed: meta-arago-test/recipes-core/packagegroups/ti-test=
.bb:100
    error: meta-arago-test/recipes-core/packagegroups/ti-test.bb: patch doe=
s not apply
    Applying: ti-test: Add iproute2-bridge
    Patch failed at 0001 ti-test: Add iproute2-bridge




