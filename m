Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654A5FD7073
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:23:41 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72837.1773743008646851643
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=f2WsSX4d;
 spf=pass (domain: list.ti.com, ip: 40.93.198.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilWlh501k/Hlb+ITS/MFVaZ+pNjO4L6kHp+CUNthawIsJCiOO5pGqYY9F8JDNNWbWHzLYWdMpH6ST2wp5z/AHKF6KDUSlhRkQf85f10nx/LhNZOlBJ524KtV8+4eIJwBpPo0/rc0t6d3kg6YpXWadcML1FMCETgET82wya0ROM3JjfdUY+y7FE0UN6QATYie3tKLr3JLXvLji2d7xxwzf4Zmo5UmBmLUhARConNimw9okrcPrNtulo8NDe6iTXtCLA8tJm3OjSU6rJvMjBifpV56hPow/IxV2W3epqUuPD+dpDcfj1eLBl4WL7cUgUrFnLgv1+0J+KudkZOZRv6Ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvRBC8Uvw6VDqRRPUevd6VBqUv68w2nDszboOyOF02M=;
 b=YMVaEvDjt4U0q//sgFTJpTFb/lBFjfdRPrtS937tj/dt8Nvz7YaQfH+g6g9jwclj51lO5fnx8LBgqOwaFR+X1xF6MDAbhyGnbOH6lr58EyOYP6J619CpQSamNIfRRLxBCfM1cQtQfftds+79p3GB6LV8WMKRGRGuuarvxOxKBeGMZPI0YC91vjAVKFZPsWrOlfYeg7mVto9gaBMzOvrrvSphkYXD6cXwQ+vV6OotWJbnuYSoFS+w2e8j/Tmz6qQfyaYWAjxbrqLF+6t/3+3kpA0F5Q//Ip14iyz5R8sNSHsV8HwwHsyQjFqMEVTOYt5UVTtC/edIoWbTA67WDrjAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvRBC8Uvw6VDqRRPUevd6VBqUv68w2nDszboOyOF02M=;
 b=f2WsSX4dbWeH1ItRYCeuEDPaxzmY0/qlkYfXgZSKkuKKAxYDbaWcjg9/FvkxgW7cd5KD2E8TtQVBZByJ8f0P/G0WqgZoCE+1ETFzywRNEqhSWeDiO6WbwVrHZI7/8YTgB4Gua+3wrtABxL0D6bsfLMDpDpWzHz6HJOXVSM8NWyO9q8NioCES7GeNlXNknrOvZHPRgngfmVlW2uC91b4k4lkeSw+0NdmaLs5HE/NbYBRB/p8UaexqhbdbJvfn2TAdFXvJL4SfXDDInbfWOwLi5Rbtk5ZnR99xbNB05j9IxALCFUYIw7r7LoiCtVARjjk6FhWY7SM9+O/n7qx+G1HPmg==
Received: from BL1PR13CA0305.namprd13.prod.outlook.com (2603:10b6:208:2c1::10)
 by BN0PR10MB5125.namprd10.prod.outlook.com (2603:10b6:408:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 10:23:26 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::89) by BL1PR13CA0305.outlook.office365.com
 (2603:10b6:208:2c1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 10:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:23:25 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:23:24 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:23:24 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 05:23:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HANOl22542635;
	Tue, 17 Mar 2026 05:23:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2E2809ACF4; Tue, 17 Mar 2026 05:23:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aksh Garg <a-garg7@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/2] Update PCIe Endpoint Testing Application
Date: Tue, 17 Mar 2026 05:23:24 -0500
Message-ID: <20260317102324.295369-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317101651.273730-1-a-garg7@ti.com>
References: <20260317101651.273730-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|BN0PR10MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cacdfa9-f9ed-4180-cec4-08de840f394c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9n1UP8v9CCmi3/+sT2A4OleO2rtZ07AjQzEnX8irAB4q29q8OESubDzmasX/1GJv8RRf7JFGHnHsLOjmFRGqCEw3xcuABePt1IZWZtOZLao5m2+Dl/di+gzGrjldLxyoEGff4kUvEJD8mWhMSQ3Vf7zKni2rmUt9nm5+AtGDbvE5JfhoopTxZk+1+2WUKARNc/IFPKYFuAk7i7AKWGJPI+7novekk01AcbmHFt/7ypimS0eE2SZKaiolmmvBJDm0OsdKa2F+Cyx2GNl+BdMCBuTVdU/5P/o68EP2SE4PYbL51DUKaVoyidQbEPhhtZPhXro9lyegt7YyIaf20nJO0O2/BSCqlM7gUd1CMHpCVNKQmexLDINhN9Mm2IRK4dfFPnu8rwSHHpeJe8DdN2mRRNthf4QupT+H999CfQS/Kv5A37PbpnOo+wuEueecBBNhuhiXF0+IagYH43M+mv1gceicf/ExPDGUzkBQu0qzuORj8ANs4qO/1P8pm3OvtAc9qjl9BJCb1auUtleDdv6rg46WVRoHhRBf1Cx4Xc3FcLQDnI8XFo1oMwKgphI0idT65fSWCrgfz6gHyXiDhvGDxvzGhLMpbh/jzPCPnvmGZfH22skB5C5s1+oz3DV7puZ8dk//HIMYzq6p0Kw8wcVo7t/zR6bXCQsT4rKLjnstYv0k3iNib6IlXR+g4CIcYlqmVNlJ6eHQikR5GOksZ9npy/gUcE1LBcYh6aR895XY7vTP3CxkNIoV/mZH6P4OzONz6TbrCBphf4IQXP9dgTclPw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MPXKf45kmhUgzh171x2YzrHAFF1frTFp2oo3xPZUDpoPD2CSK6mfmY2Mi5Rz0NPz6HMJTXfdjRAUNY13xclo5jKj+OGZdgzgPsp0auq/TdzxzLAeU063AD8wIekZj58V3igTsy8udRFeH4DF7fwvKJHXTlPvqqHY7QwftTpok2IGqwpFV18pcGVhchmWyLYK5MbSascSy1Sns3apWuMZU6AZlI2szt8gUnFmUVxrSlzJ18nBAPbp79aGXuHbyzrLvSLFFbDJaeDtEQmEPXvrsJ500cz7xg5aHRXlMDtxGl9BD9aBy8AomuH9pB1J9ZKibbDHHeIp1ADkL1LmmqDJs+KjjRWHhrtsZ5A0YT2AGIHjNeKjNcVDK9R+EciS6OpgTTdjB/ayDk4Jc4lnisoLOTUDqjoSfATNbkpdxTjRefNW7UtFLr8IEwnsyV4/OgiI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:23:25.2700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cacdfa9-f9ed-4180-cec4-08de840f394c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5125
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17361

meta-arago / na / 20260317101651.273730-1-a-garg7

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
- Patch Series: [meta-arago][master][PATCH v2 0/2] Update PCIe Endpoint Tes=
ting Application
- Submitter: From: Aksh Garg <a-garg7@ti.com>
- Date: Date: Tue, 17 Mar 2026 15:46:49 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: accf1608bac476cdaf6b9fb255b8e87ac=
fbf4aa6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 9ba2d3bee20febcfda1e61bea3a68e517b4b7bde

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
ERROR: Nothing PROVIDES 'gstreamer1.0-vaapi' (but <build-dir>/sources/meta-=
openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb DEPEND=
S on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




