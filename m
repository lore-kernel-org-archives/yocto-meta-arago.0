Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94862E6BF3F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 22:08:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4192.1769810925611373223
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 14:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=izP3PgEH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.4, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCy5mF8SnPJDumfXdn7B84HeQpGq8vJnhv9VgAW84VIhOzgXI/b3VG/95XpD9W0lSnOdYGUlobokSMrYZlINLPq7Tsk4cy0NHZp/ooVvkXgnWfWHGltPxTTiLmycpDXJw9SRxJAW8YH9EHnPEqSX/p7+1Dkm5Cbn8C1dsnL2tcNWp/BV4tBPzjO59gKoVBG5slbvOYYENu7XF2kPnYbQqW4Q5rXjBJCXvBp71pZbAO68/xDek9usShM5286m3AWj+a0sz7woTb/3wqZImRIrlf9jsTSeVerr1sj+SdQTQKd43wq+ZuwKJr6KPUU8zqeiZgRYivFwIJOsi1K5yIZ/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHgnhpTl7a74pOSFP7EHwkriDuFGZHrQDln4CorG1ws=;
 b=ZYrYIU0nbnidDUuzDtxXWDei+Pn2fN6WmOqUND9RjnFz+s818KT03J8oSseK+HY5wAA+4udsgS9rZUqAi53FsuhnOTNpWfFOI6Q8XxapithGmBFEPYCaPnh4ECAzglPyetQY7nQdP/tjkZuX3dwFVwF2s6ARqf6MOD4tp4eY7gNJwK9qHtggVvHv+GqQxhEzqFdmT4QZ+dU7RrpMmT1qMSdpZ0MTzY/8nojG4P/VQlnWxMJ996An4IrNS0oVndySPvS4/aUxpMtErR1KLZlnEJWZh8VevTiCgxS4Tcb4GFEK5h0bSJCDBWPUvXLKS6pbqS1w3t7RvRuATiJL0xYJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHgnhpTl7a74pOSFP7EHwkriDuFGZHrQDln4CorG1ws=;
 b=izP3PgEH0lDY9gPovPyirVYZbYoush8Nn9kUcTRw9Fnd+2sOPJzOSDXQrtHWsieVvEAKVT90mxVwizVL0Ry4Y4/J8HVp+1E3MEOvy8LdxOkut950E7nPclYnSid076bwHCAHjXFh2hVBNNuAqtXOyqGawKNZsCxOdtPAz3nb9sY=
Received: from CH0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:b0::12)
 by SJ0PR10MB4687.namprd10.prod.outlook.com (2603:10b6:a03:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 30 Jan
 2026 22:08:41 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::3b) by CH0PR03CA0007.outlook.office365.com
 (2603:10b6:610:b0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 22:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 22:08:40 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:33 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 16:08:32 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UM8WGV2385490;
	Fri, 30 Jan 2026 16:08:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 0/2] Arago image names
Date: Fri, 30 Jan 2026 16:08:28 -0600
Message-ID: <20260130220830.2173125-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SJ0PR10MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 14774c1e-5402-4250-ad00-08de604c1fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v7+8jH142/NYqQfzEHirG4FAMGhQmfZLN5I0jrtPC9gb4GeLawlJ7rxQ/5/s?=
 =?us-ascii?Q?S93m2rpARomyLNINQsdAt7A1qBIxy64UfEk4OD1CLp7fxF0iG31Sssb3c5PN?=
 =?us-ascii?Q?P7f4mU1EK/hLLbL5WzpXN/v60nInKWYTtLTIBhjW1ZFOUDz5On/TbZuW4NAE?=
 =?us-ascii?Q?+3pmMdJ840jYL0CsinAi4YFhcY5RtNdgYbbpzVg+leqE/GrTwxeJ5Ockz1e3?=
 =?us-ascii?Q?rjB+OhbGtGZ7K8fDCr0cTyefe9Fr+KFc8Ey2+F/18p+oxhilD2mOHClbV3l/?=
 =?us-ascii?Q?h0O3COaT+q0/KN3+jGVX2qMfv760HxxBuz3NMfh/2SNal7eeJFba6jgEflZT?=
 =?us-ascii?Q?YqtaD56yxp1txQ8OKjrThOr25Tk/MqqtD69+gEkewcSdWbO6cW+NC4k88BrT?=
 =?us-ascii?Q?f5kNyJKD/dEgRzzAo9F4ClSWy8CUc5D4alj9njSQlocNZD/8U4v7eSBVy5tT?=
 =?us-ascii?Q?x+zFrrgXBXYo5wbf0h3Nu6LLQpUwZ+Bo9Ejrx4aPDVowVuD/LAsFcQ3wzrN/?=
 =?us-ascii?Q?LMzk6XMhV+rd+8TSze27JsmLcc3BXmnevKasYoyfkvTX7b/gLIHQnEGDv5fB?=
 =?us-ascii?Q?KKroh1A0we22rFsB9qTc23lq3Gb0Dtv4Wwf+E9LMOQzzEqutsVo3Gx+Dv+cF?=
 =?us-ascii?Q?cYEqL3uaznVGXaquC+Y+xeyqSAo+gzUiAF4q4QgqT1xcV0PNv5XNf4qPNSFc?=
 =?us-ascii?Q?V69EEh8k6aQdK2wNL6EMJqN7MbxUbGtehWwZXplGODCDiwd5nga3iEcOlJYI?=
 =?us-ascii?Q?KmKQnuEobd3E3Lq053WlK6g/bcTUmsLk/4f4JNn8xTGud6hvemG0u0OCr+XO?=
 =?us-ascii?Q?BWLHmldIr94uT7Vi1ZxA2bs1z07pcaC+WPNqnZqGgKotJONmCF8I2BtcpG/L?=
 =?us-ascii?Q?OwjfDgNeh82ZSj50WhKRsGDeAaQtQSHmp+3FA/FKpVANgSGQ7tTgzAagdGcn?=
 =?us-ascii?Q?rdG839jf6O+7d78iENVq2TZOahfekR90TsvFpAgUN91PnwUVeEruHPgDFv57?=
 =?us-ascii?Q?PByrPkLEbWhVB+UOKyP1dreSCwH5r9IXHDG5/y68mPXdsnGMxw7DwD/ZzDK5?=
 =?us-ascii?Q?Sz4csEYNaUQdsWLzl+okRDqO+5Ep2i5ierCDJq3/V+lTXGeDBl4dmMwDybWp?=
 =?us-ascii?Q?oO00rfcJuoe/beElNrVc8I8sgLWXoQRbYMSReCNjeFv5JpTx9cpk+A2RYIvz?=
 =?us-ascii?Q?F1q6zim4hPNfHCitFew/IeQQ//kU6FJ6zqJtCaTs6XEztmtWXYHXcsXuyf+3?=
 =?us-ascii?Q?8PPfBS5XYBxR39JA5J5v/JbORxFBeZTha8rjIUd96h+m0HLjQ01U8uz0hyIy?=
 =?us-ascii?Q?6VdIM/87vv5D0woAnFPE7MCZ+0EuBX0TLiFmlDQAUy7bVN9BEoW+NvbogUa2?=
 =?us-ascii?Q?t5VJDLwkMHpkTdohGWzVuTqYNp5n957IN5Dog8sEIxk4O0VHv4P2GmQuTTxJ?=
 =?us-ascii?Q?9UbNshbmflmpXF6Kf+X2bZ7DCljATYjfU4+Pi4lkSifSENQEAccyiFB5fYDi?=
 =?us-ascii?Q?OrvOdrcdzYaUAIkTs8/6oGTCb1oe741f2cFZu+z+m/6sk/RyH8VAwI6plQH6?=
 =?us-ascii?Q?DTLdR5/KRQN1l/EBRNSsXxyIYiU5KKqISrZp9kNXTXNPccjGINHiNemxVUaA?=
 =?us-ascii?Q?CNryycVfTMj72YBuQk1TI+seti3wI3xSw/RzTSzKy7V/43J+sg9cgkPlXZK3?=
 =?us-ascii?Q?L5bQqA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WoVmW/BPRirhOhs6fhqItCu+Inh4QPArzY6rEWTaBrHrW7UQGRnVuuugzukyiyIHo1d1WHrdxUZbfWbgNr0YtwaVQwhib46FfDOKBM07KV0idXPBRE12Qj5GFW/ROrjk63akU5ORUE64gr42xxbOaFi5LFqCsWcPouVN/Zg9++aayj0nzGdEuxoCnn2dHaTEo4KHBD75FRtesC/WALBfe1JZnF7Rvr0ZQJSyu14ZAmHECA8Fkiedi6TtKRLis5Miu3lPVhqLJ8hmhbgqvrzdhRMhJmXtp6Tr51mSJ/ipAB6gewPlDa0zMmB3SGQnoE3aahhDjq5rZCW8Ma9FH3zJ/pI+kQPvVkLSb8v90TFAyTkHXCuOH7aO32PBRcMs3QEgH5/v8T7je9MhcUMsV64oGnE80G0UMII4a5aXimOFlse+c61JWtlbnw45tR18Oy0u
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:08:40.1006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14774c1e-5402-4250-ad00-08de604c1fe2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4687
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 22:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17059

Hello all,

The meta-tisdk layer produces images with the prefix "tisdk-", it does
this by appending to the images defined in meta-arago. This means adding
the layer meta-tisdk changes the content of the images. Meta-tisdk has to
do this as the image names its "tisdk-" prefix is already being used by
meta-arago.

What we do here is change the images and package groups defined by
meta-arago to have the prefix "arago-". This way meta-tisdk can have
images with its "tisdk-" prefix without having to modify existing images.
Instead it can extend the images and give them a new name to avoid
any confusion about the content and source of each image name.

Thanks,
Andrew

Changes for v2:
 - Renamed packagegroup-arago-base-server-extra

Andrew Davis (2):
  meta-arago-distro: Remove TI SDK branding from Arago images
  meta-arago-distro: Remove tisdk name from Arago packagegroups

 check_yocto_rules.json                        |  4 ++--
 meta-arago-distro/README                      |  2 +-
 .../classes/tisdk-bundle.bbclass              |  2 +-
 meta-arago-distro/conf/distro/arago.conf      |  2 +-
 .../conf/distro/include/branding-bleeding.inc |  4 ++--
 ....bbappend =3D> arago-default-image.bbappend} |  0
 ....bbappend =3D> arago-default-image.bbappend} |  0
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  |  2 +-
 ...isdk-base-image.bb =3D> arago-base-image.bb} |  2 +-
 ...image.bb =3D> arago-bootstrap-base-image.bb} |  2 +-
 ...trap-image.bb =3D> arago-bootstrap-image.bb} |  2 +-
 ...dk-core-bundle.bb =3D> arago-core-bundle.bb} |  6 +++---
 ...-core-bundle.inc =3D> arago-core-bundle.inc} |  4 ++--
 ...efault-image.bb =3D> arago-default-image.bb} | 20 +++++++++----------
 .../images/arago-jailhouse-image.bb           | 12 +++++++++++
 ...se-inmate.bb =3D> arago-jailhouse-inmate.bb} |  6 +++---
 ...inux-image.bb =3D> arago-thinlinux-image.bb} |  8 ++++----
 ...isdk-tiny-image.bb =3D> arago-tiny-image.bb} |  4 ++--
 ...y-initramfs.bb =3D> arago-tiny-initramfs.bb} |  2 +-
 .../images/tisdk-jailhouse-image.bb           | 12 -----------
 ...> packagegroup-arago-addons-sdk-target.bb} |  0
 ...addons.bb =3D> packagegroup-arago-addons.bb} |  0
 ...> packagegroup-arago-base-server-extra.bb} |  0
 ...agegroup-arago-connectivity-sdk-target.bb} |  0
 ....bb =3D> packagegroup-arago-connectivity.bb} |  0
 ...> packagegroup-arago-crypto-sdk-target.bb} |  0
 ...crypto.bb =3D> packagegroup-arago-crypto.bb} |  0
 ...packagegroup-arago-graphics-sdk-target.bb} |  0
 ...hics.bb =3D> packagegroup-arago-graphics.bb} |  0
 ...b =3D> packagegroup-arago-gtk-sdk-target.bb} |  0
 ...tisdk-gtk.bb =3D> packagegroup-arago-gtk.bb} |  0
 ...ckagegroup-arago-multimedia-sdk-target.bb} |  0
 ...ia.bb =3D> packagegroup-arago-multimedia.bb} |  0
 ...srepo.bb =3D> packagegroup-arago-sysrepo.bb} |  0
 ...ckagegroup-arago-toolchain-tisdk-target.bb | 12 +++++------
 .../recipes-core/packagegroups/ti-world.bb    | 16 +++++++--------
 meta-arago-extras/README                      |  2 +-
 .../recipes-core/packagegroups/ti-test.bb     |  2 +-
 38 files changed, 64 insertions(+), 64 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-cor=
e/images/{tisdk-default-image.bbappend =3D> arago-default-image.bbappend} (=
100%)
 rename meta-arago-distro/dynamic-layers/selinux/recipes-core/images/{tisdk=
-default-image.bbappend =3D> arago-default-image.bbappend} (100%)
 rename meta-arago-distro/recipes-core/images/{tisdk-base-image.bb =3D> ara=
go-base-image.bb} (89%)
 rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-base-image.b=
b =3D> arago-bootstrap-base-image.bb} (91%)
 rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-image.bb =3D=
> arago-bootstrap-image.bb} (90%)
 rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.bb =3D> ar=
ago-core-bundle.bb} (81%)
 rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.inc =3D> a=
rago-core-bundle.inc} (83%)
 rename meta-arago-distro/recipes-core/images/{tisdk-default-image.bb =3D> =
arago-default-image.bb} (71%)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-jailhouse-i=
mage.bb
 rename meta-arago-distro/recipes-core/images/{tisdk-jailhouse-inmate.bb =
=3D> arago-jailhouse-inmate.bb} (53%)
 rename meta-arago-distro/recipes-core/images/{tisdk-thinlinux-image.bb =3D=
> arago-thinlinux-image.bb} (80%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb =3D> ara=
go-tiny-image.bb} (81%)
 rename meta-arago-distro/recipes-core/images/{tisdk-tiny-initramfs.bb =3D>=
 arago-tiny-initramfs.bb} (93%)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-i=
mage.bb
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons-sdk-target.bb =3D> packagegroup-arago-addons-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons.bb =3D> packagegroup-arago-addons.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ba=
se-tisdk-server-extra.bb =3D> packagegroup-arago-base-server-extra.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity-sdk-target.bb =3D> packagegroup-arago-connectivity-sdk-tar=
get.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity.bb =3D> packagegroup-arago-connectivity.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto-sdk-target.bb =3D> packagegroup-arago-crypto-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto.bb =3D> packagegroup-arago-crypto.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics-sdk-target.bb =3D> packagegroup-arago-graphics-sdk-target.bb} =
(100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics.bb =3D> packagegroup-arago-graphics.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk-sdk-target.bb =3D> packagegroup-arago-gtk-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk.bb =3D> packagegroup-arago-gtk.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb =3D> packagegroup-arago-multimedia-sdk-target.=
bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia.bb =3D> packagegroup-arago-multimedia.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} (100%)

--=20
2.39.2


