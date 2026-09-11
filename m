Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD14AC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:40:07 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46598.1789152006652385933
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LEPTRQie;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wl8V3PjB;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHV4D52544666
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=hR37Ezjj4LGw4
	7rbIU3oZFIOsIW7saT9lqOhsnOdSa0=; b=LEPTRQieFOgjbQHA0Hxyn3xxsMieT
	Z8WrScEobSgPtqn5ADi5rkFgrrPQ+rJZofkeZ9yj7x4JEH8LAjh3YgM2550UiOlk
	JfbeYQ17fsKPhMCNR7yN06CWlPGmNYZFQej3Nb8CkzZGZQsvgl84bOEGavnVIQ/+
	a/k+sFOqobpBO29qdQnu5LT41TrAfrGygM+GQISYsAKiyy4/h+L8TWeZQaC5K8u7
	ZsiRN/GtXMaSxL8B0d7uc768KQsCCd7s286Q4rxKEVZwJjNtMh2SOprOXgz4sWL1
	QKPtYFD3iXV9mEV2PehQFc2IGCiJ7knrPKUXwhnN013o8RY7DbpYDoZ4g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9rap8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:40:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEPNETj2TpTHtKuUpGb530KRowTh+nzr2bLdj8sdzjA6T/OUQGeXEh8JeLaE/EIR0XbIZ/IShdlN6Xu1y9SDZZ4FXQWhEwT4lkgMUlzaSip0EgsBjrllOWYXDmpjGJkZFexjOzA5MR84sK8M+8aYqPiC039hhPsnRLL3mW4NTXjqPlpcE0fOOHM9Li9xVlsJhzBwyQ8ZVtjH159evDa3PwXVVF1izJlrZ3TXOCNmbFTopWRtCdH6s6oPNUc6RIvBfyG12zwlMtf1p+gzdJQNGjSof7tunC0gxUvjYpFJhf8ml3jWdkvsKv/4kFFNe8NgNmrhn9GsxVB9q4NIIfnofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR37Ezjj4LGw47rbIU3oZFIOsIW7saT9lqOhsnOdSa0=;
 b=zTIswyMqiojJ13VfpjygSTFLWbwAAGDPUsWFABUR9jBnfK7CKac3TZ7YE1sQExjWAAoJlMzUfNf6Z1spo7itO7+75OtzgHbdmqx3O9+g8m4ICyoe0yfrkasKOdY5/5sSrCnCF+uPvX0RlY457e6goX2mxYkwu8VFOUw6rqpfcXxFsY5i3kw3ySkd9aWhd1GVyFi1FQB46cDta+rk5/TMlsitp46kxwn2+aI2SSJSD8xr4kTJ9Z7my8y02fn8OLf583zRUx3oqECdcgr/H7VOesVZaaCzVmkvhsCHyaKHryOf91pca4xkaYzzJ2PhubTJ/ewPeGKO4xxqtEydICzSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR37Ezjj4LGw47rbIU3oZFIOsIW7saT9lqOhsnOdSa0=;
 b=wl8V3PjBfFTkMZppeiQxPSdizQNv6Sel2WR5Z1yAnyJWcBx/l65gtKrCkq10G9HLu47O2uVnapldaDn9/+oGTV/ll+yTA34IrAJPn9/sRS+cpQeeLrbOfSfJmkRSgpQqoMhkM4ewjbwXBTB/VrAhEs24IXkoqO6XntqGWSYtI2M=
Received: from MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::14)
 by CY8PR10MB6804.namprd10.prod.outlook.com (2603:10b6:930:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 18:40:02 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::69) by MW4P220CA0009.outlook.office365.com
 (2603:10b6:303:115::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Fri, 11
 Sep 2026 18:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 18:40:00 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:39:05 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:39:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 13:39:05 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BId5tG1610127;
	Fri, 11 Sep 2026 13:39:05 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v2] chromium: restrict force-h264-youtube extension to supported boards
Date: Fri, 11 Sep 2026 13:39:00 -0500
Message-ID: <20260911183900.631578-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CY8PR10MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: c925d1b7-d164-420f-2160-08df1034160f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	2t/U3tydDG90Z1zrWFyf9HtoMDIGG5Otv6EJR8K7WAfixcBsNLI7gd4FSw2r4H5CXctZ9ut1GNdue42EM0q6rlA/QTVS0BIMjXXdCXODvjheVHyVF4jRxeLBkmFZmCN2zK30S78sSo0ji6dydakf8bqRqpyTpafR31lPB38H6Hg3fUt7JL15f98xSE7BxHD/pkEhAeSl70Z6jn+VL+uUeFoHj9UANXiW6HhhEkAMV5/q1B/nC1aQeCSh4YfPPqBJt1EOyoc3QLH12gUcsbH4Au+MYFHDFzC++rneTVZHNZtWlQ9nCOTaMpgRFyR3lBhhF7aVYFpvhtQL0QxbJIjPviqn2iaY6Nws3OrhbpjAtnS0q8owcUYlbfukrb0I6M5oJXNEZf4wizNZzX+TRQTXExju0wMXou0aPmiAm69oMHUthn0URlsmiPtxadd4ZVY8AW6bmS5DkNrLs6LQskW+1Wne306KhMfkqk9iVaqhiu0f3J2XhIuQRFwf8AX67Iu0pSMTk4zX36pN+WhDbQF0nx+7O5ml9jfzT7SHKDaFYOkHK79F5333frFhzkjLnoEGcFhnYaMKczRXxmjLevnl1vofeJPN/4z9UjnKaz0ivgEbMfLN6eIJqtrf5gtS3V/enqVpgsYsGK5BTKTUnF2WBXPme71lcHBb/IdMsfvVGEYLGSOh22hjxFtzmogO3sXBOkRLf4rNC/+T8q2L0SWLcw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KvvfToQs2cDNvZ9hQf5qwchR8/rLpgqwbaDVlF2LHxPMoV0N79FMD/zLH4QIP4Kp8Nai+YD3lS8W5tYBv7PQOMoJJSK/OiveQZj/zJSE/0+ms5mgv/6sQXKxJu9+3m7WNlQaJelsqLURnEjdR6v3COEjaEkwhnxIPA2jln0Nc+8lQmCZNsdhw4e/ZYHuoUvnOcDfyOyJ7olCaeYrVVt2z/qtqx+xFELM5DvpIhOWfgUYz+KvUgctEDvOFt6QzdY3HE5Xf89OoMtRP/nAWE5QRxsbi8+lhSdpwyZuT1MFK8goBuKavMrIQTNmv8/hvGsMPFzLxre9aIMCWDUUG6kWvi8jNbNpyD0nXI0/nqTKOApkZaqhssMdRf0tgsMzuIIJsB2MF1f8VdOATgEx3M1MqSM0xtk0lDqmWP67C7/imAGhI45lSVKUTaCYSZNPIJvY
X-Exchange-RoutingPolicyChecked: 
	J0QO/+Fa7iDfkzIy4epq783Eo0QAYAMwYPiIfFzC7F78yRqCWoD6k/mhbJYNU7esRB6Uqjxbf2D+/bX6PPCO5msScThtj0ILxb+TxDZaluTe9Gl9g/gpe+mJuyBGG3ICpQhAaqJxY/LJBqVqFLMDBHq+FuFQI/nPg0AVdLoi05v8eCZsV47Jw1xt6vDZwTQch6mO+U6JWP3hQSYkaMG8VdWMdxEmoMxAjJNo1/8XEjyzFmnsOrbNnPa5cSopfA4IeKraSAQdRF5t8rO0HDOW3UyzuXv4fE4JSLXoQ26lXytXSLgdPn51WwJV3pV01kixvIwZtqZGu+y7NkS3YmT2BA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:40:00.3011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c925d1b7-d164-420f-2160-08df1034160f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6804
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI2MiBTYWx0ZWRfX+HJdJdJ4cFGi
 i5sa+zCf/BYdO/Y7NN45gVf+K2ZxsaQtLswVPUhYhZZaqvtkcerCKbHdGzaW05uYbi3EnDa5xw8
 Ym4UHPnnrC9RHYq3gzNSC3Viu6jUTMc=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa44b05 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=_G5YW2nmTQNbAYYp1rUA:9
X-Proofpoint-GUID: KD3UBvTzz-ilp9PMIQTk3jz-U1Io0XFy
X-Proofpoint-ORIG-GUID: KD3UBvTzz-ilp9PMIQTk3jz-U1Io0XFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI2MiBTYWx0ZWRfX5gDIf2Tnb2yW
 BblfLHejsAf6mA6OlcXyL0VnRmDys7rIvfHeqhDHHJNH+m7mrFvfN0MPHJVXRdGsOp7VjIpIeZW
 ZGyV62NGevZM4b4Pc78a5FnhGW1tt+QsFn2ufqifwpVsDtXWMLQMxAOsDOtK1q9NwGiTH8ERH/4
 udKZLni24XKKccGEfAkPHQ59qm8LRzraXOp2mCpSfydLVNhsRq/cIrxFgc0BfaqJZF+oUfdbUqw
 5id6TVHLCHv3dH9vKGdXVmQhK8f99iZ7PQ28pXi95zSN+dBSgm8nTI/sLPmsB9052BeHcKPHHFN
 /g6Hi3HpGcpj8LX6hsNAKPUTVxjXBHOQymOuFG+xRj4pCucV8I7V10+qnYi1nge7qO/K5HV0pdl
 V18Z86+pcMHTilnF/NzdVhw8Q2fRXdFe01DvoiI+8lsgDKdqLgzBGUFjZOZNEDrwHgO4kjXroZP
 qqFcBRHkXa3hVo0765w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110262
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17668

Split force-h264-youtube into its own package, enabled only on boards that support
H264 YouTube hardware accelerated playback.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

v2:
- Shorten commit message title

 .../chromium/chromium-ozone-wayland-arago.inc | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..108f77c7 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,6 +1,6 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
+EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
@@ -15,11 +15,26 @@ SRC_URI:append = " \
                   file://force-h264-youtube/manifest.json \
                   "
 
+PACKAGES:append = " ${PN}-force-h264-youtube"
+FILES:${PN}-force-h264-youtube = "${EXTENSION_DIR}"
+RDEPENDS:${PN}-force-h264-youtube = "${PN}"
+
+CHROMIUM_H264_EXT ?= ""
+CHROMIUM_H264_EXT:am62pxx-evm = "1"
+CHROMIUM_H264_EXT:j721s2-evm  = "1"
+CHROMIUM_H264_EXT:j722s-evm   = "1"
+CHROMIUM_H264_EXT:j742s2-evm  = "1"
+CHROMIUM_H264_EXT:j784s4-evm  = "1"
+
+RRECOMMENDS:${PN}:append = " ${@bb.utils.contains('CHROMIUM_H264_EXT', '1', '${PN}-force-h264-youtube', '', d)}"
+
 do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
+    if [ -n "${CHROMIUM_H264_EXT}" ]; then
+        install -d ${D}${EXTENSION_DIR}
+        install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
+                        ${WORKDIR}/sources/force-h264-youtube/manifest.json \
+                        ${D}${EXTENSION_DIR}/
+        sed -i "s|CHROME_EXTRA_ARGS=\"\(.*\)\"|CHROME_EXTRA_ARGS=\"\1 --load-extension=${EXTENSION_DIR}\"|" \
+            ${D}${libdir}/chromium/chromium-wrapper
+    fi
 }
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
-- 
2.34.1


