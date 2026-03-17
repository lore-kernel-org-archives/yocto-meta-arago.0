Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1A5FF6E7C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:08:52 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87405.1773781722339558272
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 14:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nDTSN90j;
 spf=pass (domain: list.ti.com, ip: 52.101.193.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r05zHDkJpT+99Ha2zufti6KLQlQjpVzGMR5HVwMhk7CJvUePDj30+SJocutGSjZrFOsyEvwE+MUON/UrJlERsVMMVrzHY8mpMNIBZxfOWLuRhheRbM55Apsdbvt7Pi4k7HKr48W//qLNRngszeTY4RIsOxy32E0j5BZvKmX6EFoqxIro/3Nh4GPw6y3uompnsKZ2e6Eek8iqLx9DqH01v5+JmFoWLaK5v1LeXdjT6luZcISIgAdqTH6HTt0XpYLG/e02IWIuqF8LNsk5XqCTKyY7/hjtflZmkFEYDvSBma2jZBz8rdfi3ESJlRgUUdG+KBvjcTiDMbKqupV1cLZ+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+F06USYXy6t0gbIcLTiFqNeUL/vxUhPn9GCkb5RYfQ=;
 b=s4bcR8R4Zhr2wA0C9GacXZy5wJ4lK2zyhRD784fClQnAx3K0+n2dUbOLfKz3w2UiuWsqx4wJifz55UIWAvG2EMTScBcHEHbq0MmH5NpGpz6Cty3bDNyh+HTuemKBjS5z9spPw21QpDfLHg1AePIhxu7zivWj1cTkTh+2fAbP3MCwV0U7AfbJSWIn1E9V6csIytag8J5TZxSxUTdH5dnROURCQYeu59p1XySlFogtYNH9PMGccYLgOGJy1iBTm+jSsO0uhbo6fXgMpSUubzHrvxTjVhehurtufqTgEoIt2+FrWyuRmUz6sfLGQrNiWy6Ho03IqeXicObxtlSLGIoDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+F06USYXy6t0gbIcLTiFqNeUL/vxUhPn9GCkb5RYfQ=;
 b=nDTSN90jHtja0RgXuqE2qiufnjqJKwsZXyXjQ1OfiW68+6HB2+aTlFG8/51DJsmQWjSdOlSaDI33QiqovL8J5O91PMW/tDLWgguBtxeaChEu+akZE/mHhlqFzZhqYLz2nw4F8gyVjFMJs2AoHWGrnpARNP/eDJW2pyqsI4hAWmXJBorQXt+6r9nXOU7/1dMYEVOWe569w99/G0R+3/JAsl5g+hUR3eOwtzrx2DO5nI7OY7DUnm9RoODE/oatpvy/pPeLjHtLacYwC+AI3QINdN/fgZz7V+sRyLUfog4mCguYz/gFO5Lcp0R2hkkU995VmeGoexZs1X/jXfexdGVDAg==
Received: from BLAPR03CA0007.namprd03.prod.outlook.com (2603:10b6:208:32b::12)
 by IA3PR10MB8705.namprd10.prod.outlook.com (2603:10b6:208:583::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 21:08:40 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::7b) by BLAPR03CA0007.outlook.office365.com
 (2603:10b6:208:32b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 21:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 21:08:40 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:08:36 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:08:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 16:08:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HL8aoD3019954;
	Tue, 17 Mar 2026 16:08:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6CA3B9ACF4; Tue, 17 Mar 2026 16:08:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] flutter-samples-material-3-demo: Add --no-pub build option
Date: Tue, 17 Mar 2026 16:08:36 -0500
Message-ID: <20260317210836.3870793-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317210138.46226-1-a-christidis@ti.com>
References: <20260317210138.46226-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|IA3PR10MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: caf4379a-8b03-440e-f307-08de84695d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	h+U9GuPsQWvmwYGMTkczHfF/MRa8Xgymy43ifHbGGobIhWwytiP2vLueKbHwMVpezHh7/qDjbusq2d30hmuVlQ2KIeyIqpOHFBudalbRGsQKKXjfp/uOdn+aQ5mCpLweYJib5ua0ZsuZv42QPzL83h0LkAfY5KSPJFAoRKUQuqtknqSRqKeAdgHLRw1IlWLt4Uy5vRogBZa19P5GpIBAtCuHjBlBQiiW2vdHDmQ9BblOo5NDeHabqAej5SEtcdMPjhYV2M5ASQ12mnqdOovWrUHw89qkbU7XGxVEtsBgaYNksGh54oca71EPWzETCkWStuBMa3pqnhYhsl+dOFedeo6o4FCP/nAk6ZzT3ygswNx0VKf58Iu87KmX2mTRJ5a9gRv+b34gZxu+fbtPG/PQVTUrVXINBhYIDLn9cOYZw4snFYTfI/Nx+0RMkwpSPnudIO+6xTa7+iTbSTspMOndBNpRN2TRyyKLYQbxGq25WjuQubkOfEeGQafPTYJShV9tA/3vya6eVfE9I2OB0J17QlPEoY34ezFS7x42JLHtUTU1xKejvxuygnSEn0Ue3kmj7fOTbgw7s2gKXsv/M74tpB8bNdeojUsDmsZRBsOkobpPKQJQzKaqImv82OKLB99Clzu1gfqzfHP4cZkuJIGg3sFgNg8ZYfZ6fhoG+NUTAcMzKgIacKzdgb2caEFx8AsfxD8U67Dd8FpUFAsidefKK3U2i+yyRW8FFcsyPeYVNkPjM3hKF7Uy7wHp4dLDKlk/6ZF3kDRCmchJ4gahQ4yQdw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	57veZAZ8++rwSx4n3RM/Z/qJ5Exmpn9d9UlhLnUwqzTqNYhMP+XZbPG1TPjw65LGfT6CwSTaVxAUyYW9gD8lRrkBjrufb63v/fJ9TdPxe9P928D5ZnVo0YvsnhvzWt2fynN68k5Adn6bMsQlWiRzLzuJSuO7jpfTD+zPaMZZMWhOacrm27BkblmLPBXFxlGXLeZeqjgHycGKtQLZ0SorIlsTAXcnQcc3XeqNsOhku4olqTWqvHXQS2IaNwblZJnkwqyUT2sDkiPN/CuKiiCPUEpQvGXlTixWIDxE3ZSKKwyN5+GpfA6qY+FIT6jBRo8OhU03/2A1/Gl39xa4vJuICw1aN+fuCiDLTi06amC+oYe/RSf9N2fCakE4ZJ6c2v0626fiCyPgOjQino2dWJBjAJrm+rt+76dyKPQH4CBIEBnTRr3tg8TkmOjqK6Lajwse
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:08:40.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf4379a-8b03-440e-f307-08de84695d3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8705
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 21:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17387

meta-arago / na / 20260317210138.46226-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH] flutter-samples-material-3-demo=
: Add --no-pub build option
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 17 Mar 2026 16:01:38 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b8597ff36002f6b147b7574e1a6ce11a9=
f3ad524

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 64d6190f700d54addcd17687b7428a64c2bbb0fb

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




