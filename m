Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB868C982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:10:21 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18681.1789575014168057191
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KyTJSWz8;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OTPQM3bF;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFaUrh3542333;
	Wed, 16 Sep 2026 11:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Yv/9fH2c0QhegJwn1rinPixeFbdy5XSO2uGrgpHbx
	1w=; b=KyTJSWz8NIzOXmD50tZYokLRTxlXQBrRmBBlRV/L0b0SMOnBncmxwBMH1
	lt3rfVn1rSEsSMczB6I/NeXnvtWpmUWsCjE1Zco3YuGLA9Fmw559/pxroZinoktL
	pE3Y6N76pMLsB0M4WSjjO09yo2Ssvc+NfC1ASAh0ri5mxYW150FDAmJDLKa2iEfN
	dw8iMSq+tY07Rvh267rmw00yjv36frEhjz6Gf46BY+IREV51mtjwn4WWrxSNZ6+V
	tNDTzEFXJKpyCc9ZcCyHWu5LWN+vRxLj4cvheFE4nhNAQn/4kd+F7yAVoPM/5pa6
	liVfgV+oxPGOFQFowamGC/VxVsbXQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqqmdauqc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:10:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn34TLHarH88SAe+yq2d7kvqOIVJkHCT8KK8ZAN+w3WdNk9Im1Q8pNWnWWpXsQaQjlmTdcrpou4uK8htPcc9PIt8zKJcCcmyvK3W4ZY3PnBuK5dMNPDMehFkiFABK/FIm5rn5szXe46T+N5LJTxEL9bsuzYaCHVwsBgE/1AY+UPfBh5kQ6c6PPtr19TUsgslze+1zWG04faKDHPKQGy+kmjbHjd/GYv67FWlYCZjfxgYPSQxBBlvC2CwyyY+pkAk3edar21PsX4DAw5gR/V9Kcf9Hu920tWlsxGX2I6Sd42ni7Pa2rTFQ8FAIU8CoCMOMuiqXatVuzapV9wbo8t7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv/9fH2c0QhegJwn1rinPixeFbdy5XSO2uGrgpHbx1w=;
 b=q0LBrh/CcklmQi3B78vBIFl9MbjRRW3Bi6NiXEoe0djirbL/PTOtg95qalYCUs8e66OcKyxqnVeYL+JHX+NirwdJfiLuusEk8KUdilYWTzUek7v38aWdyJD1r/J6dqh7sncMJYug/bfEtXe/NluHANOohoANC1lxaZT7jbul4MOP234AGvzyKnLrOawSRxsPruf3wqP69WC5Dre+ZuYXOP36GFdex6MJbpSMCZaIoegJgq/RzUhQFND7OOPZlNNeeIpIQObELxct75F308oYL/GPlFomtPJgtWHF958Nz0Zv7zyWAcowFv/qtJR/NuXLwM5g2Hv6a869Evfo8o50dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv/9fH2c0QhegJwn1rinPixeFbdy5XSO2uGrgpHbx1w=;
 b=OTPQM3bF3jjYPH0BkQpAzVtOPoUM6mmdeaDEYid+RDkj4gbBic1EhtiqwLCUGtKJc+AF2FjPukySS/uU5wiX1uN5q2K5/kTYrENbtFi0j693hg3RaIbtNzCaKZs5B3YdZbMLs0aQKZJtv4FhMMLyc+swVIDnWL/wX3u7As3+7HY=
Received: from CP5P284CA0210.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:22d::15)
 by PH7PR10MB6250.namprd10.prod.outlook.com (2603:10b6:510:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Wed, 16 Sep
 2026 16:07:32 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10d6:103:22d:cafe::7a) by CP5P284CA0210.outlook.office365.com
 (2603:10d6:103:22d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 16:07:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:07:29 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:40 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:06:40 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GG6dTJ1307633;
	Wed, 16 Sep 2026 11:06:40 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
Subject: [master/wrynose][PATCH v2 3/4] recipes-multimedia: Add wireplumber audio configuration
Date: Wed, 16 Sep 2026 21:35:46 +0530
Message-ID: <20260916160547.1287287-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916160547.1287287-1-p-bhagat@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|PH7PR10MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b5837f-298d-4d45-545f-08df140c9bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|22082099003|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	An57sRy0QlBF8AxgbcBlHNct6LAXFcO9WzD5HiC7JNbh6ITQ3cgr/OB9BJicupo3h88GQNV2RrAet8qhsCXHlbfeeDzEPYdWkFSEE4cNrp2XR9se3qg5bpB+6GgXArMrDRinHpiaPhaEcQA7549ZEkxvQQT4+xhM2Lt+IVQQ9rTvsvyTqG2hsBlnJLIzXGWDO+bkcUqLBo+FzuPo/rYZqWdiKh0IP4oTUAS5zy+U0mz18LmEPqz439sB4GZDqtgwGXNZOBzTkNPF3NPKXovzGT6GB5GQw/EATf9zkeBuMQTih++5oRpZ9N2N8wRwYqMyDMFyANiJzm/G8Bn1g9M3hO+rgMAoxt5uFrnarJe0J3vf4XJ5koyR0owTpqQwLOsyHurU8NZocApG+w8/XDP/exP5YCoE4z571PyTSh8pKTIGc3rIKul/MzEYwIHajvqbtZsWOcZ4NlQrOYN9mtwFIjcgOS7nGXCmNpGHRQuyGcd8QuFOKMM5w4NoLHvDAbZmNAh+XKrs4i5hT3nwW2ITGhESpI1RtsvFqySKSeVrc7ARhhT+xXsfVHO/IMRsj5NBXIIkUhTa4iLVjC4EBAz2oD6tR0UP5Vu9i+6lmJCzvCXzM6R6ffCYaJL7h4ito1Q+hktN4xDADYNauVGzPS+y6bMCLMoMcmW/GqIyH7CCaooX4tklZ0zs5OqCKaV7KuyuB2gUmCbUU7JiGw3sQiYJ4A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1dRX78NymaaLqAFjdvME2Xlth09159BIutBZHINqSWxy55Z5mFYeR12A50MEIR7JXC7fl+Xy5GoTVIcFObM13465rql1FtNhqj9KNKxpayGwbaMUT4vd0VlKYmSnCxsEA8OA9JF22l4FZmuzCs+b98Vk/YQBfZG1KYlYQZKAluXSjywr/ho6gqE/09qeitEJ/yVToc6W59oahmv3Rv0cXQj5TYMrRwhEE5cGnY7ckw+SQSKN9hj3rtMKjN5NclcXXXJ1sGTQxrW5CFJNJttlwjfLMU6cSYqGsuSuSHXfNtsB9rVyQJEINy/+JtZXXm3in+V0+Jb6qFqjyXtbsSkVh7n99+MCTHRlXAxhRWiwOETgUumndgmWOvX2aiQv9IBpEzsCO4PxhcCXU4cD/e2dtMv8dX1bQyeFXfKSrw1/8Uy7qVWZitvyGzAk43qiub2Y
X-Exchange-RoutingPolicyChecked: 
	MjEozc7yd9ZQeBpf1pGW2IASqitRuz3zBqqv4B2VLiIm0MqNeXgG7ickV1+/mqvXjftOUL96gYDyF5ssAi26MZwY5+/AjopXeXijsET3TngcbWbCb/aKSFFPjda0ee8xV7l90hszZrzCvwaW8P/iRnacZW98K3RDM4T6mYOnY77LiRMotlfu6rmeUzlM1amMIoAPqST/nbuzBYdgcf1KncjhrxNT2L52PAHaJsVj2MMMbdok7Y/dydid6Bq2CsvO2rIAMkNXBqIwQ4SLeAbBEaqZ5y5c+9NN9Q1I+1/aIAaUdqyYmhsTHTOsPBwzj7s+RMm+KiRaiL/TXrVeuhqAxg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:07:29.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b5837f-298d-4d45-545f-08df140c9bbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6250
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfXy5JOknqbE0rO
 pYpa00K8aqJbdfRoioyndiGv4OqOvoUNzX3kaYn8kfDDvtMFcx34t12/bPgABL95OBloF1x/W5K
 uECJKn+i1d9dOocIYKcqyC3rceUOiKgRvHq7iOfMLJVW596e4f1Mfi3qqP9JF4zwHE+PQ6ozlaH
 aXpjIERVT066nywg/ebjLLM4mkWUwDCGM8C9+1rlksGHnnypRU60y5s/byFAAaFDnnWeuEznGIr
 OX5lTU0BOE41zYDbHq02oypqKZIt283J+lDuAy3onfBmnAs7E0qEaKkODgy5qaVKaheja/DnpO1
 a9VKLfENAn/Q9PMbV8L3PKHKWC+WG2Tb2qbWRRbkVzAW19EiNxGZmBTIPAEM4ENZq2O2icAlC7C
 fCpfw+FPfBamux+H+fCkfH9wgW/RM3BJwGdOnVZqvLkJjmNh9Lx29+fcl6Nb/LctQE3wOgtN/b8
 OxKggf5YedndIjzpcxA==
X-Authority-Analysis: v=2.4 cv=S6JMU4sP c=1 sm=1 tr=0 ts=6aaabf64 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=ZsI1D44bINRuIHTABBAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfXzcgqbj6wh5YM
 t4FqL8SLwC/A/7iPYLwo4wg5O3fQlvwmWAcNewKzRAa9Rc3M3yYPO82lI/rizxh2t8x5mRSvWy7
 G469jeb19/Eb/medw8qL5QJV8A/ULpE=
X-Proofpoint-GUID: CwdaIG4IJUx7pK-_Tkk6gxr3Ni7cPsYR
X-Proofpoint-ORIG-GUID: CwdaIG4IJUx7pK-_Tkk6gxr3Ni7cPsYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160220
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17678

Extend the wireplumber recipe to enable the session manager on all
plaorms and provide AM62D2 EVM specific audio initialization.
A set-audio-defaults.sh script is packaged to configure default audio
sinks and sources at runtime, managed by a dedicated systemd service
that runs after wireplumber starts.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/wireplumber-arago.inc         | 25 +++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 4 files changed, 82 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
new file mode 100644
index 00000000..c90107b4
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
@@ -0,0 +1,25 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/wireplumber:"
+
+SRC_URI:append:am62dxx-evm = " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+do_install:append:am62dxx-evm() {
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
+    fi
+}
+
+SYSTEMD_SERVICE:${PN}:append = " wireplumber.service"
+SYSTEMD_SERVICE:${PN}:append:am62dxx-evm = " set-audio-defaults.service"
+
+FILES:${PN} += " \
+    ${bindir} \
+"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..191b89f5
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Set PipeWire Default Audio Devices
+# Wait for pipewire and wireplumber services to be started
+After=pipewire.service wireplumber.service
+# Ensure udev has settled so audio devices are available
+After=systemd-udev-settle.service
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


