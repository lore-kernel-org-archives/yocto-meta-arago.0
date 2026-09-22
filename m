Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6C0C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:27:04 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7007.1790072819900404702
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LbALaMLS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=tt8fmMfI;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MALSW9932416;
	Tue, 22 Sep 2026 05:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Qaa3r8+4DWzWI
	V4T8QF7ipUEFDkJ1xod6If4WC3R9vs=; b=LbALaMLSprejPPslUNxSH1xu5YsAz
	3lppTGlXPqhf5ArqjxyyPhRZer++NM3OoJpN0W+cOoCkmexf2gWXb2qlf3Aa+IVR
	g0C91MN9QS5OkqZw2SZBt2nFO3nNu0pVbwKELPMuCICQwXCIuZ3H+qF5++R/CEm4
	GV/f4FiQiULiLjh8RuaJIxV16OZeRwUUo9yeKEWbEOh4UI4eJXT3KVylmwyae4ko
	NBqbyD0MeVC/vYE5kbyYj4cX/qqvyhfiXvPfgcBvfk6D75EujlMr2xQ1jYd2kvA/
	RlCTd3VRZ0y6PwsdqcwCTc6wX9GTwgFrQtP4/1BOHvJhF5te8Bo+XZdtA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011035.outbound.protection.outlook.com [52.101.57.35])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x2x2a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:26:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD9111wkX6fgme1hijjKoHtRi9EgiN7edXfVCTaQz5iTuznJbURu0Hu4vRfDkssbl4YM6lGKxVS9ZDUjiCRJGC1BDJp6bYOhP3axnN1kM+3WsnlNDSrf0M56lYg8hycca2sVOIJrS6U1YGW7a5MMV4XMOtLOpOpsdcnBpxkcQs0qfaxhN5kw2bhruNhTj1lq47xA4AJFlB40SGiIjxGkhMQ18IdHwdx9q4umSSib02yWEERMSalZmEqhETLwfqiPgLHErtMZxdoNMTa/wFtruHpV+cC1TVKtOs6eEMF0w5qcn2/b6PelL43X2ElALabLLw5KWdi5XHPCm3by5uJpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qaa3r8+4DWzWIV4T8QF7ipUEFDkJ1xod6If4WC3R9vs=;
 b=FRdicUtUy9Smzy9OEBpIf3eNl1smNB+xToHDpzXxmBLS4ufyROMYNMoPkkxrNvTgcTFTAhF8izKZOrEgiBzkSEDdH57db8CqfobKcPontQqxeVLaDR57MfsEHgPfRQYsuGyhn97vQod+mf+M8d3Mwm5CdWP596EvmvkXQ3sWmag6Kq5C1EBJs78HR7SWZCKbcFz+TX7HJJ4c+ScFph/zMqhWd34771wHDb+qd74FgQQNd4UGRMSbxRUJl3NVg+/mNCrSkvfbEjOHajbUO3LYGB12tdj8WV5V8cGH10XDYpC714HFX7ncP3zEQjf4Y6wNLSfOFoJ4x8p6QyYLuL7SyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qaa3r8+4DWzWIV4T8QF7ipUEFDkJ1xod6If4WC3R9vs=;
 b=tt8fmMfIfmnmy/3cgG6XOEBVaFyBKWjIvlHhGfu+zwjSCxVB7av0hQImprs+TIrdG0UOv7UJSDDJPwzZpR9Vzxt0a7pZrohCh9wEQAICOwB6zSvUi16You6UEQYJ2qO12ASC6ZmCaIbHoWC8wbEgMs4QeWEZ+EwwPd7suxGOL3I=
Received: from SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14)
 by DS0PR10MB7405.namprd10.prod.outlook.com (2603:10b6:8:15e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:26:49 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::29) by SJ0PR13CA0219.outlook.office365.com
 (2603:10b6:a03:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 10:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:26:48 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:18 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:18 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQHFM3957528;
	Tue, 22 Sep 2026 05:26:18 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3 0/4] Add PipeWire audio stack
Date: Tue, 22 Sep 2026 15:55:55 +0530
Message-ID: <20260922102559.3717785-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS0PR10MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e922e5-7635-4079-5fb7-08df1894024b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|10067099003|6133799003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ja56xwQv41Y3DGTKkMzcUl3Q2N+xCnq+bEe1jVOh67uSGV6wxqteU06Ld1z/2bZINmwJ4wADYcJEsai0lW/BcD0erLZXIhKl/V2Ya59SgHBHUg4P8QKezDhjEeZAkWlMJVLmrCV47Qk76vEorT55R7pEAhzV8HQctVHQlMc74rd+QEA5cFkaQWD6LciD1194aCtmYaEJjL/Gxut7Lifs669Ga0vNwCLLgeiuDQKEYXrObpViwvnlK1HqNazUIoJ1aj9HwCjR8JdFi1rW7TKQCKUi/g1W9R6oh3VFCf9VsdmAHpaSEwnQoNDcxVFH7Q1wEMx9QowjwvLniXQmVR5dHWEdV0lmxDki7P8W7L5y/PSxSeFAeIl41NmrdPVynyftm9AESC0VVUelrw79pdbJvJWit7O956+l5TZyQxSBM2MIkla4odJMxCqdzGJ7grpvXz/C/k6c0lw+broMuXpPZCFpMC4eAqTGVMGAN1n3F6wx706jyGUUmBuqrAeQJntxz1j6NcGDLzbotUH7sS6vfk7Qn6StHSJxJUq7L2xjS67CBubjW93ZAPYDLUEHHkagYuEqnTAJ8hw8XQ7u5JdIy9lZAMGCioi/ShZJAbc1YsgsMloCKPN2lCKzoS7YvHwx8TeJH9U4rJ7zWEra8G8hQw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(6133799003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Jgv1qztlsRP+8IhM7lhQ4z3zkXvmunlvtfqelmQXu8kUSeVz6CzRCsC5POowWmdRW6U5UQ+Kzu2FFZlewmFZtcCffqVy7OklzWNNLH3gkHWRBVmmDWdc4P2xCfLIYM92NukMkzUJ5oQiUrkiXIvhojvwDJFQRvsRfdu2n/drOanJjiKCpg+x5adi4hnLtpk29mRbTB1a+yi+nAly6pVvK8N/3mA1+at6oJ1S8YaxcjRJDgGkpLofahk2Z/nbR0Onf/+wPRqZizQwlZkdN8SpcshjoYxMFN/euRzWwCV+pDLstQijxJFmEVSQ0N0KIwMfhUC64Jz9KtXhmS/p5PjhqRIL+NNxH4ZH98ajfViMcijQOwx+8JRbK0U1Zjjf7kvN6Bkc17Vs5BzI6B8aU6NNxrIZfYdVXx0i1Qo3Q7pU8X9sbO60pkyouA80g8hVPsk3
X-Exchange-RoutingPolicyChecked: 
	YX6uwQati5/ta6ZIqVR/ryq8gthM0qpbvwvuORS1dMCeKHwb4v7WVlWL392ZnyuaL2M+xbNVf9ojzyU7kJNjs3pE6rDBbNuelrevkF50b/yQEIjUzqTabOOCuAxZWiGB6l0dvEnqvPuPzkIyzKWb8WfJ6n/C626wWNqIyqF+qT/IimHFufZgEnb9Me1xdynzZ2zqxM4mAxx3v8oWgjmamYQhOSn0GqVVzXp7+P/ig9e9RogcoCLJ7lxfaV/mgZcfP6jxJR51tVnD+44f11WPqOI4NVuu/A3beu4+XVH7tGdSFObt7XcwMVvEAt5O9sphoxUMZv89pTWPaxiyTmPUiA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:26:48.1307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e922e5-7635-4079-5fb7-08df1894024b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7405
X-Proofpoint-ORIG-GUID: 28RsrfmCPPZZxoGCuOkcDWY2fynhvRh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX046PGREcK4t9
 w3Dy6WHaWRnkfhzYHm5ybblutmtrpO2S6HuIZVHBClINIkLsuoF38bhmLfJl7b0gdOSJWHuMeSA
 y7D3mL05nsGW5LqUsv57oJ4V6EO7SFRcCmkaA/tOeID3eKJ+x35rCxfs++JYSlsnCjb9JCBaGqv
 gZGFFykwDMmRP02c6pvpi6x/7l9YsCJ9Tv7bDa+Vt45zmK4luNNz/rrIjo/CmnftpZVIMxnViL1
 VKEdB821O7uEB2t/IphKjtgYoG26/H37yJBVXVM7RN2szZZmVByxRNoJaLf6Tvt0/D/uTr4+pBy
 UKpq87y3PDk9ISfhyns5xtiILwmbtF5+z+0Ej5WFfWZpmPp/T4IHDjhL9PmMHEooHVxaVcrVKb9
 5vMdxlzdtSQMW1UFoOGVnWuGrxR+Zzi+ax3SIgiuaJ6ZPbXO/JPBbw5QeyYegM4aqM6J0X1xS+L
 Ofgt28rGXMa8c/fQ6Qw==
X-Proofpoint-GUID: 28RsrfmCPPZZxoGCuOkcDWY2fynhvRh6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfXw6lwhm7CzT4w
 JhIi8K3uk1EGazLWmSF5PoK5PpYZ0tzD6kRZF9wdkkYshEg2A+IKW/FPME44qtXeAX8aroKCfWa
 xNwewsVp3ny1s7FmzyR2KAX2NXFjplA=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab257f1 cx=c_pps
 a=MvJzBjTJNBx6A1eu3kpgJw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=WcVicg93AAAA:8 a=iGHA9ds3AAAA:8 a=Urp1N-mI1X3pp880L9YA:9
 a=K2J6eEO5HafFHa66XerQ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17690

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
v2->v3:
	- REmoved platform specific changes (meta-ti-extras)
	- Updated commit msg
	- Added pipewire packages to packagegroup-arago-connectivity
v1->v2:
	- Updated commit msg
	- Updated conf files to use default values (except 8 channel for
	  am62d)
	- Remove redundant define in pipewire and wireplumber recipe
	- Added a check for systemd before installing service files
	- Removed speexdsp to decrease image size

v2-https://lists.yoctoproject.org/g/meta-arago/topic/master_wrynose_patch_v2/121281293

Paresh Bhagat (4):
  packagegroup-arago-connectivity: Remove pulseaudio
  recipes-multimedia: Add PipeWire bbappend and service
  recipes-multimedia: Add wireplumber audio configuration
  packagegroup-arago-connectivity: Add PipeWire audio stack

 meta-arago-distro/conf/distro/arago.conf      |  4 ---
 .../packagegroup-arago-connectivity.bb        | 26 ++++++++++-----
 .../pipewire/pipewire-arago.inc               | 14 ++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 .../wireplumber/wireplumber-arago.inc         | 22 +++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 9 files changed, 141 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

-- 
2.34.1


