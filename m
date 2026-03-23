Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0224FF4613B
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 15:08:17 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19792.1774278493440539506
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 08:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ku9f0trj;
 spf=pass (domain: list.ti.com, ip: 52.101.62.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii5opx2CgCj5UvRCKt/qzVkYstKR710ztAZDlfJjnwfKZxvYxQ9ke8UOWQr5h8y12kMnWchB36qd6XAu7lscHr3eJUJgqCHrJ3Rj98qtDVN8KjV5Re4l/WFTAVOL8yRhsDIZGqbt8IjbHBLKxtvVyafp8Sz4rpacmiHskIl/6GYqokLB1Eg2aGr2K3nfq5gbnTNb5+oYFxU/eIQCtrECfExObAcOq7wFHXR0VsPoP7l+TetHoxqPUp4iVN3rDCKm0y+mJh5Vcz8DVdpsZgADsJXcD5Be3vXrYgG8PbR/EfjggEUzV5lvFxmGgsBypOCEfXZGZmmahHP0PpA0QFRvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63l26X1VyVeSgLJcQCH0rg+hRre+YzW/Oj2vp+wjEd0=;
 b=LV0NFPx4dCbtgbYIj3B7JG9Y324ngka5wSFjbPYYKLcaEdn+BiHMH6cCITrRNO0qpLkCKkWJMxAu2r2AJ/MVU6OyfDhNHvj03cSTPNV1YbOirDcw70XNTuY8LLXCaP42roS14AbmoJ9Obn4D/jtS4FXx5Z15wVR+wm9GpY2lLX9LxTs1AQ/RBZQHQDnmYqHQP9oDGMV3KRxuNWLw7HyqDUTP6sReYmXuvZQZtbQsu6AovieRwyVjMgYldN39NiSwPM64Csvc3QT1vWljvvC9hrrPA5+vlpmqtnPjwiYQ86wJlCB4zWxDTpAqEAfXNwLP4eHTQL2xUtrR+ObBx8nEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63l26X1VyVeSgLJcQCH0rg+hRre+YzW/Oj2vp+wjEd0=;
 b=Ku9f0trjJ3CptnzqhhMAOoiv3aMNAqUcfoOVoYTF3Dcjoo3zhy6tfE1hdPetli1TAJcZ2qx0xFsYJxf9c05p/YNowN8MYkkesUCNyRX9kYvmsulf96QDkve6Hpr+Kfdg2/Urr8oPUy8MAV7PAIxMa7zfDcN5N5dDoqdRaMeRTJCO9ir+kGoLzi6SR02HT/5tbSNZnOjNQdcRJBpSLGqRNTCtbTEj0BrlMY817+xCNnUX0PXLsJFg7wmGN3SR3TkJP19D9f0MfvaeaMkH2EVAc3Y9Gp8wCBzuI9zUKR3Q/IodTtCoPKxsOdbnUeMkBsc5CSN9f7hvOdxfazADUd0nAw==
Received: from SJ0PR05CA0140.namprd05.prod.outlook.com (2603:10b6:a03:33d::25)
 by CY5PR10MB5964.namprd10.prod.outlook.com (2603:10b6:930:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 15:08:11 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::47) by SJ0PR05CA0140.outlook.office365.com
 (2603:10b6:a03:33d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 23 Mar 2026 15:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 15:08:10 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:08:10 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 10:08:09 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 10:08:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NF890T603333;
	Mon, 23 Mar 2026 10:08:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5E09D13F525; Mon, 23 Mar 2026 10:08:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH] systemd: Add systemd-networkd-wait-online service
Date: Mon, 23 Mar 2026 10:08:09 -0500
Message-ID: <20260323150809.3061344-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260323144022.2278502-1-j-sahu@ti.com>
References: <20260323144022.2278502-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|CY5PR10MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 58764a8c-b4a2-4b22-a701-08de88edff61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	V7XoOQnPf+JmYCaR7OSJRI+Wam+mWLEoiLBH7HiVZltCLoIDTmCwIpvqFDIKPevVA9khHJLUTADAyB9LKhBSu0SCz0c6dT/ic6ftGjHGaqzjMlB0woc1ffWYjI5XoHBbXghcPokUaCzKAPQjYscyXZGsJN17d3G1JgodRxht7kTAJ/qnsro/hbAw006ep39tXnV/Vnu4FVMFLTtKE0EzaUjClYDg+gHk93YxueXsawkH3/JcmGv6leZlAmXa8KwazLQWOQYqQcHukCPNPmqU9fVG2RYkkE6C2eJ3YLMeOHT+mRA1jPzheW7UjmeJlszsd1alnoFOlA4GVMWeKWBKY1qkmblVk/UYautEMbnfsa7XKdrwXgebpD8bqSYr6sfWVDqff1KOYiAugUNwzKHzuXeDdia44IPbNuCyO+g4KYkGfuRaubx6N2zNODi/qNYKlZYvs3lrR9aGy8khaylvU7exbObNwZH4J9rNHf2iRpmlG4eKqp1TLAtY7guDSXfuPwTx3k+E8LgxwqLiiWu7VNpX2FG+h2/snW2IVnuZ0NC+kH3kW5ugu9Rd//AgP0/sc+KyopoAASvYvktvKVWs+8+ubWUZb671YxfT88CyTbsHX7FTFU+8KudZ/kOER0HcD3rhjMOwQ8oiRd9YH3yZ3zWo7xELwwPyVjzRa18sQlNgkUhxRbA9nUml5+gm5j0smgXZ2DPxEXFnDNRg/B53cBHtBojJNPnqSQ3oqd7sRc/T8xYQ62tBBXfV2K0pZACgO7WsZBlAiaN8R5iZC2kQfg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6BHlkeDiB/a+IB4lYEcA/gRE28tHIFFHculqWspwygGSxG3Gl9BoM2wjwrkDk9hCT0f99GO+3I/p1hugmyCNLa0v+m3MDYeYf57QuhJrD0iBxq4m0DE0gu+MLGeskwbQ2DOCZ4N6whLNhoIS56sn4MA+uQJ147KGWKOH7JAvsIoiRO21O9YADptxfTEVJ/svB/s16PZFTcjRDw20QJCBx3Uj8dNWIExNNMjR0gt18vPEshQH9U/CjoEleJ94YrnHWHa/n231libhkfhA9T5HIkVSbLqAOkDTLdBLZCpFxBpTfIrM8W6cwzziYmUCxV0tWh/YWw74iYMH/pC/u9csRRqycVRKZcvR1PVnvmCaX8trX8BlymxoMkqobAJQWW5affnsqWh3636oH5nnB3YABpf+SYCdPf8K2ZUwGAhKGqcw0qiQltaruSSb5MG6jrul
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:08:10.5122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58764a8c-b4a2-4b22-a701-08de88edff61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5964
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 15:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17421

meta-arago / na / 20260323144022.2278502-1-j-sahu

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
- Patch Series: [meta-arago][master][PATCH] systemd: Add systemd-networkd-w=
ait-online service
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Mon, 23 Mar 2026 20:10:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8a07ea2298cfdfb0f95dc28febab31b82=
280c8d6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libsdl2: Remove unneeded setting
- Commit SHA: 9c7ac854c1119661806e4afdc5c2c0938315f00f

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




