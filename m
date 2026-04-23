Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DE3F9936F
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:13:33 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16998.1776942813020381139
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 04:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NZqCqMi+;
 spf=pass (domain: list.ti.com, ip: 40.107.208.68, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSxbziolJK8DJKm4wxVQhD8Ur/0gDlodrSIiAQizU9VOKHWBy1QJ2ljGn8c90Uk2v79/9vDiKhKSmuBPbu3ln03fA/+8ggOI9bd+e7uenpnQtjAEfUCJkGdXcOHTkMHK3/SodFu3S31C5uTGnqeLBCate5PsHsuDd0tbd40ijS7VQ09ko4UNeEXjHrIsPcE7qfmkLH20zsWhco0h5BrpPEGpxHBj03bFVqO44d/k/Y4RtWI2CA2BX/8LQBwrXBvgxRjE+F+J+OEvo+znbo1gujWBy8BfbTUE4B99dLbXKRvY7TaAS+tvZuEAvgSwnazrxFhBaYLzvXusVOAxZf89Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsrfyW88O/f6F6qUjVet7qxbygX2Mx9tm8pVFSewlqo=;
 b=WtRKQ7GMvcjoa/+zd/ya3+wpsuGhI1gVFEb1Uha6KtiUm2IE++vn+iSqju192u8a83lLEF5w89yjm1N5cA1HXCj/c0Skp2EUk32XTdpcWAmbqqX9JO2z7ky8E04ijXS37nzRF57uEQ1WWc+5EZFUopZoCa+PGVbCKlArVnERYz/nRBHZLXuJDy+8BiIhU4nIGo2f5IhRTlxH2KR7Qkgab3Ity7UYvITqYZxlCvkJbad8rSIXNnCoKYdDLYFC1wvbkm9OBIqaZroZiKXX2dc090691+23BKH7LbzeBXPr949lrlcKW9ojo3uJuIG6aghE6fW/cIpQ7FBPuqEWMXrNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsrfyW88O/f6F6qUjVet7qxbygX2Mx9tm8pVFSewlqo=;
 b=NZqCqMi+pIhzjlPBopvjoW6BrsOBsxxMHsEAnVFQOVotBcJRO2omOvzNuyIjztv35oARG+vl6MUYgDaCqy1vTfIDWDXHQeWruNxYT/HttwBdUB2EveXkmyhLtztIZ5xfl8NJegmN9KuBZDfO+aHjQ+Ys4udC2lVkLyLJz/2Agjf/dW0KlzdIpQn73xVVemPQdrG5UgVUWcYTbNpVHXjPos6HD9vssgfz6+avV15H8UbBtUji+ayAAIUvIz5lb/rqd41OC66hPOxb/m3Lyi2Kt+S78rxfMGQ0JLAQy5m1LepHznE7NIJk7o5xrDoTO0vWtiI2dI/UPQHWTJyZKr1p8w==
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Thu, 23 Apr
 2026 11:13:27 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::63) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Thu,
 23 Apr 2026 11:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 11:13:26 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:13:26 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:13:26 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 06:13:26 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63NBDP8F518151;
	Thu, 23 Apr 2026 06:13:25 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E7D212A67; Thu, 23 Apr 2026 06:13:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202604230400
Date: Thu, 23 Apr 2026 06:13:25 -0500
Message-ID: <20260423111325.1686056-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b187d59-7876-407e-843d-08dea1295796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	gc6L+AnqxOrt+i0e3qxALL/niEqv3EfUyxIOcojlg5fVk/VPtFJEhwhNE5sL2GwL+BPcT+DIvbk29Hx6kzVEFRf2AQgibhm+Y+0t8grGLMZtAx/ZVEtc+R7dnHb5p3i/7zTYTM8iLmbNDOUZUvP3u0p9AqmdFCtRGcljTz6ewyB3tNS0ON5AF9v/+DZVraDxqGXE19OXVPNsXR0CQknHisDB/yl86M6SzsRjdjVgCxeeMXL+Laoe3mTmPh/EUYH54KNloY7wAzKVoRQdXy4VuHa/LvxC3/iwCsh/VtOSgjBAOKKwGpfrlhEbc5h9/KWyPNm4mYWC/9RnrMo94RYQ5gaRJZ2k9U4V9SvfiF/2Dzq/0BfFqXES4Ud5DIME8Kgu3GHb3R8QTuOAF+fscz5BSD4vw2Rej3RaetTJQ4yrGkbSuoyV4nJQsmQF5DS+6e9C/aQCL/LmIP2GDRLV1MI2yFc6snUQjTla9c/QdqDWzLFVY4wkOfkk3bIrNjNKV5JIjZ2D9y9JId8zxmlmgnLcyPh9RyHvWDJpJxNLpoBp/ADL61DgIgqzfRSn/Y44qkqBFF86Pwj2oT3B5LRpiRy0zOQIMbfFl0naUsJcvW7QNbyvI+6OEJFR3PGzznChLXOE0vvVDrERknw96KVIezthbAk+Rg/nymhdrnWCtEBvdqaJqt2b22YPepGAHlHsr5XImM4zjDrbLhu1/iplMjpiz/nBkTz9O7P5pxsiBwtT9dTKvQ2iK4DcRZkOl5UQHnxbczTmNNTL7wYK4svd031lEQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	STnHyMFUaQtC1Qq0Jeuuz1YDKgq3G0XEBwOIgLndoNzK9r1OuWrGiWfYEw6Nza55emgxXa8bsWm6Avs/SMK+LxFabyhQ7NUgdsnf1JTtQO8v2NXpvhTA44Nm1ud0TAJo8AZMN+1solwRiQ65fIS1SFCJ2K3XaQ6zHgQd9Bplv/tw+rwIdkWYm1FEeUFlh0Z7ev8++sYkmqI8vTt4OD86xH9CYYXRqzkl6YmVH6rAtH11dMHJXRpgpdvObdq6rwZlvysC67e5S/HpAeSl8PoHUSmtSD5UdThraxEOEklawp64cK/D6NmVE+1PHAnDjjGo8mM/yfo+eALmbwUgdCsueqjqMvrhxjiuL6g2IjFdNIqlt/XwQEW4YSfxXS0FT7g27g73e+BAThVNyi8ThUA7fVr/dbIijv8w9gLHSDvb1jBORK5mMsQ3D37wSrsqNrUi
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:13:26.7082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b187d59-7876-407e-843d-08dea1295796
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Apr 2026 11:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17485

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D9b8f565625c94162412a919a93affb4dfa297a6c..8c6d7c033f2523450068ec128ce63=
75a0e2afa80

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 36936842..0168d125 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "9b8f565625c94162412a919a93affb4dfa297a6c"
+SRCREV =3D "8c6d7c033f2523450068ec128ce6375a0e2afa80"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


