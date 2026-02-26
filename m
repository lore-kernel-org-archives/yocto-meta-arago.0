Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC81EFCE080
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:35:50 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70089.1772112941331147681
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nn/UJLPw;
 spf=pass (domain: list.ti.com, ip: 40.107.201.18, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5fJ9xPMzFx8hJZ+A53IXcA0vnW02QNbcDQXRzyS5KVZ//aX7fvl4ELd6U/exywevFBNO65gqQ6G3TjXRA7K4fGC/NXtvkhdn9+TfDyLciJkxsLA6KaGBScf7t888nWV26p0zwJKQOPiPFS225UiDZC1eNYp07PeNCQPUS+6sf+HhUkubjooai4zFhGyYbbeJ1JJHczXFUwLibgAHROs+jFR1MTeWwXdK7Is2gVeq0UJkBn3P16gjQQBzL+nGH0vgTW2HspUqQHOowEABuhfUWugbZNXhv44h/DVQX3Pvj2QFNFsUfrywnXMZMbvgP6v4B0t2rTDKPynNyhnG+xiyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5UHFvCSwIeiAiX1DmZu30G1XHvanFoRgjNosyjEuMI=;
 b=FIE9QLGK2Xxma20ZRnZ7P5PiUaWOcTJXXRTQ8g86SS4zb9TkOGuo4k9dc3hQTW8kzdisCoKrr4vC6mu4zT46ZQI17E/UTRTkXLPaKPUC0dYHjhaDQ+iZFxxJH4baAGRjmlOrhP98loXoUgYMn0zHq1DK+IRO3mNHVBtFb4ZfpFEc6sMdUo0qfVcQXFQogg8Dqh3Ytk0nSxATDJZr3kctQdaSXbtEB1+X1WJZ4Y9SLdVLM4aCFH7L3xh8rxtXLtIEzZtB6kTJ0sKJolC4BzIJoDK8nI+8QBL4JXhv42vTsRVdRABR/T2E6RjpWc2bfiLweL3WpN8VeisPqUH6G6E6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5UHFvCSwIeiAiX1DmZu30G1XHvanFoRgjNosyjEuMI=;
 b=nn/UJLPwNSpBsbdaLxHDaTV/C+mzXjaO6HaDbOreDz92DQpYvtCUFt8boqVKKhHHIuGf0DDF38A6SvYhu0X0pyup1Gbxj2XvsX8Qhb5yI0hByG0QJIFlvvr6pjikDFdlrRZZB5Oud4GbkjDwhx8lyan9VpX3JT+1fn4duMnzUAD6dGWh6Vzx0DQJ29JDCWK9nGtNkgc7V05hyq5EKjztkhRUZPN13O4KpjvaSHaCx6Ywn5MZC3TaUAY1cgTbKhQ70dDOSwxyZ4asGhM377sPvt3KQlJ3DoDSI9ly+nCD4MpF32/1/PttvJ5yRIil1COJrCWOkgpMfv7JFQJNmsybeA==
Received: from DS7PR03CA0038.namprd03.prod.outlook.com (2603:10b6:5:3b5::13)
 by CO6PR10MB5635.namprd10.prod.outlook.com (2603:10b6:303:14a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 13:35:38 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::9c) by DS7PR03CA0038.outlook.office365.com
 (2603:10b6:5:3b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 13:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 13:35:36 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:35:20 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:35:19 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 07:35:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QDZJca2329697;
	Thu, 26 Feb 2026 07:35:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DEA71138B69; Thu, 26 Feb 2026 07:35:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <v-singh1@ti.com>
Subject: Re: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay
Date: Thu, 26 Feb 2026 07:35:19 -0600
Message-ID: <20260226133519.556521-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226132925.537059-1-p-bhagat@ti.com>
References: <20260226132925.537059-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CO6PR10MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d7f8a2-7a14-4a21-4526-08de753becc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	hLfLxRVMW84WNAspVBTs/MN17ZlD9yLkN3SJW4buajwM8DAkD5Cliia0rk6OWbYt2ocP565H4jS7CmgS0BziwkWCz/hL/1Nfvc3gxoOZjPXS/vP5sA//ocqK190yCAnEDTzjuKA1wKBOPVIeHmXZsglllTNPOsBoE9yXcOxpzS3CgC1r/SppuJaIb6FN2tNLlHUeZ33RmTW7i6TgLbrI83uJWIhsmt3MBjSMKBUkNLtBFMPWVXP4q9Dk3lWdUh2wBIZwkiW/oSZ2M0Nt4wxvNaazcYCaSov0eeo05+Ke6of94C5SD6atvtNYhtE24CISBUlN3ND11W6DmB8uIJBNqxwdsCcuqpIOWEhkJF0iq1nzgLTeuctf2w7otvFCgSsiYbuPoZXQtWwvm7lRC//KitnsltVzrn0kiXtvPuTeEJdkKrFQj0HsQOlfoLso8yMsqU5YJ0Yzg/DgGTXQ2D9A9HlV1E+FyJ5ubgNCX37mSsZ+B2dYVCPUJIeJkEs7xty6zLFA5y3P8gtXtfUQ9VZDbBjzqyrD6xYU+CMrsroAASTG10OXRkI1uvUZj0/25jK3i9SW93sSAoztOVSKUJHT5li5ggx/DY6Oe3Xg1Lba3og6vWH8vxzzrtB7NpwjFwDJLO14C9i+S7cdS0BQnpzXhL0KKGKkJpJniWkvgAvq2CFNTAWu9nKQtmq0S3q2oJhSjbWu/anVWCiLoj0MiULDtiZxRUSy+yjgWKmnnqn3hAao0wjWHrrBWleSAB1cq8sCtmfFNKYE+skAdgcEajDoeXwnjMvm8e9adWlgm0D/cWQmj2MVin6/jbX1b2TJ7VRt2lY2xpFUVHsnqcBD4wae1w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2QSid9jlsAL6GQyaPQv8DjpfHy0tX0XhLERo/akdnC/TVu5ZQaVbsT8Gzwl0Cari0obf3BavcgBq+MEDb4RDM/2bmD6vSmciYqa5CpvtSDTEwI2bALKbnJ8nQdbiXvvNIQR1jsQ1sK6Fd8NwqKeUDfu1h8BFxbKh4Vvpn6MFOKlQiIzr6osQdupH2iUV0pjE5DgpoRN04s1AksgK/95hsUsjUe1ZIa9k5y+RNWraIPYT023nWx3C73CPZsZh2XFteyaZtb5NHNM8PlXMXgvQQuLbBff+uv/CKdAd5GlG1ts3Oy0+ZPR+JfQkmZHkZ72YPO7DS3oI6iTM+2a7FR9nzlVnFhHOwtZCT70ghODvewbo5SI27Z++tGWz7tx9veTYOOA/lnCmS+URWvk3si99B97JhKNGXYh/r9UJ5o385r09yyF8uIs5vobbRJJXQabw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:35:36.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d7f8a2-7a14-4a21-4526-08de753becc2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5635
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17157

meta-arago / na / 20260226132925.537059-1-p-bhagat

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
WARN - [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp o=
verlay
    WARN: Commit message should not include directory path to recipe: conf:=
 am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay.
              conf (COMMIT-MESSAGE-3)
        patch
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
- Patch Series: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-=
max-opp overlay
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Thu, 26 Feb 2026 18:59:25 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 93601c6e8267beb911b6ba49448f8a98c=
1aca16d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: gstreamer: Fix CMA Exhaustion in latest gstreamer
- Commit SHA: 92479493d820fd6a617a4605ed2612649f0c4aa7

Patches
----------------------------------------
FAIL - [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp o=
verlay
    error: meta-ti-bsp/conf/machine/am62dxx-evm.conf: does not exist in ind=
ex
    Applying: conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay
    Patch failed at 0001 conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp=
 overlay




