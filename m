Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6BBC624A4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.971.1788231790896130974
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=M5iIDkXX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cuHEzc6A;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810xYnv2179157;
	Mon, 31 Aug 2026 22:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRh
	HI=; b=M5iIDkXXFuel1D3xXT2gWq/hWaJHAapzGdVyTCjkexmnaUJC/KgCTEiv8
	GtB+iO5dh+wPKpQXidkmnatmCXS2PnxX/WhZffZi/8vf/L792Sxl62hL7i8rUlFX
	mulQuiBKZaL4TuzRH2cHyP+zevVuioBPVFVhne/CEHeLXlHVZeaVe1PU3DUqKafy
	sEIbp4yJIFrg/EhGIR0XAUb8iFEAkYcVbOu/UfTmtTh522eTpfMvm63VIikLl+JX
	9/PM/ZnW/OUhbxQkmWh6f7MdDljpjEqNqfRPC7JrTwHhxrde80XHYEUXDWPpaJvy
	rNpGO0DTcU8044wylVRmTDkqkKZEQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gdmnd0t4v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:03:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRCrwUdOH2OC/T8k6B0aWbdqfIsqFi3J4ID854lp8KR2z9tKxhsqm0guM9JAhL2bteWiw0M/pM00wP4rpPRG0rv+hDuwYfQizC+8e5sOHQvQAyC/zkMo89j4MxGP5IekThAPZrP9X9PiIh6JPtvXQLSOWus3vHHprogZPHwLh7Qa0xN8FdxZKkQ1sYdyAF09A2Q/UQwOB4srW4yoaiRSrxCu7E8vWFXi8y85eXRUPSu3vuUs6CxlHFyG2mRUEotTLCJFFFwu8Dqj3a2fqyalM2OTNfao9DQv/XJRPxWQk0a/EoX/YsEqy3Gw37JDD1i7xCCpwlv/LxF4OQHUGdXHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=G2s/hPGPa+4c8cZnATpdgHPc7/vUWkMACJpAlQxFXkRI/NcnO4aMBFrgSoSzbs4H+OPr39frO6UnkQ5LNEK+3ngW94krlXdm6SpFb93iFiYUq9FTzTpDiZzArEKzFB9+O5reE4o2YhXUNtHH00+4MPsnVgRj1tOi4Fq5kdfRYyPrmt3KQ7Edzlqlyaf9cQu7+kkKzkKVLHI5GNi2Ey/zfkaZP60VQko+HplUgoXuMD3cpCweYuMwqPWsinIUIBCPEvndYjilLxOwo/cwoG2C+s5o6rVP7+3hT3vX9zRBGIGeaUpGhFhsbsKITXXVvfKas7/LlPEIYke99ctd5POQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=cuHEzc6AEMYwS5WAI45eG2dKtzww5ovaFoAPlyhs9MveqBUJz9PnagW/HDEToMGdnuP/aGRWrrL5YjSezJPKKnEAhB+ZvI7IlrtpJBHwwaFKc68Tk/GFIXHKWK7/pHTaQGs9uWQbIjA9cuMj9THCwX8TfxNCCvahU48+Qg54Sz0=
Received: from SA9PR13CA0049.namprd13.prod.outlook.com (2603:10b6:806:22::24)
 by DSVPR10MB997937.namprd10.prod.outlook.com (2603:10b6:8:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:03:03 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::93) by SA9PR13CA0049.outlook.office365.com
 (2603:10b6:806:22::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 03:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:03:02 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:00 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:03:00 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68132x141966811;
	Mon, 31 Aug 2026 22:02:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: [master/wrynose][PATCH 1/4] packagegroup-arago-connectivity: Remove pulseaudio
Date: Tue, 1 Sep 2026 08:32:30 +0530
Message-ID: <20260901030233.686017-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901030233.686017-1-p-bhagat@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DSVPR10MB997937:EE_
X-MS-Office365-Filtering-Correlation-Id: b080eaa9-8d6f-4521-e25b-08df07d58956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	NqhyTOkkFr+4sFmHtPzNVeUTR/rM2orRmrM77sEj7l62TBQJvnOBnho5pLnVe5goru0NAD+gdwtbOGzyChjqHAR3wnNYOtEtOXYlkPg3WUEqiqanoVnh93G4qu2h2YPODacghPC+haWbqMRb6Yt9x/0/HM2v3iJQx2uOAiXUodDXbJTuI8YSIo4cCa/6KHSTv4RrnwQEXuB51/0tBBv2II2o9+IKY0JARZZIeh9TZPajL5tKA7RdyYhY5Q4TAf8bsazHAjDYkTKqzza0Wy7KCZ/oljdgh9homQkS2x6833RFheCfkIMKjE13JeQmuzRMFES17LVXSw8K4U83IvnpiYvC89ilnHVq0O9kxv/o+/cvnfzLw2vBr3ZF6qgpIuQuQAf25+c3vDlnDVU36BPI80oHP3vspKvN2wsFmQ/yNcqZIUZ8fZW+EhfAJ9HohNYH794vZ/SqbsYQdhusmYPAh0ly2zrAnwECPUU2HVnXoRr6Waj+6PmI2NI1hmrgz+P/SmYu3OMXP8BQ7/MW6fa0eqMhFG8YeFMlTeZ3Y20X9JyrMSZFKWJHEfhqIo7LFIlP4+5GDbpPy0buW56V+PnVug1tieqUHNM0G987aBKK6SydJOfEU5A1SUEb8YC8vy8V8In/xmPNsNhuvV2hFcE0gRI33fUqJ2C0WDvw5flBbVAwdHEDkT7b3At4l57bozye8+Nq1FDYtGCrpSvhKMn9Xw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UVXfwMzWl8WLIuLcLXUSv8X2qrcEempo/ed7lRDfE8+ZAV4NgryzIdIZ98trHrarOtxmz8iGrnXP/PuK7Dgm1Sx65Smk8bJil1kxAkNnNOzBvDSbnPCxsk+sIAzyOWtSJekz6GMKfpSqWOZejqoeQsZq+fLy+IF0NUm7zcxVZJpwmCuHYfuvnz56t6LppUGjUmLQxAi4pTlNJlGIMCTvxwDZvroNhsO7CQ9cfhg+Lo7FLAnRjDpFYn/SY42gOBTVidKRWhqnVR57ZNt/NRK+onRxxfN9H7XYgsieJRw1OhlaPWSXK2oIDFAOzWF0UiG+leboMErww1CX0iedfOkVAQyNmKOrg4xRJlbkN6potXviGsFO4X8Cq3KIIrSjmQWlL9CY0HOTHCcBupsQ6TeWSffMIdRxuOFlWKBhhPoDcoBQLvus4nyicr7QePLCGoQx
X-Exchange-RoutingPolicyChecked: 
	Rc+ihENrF8pyFJd5v3upsag5HbJXaru2UeIPHwnmcRj8wb1Sj06xZ+xQN62i+fm1jpDgIycvNuYr+7xXZ8OMch7fPvPBNCeL4+HxCtWq2OiccFb+CzMOgtFQkWWBzoKOicegr3uc4oodszMUgFp8Ur61rE52zYPiyBUt8TtNO1cG0ZFbdLdR1Z7k64XAKtUQs30gC/r63841yE8CjGwAcfelqmT8J1tp8l6RYLf0Jn+ixk48BhpezOqFiVKUPgV5Wt5W31jfM5IPQtLMt7Omz5eMcU3yRi+2D24tXfgcFr2I872lByJXpYUPpLl9x5bCMvUDfVfpHq22PsH8CGeNlQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:03:02.2664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b080eaa9-8d6f-4521-e25b-08df07d58956
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997937
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfXywlB302RtBSh
 MpwHuiFeMhi83fnXgnACeCXXk3JTlard8IaLXofi6auNRpiW6lW/koxGOnHiNgcO8uFBk6NPtPF
 S1eZL7IyDk1WH8g/JBHQIKLQ81ZjWh0=
X-Proofpoint-GUID: D8QETusmOPHxgx4b-4QWBliVCT_UXTKA
X-Authority-Analysis: v=2.4 cv=D+R37PRj c=1 sm=1 tr=0 ts=6a96406b cx=c_pps
 a=HD3DV6xNHsutM5VcLnEsTw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=c1_A9w9KVkEXk37WPw4A:9
X-Proofpoint-ORIG-GUID: D8QETusmOPHxgx4b-4QWBliVCT_UXTKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX3NjLJsyYUIxa
 KFT9TQnr7vq28b7hHdKgUpQTByEGF8xk/ml5Nx3cvAj+PWTNXSwMvroRVD8HFJUx79BUjOtyngO
 4yh3biHa5bOFUknJKwP4rO5Damx3zIqav1rakfrsr5UQJ/qurOQd4ZqCO2CpwwAYAgWuegVmCtp
 7LTv+SfsbtHW7Eu3tOX5OWkd98az6W8L4vN7VjTHtUkOx5oU58vfYloRVsudJSn4NR4OwxTN9wU
 KJZ17KNYvCKmB+MhgUDYJDVIVvQDBKADXCY9hkQOWeBSx4EXxFFMxtrycqHIYGeiUvQMOwJ4o74
 qqVzdTPoAvfRcovnQBRh/RRAfVS9/oAxeRtg/cSCarCgmwnGRGfDZxYSsLYGcHpIGzMpYPsVTMn
 B899+EpRp1hKgkZYkZUziT9BToy9hPzXOzwX2FsVOB2QGRvp/cg6nuiScslQR0LX+DKC8WEyuok
 Js7h9GE+q4VWU47VQ8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010024
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:03:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17637

Remove pulseaudio and its Bluetooth modules from BT_COMMON as we
transition to PipeWire audio stack. pipewire-pulse and
pipewire-spa-plugins-bluez5 provide equivalent Bluetooth audio support.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                  | 4 ----
 .../packagegroups/packagegroup-arago-connectivity.bb      | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f3feb8b5..dd0d6072 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -107,10 +107,6 @@ PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
 # Enable gstreamer plugin for libcamera
 PACKAGECONFIG:append:pn-libcamera = " gst"
 
-# Disable pulseaudio routing in alsa by default
-PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
-RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
-
 # Enable gstreamer based video for kmscube
 PACKAGECONFIG:append:pn-kmscube = " gstreamer"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
index 98e8f897..a1de8f4d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
@@ -37,14 +37,6 @@ BT_COMMON = "\
     bluez5-obex \
     bluez5-noinst-tools \
     bluez5-testtools \
-    pulseaudio \
-    pulseaudio-server \
-    pulseaudio-module-loopback \
-    pulseaudio-module-bluetooth-discover \
-    pulseaudio-module-bluetooth-policy \
-    pulseaudio-module-bluez5-device \
-    pulseaudio-module-bluez5-discover \
-    pulseaudio-lib-bluez5-util \
     sbc \
     linux-firmware-ibt-18 \
 "
-- 
2.34.1


