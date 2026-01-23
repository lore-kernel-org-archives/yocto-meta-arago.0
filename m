Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBF0D6CFDC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:04:15 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61919.1769148241944560325
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 22:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=eCIUfGFP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.61, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjkPV+rHnVQV5T3KoKw7c7B9e9TAcGjXQlOs64w8+pGfea0IkbyHkUbdPZb55XYlY8lHI6Odn0AgZq73LldfpfGVtLeWmGOKaFj35v5IaGlOfnIqceNuaAYxTsvwKNYxGYoRYRrLiyODZh0Octhoivv55SktreIifgl7AYu9GQtO1j3r5Rvoi7EbyCpCivBt42CJBowUlQCKIoNDaNfyx33pftD2zdnSIguvkQKPvj/ta5C/Y9/o3NJGudg4/jNfYBiGAGYQfOY3eSm68aK8Kr4zmfAdtr/HYSuaDccs6IhwD+YvGFE4riuri99C64ASx4qBT1K/aOZEQFMUaHDJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wymEV5HxEKrHs/kG+GMQ51V/IXKUeVznOeNxBnuqM5I=;
 b=cA18ZWz1Vj2kniJJ2p6pnGP5C7AMU/XguMRK4B/ru7+4tmzsR+dcwKDAE0qnhjILTBP+4YSepueZyBJeN6k46eY0ud30WRHMdtKJCuOQ+SEtavNvrSj2lViFBiR9HKAsBAKCKmMtQjxvw4kPu0qGGUCCN44c+fwO2Vz0qD0md/5PQNY5wJWhNXmNYltmjjmGu3N0DBxmqPhxqXcZAlzeloapUsRrHmhHCJS16OAZXxuBUa5K1kbobAddEKkd0G2ZbYLzdiQR+kUvpvZgxYfYp/Ewg5jh9Z/fiohJFBpxhnyJ0pLruuCNn1ss/4has8x4BRXbYZ0K19ECyWzdxFd0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wymEV5HxEKrHs/kG+GMQ51V/IXKUeVznOeNxBnuqM5I=;
 b=eCIUfGFP2l413QseDJQpda18JGVwnVRy53wFDXS1InCVkOpI8tgeAJpznctMD2/LQ2R4NmJ0pXr4UVEkXopadr0y+F5ZnO8O9aOCKbvpSp6utUB2dm2S7LyZlmni4Bw8AaxJN+aO+BbEo71MgDO250moaeigbIMqNrYErlMGLfQ=
Received: from BYAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:a02:a8::35)
 by PH8PR10MB6314.namprd10.prod.outlook.com (2603:10b6:510:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Fri, 23 Jan
 2026 06:03:59 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a02:a8:cafe::ee) by BYAPR03CA0022.outlook.office365.com
 (2603:10b6:a02:a8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 06:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:03:57 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:03:56 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:03:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 00:03:56 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N63tiU1826983;
	Fri, 23 Jan 2026 00:03:56 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
Subject: [scarthgap][RFC PATCH 0/3] Add pipeWire audio stack for am62dxx
Date: Fri, 23 Jan 2026 11:33:45 +0530
Message-ID: <20260123060348.2493115-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|PH8PR10MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 2116e237-675a-48e3-3788-08de5a453214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wp8PwGXe4ThjNBktaFFdiuVxpl8jVaSnyHh+uYrgBz2maz1ILBzdVglVgqdP?=
 =?us-ascii?Q?pqtW8HYMZM2saCu/rUewjfF/6vfYsH7GOlgw58I2vt9+Mf5OZWVY15CtvLrn?=
 =?us-ascii?Q?KkR2pHUZDH3qecuUQHP2IAuw8I/GJ9juZ6yTWG9LVSZij1t/oR8Ra1fb+g+x?=
 =?us-ascii?Q?syitHGsCo3CFMAoIHiQxACyfstSARmFRN6Z1PyDpQK8JbmsYTdw18DgVyba8?=
 =?us-ascii?Q?AjAgB6DMjPMMIf7QyTub5zhVgZvPFEMYKvqYZyXf78/7MChemvFjPvCYOxE5?=
 =?us-ascii?Q?LwHMNUTUWodp/+En5OXuWLljbU1hpnKqC7YdJxUP7kb8SmoKi5tWeSEVCWHl?=
 =?us-ascii?Q?QPWaT7ZeY5S6NOOr9lrMi3LTA7m4xanHr6DiCNI111bAc3ifbY9RD4g+kBml?=
 =?us-ascii?Q?yWu0kkN7RJo4Acl3RnvHbUdKFUGrZlD4n6FJLmJd7F8pAW6cwHhT+Aixqngz?=
 =?us-ascii?Q?DD+5gcnCmcxElVkEfkfQxiC5RSf1VwR5J4sayjNYmL1jZwrFVUYYf2KXdDF/?=
 =?us-ascii?Q?nqOjbQydKE5LugIfeGX64FqFaHw4UKrJ2I6RyiunHFPqj3ylqjwXDEdfBtUT?=
 =?us-ascii?Q?zOK7DNcF7olFGbAXMPnM6ShfARnoPm6E6OYnKcepSlQEfFpMM4aeLC4iA1O+?=
 =?us-ascii?Q?gBvj1ZOrVKygMGJaFxQX+HQspNttBCiJwGisykLpOWLrh1EwUNcDCXbnwgBh?=
 =?us-ascii?Q?ovzKg9yd/b8cpIQJpcAtIV8ofqRhnJQMDGvcU+RbBMq5KGei2EC2q0fHb0bY?=
 =?us-ascii?Q?4PcpdLhY6eA09TFlxCFzj0t6ZoMKK9rCHgouQOegMPWvfH6t5VGZIlrAyEI5?=
 =?us-ascii?Q?IffAjn3HBWYjSbjf+ptI/aucrfRdb02mPZzC73LCf+pGnUrlczRG3gDF4QkA?=
 =?us-ascii?Q?ruyONOJkkKxINxdEsdw+bFHuceSNHH6N4P0ZW9HcnjBk1Xro0Zex9kRUO/3I?=
 =?us-ascii?Q?zP5Gf/bKQtAhtoQD7ZSGFkCQz0LPqrsL+oSwSDUbNZtXSFcstISYt6PEfvtR?=
 =?us-ascii?Q?DTtB4oqDMahF3lNezA6ihoaFMCqcrKHDvCeSRnFJO0Hq9Eh23TaroeDlRkZY?=
 =?us-ascii?Q?sPsXLjHjgqxN84Wp5wYiz1Jeh09lmLNbRwsc8yg9scFeDdnZGhme0vnrArJz?=
 =?us-ascii?Q?RazWbLKS8Xc+HxkalWXqZ2tIkgWQZRlS1FtklIG9gINEVwRnJ1H9zqq3crII?=
 =?us-ascii?Q?MZBZmApA8S9nMlFyA7xb9CqHjyuypt39RApooReLx4YUbLUU1UfBein9tt3I?=
 =?us-ascii?Q?yMoHh+g8pUgMBy0XdcuH4KGdghHOZMwHqHKiviHzEZKWTk62t0ltffrp7wOe?=
 =?us-ascii?Q?DCw9R1Aj03kIXxs6FEmfj4wLtJARsZ831S0qK4kFUn/tUc5dSm2VT3+kr4rM?=
 =?us-ascii?Q?lg8U2W5wBxMNd7Za/zJSi+Be+sHb4F/aLeV5KqUO34j88SJEpJUBpIhDExth?=
 =?us-ascii?Q?muADHFvMTeu67jWJ9WYQEObBRAKB6Pc+gPw8eEORNw5LViIZqukvkcboXjYP?=
 =?us-ascii?Q?IJY+Iztlo0e9t7CDWln3gGZ/+L2wbLK/dsmShgap1rUMUtnpCZK0IBwM7X8O?=
 =?us-ascii?Q?I5LPfkyRo3bdn8YkqJQ7ZfUPhI4NJuHQr79VZZs4HGuwqR4RT/phuqF1LQKl?=
 =?us-ascii?Q?Ig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:03:57.1366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2116e237-675a-48e3-3788-08de5a453214
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6314
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 06:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17021

This patch series introduces PipeWire audio support for AM62Dxx platform,
replacing PulseAudio with the modern PipeWire audio server architecture.

PipeWire is a modern audio/video server that provides low-latency, high-per=
formance
audio processing with better resource management and flexible routing capab=
ilities.
WirePlumber serves as the session manager, providing policy management and =
device
configuration for PipeWire, enabling automatic audio routing and device han=
dling.

More info can be found here:
- https://pipewire.org/
- https://docs.pipewire.org/

PipeWire offers several advantages over PulseAudio:
- Lower latency and better real-time performance.
- Unified handling of both audio and video streams.
- Better support for professional audio applications.
- Improved security model with per-client sandboxing.
- More efficient resource usage and power management.
- Native support for modern audio formats and sample rates.

The series includes:

Patch 1: Add PipeWire configuration files with capture and multichannel set=
up.

Patch 2: Add WirePlumber configuration with audio defaults service.

Patch 3: Enable PipeWire audio stack in tisdk-default-image for am62dxx.

This implementation provides a complete audio solution with ALSA and PulseA=
udio
compatibility layers, ensuring backward compatibility while leveraging Pipe=
Wire's
advanced capabilities.

Paresh Bhagat (3):
  recipes-multimedia: Add pipewire configuration files
  recipes-multimedia: Add wireplumber audio configuration
  tisdk-default-image: Add audio server support for am62dxx

 .../images/tisdk-default-image.bb             | 17 +++++++++++
 .../pipewire/pipewire/90-multichannel.conf    | 17 +++++++++++
 .../pipewire/pipewire/92-capture.conf         | 17 +++++++++++
 .../pipewire/pipewire_1.0.9.bbappend          | 14 +++++++++
 .../wireplumber/set-audio-defaults.service    | 14 +++++++++
 .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
 .../wireplumber/wireplumber_0.5.1.bbappend    | 25 ++++++++++++++++
 7 files changed, 134 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-multichannel.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
92-capture.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
1.0.9.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_0.5.1.bbappend

--=20
2.34.1


