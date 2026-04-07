Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC41A105D98D
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:19:16 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92310.1775596746814969819
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 14:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AJDh8Nqo;
 spf=pass (domain: list.ti.com, ip: 40.93.201.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR9EMmvlj8vZdjUHje71dmlt8lDVXV84oytqJhPJPZNnhxzSIH4Ot7g7S9jzi3pWa3xgW3+XbrtM09alnhowv9lD8WXxMI81o2xT4BEzeh2F4KI567vUks1jaJEqlPwo0P1xaM4k9ClyNUBT4E5wIZv2zOwnl1i13PZHXG3i0RyCmDl+wjb8obAjd4T7YwwpJElZYbtQDx3JEzi62nmbCht1SYht2KT+EaR53kzo2fa8A5iBefjvVkQ/FL1NMD8HKznp0JkAkg6FsLGY41bGz2hxLwXbaWhKSGJZj/fS9HbyHXw9mX3pSvlS5bm8u9KBTgvBEdCN9x+oqza2x2eT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWiy7WuYwY/NeK04MsTnmXfLQa2FQkpLvaombLUQRiI=;
 b=n7CQzrpqM8cWMJU9cuKXelgYEq/4VRTzcq7GMm0w45XjbLu5hsMIMUSdsYpV36Pntk0Vw1nuz+709axQ7yEid8UdhhuA5BEZhxn7q3gxSv0l8ZjEZ9aPeVLOtL+wKkoXVHJMGAqHU7HBkE2My0q0gaRux/DkbrHJAU+F6VvQhmxIQG+H2kR7N4s/jtpGlYnblj9Uypn2r03KvJY1+txi9unjFYJIgfmHIotf77hz1U51KBtRu4shpPA6KWDJZISRCIgK5+Qy0R5FTuvMFo6g1z/f5qYBg67i7tYCyFzZ0/5JpSidXGTLWMwi66hIizZJcA/6pcw85SW4551f1c7NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWiy7WuYwY/NeK04MsTnmXfLQa2FQkpLvaombLUQRiI=;
 b=AJDh8NqoJ7fTHeQTPXr7g7qjAXLgrS1c2wAka/LwPlbb8NTQKzsQxF+r5mTY4mLp0Y+Bp63OmYJzKEuOSHLXJXpZamBqXU0UOvvXkNdlKGBpizjBPMuR7Lvaptgk9DRNh8TJD5p8E0XZT+Fe5AWQdugy23JpKjVdou2GaCJIoHgbGfF3fCgaiMKvco7FiFIk8D34o5QYSse/1e9A0Q73RZvxyJL03XwncRFFoemtwhbA2Bq24Txy54l95nAUEG7wO8Mgy/jluaylrIe1moZ9QEdOugE8IZ5138b+McjVVeVyVhwL484mge11VYjvUI0TKqrNVh+uWuiBid66BLm3Ug==
Received: from CH2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:610:4f::24)
 by IA1PR10MB6028.namprd10.prod.outlook.com (2603:10b6:208:388::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 21:18:58 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::c1) by CH2PR18CA0014.outlook.office365.com
 (2603:10b6:610:4f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 21:18:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Tue, 7 Apr 2026 21:18:57 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 16:18:57 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 16:18:57 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Apr 2026 16:18:57 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 637LIvvA844109;
	Tue, 7 Apr 2026 16:18:57 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0AE3A142E1D; Tue,  7 Apr 2026 16:18:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Change to DISTRO_FEATURES_OPTED_OUT
Date: Tue, 7 Apr 2026 16:18:57 -0500
Message-ID: <20260407211857.2623627-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260407204824.1003213-1-reatmon@ti.com>
References: <20260407204824.1003213-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA1PR10MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 67475c5d-8cd8-4666-a059-08de94eb47e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	S+I2YSpbqBCQgytNL6TtBAjVG3iFEhlEFaQuelNiIySiGJNYP44YuF9JPAl7L7Uz3t5WdunP+GTQ0De7v/tCEZ1e1o45eTEigvKtq9xXxm6lNnB1ll7P3SFp1Yty3AKAmD4axNWkU0brhjTsjq7kae82t2r/yCG/+3VvulFHvcNfWB4ihKcbkRFz6nC+VLFK2sy+PxckANGR9FgselLmK5yu5VelIOop+KPRwK8jbXJqEnF5sD47z7W8MZaBTeTSDRHYEWhzJbjI5prPwhZSB7oSPQwKNedvX+uvhew6rrq2WW20WzQsMVJEf3yxCbupw7KAil4ITY5UD4RHVudQ8AOVzri4VoNTbAh4S2ratz0QNjEShQ3h1sYvl9GezFbk5h4dqTGK+GoaKjCfTG1m83F492CKQAev9DfKgHB2ext8w0g7BOmn64NFEOz5wwGMzMlOdfxAVgf3YuRbT8Z1T0SKP7yBDkUAkg69tJ5iREBrrXYix78CX7sAV+WTLHE8QhRy54CC226RaKXPsTRlWA3pb5Rs+ZzXc8FWQ86EqA93vS6Y+mHVe5Qy8K6iYfs6pyd8K1g8H9PsZ2GypNsOts3VpVSLKjWQYLHen6MD5fNpRek2QA3Th+KrSzDZ/MtR3iWK5GLNO4usOhp/84WD/yKiAhRptzIJ3mk6YGqQfX/PbIgOJiNtDN/Lm2F7tLhBuNnVo7B3jtyuO5Xb8ovuVqZBstXf85jKazL/03rOpT0IA3W82XMCf9Kyshg0taOmnX2l0KeQ4MINuwSMuRJMHg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IA56JOY3pKEajSGyBSDLKkrwexX3X55iOXqnPA9TBIcTC8/M/P59of4zTVE8DkWk+xO823o6BILSy5gtc0H8+JcwCJGvse7ohfO7WIWLqed9K5euSttpEcEwqSf1uWfJ/K4Vx/AWGXX6DEnu3d8u6/CH2LjPMJnX+ZH53QAjrrv5NdeNMs20sf7l+5pO29SAbqSL7ou2TL39YTZdQ1u4wjq2UnvKfXG8UO6AUR6HM+rT50yDpiNXi5RdTA0tPQlUB58ErMRgHTWMFnUhjVEvhO8NPpmsept6fLOJcPRQGWE/bst72KRvkiEhIuFz/6jKNMHKqyFG8zzkl5XeOsfUBxd/VEsQ/QNFWIh9FhT8BLJucSuqo50a9v4bqYhpkP8dbO4NdMHv6CWHW9EuKu89fpU79XZ1bZScqUj1twoIFIvhIY0fMNbOWJTuFz9xUcsV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:18:57.6631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67475c5d-8cd8-4666-a059-08de94eb47e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6028
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Apr 2026 21:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17455

meta-arago / na / 20260407204824.1003213-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Change to DISTRO_FE=
ATURES_OPTED_OUT
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 7 Apr 2026 15:48:23 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c8b0027f1a1876e7300178317825b011b=
12ecca1

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Change to DISTRO_FEATURES_OPTED_OUT
- Commit SHA: 99fc683bfe04f3cea6f7d94c9c079a68e8adcbfb

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




