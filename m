Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA0FC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:26:54 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7064.1790072813462469904
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cgTmlxLZ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Tkh4Se1v;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7htZI1034837;
	Tue, 22 Sep 2026 05:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bVVhzuhF8WFQ1AKomMHf1FEzzI+050Uqpwc02FUEb
	tM=; b=cgTmlxLZHbbPPgnqzeuibsYau2XKiOsJOnR6sjFOoQlSW8bkX96TuCsgb
	r/fIsD8NeQbJuLcfVNNKOq1h/5H2CdrTKOuV+DawpYeNIeGIbCcX+3nIt57Fiyx4
	5PL57R3DWwKvTe5uA46UkvKNBMnQz8MyUixRd5Chyp965GzXOCbiBzrAxj1jE7kz
	E64WEuP1izV1uU6e5ZYb2CGwoOWOayrMg5ymfior8qnO4tmwpfzw2wOhwpb+H8st
	XGxxNE4vRYCQ5sUqmZyvefj5avFfQcwmvBa829J/xu71vaYThV+rtirx8dPpEvbP
	violgdgIjI5Apt64IlG3ePViXYNCA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm27ud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:26:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1Svj7GpOOdic83pNnkOnzIoDOzU7uEyoparSlYFRtOTwcoY1sO7O8AsmAmzbhTOVXJGY7VGqUTMk7ENIfd4Al3C04S88ujCN+SZ9YcnRjDTrKMqpnOe0kFufsZ90SRqEorVamxjOw0WI7LWEbkE3w/iSeV4Um8QAM1Kddoc2BLTc/YAk7pGd6U5B601/fbhIFrOo/Vcqr+D5ww/TtZSbRJgaYbjR7OqbHt8GW0hOis7z0icPB+qyC1q5F6smSQasRum2HrYZEFrPwrOA6FNaHdHJtr4v/8f1GapMkHGzZZ9eqiHYKbhFTA+nFXpByPAp1IY8eQJHD9aDKkpGRfj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVVhzuhF8WFQ1AKomMHf1FEzzI+050Uqpwc02FUEbtM=;
 b=DDIpvn90xt7ozmKn9IGk9Ez4YjAdLcCUuSTkeU5M+Pkncy/NoIsyPLxVWTKVsUo+w1mR1QYlQZfQZINB1xNuMIlS8NR/pIwBN4zTgG7qGNb96O667It92ETtOPSgMCf/m+1bvpwTEhS60PVtKhWQzxzf/KutoQJ1+LG3CoCg87HU62M2xrvt5gRSKpAGSneFMYWnpbxrSTjJdJ5Wbn9l8qRW5POBm0PCPF8pkXqba9wz3XHAdow6iaV3oBqKV14KRxQYDqC0W8U0hWeeoWcyuHGRCmKjnnwc7xH/zhSmQv5o4JPKQWXUCigZsmu0I119xQJ2P7xo0Q/UI84gz2RVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVVhzuhF8WFQ1AKomMHf1FEzzI+050Uqpwc02FUEbtM=;
 b=Tkh4Se1vLncWq/aK3iOp0cLmm6tx7yJr2/i3lJ7w1SENSbBPJIocjQwthu6Mb8QlqXon1iMOpiUgfg/OHnDgAekDFxZatXnX6iTp1KZ/rKZzezqfc8eC7jr3CVPUTIhL1eikt1LtYXVtTm7IFwrtTvcleJP7o4X0Awbgn/Tj8xc=
Received: from CH2PR15CA0013.namprd15.prod.outlook.com (2603:10b6:610:51::23)
 by SJ5PPFBC9E970C5.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 10:26:47 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::45) by CH2PR15CA0013.outlook.office365.com
 (2603:10b6:610:51::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:26:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:26:46 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:39 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:38 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQbax3957907;
	Tue, 22 Sep 2026 05:26:38 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3 4/4] packagegroup-arago-connectivity: Add PipeWire audio stack
Date: Tue, 22 Sep 2026 15:55:59 +0530
Message-ID: <20260922102559.3717785-5-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922102559.3717785-1-p-bhagat@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SJ5PPFBC9E970C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b814ae2-c2ce-4407-9e93-08df18940181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Hj1dHWtDawR3cVDWlksbZ/KB+OQ5jjQNOSs43h5QZN5gyoZH0bpjAkmScF29bBsLy9pZ8Y6wGW9ztPfqggo/Il7x4kJ8+NYK/Smk8Cj5S633nPC5+AL6XO9JQRrEr6BFZpRkmKGBh0akQk3KcGmJUDft8ZwDDxeA2XOJTU46KXmZ8+VkSXGXvt2ZYmT0120MQa+r91nVAJ4Uzzj75grSS0IqLrB0kzqo3YLJ68b0E0NrIsn/0NAMTnfzajmayk0WkgsZwSKIvOwyz7h8nPVPnHLI8ZKh6WYh39Zu27KaxatpmoNKDBSbJu2R5jNAgsw1FMN/PFYUGa/KrXZcGSA+OlCPpwzPQQa6OrbRxvU+yKlzysLuEO4DmHSKc7Qbo+10j3JoNwihCazTVrcDtkfoaVZWqCY+xzaxMpkj/dU6Id+ljTu6WP7jbV+4vZgN7E9stX6yAPyvQbF5NXUBgzRClM8nq+17leS4EKRDcmmQt9tZDrTsstdxddy6T7i5AW/Wj+xfa+SNuLgO8JufD6HQGEkV/U/HDLv5CXWjZ5VvbmjtwgeWq6wWMe/TmejN1AmLIp3adUeRA++5iERYIqk1UPTUTHQg39+4iowkZjVJg6rUBDL4QmMW3ejg8OByH9tIH7X0gYMfT51YMFaSZsq+I88my7KXQ7z0afpEUD56U72Y23ZqZW3qExJDjXZPcQdUlHQ8A461EwdgCDySDA9oUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7837B3Fo7PqYjzJbENy6Rx4ysKoVRsSojyAvg5FNFUTsYVsaN9YXOurpjPqQS2HnCTPOVZaDez5HtFYX/P/QUf7uIJ2tMZFvzO5fLoWyUr90cvDlYFyfvRFiGvHCbp6aSzzyjPMs4kSbeUAJaL9TGHUoPDO0IVFc74IZYFFfDTle11EG0ABC/OPLLsG9wvlHjSePZGkNwkNcb9ZPjS22/o4eecw6RgqbaXC/eTB7+qyfeFT+3SPOVCEqu1HwWGVpMUTaPTsT0HwCrbCZ8dLwzL75ATjq6MTl3yWVo1zlHTNit54NxNRXPOW3xvshnPUm+/EpH/ywNxHzcjYMjS3eEbd28WMBneYRaX+3j0O8qnksA1aVCeUTvY5t+9881KNYDYbP5SAVp7k6WFWzWbnEBI4juyMqBAZ7iem+UHzxgXtofN7uoMhwfo2R3ed/Rmiw
X-Exchange-RoutingPolicyChecked: 
	sLY/MiI8VIVItfV5WcRduDSVBKg6RUTlMjOf3/rLsA3PXe/lpmiiVYPMkXqPap+Z9Y0lrux6E7r9Fut2xPpp18WOHUlchpE55gTeGgykj1ihlulcavySoIxAQS+OdYTlJZCSgpPDYJhtN8pj8dWqBgmOJT+shenqq4UFE9nfXqDbnN58aZA8GWHKxIQx0ojme5nHNQ71xHELEEXALCZvodRxo/j2E+hYLDqix9AqHUCbR2BbE3zp6aI7JgbTAQ5QAznH3cRZhWFS1BUhlYmumxuFXfhmHb9dtzjdltNObml+YUyhgUy6CPb/p7lVCZ95niS5wS9/d50eUqEVF1jf3Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:26:46.8705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b814ae2-c2ce-4407-9e93-08df18940181
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9E970C5
X-Proofpoint-ORIG-GUID: 4wLYxTx0roLySif9s2DIS8PDvpcoRCCI
X-Proofpoint-GUID: 4wLYxTx0roLySif9s2DIS8PDvpcoRCCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX76fUUHXAV6YM
 cdW9ubWMUvm5/lminRqEsKuygMW/mfzJCmcCSM4XQwvIw0SJ+pESKsY7uXfWE4rCGhMZn7mbbSl
 8xISdQnj/NpbqbVhS8hhyaEQfO04d/Jnb1gkb0STAWYh949dm0Xdr2tq6ldMKEblYTlRxG4qxpy
 wnB8jZZMCAJ7xBPjSSyKpCMbFLn4qZQCCwEGqjc65BSOsRqhJ2JSdb1LhVvAbIUMU34Oc6XSrTi
 Nh2IHboAJpyxyu/vMFpuB9t1rHrY3qeu5sVEU0bwuZJ6uegYSxCmpvJ0VahywP6/pVsGWNgCTMM
 WorRhOHwtX+zcf7jrU1E+4nojd4hwY9G0Xi4/XkmTybwnCKIuPfQb+sb7irX2N673vPilumchrn
 D/hEVIq4pxRC0u4+xO5T44N24l3+TUVFDUxeMPz9Ag0UuIGgSZo2TqUfi4ebBKoWALa+xe6ZpjE
 NmlcNAS/J3hHkss2DVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfXydpzj1cbCsSK
 MKBC21Ds4aG/ntJUSrMl65dFCSfJPRlfMLAYHvLrsjBX4Xc7P0nw7dKyhWxKUjMQjCPPeNJdZ4Q
 /tClRgnM+iMd2rzjz25r0MSjDO/nxlg=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab257eb cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=bD3rTLWZ1uVxStX69yMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:26:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17689

Include PipeWire and WirePlumber as the default audio stack across all
platforms. This brings in the core PipeWire daemon, ALSA integration,
PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
plugins, and the WirePlumber session manager.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../packagegroup-arago-connectivity.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
index a1de8f4d..35a6e59b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
@@ -50,6 +50,23 @@ ZEROCONF_TI = "\
 	avahi-autoipd \
 "
 
+# PipeWire audio stack packages
+PIPEWIRE = " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-dev \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    wireplumber \
+    wireplumber-dev \
+"
+
 CONNECTIVITY_RDEPENDS = " \
     htop \
     iptables \
@@ -60,6 +77,7 @@ CONNECTIVITY_RDEPENDS = " \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+    ${PIPEWIRE} \
 "
 
 CONNECTIVITY_RDEPENDS:append:ti33x = " ${BT_TI}"
-- 
2.34.1


