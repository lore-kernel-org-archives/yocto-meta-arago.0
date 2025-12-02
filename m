Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2AED116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:16:30 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5395.1764674184411543129
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 03:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pvX2Pj2F;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.18, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZt13j6419/MO6aCprq9CNLAYUWxm1crxfwdiGOtCABCO2FsDe3oH7ug9y/RVGuF0HTACbSTjNZOPts3gmV8rOl16C9fmGDwLacKEhjpJbyFQoevGcho3LKPhuP+jRjG4fzVVLKGtFP8p+slveb15XqPqMdKDpy8LUsot3UhV9cv0cY3ObeYJxW9Dcis5+vBrScxuQKKozpgTeDM7c55cfllKKHcY2qnp3eooPf4UIqul+QAkRF6BmrdnQgksmyP0CB/JLZD/essYL69BDUG8EBNGzccJSZ+iwYnkK0M7Pl6rEM/E1VgD96QfPXI82uJbphR+b8zUB4g89nNmvGdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In/u9ENY5aqFSC73t+NmSMLD39QK1i8PuF4NLSoGlL0=;
 b=B4yYI7FdQMD5S5IKGAi0w4cuRhpou5vKID2rPeFRCo4jiPV8j4DBc6ck+vDoMTHG+6iCtcimOcGiLkWrO7qvM4wjVcuukc9e0u9kHq74ADy8xZ5zUQ0klzFZl5ew4xoWydYTCYlaRzs5VK0x/QkEMAexLH0uXBlatkh1EsxsETVkjwc+ULvqYVWrU3UneAmEi/PE7zuTVoNRQ3WA+O9ArTLDYMjpbP3IY8Gzn7xRuXev8P73tYAiGd02i7H4iWsWEbFzn9muSgKvNEjEJ3VVXkehB0P9xcjFzJ91YnfE954CfhEnhXP6NWiZngKxtPgZZukfdBJ9zLN718npaWQfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In/u9ENY5aqFSC73t+NmSMLD39QK1i8PuF4NLSoGlL0=;
 b=pvX2Pj2FiM6EHAsrJJwv55iYOEY07VrkKlbJ1T8Sub6GSAkX0/w1QHMAwR1+fAoPvZeSbtsK/LP6z8zzYzgVOSkEyTVVS6+ZRB1WwFQ/2f5uPwKptDEZyeCk6YrmQUmti/3UvsxUjTfHiayxNBy+Mevrj7pGxqDz4V65/ugEvfI=
Received: from BYAPR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:e0::45)
 by SJ2PR10MB7760.namprd10.prod.outlook.com (2603:10b6:a03:574::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:16:21 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::b6) by BYAPR05CA0104.outlook.office365.com
 (2603:10b6:a03:e0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 11:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:16:20 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:09 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 05:16:09 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2BG8fL2143094;
	Tue, 2 Dec 2025 05:16:08 -0600
From: Anshul Dalal <anshuld@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>, <denys@konsulko.com>,
	<reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH RFC 0/4] Add support for SWUpdate
Date: Tue, 2 Dec 2025 16:45:57 +0530
Message-ID: <20251202111603.1616989-1-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SJ2PR10MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c041a16-ab9f-4c9b-bd9c-08de31943884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?biA+12/r/YUYW4a4lAVOmTUum4vCwqGzVlDZB5YfYzwUfuE5Yws1uO86PVc1?=
 =?us-ascii?Q?DiHLEtRjrsrOYo/WbWbu7r00tcnj75Gdngi7E+BHszacp+Z1KqGr1dJnN3ID?=
 =?us-ascii?Q?0aYp5bMwzaUGTr48skF7TsBHZKAMCoKwTXRzy5G3LTCwJuntTVqg2LIflhRW?=
 =?us-ascii?Q?bXHAS0IhubOhV8XZuTdO1uEXpz8/w7geUb1p4lUU8RF0rHwFSai2WuXPRt1z?=
 =?us-ascii?Q?OmIMPvAEjCAMePf3pE+2NEKK3NcwanW1+oJTBM/Xb50sLgXVcWEZk//MtFnN?=
 =?us-ascii?Q?RubgEr/bToJZcr1WASz9+Te5RgvNTnYilkQ7EyjgezqTZSR3TJpcPv+QbquV?=
 =?us-ascii?Q?qFdwcrHvRh2aFolfSYa/fIo1KX+oqtlHKJlnP7axFDcPvHqBRRJAEvTTt5z6?=
 =?us-ascii?Q?nopwVRWzsNgcUHwWowEr0CSK0yqxEDy1XyAqExbTy/s7yjYK8WMZdG1fEypO?=
 =?us-ascii?Q?GunxRbRHYnHKYxB0fKMuoVqJl2Uiuu3p+MsrqYuYxJssjy+8mgkoDJ6hrXly?=
 =?us-ascii?Q?qFIStTfLgucxXDRJSgNjW3W569sAMJnij0qFtLmPNaMOLOdtC36TB9tSq9zW?=
 =?us-ascii?Q?Q6XC5VNd2tUgGJxKs8WOQTLYhdyt3MQm4Ey+vohG83Hv+SJlMcD1fN/NiDsz?=
 =?us-ascii?Q?dFY6/E36BHIh1SB06s36nkxNA93s/hFIXU+BgeljkNFE37oyubFGXnHgQjC9?=
 =?us-ascii?Q?CjnO3w/czaOU6QrYgwgv/58grDH8t+P6U8wx9O2i0N/gO+hT4MDoc79EY6El?=
 =?us-ascii?Q?v6I3sanNDb3VmgI0/A/5jAXVkWFs4HdDoUsu906MckvmzBP42ikVemd95dLa?=
 =?us-ascii?Q?5ltBtA23uTtbE/KwtUp3Fb/GJOhA0noMnS1aIrS5AHo2ZJU51Bg7pbkST+Rj?=
 =?us-ascii?Q?MkltUGK+9TJnjgVUKlUG2kjS/SPGL6orE8eMX5JMd5Sdq83el1dJoeNy1Vc/?=
 =?us-ascii?Q?JBOxWTkySgyDyNlGcaCd0KyhQAEC0gw9r5iiQ2CczYPwngcY3p7DybDsEG+/?=
 =?us-ascii?Q?lA83BqyPEFj9HV36MgsLa36QikVOZzOkcvSbOyzw4LaTDl3PgKufbZO7PAEw?=
 =?us-ascii?Q?XbkF66t8ITL7JVAJsadcQBY5/g8x0gIqVy6temat7TOX8wPL7MejFggVZdRV?=
 =?us-ascii?Q?3BOZ1of6dDEvQX0ANudIElDsnYbTusmse6PhT3NRBz7n+BqERg/TYC2R7vjW?=
 =?us-ascii?Q?IPUx4ISOvxY+rA2SWFcULf0KaXwj7Xbn7EeF1ikDJWeK/fyKNhMB4EfwrY9f?=
 =?us-ascii?Q?K+G4Njrhg6zr3p7KmTCm+KvjBPy9w0y72+aFjta11uIMvUdLy4UOJzzlWLhK?=
 =?us-ascii?Q?zX9QIP/17w+Xj6DFnkYPkGOM1SBAY8A+WWoB6NU/FbHLwEp5sKdydnY+vrxG?=
 =?us-ascii?Q?GLLWP4bPvf+m5DbNVKJca8eG1DuKSBq+51SF13Wp1TIHPF/xnDzlfAMiT6Gy?=
 =?us-ascii?Q?OkytxemyY33CAJTR5tmdFSTlmLmTNrXOx0jLuZXkwJ+OJHecTpGbGL7nhKCT?=
 =?us-ascii?Q?LyyR4WkOdzoGmfI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:20.5074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c041a16-ab9f-4c9b-bd9c-08de31943884
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7760
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 11:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16849

Hi all,

This RFC adds support for SWUpdate[1] to meta-arago, this provides us with =
OTA
updates with A/B redundancy for the rootfs.

For now the support is enabled for eMMC boot only based on the 'ti-swupdate=
'
override. The below steps can be used to test this RFC on an AM62x EVM:

 1. Add 'meta-swupdate' layer[2] to the SDK sources directory.

 2. Since the bootloader side changes have not been merged to ti-u-boot yet=
,
    make use of the 'swupdate' branch from my own U-Boot fork[3].

 3. Enable 'swupdate' support by setting the 'ti-swupdate' override in
    local.conf as follows:

      DISTROOVERRIDES:append =3D ":ti-swupdate"

 4. Flash the U-Boot binaries to the correct offsets on boot0 partition as
    per the docs[4] and run 'env save' on first boot to save the environmen=
t to
    eMMC's hw partition.

Regards,
Anshul

[1]: https://swupdate.org/
[2]: https://github.com/sbabic/meta-swupdate
[3]: https://github.com/ArchUsr64/u-boot/tree/swupdate
[4]: https://software-dl.ti.com/processor-sdk-linux-rt/esd/AM62X/latest/exp=
orts/docs/linux/How_to_Guides/Target/How_to_emmc_boot.html#how-to-emmc-boot

Anshul Dalal (4):
  swupdate: add systemd service to rootfs
  swupdate: add creation of update image
  swupdate: add bootloader support
  swupdate: enable authentication for update image

 meta-arago-distro/conf/distro/arago.conf      |  3 ++
 .../images/files/sw-description               | 46 +++++++++++++++++++
 .../recipes-swupdate/images/update-image.bb   | 27 +++++++++++
 .../libubootenv/files/fw_env.config           |  5 ++
 .../libubootenv/libubootenv_%.bbappend        | 10 ++++
 .../recipes-swupdate/swupdate/files/defconfig | 12 +++++
 .../swupdate/files/swupdate.cfg               | 13 ++++++
 .../swupdate/files/swupdate.sh                | 15 ++++++
 .../swupdate/swupdate_%.bbappend              | 35 ++++++++++++++
 .../wic/sdimage-2part-swupdate.wks            |  6 +++
 10 files changed, 172 insertions(+)
 create mode 100644 meta-arago-distro/recipes-swupdate/images/files/sw-desc=
ription
 create mode 100644 meta-arago-distro/recipes-swupdate/images/update-image.=
bb
 create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw=
_env.config
 create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libuboot=
env_%.bbappend
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/defco=
nfig
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupd=
ate.cfg
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupd=
ate.sh
 create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.=
bbappend
 create mode 100644 meta-arago-distro/wic/sdimage-2part-swupdate.wks

--=20
2.52.0


