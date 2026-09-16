Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A650FC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18609.1789574847833394361
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NCk0ENto;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mJXb68xw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68GFaRgp3174548;
	Wed, 16 Sep 2026 11:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=SxOBSrMW7WAxr
	AWcClhRrCQ9zIAGvShIEdJ3EGqm54E=; b=NCk0ENtoe0rfo/pY1JZwtKfPnuVGJ
	jgGOs1jpODrvOjySvwqM39r187emuMlXxRAqa4wMrEv+Ng1elO2VAUeo0B/3iLqj
	5TyuNefzbofvyPGCsRR6pRHkbgSlQjdh2WfPkuhN6UwETlYz/XWj7XtocT8iMgPk
	6dVKbGFjuAq8DfEGIBxiSeqzqHzdhrwdg+plWY0S2fakWmXMNPgOA1tsVwTno8wo
	ShwHYoZ6I9JrqlIgWP30ZKzzP839/8b9l/Ho3xmjvsFfiVvryG1WXGlLzGA6unrD
	Eg5C62sniA+64RA9iVEBEKcXLB7SVqi64K90o+mcjDlKyMhQ5bskXijvA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gqqmejgdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:07:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4X+r7zBDtMILqHpw9A7OBDnfxB20fnuTgTJyVRSPiG6/xTW3lJsU036rJkysO6kUMxc3V2/VnWv16gw1Dc8KwJ5bBcEg+B9F85LZq7LjI4tBiI0e6OfrlRPYPZPCQbDQYjymggZh3w6se0WmD7MlW9nxV/mGkfNd7AQ7lIZkRS1mzSxTff6UANV3OMgf/QHEeORvgaV7Hv1byPL/o/aCwCZPIY9DoRbKejKavjmDvhsQKPlZVEd5C6KS+ihsIc3gMar5BDbyPYp2Yt204oV9c93BiEtJRs5YK/mbMk6rfjvVZ04DDpofJw4LK1GIPxkceo2QBC7pr6naC/h0DwJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxOBSrMW7WAxrAWcClhRrCQ9zIAGvShIEdJ3EGqm54E=;
 b=lillXM4KBibWI1SpO/zinJTvpeWhUJCNoobu5RjAM3whyUkxsMHWsKyiRmRxP0G3v+9l5/3K84DeEqeQAi8qJPOS6mi8q4vHasqNN3UwIl298E28SdRIwED1j16oKinV97QpN9ZYQ/KTXMBlI+IToHm/0Atif4lopVY2i4EbyuPbRbPmBqB2OWCJcOjt+8Q+Gh7/WvDkHjLVfxJ0gS6EM2FvV6V0k70qi10xmgqTgwMZkvNRoS/hfpERoV7TUvg+M5j7A/GXpEPG5Z0ULXq8kgR1hvyMBaUECLCEZP/v4G+M+mOqkF/sjO9Krxnot5ZTZLBl1lPAeaOxlbrTHe3nGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxOBSrMW7WAxrAWcClhRrCQ9zIAGvShIEdJ3EGqm54E=;
 b=mJXb68xw6MDQ+izh9rQyZqJWPAuIutneMA7NFG5eNNMkMr4zyywLzviSg6hd2Rs3V+dEKm1fGMWNTatfbixs0i19c9YyHHQZYgO3d2HCAbV7Jp+qZDZeaX/T8FObY6WNk2grAG0bIX6fjW0hL1eSuoeC2ceB4iTHQZbkXOCWVj4=
Received: from MN2PR06CA0001.namprd06.prod.outlook.com (2603:10b6:208:23d::6)
 by DS0PR10MB7176.namprd10.prod.outlook.com (2603:10b6:8:f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 16:07:22 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::24) by MN2PR06CA0001.outlook.office365.com
 (2603:10b6:208:23d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 16:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:07:20 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:32 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:06:32 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GG6VXb1307375;
	Wed, 16 Sep 2026 11:06:32 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
Subject: [master/wrynose][PATCH v2 0/4] Add PipeWire audio stack
Date: Wed, 16 Sep 2026 21:35:43 +0530
Message-ID: <20260916160547.1287287-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|DS0PR10MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 21884928-403a-4e1b-8086-08df140c969d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	jzZmHM7aH0v+bI1u2qQo5P6cX/T77ob4ftM/5F52GG94vltBWB+0mf9vmhOzbyywCFUKWUcpQbijXzS9FDLjpU4ogNxnHVTnvWSIwiTC+ULROJJ8+8ir0d7GTCrg1HutPigR7cRHXRL8viq6g2oSJNfJeRetnDzmfdwbTcaO6mxoEN5S8oKT3THCfm9Ye1Guz19BV3uGgj/LvJ/DrfZsag9pZ9Of1VDOE3sH5ywD/8XWqgKVjkMBlI2//bcMuWGglUpdLDu1WEJvfundXt5lKiYALg6hnvoU9Hly2wDS5vB+zpTlh4Yt5udnDvjVEITjK5BY2BgSY02VQ5jlAshOPYVz8wcw7YM5XD3MAlIimfpLqhIBSjAaHHeGirAPkosR0tzxLJmBylI8XXrXjauxSKSZfFoa8/a8XsX5OI2IpbL59SPV/jKLq2wCAPUXmuUI6pgi/iwOsy9sWhcKR9UW63JH+0YONA+fdf4g1AHt5Ni+cHc2+yOH7mY7oqmdzKygwD+F3JD4pvKGswtbutArrp1hk864s9UM8idoCA9e6Ked4h1RBfZRJwCQWwUDDikwBfr4l9PV93hga4U4gTPQK3SUGHksloQX9FSgJxNC6y8caZLiKXlEGi9eJQcuzqpy9cr47mH0jAIRpsto5HRP8A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9I+3gvVqjkrcGHCpK5G3Frfy9qJ0cAZn5DDRr+3UQYqtD7AE1vf7btI0Hc/kUAcS63hJSwJBFVGNLtff5taosqZeLGMbRF4JRq0q6qRAr2ibk6q5vNhj+VWervC30wicDfafKT+VmjkQN99IdyiF+QknHrRCJV0AOhB9xykm787w1spnp2S1SA6rsdzFhLgpLT/CT/DhZgS1NQryZVw11xfZDsVLhyoSSGXGLsoBL8gw2N/NU75Bmr2wFtIOzv0lRrqIvex3JQZCf0p+97uhPpY9QdOnURQgUNrEtShh77LGkV4VpaIFVITld6I1xCycURk8aozQIc8MhwmkvNBYqxk96v+5OliGqNWQwfrrF+4vkTmfNhKq1VhM3/gQw+k5vWjPNmt2xHdCN+yf3tSKYksrN35M2UMpLYOkysLXtkjn6XPtd3gBrlOfL01Kac53
X-Exchange-RoutingPolicyChecked: 
	NCAl1uaBOOtZji03quVUWxz1SYS6AuAXVxUoDF+3O8BAuO8N6WoBEOGc6Uk253TsHBMpUxanyetEpmc4d3Q4eMSZfMf44NhhIQKQ/C69bWPyCuWxBTRDQOtXLq1LsNEzn5NCqiJ8LvcZ6uyAgwRMKoFQkrZk9NKLuIngbsDLrJ7ZZY/stujszHz7n1b9LjYBUr8yXDSZTVyHW5tSry6agr2ANFG1F7IUEQnnTarDRLl8oeolLFOmWJhWah1Uliz3CD53TGgXUArYuIV0stY29ihO2IFymO8BZZYv/FyNjUbNs41mr2mbVQa3It0Y6wBDD4rmBx6OQLUd2OjDyqq6Rg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:07:20.7766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21884928-403a-4e1b-8086-08df140c969d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7176
X-Proofpoint-GUID: 5J0E_zYqXS_9ksdchZNzG44RVgAI1S7y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX8yYOj7MYspQq
 7mopxbkuOWm5eWMkdaKZO/gwmf0AZWEQOlEATs/Yo3RKALjUztEUcYn2CO4hWD0BmJh+MzP0gMm
 A93xj3GhnWK1ss7JRzdXxvyzjHmghr4=
X-Authority-Analysis: v=2.4 cv=ausnmiZV c=1 sm=1 tr=0 ts=6aaabebe cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=WcVicg93AAAA:8 a=iGHA9ds3AAAA:8 a=Urp1N-mI1X3pp880L9YA:9
 a=K2J6eEO5HafFHa66XerQ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 5J0E_zYqXS_9ksdchZNzG44RVgAI1S7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX3dic+L3+Y4Um
 Qwh43h/8Qj4haae5Ef5qtVhzEtiB+x169tgMMOiQ0jBugFOkKFJa90VXk6jD0c0xMDgcnphyaeg
 olAoC1sX53nMARRwOu3G0zPQp+z9H24x5ud111zswtq9SBjqqdcHuudNPILtKgZQlhWBW7d48Rb
 nDlab/2udzdkvppzGOTU39+W7HDRxF/VefkfkAUyVVDqz2rMcdhF4A6+Ir++dyCWP+PrNlIuOv/
 QNpFFnHBZQAUel8/H7VYPQpS0LXRvKhDiWNNMNrTXqDRdUPiqqEpPkVJs6IBBHPrb1kiWkQQg2N
 eM7GHun1kwcprfJlvAjC7QePJl2qnQYIExEKtCsJJKsMe2zbMjq/LkahcGjNYqVqQZWxpnC7dzb
 uEFOLgP1lw5d4iVyibnwiWaUJTy36EAm9RnhzvT6qbX9L1RhyrPSrLY6LG1H+8bEu+6J29hexvM
 +uw/wRCtsdt6cr479vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17677

This patch series introduces PipeWire audio support for all platforms,
replacing PulseAudio with the modern PipeWire audio server architecture.

PipeWire is a modern audio/video server that provides low-latency,
high-preformance audio processing with better resource management and
flexible routing capabilities.
WirePlumber serves as the session manager, providing policy management
and device configuration for PipeWire, enabling automatic audio routing
and device handling.

More info can be found here:
- https://pipewire.org/
- https://docs.pipewire.org/

Change log
v1->v2:
	- Updated commit msg
	- Updated conf files to use default values (except 8 channel for
	  am62d)
	- Remove redundant define in pipewire and wireplumber recipe
	- Added a check for systemd before installing service files
	- Removed speexdsp to decrease image size

v1-https://lists.yoctoproject.org/g/meta-arago/message/17642

Paresh Bhagat (4):
  packagegroup-arago-connectivity: Remove pulseaudio
  recipes-multimedia: Add PipeWire bbappend, service and config files
  recipes-multimedia: Add wireplumber audio configuration
  arago-default-image: Add PipeWire audio stack

 meta-arago-distro/conf/distro/arago.conf      |  4 ---
 .../images/arago-default-image.bb             | 18 +++++++++++
 .../packagegroup-arago-connectivity.bb        |  8 -----
 .../pipewire/pipewire-arago.inc               | 28 ++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 .../wireplumber/wireplumber-arago.inc         | 25 +++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 12 files changed, 192 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

-- 
2.34.1


