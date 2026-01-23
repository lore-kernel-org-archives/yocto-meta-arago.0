Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC10D6CFC2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:28:05 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60872.1769142472412903392
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hJ8MPj//;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.33, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lo5FreL7vaGKAz7QhxgWlqv9s7q/NGQq8EQUb+syW2drnTGiQVtINgUfm192NnH4fh4tWHRxH2hE5n5UMW6LURWOim7lMlYbzluXWmhO5FSl247CcwWZ7RooB+ciNy4UMDcVrZVB9y2mDD6dSis+vBGbGZdJmrNe1PW2w8NUa5ilgOYIW2dntTdDd2/Y9f124RhuI29Luq8nUmCS1D2FC1422kzEGxzB8W7S+LAUEh1z9JUWRmcT+wdDIhjvTHEUH3vnyqusik7RSWMj+/3tdoOpcOlTBWDmA5ljaqlhsqvjvyMmgPpW6zH9/TIfFjxc97g1iMfQIvrApTe2StS18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2pyPWJP/weieQ95Tw712YUMl9eEypkQvr/+JxfokQ4=;
 b=BD+vgus+dTYYz15yCwxwxpJUjDMQY9ubO5WU8aHZe/8MqhCrN+3q8lg4lZRwKmLKiijbZBVl0eFuTYKJIkhTlwwzYyvvJ/+YpCZM10iE17nI8l2qjuPfesHVoCqmH9IbA0ktgCePfCWusqtUuDAD7ACXCUi31neZDv204Fe/NzVaHbaeJUUzNJg1W1Nr9PP2KckaObgmeSq18mRg/UR2B6ZdFfQOuhY7RljvGZL9An+d5WKQRdmNZvDavd9pgUwj0UwQHT6DrjChEZZMrOK9Kn2czZJFZLfzNrTC7bqamHCJh+EE8BLpYwXu9TWxZIKBUQwEvz53KsMX+RGF/akjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2pyPWJP/weieQ95Tw712YUMl9eEypkQvr/+JxfokQ4=;
 b=hJ8MPj//R6MySfO0roHS4nkloriX8vqnZd6BHgF+Gq7SzdoM0Rmz3C5lWjv8Xcwi5d7unXXUb+8y7ev4dYLN7Zkifx4BS94YStCnQoSs6CeequiFuUjfndjgfAxVgJKD6cVao7zvrB5cyl+gHZinuba69kJOdlV0GxHrnCJUOn8=
Received: from SJ0PR13CA0169.namprd13.prod.outlook.com (2603:10b6:a03:2c7::24)
 by SA3PR10MB7093.namprd10.prod.outlook.com (2603:10b6:806:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 04:27:49 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::8b) by SJ0PR13CA0169.outlook.office365.com
 (2603:10b6:a03:2c7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 04:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:27:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:47 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:27:46 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4RfYo1704885;
	Thu, 22 Jan 2026 22:27:45 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [master][PATCH 2/2] systemd-networkd: Enable IPv4 Link-Local addressing for Ethernet interfaces
Date: Fri, 23 Jan 2026 09:57:41 +0530
Message-ID: <20260123042741.10313-3-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123042741.10313-1-v-singh1@ti.com>
References: <20260123042741.10313-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SA3PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8eb5e6-9cc8-4eec-b718-08de5a37c344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5X1K1lROyIcmTLlq6Sf3qbh8qBoRwQYzIazO2IO+kkz/o4creGjdxKp8zXsP?=
 =?us-ascii?Q?l1qxNN1yVLMK7aS8mJDiigyOAK/Y/L+eLa4rywMER6PZ3kfayB9wrSvENVnY?=
 =?us-ascii?Q?iN+gaQrDM/94RIsEHaYUxkRgNpwLh+LutFIXT2kVBjEheW6kTWIYrLvuSeXj?=
 =?us-ascii?Q?0jaXBC99UTdCclP8v8UXdT8XYTDjhlSrY4LTXqPUh796Yg4dCGJzIj7B7f3x?=
 =?us-ascii?Q?4XR+jdMaGIK/bv7FQitAZAFgscW1Bw63RX/L4Ugw0FINVF0MQEYWTt8KRQtW?=
 =?us-ascii?Q?9bH7fctXEKar+vXAgn25SxZXrhr6o5rWBPX1ICGanm4TSCyIea1wvrIW8w89?=
 =?us-ascii?Q?VXzi9ilDxZv8n3fMn2cM/lmsK5AgwNmbFOhKz+9ylvC82jgOuWlIBj5KHx50?=
 =?us-ascii?Q?Z4m8mG3YdXKHy+RNH2GvtumXDSJW4fruEusjYzge9EeT69eVhiC+ZPzxzSDH?=
 =?us-ascii?Q?Vy2oRtAfXhBlCHa+gUYHhLHGfy9TaZEdiKGK9n72AwQsMRwLfnGa69a4zox7?=
 =?us-ascii?Q?yhrgm1goZlM67EQAw77dHX33fuLW9RIOmMgdxeUEqZCuusGBMUAJ5XCDyazH?=
 =?us-ascii?Q?uOpymXwmrCbXlW7AxdFG0eLH4UyXhWnI+G6Isolmey/MhKgYKoSJHMv0kZys?=
 =?us-ascii?Q?txOxmLrrf4dpoEkLIJK0vTXcFpKyU4wYi3vvJYo3dYJbRdODy04IYh035mZV?=
 =?us-ascii?Q?gE1p66xZmKrGJHbqq2mkxnoQKcTJYSvA0KOVt/bmse6hNwZ0uGoNaEIgf4FY?=
 =?us-ascii?Q?/gq7TQ47ZtypazUXD522cwWDWLaiBEAB0W4BpbbxnG5XU6D4uh8O7DV5Gufq?=
 =?us-ascii?Q?bLPrKjB994KqwD6hXeq9vbBvx/9+JvyprUn/WcHbxj+bHwdf6UlOm/vBHrQ1?=
 =?us-ascii?Q?/AdQ0yS4cu59uY3jN57X3HOrb2TiAPvuP9nvNcIBJQBoqfltSjsFz6aFpZA/?=
 =?us-ascii?Q?QrE20JSStR5OjH8hfVuubQWotF2c3dLWiD7FVO1YhSC8UEk4asgEdZrCxvbr?=
 =?us-ascii?Q?SmdQ32rly4t2zC+wKu0JYXhhnY4Gyp3z8EB9lcOuTG9chw6wXA58Fki7DD/Z?=
 =?us-ascii?Q?C4VBVcvu78O1jXRsGP87SY2K8ZyWcvKvWox8THZLXLXRX4rot0yuP8zSuXBt?=
 =?us-ascii?Q?pDHHofzZvty2iSt1W3l23VSUV2M7zkJw+fjmjak9lrSVTP1BYZRnXhjO9swv?=
 =?us-ascii?Q?BwTDnYYV3DqWYYhcv4d3BFhjdGzje3PEzUR7hUcAnCNmADGYNe2Ogh8fBnZK?=
 =?us-ascii?Q?YBLB++dLqlPp+Ung/m7n2W7ezpHcTaz+Qdn0Nh6z4LdsslfYZCFUDgfoXEQ1?=
 =?us-ascii?Q?McEcUK1jFYHyE5+iVV2CJo0PS6dHJLACYhW80nLNcpzTb139iWXq3G8UYFRq?=
 =?us-ascii?Q?gtHyO6QGAJfkPoDFykG0HTLjzCWWLSoUU+tjBm6duchiZXkjpRyHNjq8pWx5?=
 =?us-ascii?Q?IP+rO+4UOZ7UtEMEsLFXfa28F4zX5LF9e/6VvWi5iZBgiBrwoPEGtmvl+FKp?=
 =?us-ascii?Q?SkE1rZLmoxYN9605IWyFt0Ol6Y5iammMP8O1nZ9XrHFlrJZ/tZSbY36JOSgQ?=
 =?us-ascii?Q?Hl1WBaTgNn0csm4KNz9/Qj0AD9r69P7JrLgYV/NZo00GYaq3QsdRF1n0aaL4?=
 =?us-ascii?Q?3n/cdgyJgGRmgqhni1+pRqMU24iEMpjddxAH0tthhbNi5E3TUQzzI+Fr9CEc?=
 =?us-ascii?Q?XGxAPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:27:47.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8eb5e6-9cc8-4eec-b718-08de5a37c344
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7093
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17015

From: Vishnu Singh <v-singh1@ti.com>

Added LinkLocalAddressing=3Dipv4 to the network configuration to enable
automatic IPv4 address self-configuration (169.254.x.x/16) when no DHCP ser=
ver
is available on the network. This configuration applies to all physical Eth=
ernet
interfaces (eth*) and USB Ethernet adapters (usb*).

This change:
- Allows devices to communicate on local networks without manual IP configu=
ration
- Ensures addresses are assigned directly to the physical interfaces (not v=
irtual interfaces)
- Maintains network connectivity in zero-configuration environments
- Follows the RFC 3927 standard for IPv4 Link-Local addressing
- Provides consistent behavior across all Ethernet connections, including U=
SB adapters

The Link-Local addressing serves as a fallback mechanism, enabling basic
network functionality and service discovery even in the absence of network
infrastructure.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/10-eth.network | 1 +
 meta-arago-distro/recipes-core/systemd/systemd/15-eth.network | 1 +
 meta-arago-distro/recipes-core/systemd/systemd/60-usb.network | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network =
b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index b16ce4c3..aad5e194 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -3,4 +3,5 @@ Name=3Deth0
 KernelCommandLine=3D!root=3D/dev/nfs
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network =
b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
index be47a01f..0aa8b22d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
@@ -6,4 +6,5 @@ KernelCommandLine=3D!root=3D/dev/nfs
 RequiredForOnline=3Dno
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network =
b/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
index dbba1898..73e5587c 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
@@ -2,4 +2,5 @@
 Name=3Dusb*
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
--=20
2.50.1


