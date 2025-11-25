Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E96D0E6FF
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 15:38:38 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.210.1764085116474234912
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 07:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ndDfOfqV;
 spf=pass (domain: list.ti.com, ip: 40.107.208.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK8fAhEKMQT4DDkRyAXTT3m8vwvkz50TxXAv2FKOfKALEapuwSlqOLcB/j6RVH6MO6E8pO2M70E16MlZF4dF88EDOn2PgctUWYZ5b8v9Pasbdv5+8yhZ1LPWl/geCc7zquJTSrwSSEO6/qDkg4DnrYw8fqaRhWR3l+xqYpjcN2sBhpo9asFFHFbmWwGCMXYr+FXRYDaSFeIEYUreIIJU8QR9WTvTdBkXPK/gQyqttVOeXrvnDfaa1qpa8igHMK8Ez6xKQxekaLUDiRnq8hStEHJHpPlwARsjrVTLAM5YYbpQc63IpnUXxR1VC3i1krRd8yiO8IVZJ+Ig8ptbyCqDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbFihWeMtX7F4+gwp7QDEzKBOpWERhByMV3vj/VsXNc=;
 b=YAWI6ig1WnacnNBN4QuijfwjNq9Vrp2AQvCx/cH2ljWRWuL7BN70qV9uY1AlYR5UWg0ltO9fsxnpyy9wOJ1I6+Fwo8ftP7gORxSmmGC8JotAKBTu2/GgQL7uOddG2QRfaBuNaBC2XsOBhgLc3HWZKZUSctSe0j+740G4GV7oWyH9RcmGo2NdXCsPOCaJmJxjHKG5w7csBlp2gxbD+gfT96OGI/NX4oYKY5kiGRi8K4UR19BrUOjXJMoQt6mRW2rrO31mG0RMe7yH3FBh4HUW8uK3qZBKunrmY0f1yQy/pJZa3XL+wlipfKlOwGf9vggJlVOmbNCTEzmfQ3s9qAlLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbFihWeMtX7F4+gwp7QDEzKBOpWERhByMV3vj/VsXNc=;
 b=ndDfOfqVyT/WaCqWp2rLI5hXRG9gGNDQ7TpBA0bMfvsJfvWx7oW/2/t7DKzgCDu/k21N958S8PTxUOAhlIWkOy6JTWO+SfXmTUVTwzBd3bAmaA8L0gY5FqtlbyDfXc425RK241A+niIxYiIF5LRNM/3fuTyOkpNL3G69j2+5xNvT/Mrkif9sdnDxXaur5MgxCp3keaGG3t0Njl//jdhQIcYnYR+wi/QC7H3mJQRPezt04Vs3pbeb+lvHjpagA0sIOcmVL+KH/HBm0g3PILui287tRwcZRITsU7NI6/6YxaocYvqkbIw82J3+Nb38JZ9iy/VNAFC9AHoGCGbZU0Zp8w==
Received: from CH0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:b0::11)
 by CH3PR10MB7648.namprd10.prod.outlook.com (2603:10b6:610:179::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:38:31 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::4d) by CH0PR03CA0006.outlook.office365.com
 (2603:10b6:610:b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 15:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 15:38:29 +0000
Received: from DLEE107.ent.ti.com (157.170.170.37) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Tue, 25 Nov
 2025 09:38:23 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 25
 Nov 2025 09:38:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 09:38:23 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5APFcNDO3920089;
	Tue, 25 Nov 2025 09:38:23 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5F4C0D6F28; Tue, 25 Nov 2025 09:38:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH v2] arago.conf: set preferred runtime provider for weston-init
Date: Tue, 25 Nov 2025 09:38:23 -0600
Message-ID: <20251125153823.3708356-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251125151825.20660-1-denis@denix.org>
References: <20251125151825.20660-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|CH3PR10MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 63164f94-8ba3-42c6-667f-08de2c38aedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?obkyiPCoL+G33msb2SMeXuNKJHE9X80mPjivM3DOiPZhWQLPAakmtMjBmyuA?=
 =?us-ascii?Q?UeBUyrL0wBtB+BHTY35f5or8JAaVEeTI285Fb+AsVh58JxkGO/BLsXF9ZHCL?=
 =?us-ascii?Q?ngHyaunVA/hgujqH4zc9sGQ/Bd9gJ0HHcVQ5Fu5MgBqPdgsEQlL9jSLogSaa?=
 =?us-ascii?Q?Fvq9zPzzzG6Erlu/ArTwQ60ZQmJyIWCh0v9PmP2CQlVprFj64NkZqT6zk2m0?=
 =?us-ascii?Q?i2+8eFBphD/IrPhgodChYFO6seLEeQbG7laHsG3xHBHyvg/5f0RRZNHMWSTi?=
 =?us-ascii?Q?Tm7vWDtZNX7KuVS4fmMN1pY83unpjD9VFNcQL3GBp31QmbgqVthTMzhHPma7?=
 =?us-ascii?Q?If5jOmsLkGa9HHjf+vMIBVsZDa5x8dC4bQkFsRmkrVLH5lZmn7RXaaEbtEsn?=
 =?us-ascii?Q?7CybZW52oEydagoBCXeNWQuQE3KSHpH15+sVUTI5DqrjYB0UlGlZ+WKM4uwG?=
 =?us-ascii?Q?pNTdsl/qpwFz7ns+zTgeSYwQohIlreZhbFnVed7js3YNBWV4MEngU3nVY/8z?=
 =?us-ascii?Q?utzlW5N+l+0beVMUSQTam22Hz2NHn0Rydrebguu9pVv4jUoVoAVwkLqH6ufM?=
 =?us-ascii?Q?6Jk421GR5qrfZPpJ6x34N2Un3QFyQViDKxEk1oDEX84zcGs9y6NDwHBlPEnV?=
 =?us-ascii?Q?1loIm0xt+VHFhjG+MXQ+QJ46hTBMlkpKOTKRRZkj76yT62kYgtKdIlPAgkJR?=
 =?us-ascii?Q?iDzUdc/ghsZBGlKwVn3qjU5ZtFigZFgLBnN1Lu+YiLxK18SOWyLDYrE/pdlh?=
 =?us-ascii?Q?FF0pfpeF7Dlt+1rvJ6m3WhP3zmeCHWbBoSqn6oqnczL6doGvWZHYOIA941LI?=
 =?us-ascii?Q?w61+YjM9Mx6u0P5qgBaZFY3qrECkmGvFoZ5w+VrKNc/fOH7QyBJXC5IkCgOg?=
 =?us-ascii?Q?8TJ91qHXb31fPtnmDFBYehsRuN5rRTe65sUOrvoHp8MnKt6kMwHAhN9ggUbG?=
 =?us-ascii?Q?8ASJLvxDjohL5YyI+Wcr2boGwFBUABjkmMogRq4UgLRUkuv+kLcK63msrwxW?=
 =?us-ascii?Q?fCHTKW8ade7mb/MoaksofB/E4KoztWSHeVp8WGpux/jDMLDWVv+JDpnlcvwK?=
 =?us-ascii?Q?BThU+VEU3wXcx+1n6blTBmgVzVaF4h0G+o9QH4nNK4w0MwUq7U83fyM4BN0t?=
 =?us-ascii?Q?sHAv4Rx9tS5XLLOAv5QrafaAnjiyIW8kGEJuAeRU4UZldbKc7otPFAVy8DNg?=
 =?us-ascii?Q?WvEoqhztKL0eNO4CB/sZMshFS1rqE4sRTPA2iCAbyrmTs7eWGK+u1MFW/I3d?=
 =?us-ascii?Q?KRTxpfC7P+bdp5as4qwXWXC7qrtfP0LaIRBsmwCndDRaBeybTbxPMvee8XH9?=
 =?us-ascii?Q?0zaj89w8ImXKkHjzBClAKiRDvgAeEH9D7IgSL8rzE7OlX9cABb91vHpNFd1s?=
 =?us-ascii?Q?sVmJQTGfRE3zkYexumar07oqR0P9dyz2dyzrt/5Oo85e9nEKkk8KX3+QMWhr?=
 =?us-ascii?Q?jqXmgNV+6s+jJsVLO+hIHZwZjqmHhgaULaxbYS60kV6x0u9I4SnKOmkAS8Od?=
 =?us-ascii?Q?H+gV7ox/1XuRg6j5oggCYXeo+XghsabzUvhR/L62khzjgy8vEuJiUQyg3BvT?=
 =?us-ascii?Q?7atyLR8bAHqb/dZUPaE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:38:29.6271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63164f94-8ba3-42c6-667f-08de2c38aedf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7648
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Nov 2025 15:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16837

meta-arago / na / 20251125151825.20660-1-denis

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
WARN - [scarthgap][PATCH v2] arago.conf: set preferred runtime provider for=
 weston-init
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [scarthgap][PATCH v2] arago.conf: set preferred runtime pro=
vider for weston-init
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Tue, 25 Nov 2025 10:18:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 527d17477f48f9629ea6b5e51c5b28430=
76f503a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: sadik <s-sadik@ti.com>
- Commit Subject: coremark: add Coremark CPU benchmark
- Commit SHA: 28c94265012ec97c21a7e78c6ae34e1fd1ef0401

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




