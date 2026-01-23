Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F38AD6CFC3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:28:25 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61437.1769142501743669494
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YzCL2WOE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.34, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT/uSZXU9l7kzBC7smKD9uVvy2Hc1/NBxLpHm9EI88u15zKcF3niphEDkPhKQ4FuMrEN/ETYP1PuCHA0Y7xTDzhAUtlLOEEggDRuGGICB8LFwrMjmRrAbiQ99pO369BEyr9Rl/mBZNtKmr2gWvh3aBji0KLxZ0Whgds4kwwqW3CcwvB8YRq3OV8+CTCzwYmBpfLwWPGxe3yQmCafTnKfHXOjpcxrPRc03qvLPrFLHNaDtRqhKfGW2OWI/YAriTst41/G2OCC4svFXu+k1ccfjNocbZxD6N+O0l4gRoycpr4GKDi+C2nrak9CS17LlqPmFzfJbtzNFgcnKM71PjSldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h06YEA8BYjBiMf3KT3luxGsSCH/eGTvztE/RnPxaQ0=;
 b=McQYd4vNXONNpI/8Kb8wO7LjWpD+qev1mQXsU1YOzI+uzecwS+8gMhWyJFIFusBgHeOSH46FsWXwitRtXrJOiACms4zFLxU92nSEoHOesH9SOWZwKxK8L+IAKLemSBN4jBBJsFAV7M1pngkD3yHcQIIIc5RxkTnxptmblTGXC7pxa5OIMIB/eCjJZQG/ZevrBIWB99ZRMYG1UFZrxq5CXbI2hddYU5p5AZOWehQ2Ve6w7FCemt+Pho8K0cJk0/1ZsL6mJ5UVKi5IaNvbCdMfaPHV5NoOMCKMdXnRDw7m/1VpaGnlU/W1+z0/+qos0iaBTiQKrPPtXq88fnj+B+uS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h06YEA8BYjBiMf3KT3luxGsSCH/eGTvztE/RnPxaQ0=;
 b=YzCL2WOEgkVVDexEao83C6jo4HMyQZbNc8O1kixBRcJQAfN3cmqz8sbyJkOG2SZJ+2GopVa+NPdFmLjH62JTGJ24OGQXZXrkCOx+G1KcpWd89BNDaleL1UEzwRHHWYEAj9uFOrEfsepmvcuo/1VZvEtzrS+BlBKzJBi0Zj75SZU=
Received: from MW4PR03CA0068.namprd03.prod.outlook.com (2603:10b6:303:b6::13)
 by DS0PR10MB6054.namprd10.prod.outlook.com (2603:10b6:8:cd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 04:28:17 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:b6:cafe::31) by MW4PR03CA0068.outlook.office365.com
 (2603:10b6:303:b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 04:28:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:28:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:14 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:28:14 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4SCMm1574886;
	Thu, 22 Jan 2026 22:28:13 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [scarthgap][PATCH 0/2] Add Zeroconf networking support for Dante DEP
Date: Fri, 23 Jan 2026 09:58:10 +0530
Message-ID: <20260123042812.10342-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DS0PR10MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 1025621f-74f5-48d4-de87-08de5a37d3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XGO1qsjYBSDx2/0vPAHPBk0WZpzCGM1dzr5sY9TFeTUxWVF21UAFdsrVcio4?=
 =?us-ascii?Q?CrcT7nW3t4ABsSSB2Fdnydv6ODmWaJR3NV3W6wc9PlgO7by1ntoAzYCwuXP1?=
 =?us-ascii?Q?iBKV1mb1Az360ikH3Je+jyHSwS1EuqkqvqFkNpQd0UFaLHAt7wRE10Lajr/C?=
 =?us-ascii?Q?ntI/eXjKC9jWdDHz+RzRGKyI2zHMp0TNJK2b2hzrQDwKqe03mpqXaUTzKeGK?=
 =?us-ascii?Q?pXJ3HTmrd52ExIJ0cKrEtZhCwk612khp1iqxCNKntK71Le/OlrVw1k5d3w4g?=
 =?us-ascii?Q?jtOZcbHJRmjXDD3NDz+cypEKW9X3djigC5Nkktp8Pk5W+Gt6PkX4QvlPvPKW?=
 =?us-ascii?Q?zq/NQvtb3VZF/W7CiHJH7D4rB77NtqiHUZE/DKInVBIwXewX24XJf6woRTfN?=
 =?us-ascii?Q?ftJSwrjRxCrAzB+FImxmIiq7ax7Ulh+8DL2/KkgIbV848H00FHJ5hjPOafSY?=
 =?us-ascii?Q?/hjbfEOn3ioMGrVC6OiunKm1T+7ddQ3Bi7qW+uSQksKIhJFjQV9MYk2TnBlF?=
 =?us-ascii?Q?ZxiogFMsgXtCPns7MUyXnR6389loHMlzmxf7ulEdR6FXH6f3rr1WM38efoG2?=
 =?us-ascii?Q?B/fTxgJQgSVjd5HvUdXBSjUkdkXqaCYDHHtjf4iiTbyKstXghvyHpi1gCWgI?=
 =?us-ascii?Q?ZkGx2y+claBbQmBqd1qQGCEKyI60sEmbevDDPUYLWVvr6lK/4mir36DvRcdZ?=
 =?us-ascii?Q?QqlkSs7Y/J5C5+Hf0wBhG3XX3YJMMdWeaVxEDSgqzjxfR6gcX2LcFaHEpSij?=
 =?us-ascii?Q?apXoulS0B4jUqBbQ1Gk6XlfRBaiXrYf8kQjYXQR35wZdJsjp4zPeogqJ0Ljy?=
 =?us-ascii?Q?P5iaDoJMSuGSWfkIQ1J2aWXDtBq6oRqWI6tVSw39qNjQBJUL/bu0swadh3m6?=
 =?us-ascii?Q?/UkmmMMi3WKRK0QNsLDuHbGaIY7UCjqqym58S7PRdJxhq6gek0NKPTVwm4tl?=
 =?us-ascii?Q?tU9LItizQPd1Vy7m2Ud4Fv8/PXU3tvW820F1HY6EpmmdC+SIf+O1eySTFDvF?=
 =?us-ascii?Q?141indijUylYEJVltmxnWwtJtBSFCN1iCvxKZCz7kBQcFhjZg9Xkvk1B5xt0?=
 =?us-ascii?Q?4pEb6TRlvwc76Hf3zJcsXq+V0qa33+Sk6jIPEyxLhrxF/vE8j7RxQp8jwaON?=
 =?us-ascii?Q?+0Jikr+SF71oQfAElCbbDItE8aG/3SFy0AwaUpKIyezljFxNHRTGc6r/GGAy?=
 =?us-ascii?Q?X1i+ZMG3a156JM8ALJexyW0xpfyD4+w6PHlEwtLk9QEQFRCtFckmen4JIkJR?=
 =?us-ascii?Q?U6ujNXlw/csRDssXySzGSe2FgzI57wYROjp4kV/NOp9RT9zM0dw+EL5kL9t6?=
 =?us-ascii?Q?lJ8y3DN2yoHLYPhGWZw86taoDMDRpwkG1qGgZVo2KQLqEVlnAj3Lf4IKX4na?=
 =?us-ascii?Q?UAT72LY0Uhv74tx6QfGAODKsUE5AvohKaW0kiKO/4ToFNWbCamaArNqgfWwL?=
 =?us-ascii?Q?YWWSeWEGzcycqGQGI+zA3p3cU3vq7MwPxcmhjvEBYKWmrZ/ZlhKaaMo7AvwX?=
 =?us-ascii?Q?xyLGw+PvHK2pACQ+CHPfvgiL2hBs8C1OCpDSrTXoLjN+5iv9pujLw15Q5tff?=
 =?us-ascii?Q?JoSWVkN1yMhdbF+aL+OwLR6jMV2uAbs0eJ6BdcFOwLxr/Wzmd9gveQwvsQyT?=
 =?us-ascii?Q?vGKv87Cqzyh0vVxngacnTqBsVl4xsnkFbWwqZF4FCJVIJg1pvwRYqPSSne/O?=
 =?us-ascii?Q?OxCkyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:28:15.3831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1025621f-74f5-48d4-de87-08de5a37d3bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6054
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17016

From: Vishnu Singh <v-singh1@ti.com>

This patch series adds Zeroconf networking support required for Dante Devic=
e
Enrollment Protocol (DEP) functionality. Dante audio networking relies on
Zeroconf capabilities for automatic device discovery and configuration in
professional audio environments.

The series includes two complementary approaches to enable full Zeroconf su=
pport:

1. Adding the necessary packages (zeroconf and avahi-autoipd) to the connec=
tivity
   packagegroup to provide mDNS and DNS-SD service discovery functionality.

2. Configuring systemd-networkd to enable IPv4 Link-Local addressing for al=
l
   Ethernet interfaces, ensuring devices can obtain IP addresses automatica=
lly
   when no DHCP server is available.

Together, these changes provide the complete Zeroconf stack needed for Dant=
e DEP:
- Automatic IP address assignment (169.254.x.x/16)
- Multicast DNS hostname resolution (.local domains)
- Service discovery and advertisement
- DNS Service Discovery (DNS-SD)

This implementation ensures that Dante audio devices can discover each othe=
r and
communicate properly in zero-configuration environments, which is essential=
 for
professional audio networking deployments.

Vishnu Singh (2):
  packagegroup-arago-tisdk-connectivity: add zeroconf and avahi-autoipd
  systemd-networkd: Enable IPv4 Link-Local addressing for Ethernet
    interfaces

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb  | 6 ++++++
 .../recipes-core/systemd/systemd/10-eth.network             | 1 +
 .../recipes-core/systemd/systemd/15-eth.network             | 1 +
 .../recipes-core/systemd/systemd/60-usb.network             | 1 +
 4 files changed, 9 insertions(+)

--=20
2.50.1


