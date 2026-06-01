Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9008BCD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:20:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4493.1780334446076600588
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=C46z5NBF;
 spf=pass (domain: list.ti.com, ip: 52.101.52.24, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnMJXq/g+1nPkT/2PeaAmwoHY5E5KATtykWRq3qXJRHBhq+o+XqEqQ1Rj0N2zeKDfRkmabQlEtdn+LTc3ie/iTc93Aa4hgx74IKvdXEd5IXdkHRNayZAItsq2XjSfpRE9BP3biljrQj8+BhVBRX+R4cdn6oVDDKUNd/ADtSN/Rbosm6gou1aUdCQvjnTTtYWRHNOvSz0I0ebiQrNVBENGRSaEDwyfUEFWucnmUdV42bipCzYlxP/r4oBsgidsWGfRackckAPyf0boXeLqwN7Ng/NO5jwjHuGtEMGpooNmcHhc4cCjLVkizZihc7i2c+8Wy/z3AK/pZxy5rNycbZYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4VJoQXD9qCH3H0/va8y2b0Fc/FAuzY1xreTejU3BCE=;
 b=SYXwVnmV8gcmK2h1+DqpvgxA1yzUur42tIHUH1rXrgMR6+WdIbint/R/ZTLajmBPi+wHlcuYr5XXhApE44Bf5ir6RNlHAQZuufPIwn89oWRBeCXjsqDXJEfU4PyHa5xFGmj+FDW4cL5YGXyPKwA3bmJOimfc5vv2QLO6eOPls/YgpjnEIHDCP0wVLAeWN3fuQEc7WN7t9+S5Jb9RimnEZF4Slt9LPnQuDC+UbsuxIrrnkInmfJfb2wkTg5QdsZngHFJdMb4KI/0yy0BaOi1mn+fJ1+Jh76e9EhYx+zvHoDVVpwFx8aYwzdXdpubt8lunE8EkedFOY4NSUGw7dgh9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4VJoQXD9qCH3H0/va8y2b0Fc/FAuzY1xreTejU3BCE=;
 b=C46z5NBFz/40DnYZFEjlkjSdXRn82F8LDQmuGvrLSpeVA3i35fPiUe1LgQ03l1eYWxrlXXokKRgqdfyexodwFfBmCwjEhS/fNRDpdrjlppHveqKANJpV45riNXTu0eP2r5y+FLakTTMWl8pKRue+XNe2NX/+AX/eRbiNVem8r/ZgExGctK8V2OZrlkJnKpKIuQx3m1FXEwSzr5/6nYAcDP5rnSeRCeCc958eLkJcaRBEVX/588a4StO9IyfmAXNX+VA1neQh96qx0uB5vNOI+TrZHihiD/zk3ZP1mvdW/jsn+eHwGc+xFmgX6GnsCbllehqgfo0q7/ngnu6kLK0Lsw==
Received: from CH0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:610:e7::21)
 by EAYPR10MB997948.namprd10.prod.outlook.com (2603:10b6:303:2d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:20:43 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::36) by CH0PR03CA0226.outlook.office365.com
 (2603:10b6:610:e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Mon, 1
 Jun 2026 17:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 17:20:41 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:20:41 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:20:40 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:20:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651HKe6k2648008;
	Mon, 1 Jun 2026 12:20:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C9E129ACF4; Mon,  1 Jun 2026 12:20:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Jonathan Cormier <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>, <rs@ti.com>, <reatmon@ti.com>
Subject: Re: [PATCH] .editorconfig: Preserve trailing whitespace in diff and patch files
Date: Mon, 1 Jun 2026 12:20:40 -0500
Message-ID: <20260601172040.2285970-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260601171912.1146766-1-jcormier@criticallink.com>
References: <20260601171912.1146766-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|EAYPR10MB997948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2374fcfe-e55f-4025-0c48-08dec0021b6f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Ie+XKJwSupUYw9UMjTQfQI9KjGXFxwYcxvGyAR4ZIXsHHDu0pBPbCPEDE77or++YrpTOa+tEw07ckSJ4IIo0WNC87yvv6n18D+wAJIYT/Aavpm7TM5vVNE/MVe/wDVBBetdt44EpoIRZ5NtEwM35I0dcg4YR6qK5LcpP68SE8SHlXW4Kkib0oBEawZ2AuMsP1yl+sr3rx1Raf6hD8LAhYLxBwNV7AQw3YjvXkCWuU0giTG71tPdys7wJ1j9OsxTL0bHUM+e77y3aqaCT9sFsfDCn4h9ZSO45T3XnjmZ97WFZM01NshXU68S67KJWGodgGCpIHYsgpXrs5ic5bDjJW0PjONrKVN13ABwZLKHyoEYWnbI+RztTZkJ2exZaa7ZBtwu747GLbZDgFgZZMyK3iAm4WZLlOU00SRGTf3Bs8kc0zFlvRYTNlt4otw/GKpaM2o4r4ViVTOF4Yl2JgvInSSp81RbpGMaxX4CGJapRkiU/KUMHXs9cx8Vs8iPb1IiIWeDxuFIj1rfwSu33Hl1GuvapuZ7uZuEpys0HVteGkswxbHJjw0kNFDKJSztg/BNB4aiYtqHcbYzrRs9RS4zoewuaZG/P4XQarLhIs+N/g8ftKR7d7T7+/2T9Z/eaW1Up92JQn+V3pfS33B4IpsavMEsxPp5Hhe8e5vfuja01vDJmMUmNVA9w4ZQdr6J/3klTNbrTC0ctHxjRTk3YjZJC/zwQA7a+SgXEhVge7Ko66IM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/JFWAwQsJLhFi0yj7n8q9A7vo/uUZzuD/7Ikloepz4+na6OVJq7p31AfDxS4NNyUyDSUjIXotj507AHx/kCAnRvtqaK6Wxf17+ptWDWpieklD9LvUWBwSB/BjJCX8uiv6kDesICotVLmx5IdAIEP2u922Y2hc+DU02iom53mgfcr/a/3x0aO68MJej+g+ylh+WPuZLLPCODXfTrxoT2TNngdY5igZb2PkPnnU44gIxQNuqfDPu3oikSHjq0PHhUu+xNBXswZjS8Edg2l23SOKGEGSUbYpz1BiQygHzpHnJFzqfJ4kKKhOlBmzIcfoxbj26Cx3SEnL0L7lNRDsVp80BhNHrgImXpS6aavR6fmM8qndDoDI17b+1IYBTjE/LO1/hQMtfJwILWs676yZyWECrq8zJYuKVkEcswQrDAnSMzkN6cZsuzzmjXIuuF9J9cd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:20:41.4923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2374fcfe-e55f-4025-0c48-08dec0021b6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997948
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17547

meta-arago / na / 20260601171912.1146766-1-jcormier

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
WARN - [PATCH] .editorconfig: Preserve trailing whitespace in diff and patc=
h files
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:60
            Subject: [PATCH] .editorconfig: Preserve trailing whitespace in=
 diff and patch files
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [PATCH] .editorconfig: Preserve trailing whitespace in diff=
 and patch files
- Submitter: From: Jonathan Cormier <jcormier@criticallink.com>
- Date: Date: Mon,  1 Jun 2026 13:19:12 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b0a1384f9e2be260dfaf112ccb645a7aa=
25d6f0e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago: chromium: clean up and simplify V4L2 patch se=
ries
- Commit SHA: 30a611f56a4bd74d421e36ecddf705b956c01648

Patches
----------------------------------------
FAIL - [PATCH] .editorconfig: Preserve trailing whitespace in diff and patc=
h files
    error: .editorconfig: does not exist in index
    Applying: .editorconfig: Preserve trailing whitespace in diff and patch=
 files
    Patch failed at 0001 .editorconfig: Preserve trailing whitespace in dif=
f and patch files




