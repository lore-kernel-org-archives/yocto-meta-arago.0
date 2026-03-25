Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FF3103A9BD
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:08:36 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23114.1774447706897027671
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=gxWYZJdS;
 spf=pass (domain: list.ti.com, ip: 40.107.209.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tI70hfNXTJQbUFAgWt8N+E3WRcOVyMSRRFJa/Ohx17rk+RW9em4I4O9x9iqp3DXZz3rRWcNtNRwnQfudlDlnIPCv0uD8ynQ3cH13i9bxq0XU15Eq2UASsnOHf2ztCaPyOxhb2cFaSS0UuifYsJO+KwqS+IgBEtvLf7LFsIJajayO97mUM5MuTa9/0lEH0e6lxEFsyQY5cnzTvqgKtAw+qL9OK6ur1Jw/erkTSmZFlGS4+pXeBVAqs1PTtFqic4wBxBQ2qBqU+DLIGq2LLEaDWgtG5Q5bE05hHDvClAbfPfFm5dxZeDPjhZFmziCJHrhly31ePeHwUOlkli3y63e0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eObdk0lsGORHU2w4a5QGeWxJrVciuxa1TKRKcdmcWx0=;
 b=PLoy2M18V7ir/3JUewICHXCYa0fTnheZ8O41lq0Gis0FihNFDbd2b8vM1i5YyIamz7u4BU/+aaLjse7xOFDj7gKE7LjrhpGLGDBN9T35mPU7ZNicPBFgBdv6KeXeKw+/q2Qm8pB52ffAHgABXEFULOFCIvC9iSdvIEPXltEqdF3auPFPQ7DmpSH9w6eajSjc8heSizbf3neAZDosb7wfmzQSA1OHXmlq0CyF9hsb/wQ3G1CAAviwHRaCWyAMAxtLsfEYdnVTJR5el7SCN9skk9t41VPrK14b+jclo8Z3T6jlhXBAq/R2+AZhV5shv+NzuZlrETGMT5ew84RNozy2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eObdk0lsGORHU2w4a5QGeWxJrVciuxa1TKRKcdmcWx0=;
 b=gxWYZJdSs4KTsyJko71nYuhyBZI1/c0zXQJ8nA/vT3cggouF6gNxX8ZvQhViZdYblt5COe1Uj4T9oUFR8hQOiJsFABINfjMIfjcK9KxVNR0b9Ft6ckvASGqplHf3/VWdrIhpbBwhT4mSumWqnKv0wI2CzORpbsaEg8cLYmxk52WW3hsJpF8WKUXvccUdcVXWRfz/fW+XwcXiHTZ463AZVJ8J2uwr+5BGnHzTuqZ/nLCJdJQjPDhETw0XT0H5qlZhHetsuOyL+X7mSkvTHlAzkyxwE4ezN0DIKcsKeou1/ej56VELbjDP9QbsHSty8JW3zVqJ6qpccF05PSFBaeuo+A==
Received: from CY5PR16CA0001.namprd16.prod.outlook.com (2603:10b6:930:10::31)
 by LV3PR10MB8057.namprd10.prod.outlook.com (2603:10b6:408:291::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:08:23 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::16) by CY5PR16CA0001.outlook.office365.com
 (2603:10b6:930:10::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 14:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:08:22 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:08:20 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:08:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:08:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PE8K3n2589339;
	Wed, 25 Mar 2026 09:08:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7340E9ACF4; Wed, 25 Mar 2026 09:08:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago-prefs: Remove old settings
Date: Wed, 25 Mar 2026 09:08:20 -0500
Message-ID: <20260325140820.1310678-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260325134124.3274512-1-reatmon@ti.com>
References: <20260325134124.3274512-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|LV3PR10MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: b02b87eb-998a-4675-229e-08de8a77f94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4LO381NHgF5hCM0HeiN9x5TjSQXVKDPr9mRpa2Tp7YIdjiWH32Mos068ssDR8AuZfTI514s0h+m3FFeTmc2AOpJWYQKhkuCYGNJzNeWWJF54Fp6vGY11mmud2Aze9fg/SXuUSs7BiHDlWepfwbuJwEr5Jb5sMgcsE1hD56+LVtl8nEForH2YhLA6H+UITM8xOe/eKGnKZJL3Izlxy0EszLwCwiTQVlEEjdhwuyennjyILCYI2lVNu7NGTXEd967CewA30DENwbIm+pFguDTVGhcWwk8Mw+i9StM2VZVlyb1wraytAa9Wzfuif26l4Jil/MYr0Hl8K6vjr30EOVnfxZ8n3LR0rHtfBv/Yh4AVcVUroz6lGsTJrrlqBS2jTf4cdOZ0XyoSiD0Kqb3BW6Ekl1OjdWoy+/ilF63fXc+U94VeS308dEvOe2+fspJaw2cX2PyaHYBYVA0EqfVpCOuwcUXWS7b1jkq/cYmy/8N2HLqJeznDzuag0NtkqVn9h6QZEP5I9Z0pKyZUDjbTWvSVC7h13THV51mqqeAeXKgykTxJ+BFQBtWT8+1mcFDrNRc4i3s+iOqXGqFJn9kjHxnvPMFK8LlQhnmybOeKON5JIP51NOXStSli5pNGcQllkuKzfRiatICMRnCXpV0H/uPlvM5mqEcNp09v7b4yODxIBKtmJseiPsRcrFqe4RV8E+O4GM0eHtDHZdks+H3qr4e8/d9cG/fpWSQFFetMhC8fQ/9rX0sDLekc6WxlAhMVqyMPLx/eXY63zL5YXRDi95SEqg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3CTfhrcwv30dGjo6mADfiVPz9qvjvAgrq5FOGgbSnEgM+m2irg0mxe2KzrjbXHfBrrQqYzO0pYknuD8YrEc1rosVY+dWFp/W6kOBe7bvbQOlbjfYAw1qHt0q8bBMvOBx03lkvtVeXQLRmtcmnMdRGR0tHmmApvrerEoS/1vWJNMt64JvVoSWNqrpZwFpCWD4lxQP17WqQOC0rO+IIPUkmJbvMkAi3/UDFgSRcJOgsJ8338fVLCjXwqGk+E1XrgVUkkLrCQ32M0lvd7ZoOhDAOJFtUtnYROCxb3BFYhBywaM+EdICjei0beRJKZWbVCC2LfRY9xAe3QXByu8Is6US8CYe/Krz3iwhNPoGfTDhUGBHquoD+CPYrVSGiL493NXcg00k50G4qNlJe9nGIrtIBKA6tvNrkVSrLl7+VwOYrjBZmqCiyaxK1wJLQPMC6J5N
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:08:22.0725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02b87eb-998a-4675-229e-08de8a77f94e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8057
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17432

meta-arago / na / 20260325134124.3274512-1-reatmon

PRC Results: PASS

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
- Patch Series: [meta-arago][master][PATCH] arago-prefs: Remove old setting=
s
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 25 Mar 2026 08:41:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cd8630a2bb3b14999ec538f1da5176e6b=
ed5c59e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago-prefs: Remove old settings
- Commit SHA: 6a3e3ddaca8ccea3590b072ad7fd1f2cae50df35

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




