Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6EBF47CD9
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:05:48 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54746.1772744741651436606
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 13:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=I6lWzn/M;
 spf=pass (domain: list.ti.com, ip: 52.101.57.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mor/InTyWPhsaatQwWZ8h+5AxY3RsDVhTc1i13O8P9EO+v9pNZUovI8CmTtO5kqZyRk9ogZ04p+3RWZ20Okj5TueHBfX09RPoojfhud0r7xkJCJzlL47gQKoP0+J5gEDrKbhMirDemcjGFyAxS6ojWX3uh6dfyOJs/t+gBBmG5mUK7RbrDy20h/dWKik+IFp5adCb26te81T5nEQq/yyTPTpERaA0V+8h+37TwCZ+TJHzByClVzdblIUBf/eJgBtEFlqSN8H11ZDiGuDIu+yfh2xOA9RWXdG9kxoX74q20r3aaH+Q6B6i8fNawRnmyQrHUKzk/ZWnSXSiodDlwH9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAZ2ka9dSEojoDFMCjIZrehP46t5HT7pdo2gKyfAiuQ=;
 b=UOJQwYcoFFbuCTSL5nRN31jvDf3xT//yvFrdwbF0nV71kbGiSPsdNdxvueN8nMSKOPEiKpEvZ2zupyPCpSaPuNeLUHE0mQZL6URVFuUnr6WyEY97BeiLgJl8FpbxOSIdgIlHgeoqBkDB1wkVSIhHFnmSffQnXrDoBIUxWuDPtiOS31ujc/ETVLOYssawsBWbZTp5JcGjibxUh6rzchsSpvKj13o7ntjfxRmNjmJJODVIs+Qrr1RLMlsy39QwttneIcAd6hhpNZGodM+wod1VHx+965m4dzrX5zzqZEKS0+p170sbPYRvrqUAnozA5IOT5roaGgCBeVJTI3WX/rIYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAZ2ka9dSEojoDFMCjIZrehP46t5HT7pdo2gKyfAiuQ=;
 b=I6lWzn/MgsxuaVUg1eJbovMszIC2o/9nR4IaCirzDqqzMxfWzJvzjFybR9aB+JuzdRDewWAdJlTDMCW8yzW6bxPHRKQTXcgtXyXwzCd2kAUPgYH26jUW+YRG93LRUjsfYDHlBSKv1a0SpoF9t/sWKApSDOP0Ge4s6Lu/mDRP/vOXywghoqZIsD5ll4Mv5RZRz8JlSSwgM8iXNHN/egy8Lp81CW2vIh6ZKIk3C4Wjrc4UTC/Ozu3vKvLzrCzsy2CFJo4SCyUlzSEJivxxvzrj6/nlEf5gTSzZ8SXHAp5gWitsxfDa8gFIrLAXaV1Lb80vGTIxa3BYl2v4DGs/AbfP0g==
Received: from DS7PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:3b8::24)
 by IA3PR10MB8186.namprd10.prod.outlook.com (2603:10b6:208:511::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 21:05:38 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::c7) by DS7PR03CA0019.outlook.office365.com
 (2603:10b6:5:3b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 21:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 21:05:37 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:05:34 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:05:33 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 15:05:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625L5XnX2050988;
	Thu, 5 Mar 2026 15:05:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D5E08138B5A; Thu,  5 Mar 2026 15:05:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] emptty: add version 0.15.0
Date: Thu, 5 Mar 2026 15:05:33 -0600
Message-ID: <20260305210533.3509911-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305210232.268113-1-a-christidis@ti.com>
References: <20260305210232.268113-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|IA3PR10MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 849e04df-470f-4f6f-e4f2-08de7afaf327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	isY1tEFyEzILdjSt6hndxfrcPdxjd4jj+vZjCasWjFbf7rR8xPBZFofreLV6G1VF9gFo8p3GPaMmanbQY1gKGHQZr2B90w+L7PnEel4hXx7CXdLaViUxdwzBTb8mhzs4IU1IRVelB+8druGDpBz6WLvvUakSG4NUTALxjLO+2c2QZVRAnkvbUV3i7oumOL0AMW77SKl2Q4qvdD21HssBhjUEZ5sXiC+F5nKRtfAz1YcZhty4lilvtKMNH6Ns9Uqx+MNATjDUfUjFsa6BXqyYeB7iZoQRKQBh/Fd5NSZFHZhSJe014o3Qd7VbSx053sc3JIyFxk41gVeisCqTPcwFEZefOakH+ze91WcpU7tcEIaHyTwhzla1fHKagelO6N4jLQ6jTaOlsoeVkirWbN3NhPrEeem/SE4XJpS5hXSHplQx/z7s+nH7MUpbZ0p+3iJtvJzlSp5l2wKNmt/YA3znaxfYmsyDucJ+xrO5IjWUaY1CW6tVG6V9z+OTGwvXOC5qAg5mv9CArace9QyezpAQjvhxogcO4JahYuhZQIkJPoVIM5aYkz3wsMNjTpmAhJFJ0TiglCuu1o/FicsR/XZ9alIAFMTBk4rsCCdXjjYz9gRJdpD2166gv5G2HiVoNFEYqJlN5bb86Ay51a/zcvYhntjr/QJ69EDGdrHtCl/XZvDI1b1wDuOEv1RMujNm12nL0DizKbqCxaWAyg3KR+fT9Yl07emb4kTxKKztPokuiTKLenU3Vz+txKo+FF6mZx+bYjbw6IMmcPHo/xSB7QAwhw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HVhFHAgcnIE61nbNizPlUY6Uk66RPWnToXOd7R0cQHPpXOjDZGVsmpHgSZ798a9PsMoEGfBCrMW9X8CmCwOYT+N7XViwk3zEeSLz1aL/Z+Q0l/gj4fqwUqevO3PP11rufS6cNm9UnYHIedRzQOAtlZ8igPKwTSIQrYQVVmsvuBtS3UTl1/HKxktkwMSgmbA7bVYZgakTAfYXhXSUwtB1EJ0fY3NSZr/PJEq2Bo2MU9EHhSIsT4w7xX3YpdAQT+0cCJkcLqavoD9SK29vKsN9yGx/pJhl4JLLVgowGrjh1/46vsp4sErAUyN8AsoQkB/KhfT61Uc3sRkRG2+hpIZPHsKRxTT54qnANI+wiwlMe7632KZ63im+BzNBFnWYDp6ZNhQtV++b56Uv9YGQyR0B04jr4SHTmgdnvJypCAm64VpcankYyHsT+g+VPbwY0Qxl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 21:05:37.2119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 849e04df-470f-4f6f-e4f2-08de7afaf327
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8186
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 21:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17270

meta-arago / na / 20260305210232.268113-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH v2] emptty: add version 0.15.0
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 5 Mar 2026 15:02:32 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f49e738c7e3ec0c5e9512deefb41f99f0=
5f4756d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Pratham Deshmukh <p-deshmukh@ti.com>
- Commit Subject: onnxruntime: upgrade 1.20.1 -> 1.23.2
- Commit SHA: 01e5f5f001cf661a241cb79186c2152b25ce34d2

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb:10
            GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam'=
, '', ',nopam', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb:11
            GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11'=
, '', ',noxlib', d)}"
   =20
    WARN: The use of :append with other overrides needs to be manually chec=
ked. (APPEND-1)
        meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb:68
            RPROVIDES:${PN}:append =3D " virtual-emptty-conf weston-init"
   =20
    WARN: Are you missing a PV =3D "...". (PV-1)
        meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




