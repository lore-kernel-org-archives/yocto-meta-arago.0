Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D93F9937C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:42:44 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17442.1776944560641007066
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 04:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=wO4xH3BA;
 spf=pass (domain: list.ti.com, ip: 40.107.200.19, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehdeDc2HZBTDOEc/afUY52dBh28gMBBpAlIey/MHHKxm9cBDZfsOtWwWCx3IuaKLYE5vSVdPOFKLyg0aXnid2kRdW3NJgVgLJFMGvwevSks4E/RgbOz3SUL/TjlreuYyAt0T43rVtyRaTCqNO+gH9WaMsquCG/G796/uvhI9tablgzwhhqQkQoZ7E+8giSGolxOyASgLn1KLwVbdzp/w9Rrh7/ixwiAuwDyKAtuH1XcGM3CC8DhX6f+VTqJOPeITkg1ldNUh3fo7UVnpZvjgHBlHzJbROo61zuKdqw1iIpT/KiAG+fXhdsWfNjNce7WFqd79GH7GT11NbSQdzpBOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSzmp/VZkiJf57tTXcp7xvzY9ceW735VdqCpTVLuvaY=;
 b=x8/f2YBjDarPpClI6brC7zaXMZniEZviac8+B0HlKKOfC12kDaLwcgUdkTP0RNC36+hWGXUu3hh5St73dDjIkyD0uWqtmMdZo3qMBZ2e8ZN2fv6NqNMw05MokrSFzTDi3q76OvJgbesaKPNvej/HuNHHvmCjB6JX6bkm4rEFZbBClCy4RDQ41e8y0c4iT3sF/FG6DntYldVfPsWUbsNNC+VOP71969ngTo9KA5QozF4XNb8d299mdcmk/704TFejuI6embON+yMUgKAsRC0mcMT40JKK/gIHinqe3C81Wi7tf+1a26uJYsZwuZyyGFyVQCuOAwWr96DW0yJRCv3GgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSzmp/VZkiJf57tTXcp7xvzY9ceW735VdqCpTVLuvaY=;
 b=wO4xH3BAKsMZVOtYL1GTGbc/QLMf5bTR8UV0oYyjL9Vz2KfXYDQwtwRgud6dFwfiJHpAseE6b9IVaJstOfmU2hRGE5XiIamBvFII0KCrQpUtZ+3ELUxH5oNlECTU+CQKGLTfRliSCCwH9A4W16agzegmf1am/cBWjOwdP1uPp7o6LaKJr9/Bg5pK1m2o+jgvoNMj0H7/bCErSuhnxU+PyXYLeUt4i/FWuyewY0LFhiUIWIalfNnCc+eh0WIDp0rEfWo7pz500d6cB73E+kcGXBRAHqvE8a4TJOmobgtKdc2Tequ5EYP89nHd72V9Q81ntHNXTpuMIbgPJ5MRCoyY5A==
Received: from CY5PR19CA0118.namprd19.prod.outlook.com (2603:10b6:930:64::22)
 by CY8PR10MB6540.namprd10.prod.outlook.com (2603:10b6:930:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 11:41:36 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:930:64:cafe::20) by CY5PR19CA0118.outlook.office365.com
 (2603:10b6:930:64::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 11:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 11:41:34 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:41:32 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:41:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 06:41:32 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63NBfWll3971430;
	Thu, 23 Apr 2026 06:41:32 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8B9339ACF4; Thu, 23 Apr 2026 06:41:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202604230400
Date: Thu, 23 Apr 2026 06:41:32 -0500
Message-ID: <20260423114132.4118198-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260423111325.1686056-1-lcpdbld@list.ti.com>
References: <20260423111325.1686056-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CY8PR10MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 3108b09c-2591-461b-53e9-08dea12d45a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	hzlmemuu4Xf0FpNuVXd3acWe9kezpLg0sj+i7GlWprtBdRpDwhOJdLKhvVR7FOFINt7S5e6A5fF/8tgj+cNSvmFQreZIXdOUFGxUQ7Dfqm25AmMFBbgUh5OtinbCFY14EmrpwxnmSNWgEc0lJQ+7SmsrgqOOmuigtt6/MQtVJqos5G0dSC107iIUFkqnqUI3ShKponrlycnkVPEB0uG5cYyfTUX0LAVmeedvIqTD8q9ujM+SGwLPQFmbpoqrfdxLQj9ozb7+gEyi6TPiOc61glrtsBUqNDXOpUB8WJpyNy768Wj5cHLl8IW06i8ojyIsjQDLA0wAL/6fA8yEbiTbSjQnqLGnCXaJoxqEZUuOOrbwwAD5QQ46z4q4R8qcdOS/SvYYR42k2l//64pjs93Np3qtIdRR5r23NgG7uwb9cBSdDkPlO5/dI61ZQ8ZddmoaqRybtOa8TtrKhCtNaaruCHsBKz/BAAYOaUga4H4cLO6aBZ/fhLF4zAEy0BGzpxcfgsupsSPiBJm+5OGfIkZf2MFyB2awehftvv4/cHnMjz2CNKhJF2cj+BSw3sBxV2WSz79zcTA0L33zz/XkORYraRYg7MjU2pOGCapr275sKaMkBYKEIdJuExbpAkzsDe+xxlO4YW+VZIjbQTiYjTEb/Yi0ugNhapQdwuwUk8s9c0OV3kh3fu0CIT5tpNjHf8eRx5YUZiGL50Gko3q69Ma8LpsBBX7S1ACxaPSn7D/f35qwKSLZk3cOSmilo8bm3uXjs6jYwksd85sZ5Ajj5KGfCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wA1iGKhkzBeJ7aeTtmPFrRfDwPVJYhtnOQXvfLRbBhbiG1kQI+z7b07PjUNgfTvRw5F6AKMGsahafkvc8reXC6S/FctgrVigOLcmEQGZ2unF5EilbjuVtnSPEpOpXNfiUduSAnHbHNyTjFCO1MvL++f/HAVw2543AVlFrYBYaheSmTFz9HeP7AQeK5t1HO+sO23SDKfWbiUjGWBaaHLqMw6eA7v/pKYpKRv8LqVQiJwboC5V0GyRYH5iES0DhS+jjTrzDsFL2xEXjD7EXbmOHx13lNeLuMcDjLK58KFNzRAbsBFN18obTuv81HyXWXvE0rmd6dQWeUuloOr5uQxZpAahJ90QJvbwrHi1yFhggYoE1Oi5Y44gTAANlNKYe3etEEndqTfaYv9GA7O5pAHZ+SxKPOS+tN8QBkkYQHIzEM2frDoKvBamdXMUSfbFJ6re
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:41:34.6452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3108b09c-2591-461b-53e9-08dea12d45a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6540
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Apr 2026 11:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17486

meta-arago / na / 20260423111325.1686056-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202604230400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 23 Apr 2026 06:13:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4da88eee07ef0da8235d887f47133b9e2=
3fe0908

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: mesa-demos: set default PREFERRED_VERSION
- Commit SHA: fa748a709b715e7c5b55eb94576ab9b2da93f8ad

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




