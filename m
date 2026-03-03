Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E02EE67A62
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:32:43 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24213.1772559162364321159
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 09:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=o8UOWNvb;
 spf=pass (domain: list.ti.com, ip: 40.107.201.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsupqpCWZUpDKzoUq5WwiEnKZxWphMKv670Zw4FD/hz8uN/K3BLn+s8T73EHnZf6OWyx5EY/IzfgNwVleY7IcoU4UA3//bcIGZWwzPk5I4RCtPh1wCdxPI3iL9lz3+izZPfn9wFKFBBfqM9kGZbaelsh7CaWuHBRhtR/y8NVTSngi74illCKZ/9a4yN0Z6k3KSKqBQa+Q7U8ti1q2JBAeX/F0XymZnM+iMeQaWgcNTB/hIEV+KYsMBIMdz14jiM2QusQIUkAh8Lg/jBrWEMyIPlkLiPqXJCag64o0V1lsdAJJjjS5Pf4yQ9zEM/h5PduMQhCxuLk+fzgGe6SygyJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAiCUCL3XPMS6ydRAyl+IZXduS5wKPOvs1/tyEdQ8HU=;
 b=jprIKzWxeZaEasWewQe7qpA+Kdj9ok3GzUJlz6lom+wO7YyDxv3iQ3a4FX9j3IstH8GEe2kZqgoOky2UMFxJIE8eP8TMVrH3AcPgMPSDtC1ceAbCeXBIdu4DU3PgKjalq2ym43VZ+rMVnhlbHhxD1uJdrY9wrUivmS03LRYY/QfjqYXtT+E6UlkPD+cp6jZ1Oy6kmhkvFITy6mqSe8MbKUbA6Vc0vM8RZyw/6YXNoARFYqaPWYIFC3vj45PwjRb0cVtB9HbnsgU7qDgu6AfsaQ0X2KbHR+D9A+0Fj3kepyvI4gbvrNSm7jB1LG617BJEF4yeM1ct77DpdYPpFlwinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAiCUCL3XPMS6ydRAyl+IZXduS5wKPOvs1/tyEdQ8HU=;
 b=o8UOWNvbON5u6+IPlzSaCl83+9XW0w4f/AHZzA+Qk1IfqbqROOExZxVcXwEI5CS0CkH5gG8bZaxYxc927dYAgW2Mgk5XK3Up9Ag4RU0XHMd0FnGN/4IDldmcJ9wrOvUC9uvU+HYpi8pip4xAq/7mB+1yMhQcgICqtg6JGPMoOD+Cc6V7Stz+zw1+087UVRfsq9tIVfd5Kk6U1qymeF5N7/EdNxTqtZJo7rgnX0nZ0xV/P1jBEFZfdlQILCPxGYObR0GsdzMyrtGJhnSZ9XZqI2wmUyk013lYWqTxDsNJxjT5LvI2/3OpXZlHdAymo91fAZeup3L8l0yJkSZxwz4+Vw==
Received: from BLAPR03CA0161.namprd03.prod.outlook.com (2603:10b6:208:32f::8)
 by IA3PR10MB8042.namprd10.prod.outlook.com (2603:10b6:208:50c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:32:39 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::2e) by BLAPR03CA0161.outlook.office365.com
 (2603:10b6:208:32f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 17:32:37 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:32:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:32:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 11:32:31 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623HWV003027586;
	Tue, 3 Mar 2026 11:32:31 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0303C9ACF4; Tue,  3 Mar 2026 11:32:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 11:32:30 -0600
Message-ID: <20260303173230.1155701-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303171751.393226-1-reatmon@ti.com>
References: <20260303171751.393226-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|IA3PR10MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4a4610-879f-4e16-53c4-08de794add10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	5aYPW9cBPCa0goQxkMw+zibAUHi+OtOttfP8v2Z+l9AkKI9nBB3T+JesxNbeD2PHDAsY4Wlfhl4fy9k7GNifHoi4Fv+y0z63+E06+DD0wuwyraYKPEpGey00V+IWpM5i7KKpL2CuREyQSpzFG1HQME8/bMqXLZ7C9SnVyPYSJ9Em9lDLqmCR7u2M0XU0CVbOtnbHrYizOEoeFKYMG/76ndXCuZYFFS+DA8RwzU+fftF0I14ZSx2RKHwvgEGoZdb2GHNMF6f8SU/UfCZkP8EECApSbxmj9jOtfzSVpFevRxNEKRx4AGPXYhcv66+AWw5imBJ/FwiV1GPOTYUGVsxYawId7GYyL8nI17ZU72B9wiEg304uWH1dOLvVB5OrpYFhChV7hcyyuX8C0L5b8LIcpyFcTF3hEIKgdapkQnyH0tOKXtNPWAP3/HGl9Gus3p/AjNSaTxp2+PtTZKYmydGphN04DrDfxxJ78DVWXZT4sPvcdNGUpMxzUfJvnW0uMI1zL7zGGafQPS4Ezop2B2b2AjGH/cPaJnOPeciefc08WHJwUMEkTOHDgdX+nQ+PZp6KOGNdl3AIpaAJAvz9qKTTJSIb3GOP/aUUAJup92bD0byL9lGybEdlTOmT3RLgmZsEwJn4Qi9K1ZK2aDsDJR2xIoRP6gLzoNTAhh7YVQHjGuMpEVPRcY3iZmLmiGcMbFvQHhBaOxka7si3l/YZBgjRH0N7LCOXT/nMJBZtHBcvs7bQ4BxhwEzsKsCtvrg4XgiPbeZdsWarqm6iWBhBWOxSumDLf075dwpFQE8OvO6SMquqydLauc6yXxMAgvxhScIlM0Ji+AeCHeN5tnW/oCI5Mg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Jp6/iiUzC5+PW0CHyItUot7Ye8R5BOVjMumEKBdaAyNu5HdV5qtO1T/rQk8xQc3vzb7lii0EkS4ZpkaO0Uuv6G+ily+HsHIUIcwaGLoGTAYclAiGPJNprTRGaeR9ZSUbOeRCoAW14tlxfTxgk1l86y8UGixFPGJqh+QNjxcvA51Hq//9bncj3r+pR6k4U1zh0sn1yS3WBp7qsvXq94LBDa8cSkD4545GoRPW7Ga3pIS9VA1g3ghZLCGCEQWLe1SjBWj1EOu52GsJ6d0SjmF1wiLwolABbfuQYs9vzcwpNBytpqGcT8/4TyR0aJgRSiGQ9J6eFopRpNqadffRIicYVpuH/SWFh96Jp4bbivx2y+Z5ewua2DB858al8fk8fyBOpsaNGjrNEtlafwVa0NlP55MxGOHwpW+SRrHz52lGWx9JympJZtaO1CorsT5WvPeq
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:32:37.5360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4a4610-879f-4e16-53c4-08de794add10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8042
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 17:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17207

meta-arago / na / 20260303171751.393226-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v2 1/2] ti-test: Break into mult=
iple packagegroups
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 3 Mar 2026 11:17:50 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e6c94e5a38892d969d0f066cc256ad6bf=
766996e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

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
ERROR: Nothing PROVIDES 'ffmpeg' (but <build-dir>/sources/meta-openembedded=
/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb DEPENDS on or otherwise r=
equires it)




