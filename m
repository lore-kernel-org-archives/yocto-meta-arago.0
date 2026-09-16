Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFF8C982CC
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:11 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18600.1789574828044784785
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UiZY3MgS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fhinK+NM;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFaVmW3542334;
	Wed, 16 Sep 2026 11:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRh
	HI=; b=UiZY3MgS4zrgKz3za+gMfmdeuSxgUY1dYwAmy0WliprczXn+sQLhvxouo
	yePBbt4c06X3+u9X8i2Mm31z4aq37iL4l1VtHuEH6mt/r0Akx9fDy+csNvcuhcto
	WYEhUbbu7b8VAbdVserjig1Fn2UBBe6XrK8MID2/yIa2udjl6GqTayJ/NosHB4oI
	5ybQuq5F3n+kvWX2xM0i6s8KAoZkeJqVnzej96fIz+w0aH6+rp1p1JV3CMY8IWMm
	Rv0ikMOKR1Dm0/oqaA7FIuArHmlXKUF/nCBMmBpLqk+LyfdwbYR/lXKxtl8DzY2M
	Ltt9dVoG86ysXJRK1pfU0PxxrY+9A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqqmdatug-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:07:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qtkx4+qHsvfiOLrlQCPG6TT2+dM9QPJ5q3XfFNgm3CWP86faF2fJtsgY2Co1dfHj0VCDB2Do1PAgNhlqdOsRALrP8RHVkG3xiGERvps6I0o1LQRH8/mxSFsmmH4ygHcZ36tMDJsQ6Gm8F5TSYBxKKOuEW54C+q3RXhPhntLZu1pJIjitK9ly9YpBrt7ynIlNCVKuELfmHzeQMSaPQfK5nuXXNzHdP9K1bXDDATmYqmLOLYQWHMn8NqaTR/Th+nREOs759wB4+hmkyA1o6mXgWtXMelYo/1g6eWuh1rFsKW7CrKGUROaJ8tnISaZJhy0GQlPrgeQ8j3yDjAzwnlfFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=Nupx8OjL8ZpVlJuR6+3l+JUoVw42G4G6UIAT577H7p8grJtTOas9ANyJT2g++kAqS+BoY6HYczeAzMRLRST55vZ9+S/vlUZq59r9jJ1OYipRNb8PrhcXbDRCxFXXoVvvQTzrWfrCMDXOJ6TrU6ydLMH1tuC0mMpQPYEKd8J26dtoqNeoHEN2iD9CPU/noRYprIchZUI7bMNr4HKWZrt6GBGg9fwcO6AIIop60xkOrb0qSIXnQT4Phqwl7A9QYOKR6P04uukakRnKM4aA3J12tzhMCOSaNmxYSh9OvxdNuQsqNm24Hcj1iemGFJ2rgVw0CTZfv4Swq8DRtU5nwDqHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=fhinK+NMRy14oov7r2OddGQ5ZwyrDMi6fhwEhy/ywYX9BeYpqaKnuLWwPcwzKAC4xVzIbilmD2nh8NOan+HogdJuPniKxFmbnLD0irNy6Fr2pqtfw26lLuJdJ0kAN8RKZZuYGEJcZebs/TOUHx+uK32oyP6Ipxxy9YWUY/nG0lk=
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by DS0PR10MB8197.namprd10.prod.outlook.com (2603:10b6:8:1f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Wed, 16 Sep
 2026 16:07:02 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::46) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 16:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:07:01 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:36 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:06:36 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GG6YkN2261191;
	Wed, 16 Sep 2026 11:06:35 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
Subject: [master/wrynose][PATCH v2 1/4] packagegroup-arago-connectivity: Remove pulseaudio
Date: Wed, 16 Sep 2026 21:35:44 +0530
Message-ID: <20260916160547.1287287-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916160547.1287287-1-p-bhagat@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|DS0PR10MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a3e6ef-0bd2-49b0-abf7-08df140c8ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|6133799003|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	eGtF0gE8zvC2bp8Uc/lbncfyGTq0guldyvkdNVP024psRevh7TlUsXYpDvlCK4M4pwt5AgQaK8HOD3hBpgWltPNzysIEZtwWeuy8ocpjfTkeV03oTmK+nbGcit6NYwmAON/F3PYRju8pEx0vL0NRDG85SGjstgHKlfWru1DRbtChzu1j9Yb8QHbzFEsk4M3htLINh1PDIPC8r1nUmxS2D15MD4qD3RoDAm2ea0ycWdNpYKNOJiEYcSD2GVAyx4SpyBKNNvBLiv5q7qaBg8ZsIYAb7jmTrtktQnxDdySmkWoOrEkCRMRdtwXCdMIsMP82gq9CWGco9qCcIplefi6nL1t+5sQuN+1+FlYoXjaAaFS1W7rCrHQk0dH9RepRq+7ahrOJNFktjALzN4IUeiGDkFwaVOsEeoaLEqiIqolCsZUQihNbdTBEOT/NHsS6RJvEdUzCRnjdFR/Y0A17uNb7EZrb5kigOLopf6HG6gjhZD+rMSc2jZQBgcSGre3hCvAqcR9u1bz8p36QTKRte/l5uAlsa8opATDKzdbLlcTUMQrP3lXfgSFRWJ1RoaiQzIOzVz9j//88DFWLj3YPXkYoeGRnlHGPEcJ/CseRu8PPT2+x4JB2paqxnS6qx4BKDCvjkJdlz36WnvYm6mF2A2+WyUn+y6dHz/QD2hOPuUK3zdN8bP3GRvU4h2R7GNeiEC4o6RXNM9G74cuYeEqDfJYgiw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OPQ9jszP+xvAIg1mT7Z6koZTBjfNQdnDvCIW57dMQUaSsKnm9MmGavdMouavRmXon26aU+HZG93fy+UOM5jug3gcE+eDsXRBXEa5OVJ3fJN8ORooEPC/iUrMXIO1gz4wH0xzrkc5iLVTDEvpay/nbYpATL/Jaw/e0f9bLuNwq4sSvUBm7iNNgzzHHDvEaxfjxHk5CKXCViPZC1MSR1vWwqnauNEg0holTfspYfH93P3+kM1zrbG0iSqUEw7+ioDqV6Pkz9g0z024cr3QGVsIUu4ol8D5lhSJc7/JX05/X+3nhq6AI8tl3/wpjJcJAioV7rvah/HRbPHKP9keeXfTSrN+bOJVad59S0ODa03Z6ZhIZOWww3LSqHj/mqfAGHPOHp+twkjDJp2pitb+nNT/urJBdA2K7JRp/9KEY9VhAI/jxIR9rRe2w7afDXPLSn8B
X-Exchange-RoutingPolicyChecked: 
	wa8IR9TuJHOmU93wrJ3FfGh7juxwZwKpAtevOhPMozDS4RAl5BqgWHd6YVvbYnXNah5YR9AwnncVyuecm1J3YQHw9JQXPKMVsGVXcZEeSoGgCoRSyqKwmTcPqPyzut2ES//GJX7i3FiDOuy+hkF6NdJmk2kpltPDTNC5kVlvky509kG33pEjRWZKv79G8HeNYsSuXP3DAkQqf8Ilcm6d079uIfk3IXCz3eUuJyj8egSJ9Xndppudv+au5pw/z0DzHOYpkqQGVZRt1nEcI1kUk/sAbJWeqRVmhI4Eezw86Wwb/mMP890nJMj5sUiiyOHVJkXBcE6dp9A6Q3vmR8/q9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:07:01.1914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a3e6ef-0bd2-49b0-abf7-08df140c8ae8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8197
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX916vMRuxLdq8
 jaTXurRZOofPo5y5pgocn/zHYpQU1efzakyZSSH9nAVIPFT+q6di40mqVZFXCrtXqymqVbHjAoD
 wAEEtIIjDg218YO9rSIRBuPHDERhemBTq+iulEY/nZ8gUiBeW8Nwt4e4TR22aHKwfrtmBrbWZpU
 MeVpbPqmbRWE1qDCr/kGPVGh8Wll/0w/mNrr7u9Euz5+Td0ol4orAlnT9zNoA71IVGY3B7gROEH
 D6SH1IemmY3MZLktBPOQ3gx04cvzftXZWfsmsDZ7Xhk5b5ndXr6uxgTe666DiQ5jw0ISyX4agcW
 FLDZCoq9PZroSPhij0YIM7UN+y2wiKFLRZMLoy7eq2CmtdWtlzHHbdz69GzGbbKvC3DAaHITtzM
 ZbDazAi666qIkNitaxgfayrV4jEWUcYxnTTzcRl1mqzejgm+1Kuc6iJW0Nuk4NB0jSrE3363foR
 vqjhix4hJ3PzCLsOU7A==
X-Authority-Analysis: v=2.4 cv=S6JMU4sP c=1 sm=1 tr=0 ts=6aaabea8 cx=c_pps
 a=2E9rO6gqkamS8B1JEYjvvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=c1_A9w9KVkEXk37WPw4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX4BVPzooLmJ+f
 9/5acjhXjsWlZsWc8eX9ha1qv10o6c1eLIWrmnpnyLrQbgvLsqJnM77944xwxalJZbSBrhCKAyt
 KbPjbJeKV+MY6B2JnNPge0bbOCgnzbQ=
X-Proofpoint-GUID: viRNoXQaPTR509PmcWSyGHC4lMCzPfWc
X-Proofpoint-ORIG-GUID: viRNoXQaPTR509PmcWSyGHC4lMCzPfWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17675

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


