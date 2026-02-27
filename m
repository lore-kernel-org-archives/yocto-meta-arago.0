Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA901048922
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 23:59:25 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.110161.1772236758659238621
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 15:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XkWOq9Og;
 spf=pass (domain: list.ti.com, ip: 40.107.201.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDEeWifYClE5bqVV2D17cGA5gSK9VI2/uWrO1fkwY575ddMssIntcx8hO4jVAKfc9GE12Kp8q3kT7ENe75BNXhYYWkEn8S/9BehA32hVQIhhuMRFMG0JpU8O/pqG24FMSHjo2lifBagQQLSJufy8U43yJmtrMnlRDKfkfXbB59VI6ucCuLJRCzVKy2cYuPKVN40IIa690k/abJGmS/6wYpJpenxhFFHUvGAkzbyo+gkE4ARUH7QSVbCev678NnrFtM1bizaCfQ0VuBn1Wyvcb2m5pBmg3p4BbUdKmuiVRmM9YHfBlMOTKtTS+Xlao57K8SKQdQzUSsVZoLx7qyBVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uecYsI6Cc5DjgjjEPAlFU8yIb9MYVqZf44b9+NEQIUQ=;
 b=LrCClSyyxQ5pspZMHZmGm4+jcHQhmSTSK5uJL5t7lgfgfrYikOeQHbMPBCTKiYRapYqqun8zi/FTmcYT+cvjsKM6OHQC1KrfOuJrGrTvKPnw4LBMLsSYaBHJVj/LX40PQLSLh9QVKIgE3Am1HK10hF79eC1ryPS9UFpuysi2M+lKytb9tG8nngrQiq7aPXgjsEn5iOaLfnFqjvdLt64m/hRqqUbSvgRzlpAE5YyyKFl+xN5nGil+7/KUtqQ8091PSG3Jf+HqTlKP1DWCu2lyBET8HoecL/yo466vO26PcbsxXICPGkoev79uZL+4RtAfuk92ssHpMcVGgq99PyvFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uecYsI6Cc5DjgjjEPAlFU8yIb9MYVqZf44b9+NEQIUQ=;
 b=XkWOq9Og6fuQ2uxt9bOmGsPZpCRsQDWCBZIqh+AWGDqTgraxov/7N/zfsiBUyZttekYMyqMXgWOpzHpclSnzNUCy4F167UyGnvI8tLeKbE1bh4d180/v+tmK3gjAuW2eF0v8Iql5yPimi7ICxPAbuqmGfFSePMlrl/BVFr0Nt1/orBG/MAlxL3uRjRnu0rm4GtBYQedymE+ZhR9h+sTzOcPyUNF9UcNmOuoARcQ5fzLjafxBKzsWjQkNqjU6tmdhKTBIw9SAyTg0xwVZkR4xyoMPXvIT+qNqv4T7rlubkAqx+Vy2K5e9/k3Ke3AC+IBFnQlENhe88e2zksmbehKiAg==
Received: from BLAP220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::35)
 by MN2PR10MB4286.namprd10.prod.outlook.com (2603:10b6:208:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 23:59:16 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::5f) by BLAP220CA0030.outlook.office365.com
 (2603:10b6:208:32c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 23:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 23:59:15 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 17:59:13 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 17:59:13 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 17:59:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RNxDM33818169;
	Fri, 27 Feb 2026 17:59:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F02819ACF4; Fri, 27 Feb 2026 17:59:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Remove temporary hack for DEFAULTTUNE on armv7a
Date: Fri, 27 Feb 2026 17:59:12 -0600
Message-ID: <20260227235912.2400305-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260227234247.3514340-1-reatmon@ti.com>
References: <20260227234247.3514340-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MN2PR10MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: 201062db-9722-41a5-aed8-08de765c3633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	kuQfo79/LVOa4BxUnqEoyXGVgRF6s2QBXe3S8rhTS3RJ94KXLGPGEwDisYGPcHayEdqOPqcayj7zC9WKHZtWQ6QHRMN6e3BgEYuwYRzyp+Mv0zFfuVTnHO11fhVHQRyNqD1Byb42quIttk0bXDbU+7K0MkdptzSArAaLAjdNADkLhZ10vGeNv/RIMj5xXhP8DA8iRTXXQ+MYAfzjmBp6qbtT4gTGlrXcfYwsl142glXf+s8JcAbix7dnciy9Kjy5dVd1lfpxK8pe6cJRo/xsAsfrGuYu5Ut26U5gMUwdbvcO02e95JsatOQGzOdw45inoBpi/8TeD2X4DLSx220u2hizNwXy48vjmmqeX2R3W21A2onIlRvAk8ChhZG6iRXnodKYmfmQeNfXRo+daVlxwT2d3b9gKFrHwNm03IRObmERB6ZXllDE7XfgDYN+zQPJVkEqlFwP9eOAc94/Nj56WCRiDuMG8O/f5Z14Hlki/slymz23ZvzQFVo3OEgHb5VUR2uXj6hNa2OeuMEeunxEpgQ/h5ypLRC7trIK0rrX2KjbOR9hFfYDT3NMHq1k8B10FbKz1V48M6BA9Qb1XKQGUlPLbi7pHmqiS08larm5hRFfk2gEgP0Z/UhHIv6/U3rpT1wUHDcHAr0hNT6ou7GXj6vFdgMZ23Xs7C4qm7Rzpn3XLaDTfhw2Q2Jf5v4z3HKhuj7CnA5SRHD7ASJye/yhEsHANLDpsLG/+bhwjIpaPGes9m9bpIp+g2v3I2IoWs8sBPlg/91LzW+4cJwmwy9G/zpOickFH+FdPhU8z2Uf5lY9eaEXJ3UETsIjvIgu4hyuaRPuOjuuV/f8iybRieVRcg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VPU7qTq5jqn7DBKE2u4xcKR/ZG9v/8P1gMgT7kahbH2kSnQPlMoN0nTTLMw7Dg+nZgisg10xGEzX5TrQdCknFZ/sqcbdOM4k0Dhw5fjaGTJTI1gSMKQspxjS99CvAQHr3uxCxfHVCD/uz4AligOXRUzluxAU0dx7w65YOedNLoJml11ROS2EaEyeQ+BQhV2vyXW2wD8QLXIrSNCPK7iaFbbcyDi24DOPMjlVjN9GNLG3rfRhREDbI+f2INdh2Vjdg3N2SHKhz2FWHppTqKVfVHS2PfLswYumly/kllZ1r/dAp2lWjJntVdGxrElG9rMtrDuzGLt4HFnObzpAx9BnVBzF1SgdZCPvu3UTKZ6oN2e5gBeq4rq9dWL/U3rmQcr5+FDtJKfSz2wwdFOB1sOPZyCIg/uax27o0dzc2pm60CaamoYVBzt+JwQBdufYsG7j
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 23:59:15.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201062db-9722-41a5-aed8-08de765c3633
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4286
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Feb 2026 23:59:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17163

meta-arago / na / 20260227234247.3514340-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Remove temporary ha=
ck for DEFAULTTUNE on armv7a
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 27 Feb 2026 17:42:47 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 293b2637ae56bb9b9b76b9bb555d0520d=
e6d03d5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Adapt to new oe-core DISTRO_FEATURE settings
- Commit SHA: 3230bc79957bd71775e0273ea1f4eab8d676123a

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




