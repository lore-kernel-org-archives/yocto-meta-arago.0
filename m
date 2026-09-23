Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EF6C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:56:35 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.352.1790175392545499073
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BdKYOaD0;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xFM9Nig9;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDYnup300279;
	Wed, 23 Sep 2026 09:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EkldVPOZ3mw8S7VEAeHVkR9oUi0/VlrNwmTs5DWX3
	aI=; b=BdKYOaD01k5EHN2ra0U9acsF1SnbiI34eAex12od2V0mPgFP0LegJt90f
	vbQc0A6pV0xi8LDG9VT+tIzuxujlSQCkXCUj4QocPmWBsVu9amoSjcm6dkoAvbsw
	6rIqBx9HBZg7MhrsrP2ut6ov7U1ShKEZL8RauBxFrNBzPZAbouHR4WIm5Cha2eg3
	sGklpsAKJgRXecNI+wXkNNvsEdBeCxA8o03Ai04e3QlyVoTfERb0jameFc2Lfclk
	Sh7F1OKjPqAOva5eWcDs8PBmafw6LgtpFevMCEKVJzgi6zBo4/YN82MkAXfcm9YQ
	gvtKAagsLhK+KTmOo2B7zaNQORj2Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tmanx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:56:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5szuzROonIhtGJGZLy4JAF9X72JUCunFlaBPaFwB5hxwddmNN/2gtLWf0z96/cVKBdCJuEKJz33hfV+Y8r7F7Db4F/NCmYAeJrHHHGowYlcDipG7KA74B0/Zd5w1GbL7IBeHj3mz/vzWf5ztZoVThmClQxj4r/clJfHRcodtfK+S3t9t74nfrmr/STXpnKx2svzZWHnx7dkWO3J1heI/6aBmEGYV4i7BrUhrYj+p553kGaAkYHML3WwTaJBlNnpQIQWcvX++sgHAla80KW3bClULUqYXCgTVKEbUi2+KUXS/UTUL1xKs3HNM/Pus5UxxD48DmzDKbzhBTIuaeXDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkldVPOZ3mw8S7VEAeHVkR9oUi0/VlrNwmTs5DWX3aI=;
 b=N+ParcoydHavGfYG2ur4CL0YOwQkN0oc9YLuNo2Hax9SpFwidz7DVs+Tk9/b9XHRUQmdDXHbseRr5m2To1qQbbn5Bu1WK0iHHl5+vwxiCsm9zZBQsLMC4wxhLwN6EvDuQWsh9FBOCjrPs6TVVVt7EcNjstMtrxDih2uhsTr+ATeriXSvrjflh156hgXcrlLZy6/IB7+Ps6kynmQ6y6iaTuFfO9XPoOM8bGocrWENHj7+iElayp214QoYVAQzF4DF+8ldKtiav9PFUOTUE+4PK38npD+zz/vj3FJnIOd+1Cm7TMXbIRXC0btdyiwaFMDAVGSFqkd9y396ev8CH9BUBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkldVPOZ3mw8S7VEAeHVkR9oUi0/VlrNwmTs5DWX3aI=;
 b=xFM9Nig9TRGAn5RrIPcgQIQ15nzkbzGRRxQVf5+HlEdVTfDaVPgUH1ZNi8twQukkW0UZTEL2feM1WfikaawHNOfATDMb1GZOcKRy75f/b1MhSLqB9YtPCaPE1lugt1DVLtNULFUQ94aLn4llefPG7uPCaIjoY+UEtJGfPQdaFxA=
Received: from BL1PR13CA0102.namprd13.prod.outlook.com (2603:10b6:208:2b9::17)
 by IA3PR10MB8418.namprd10.prod.outlook.com (2603:10b6:208:57a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 14:56:26 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::2e) by BL1PR13CA0102.outlook.office365.com
 (2603:10b6:208:2b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Wed,
 23 Sep 2026 14:56:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:56:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:09 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:56:08 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEu7mH3134028;
	Wed, 23 Sep 2026 09:56:08 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v4 3/4] wireplumber: Add audio defaults service and enable session manager
Date: Wed, 23 Sep 2026 20:25:42 +0530
Message-ID: <20260923145543.2140007-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923145543.2140007-1-p-bhagat@ti.com>
References: <20260923145543.2140007-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|IA3PR10MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: ae94b87b-01e0-48f5-7f16-08df1982d79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	kLD2TFPxfAayYXlJgzcAbgRmKpUYi+okJDyYI7uqy/zc5g2Mv1ff75WUIANYNbGaWDZz/bNyw2FJWsVL5wJksKbtvzwyQTyVjrh8PoMh6Q/dzyRwzkC43ZDHvaPMorbzTXd6q+j+Dex5dR0RgMKnxhctaErrz95gqF38c5L4r7TeVdk6UmYORK9b+KPNRbzdpk7UKefJ4cUsqA+ccnD3bLbxCeXRofDVuF1GAH8mXSKurLXp6U19HaAbpe+lU1kWW6ffKp0IxlaU6UxvloYMlYc9xtVvjpStSykx+btrXsuMt7oBoSY7+1yu0l1PeD768JFJABBq0iXJjENx9IGTHnSAkjbZviwZsiUic3I89wLiEOJyPqjFhRs5APdtQraU/WGS5LDZuairVpNicR1mJe0JdSmcbQnhYL01jm/8y7+Fbv0PgjsxG8kHZIlVY+pkBqq6/pmd0tvEg8nNW/rmC5T6uwCS2VpPojBwCEFtNMPle9ZX04Qogm9B0NadxlFK0JbNzpR8uDf7tRJa9wXCgZrVdlvDRh+WRjvQ3t9wj8HTZkcL7uEutWNSGRTIP85RX3ycO6tfK0yPwbtI2Gp4GgTJZ2CYNiGuSpyl5FY9UwTk+nT5sznRDmSMYeXIuortZRMzaggyvU84ShjZer/WIdk6WrJlj4OVVQXYkIbgcf40FpjYBVCVzsJpIUnnDlfx6IQbmrc1gysZvONosVHlDQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dYPrpcTph5XNbjdXm68Yjb7TEovqVrhN00L2jtdlB59UgYIB4CrUu04u9yIlWUHVuYUpOAbPjThGtmp4sdcFdlmvGhGC4hpck9H9BGQebNOhdLx/eSt8Wr1JalcsNhZjXd2oONialthHkW7fkmfAkEolVnAoPwg+hS0jCtiDQNxpCnwSHbAfbQbGT3jXw8d6bIDR6lJZtVhG4rnnf6RIa7ESeAP/W3ixYMtkwVCVpSBGjWEnby7GKtrulfBYCG/KY0wPVOr/cY9PlzroESiUS/tX6+35cfYWauAw4adqIOjFfh1yDqZH4391om5XMbudoTSY1GIHkxy7FDfT+hzEzh9l016Y5NpdgfD9CmC+BwnuL4Mtbf73vbxUvEv1I3z0U95kitbS85vfoCARXu1yRPeVznz8UhEtfdGeP+TkzuxUax6yp6TI2j2C/QZvpL1z
X-Exchange-RoutingPolicyChecked: 
	TXrGDdqvmFZp5X8abITbgme6M+ZmE6wT07LMtZ2ammliiprXi8jIiBeLoDKM/TOrNx6zXJffejqG++D+dTVv2bQ9tp+jmJILqRbKIeV17QWWjvmqwEydkf2luz5e3/TH68i+7sHUZZU5xKEpCIEu/WQ1qR5K0/Pw4S8BTl5oJkepKnplB9LZ4H52CluzEA6ZDSEeivKRMRM+WeufKHQAn0KG1A9dV9266ZMtW1Fpr7VmV2fDoW3uiklNepwQRvSAZ7K0ZPPTYFj4l45uPJkUdV5H5qYxNhVsoY9sJdTci19RR3yyQpbR9n5M0TZWDDaeBRlAN9i2n4yA9wg6X5Nhuw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:56:26.2446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae94b87b-01e0-48f5-7f16-08df1982d79c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8418
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX/SpKjndfPm0G
 dEyh4FfwR/sf6m4ZooazOVKRDWaRVDHevICfPSOPS3yuUEqq3ocT57+DwzL7kxszeJjm1xOJ6yd
 SNaI+XSJPlcv2+eriZO2RpwHhsT0U1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX5zTuw9h4kuA0
 qqqZ5qnQWBwTb91wIo+LkoIUCO9Tp+M29RqYK1WtTMHV/I/63Q9hND48Z6gSLBerIRnFECQoaXO
 YiYY+zZ5SVEkhVqXErvvGWFR9e0J2S+nx+tBSLIpwbOtdYj+1Y27T7muzRxbS01NhOW/M1tplok
 oBLZUO0MEs8PF3tukQ3IsxxmztP77YtYxCAXGWAhId6nLgee/KN0mv1S3KzwTj7ZewSY/rzFNk4
 Yg3OkCWfcuWj+kh/AhNgxhF5uw9+aR/V1X0qdDt4UHms6AWnegY4B3kx/2zuXxy10gGrAVEK5dL
 y4EbhGR7AB8BM81txgY14mXPpNivL14O5HPlm57iBE6q26w2bL5GGvSwO1Gj+E7nUoTK25OR3US
 G+IskFk/hgX9br/75+2SX/WXk/cDfyaCcmxZeXBPgZOqhRrMR3K3Cg5RM7jYHYzSgYrTpmzBrtI
 kkm5ziDVIGaTxi9/WKw==
X-Proofpoint-ORIG-GUID: uzxUx_23VKCPRtgXbNNerbao6OtJ8orQ
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3e89d cx=c_pps
 a=kgXPJ/cF3Xw5T7/w5pCavQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZsI1D44bINRuIHTABBAA:9
X-Proofpoint-GUID: uzxUx_23VKCPRtgXbNNerbao6OtJ8orQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:56:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17696

Extend the wireplumber recipe to enable the session manager on all
platforms and provide board specific audio initialization if needed.
A set-audio-defaults.sh script is packaged to configure default audio
sinks and sources at runtime, managed by a dedicated systemd service
that runs after wireplumber starts.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Removed platform specific changes and updated commit msg

 .../wireplumber/wireplumber-arago.inc         | 22 +++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 4 files changed, 79 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
new file mode 100644
index 00000000..158734a6
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
@@ -0,0 +1,22 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/wireplumber:"
+
+SRC_URI:append = " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+do_install:append() {
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
+    fi
+}
+
+SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
+
+FILES:${PN}:append = " ${bindir}/set-audio-defaults.sh"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..423972f7
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Set PipeWire Default Audio Devices
+# Wait for pipewire and wireplumber services to be started
+After=pipewire.service wireplumber.service
+# Ensure sound-card is ready
+After=sys-devices-platform-sound-sound-card0-controlC0.device
+Wants=pipewire.service wireplumber.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/set-audio-defaults.sh
+StandardOutput=append:/var/log/set-audio-defaults-output.log
+StandardError=append:/var/log/set-audio-defaults-error.log
+RemainAfterExit=yes
+TimeoutStartSec=90
+# Restart on failure with delay
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
new file mode 100755
index 00000000..49be177e
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# Wait for WirePlumber to be ready
+i=1
+while [ "$i" -le 30 ]; do
+    wpctl status >/dev/null 2>&1 && break
+    sleep 1
+    i=$((i + 1))
+done
+
+# Additional delay for nodes to appear
+sleep 2
+
+# Find audio sink ID
+SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SINK_ID" ]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
+else
+    echo "Could not find alsa_audio_sink"
+fi
+
+# Find audio source ID
+SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SOURCE_ID" ]; then
+    wpctl set-default "$SOURCE_ID"
+    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
+else
+    echo "Could not find alsa_audio_source"
+fi
+
+echo "Done"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
new file mode 100644
index 00000000..541b2963
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
@@ -0,0 +1,4 @@
+WIREPLUMBER_ARAGO = ""
+WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
+
+require ${WIREPLUMBER_ARAGO}
-- 
2.34.1


