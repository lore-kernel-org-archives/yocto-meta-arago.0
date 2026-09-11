Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43F2C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:31:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46370.1789151474854409074
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=V0vppqBE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mMZ7xpUu;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHUpeF2276421
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=IZ1cnwDgMetff
	GoZisKGHLE3iuuEVxvMosv49cSqTb4=; b=V0vppqBEgsvXyYr+MG6k3NBx6ZmSj
	+C1HcfYhgbbf2Y4Q6Fgg49I497YK1G+LCkeLmNl7HdcN9CPBjqaufTjLxA1PUatq
	MzUcsAtKIZ9IaMAIVqv9mDKXv9pC6yGXwXNEYjPHWDVWngw6OWQfbqPB7kqQMy8J
	ECJhqreKliFCX4z3bp1cumLIOq+Gx6vmUfCKDB5AutgIJH+Qu6KFdfO0JMSsWLXP
	2K2VWvXO+X9Dmv7eRM34c4EnoCGu0bIC2hjMW/Jk4yQIW8NlqQLsby4z90UwV/Hi
	4uf+C1eAo0hHqIpvTaZ242Ioh/c37odvdkWNo8dRHNvcUCmWHbtQp0kfQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyx2861t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:31:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMYM3jgwAhMG7lO+DcHbzR1N6Z69t64hQO2Tx9/LeTgmmUxikLRrxIP33s12awF76kYVAU3B3lSVNHn1slL+tUEMK5cj3p2sgC5yXJFTQXXHYw79fYT8+2aSpKuLWuOpAY/j/U3WKkIuAuj3fQcQRiAUA6UMsKlHt3T7Q38ZYANXZTcw7Au0YOfrpqNSBOVHcD7KQGkNgwdYyCfgDC8PHG2jGNTH2bguRBIOmk9493RU7MKt2B9BpSVZBf9bnP4Cn5tmv0T6oPJGlSIMZHeX0g5rbadZL1vMGt5wf9r8voQ8rlbBD/cNShb2tmv9N1JMKer+FZhoot2ssuMpgbR09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ1cnwDgMetffGoZisKGHLE3iuuEVxvMosv49cSqTb4=;
 b=fbdTxV/N/jtH8FNyDg436sqHRqLtmZXB+F5mny1bVP7skwPVIpOIpgqqNq4PBEmuQhsM4fnFYzEIseamxjPh0yQL99rpsIaa0BmJkYAnY3WkNOHe2tD3vxyShZtwb2Jx+gb4J6pjy0fJGatoeOWVhyXPSu6o01akQFIFLWu4BySxmPAxMm7tJN1uIg91me3c0e3noRcn3WT3YTw+5fb0ZPr/9IbIgo8lrfRYQ3b1ZzQOh5YQsW0iJAWzYxTXpUYdChdh2xR0MYBu/INd2NZHbHgra/rmfHIMe4XlK8jf7YWOOuor4nKPN2zUieh5w0BHecNLl9hYVs6VsyjwyhMXMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ1cnwDgMetffGoZisKGHLE3iuuEVxvMosv49cSqTb4=;
 b=mMZ7xpUuiot6GBPp+NWebFYcnqG6lNd6VtEVf46A6jFjlrPDfTi037HDYgN+mazaHQNgxsSnk3N5t78RjwR85Fa+KcHBw1mvi9nsaXQPvZmnPlS+kfKCHEjbXgI3/b+jPztfi1a04tFjdn0sdd/nOStt7eb5S7kY+L+L1jGeSbk=
Received: from CH0PR03CA0327.namprd03.prod.outlook.com (2603:10b6:610:118::20)
 by PH0PR10MB7063.namprd10.prod.outlook.com (2603:10b6:510:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 18:31:09 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::78) by CH0PR03CA0327.outlook.office365.com
 (2603:10b6:610:118::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 18:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 18:31:09 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:30:42 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:30:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 13:30:42 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BIUgs51597536;
	Fri, 11 Sep 2026 13:30:42 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
Date: Fri, 11 Sep 2026 13:24:32 -0500
Message-ID: <20260911182432.526086-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|PH0PR10MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 57627700-edc8-4b6f-1d55-08df1032d99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OnW/w3eMEYvkSGlcPtFBro13FPTeUDS4B7znPLRYazMOqzB2T7VglHnhjq0CfsBSXSDVl0F362mgJQu+GWKP5nRHowz82dZ6zv3fSOpcPEoOfOycbt7mkSNd8RzmzUqqA74p9CTgEV/F2hxWIDN0zPwuwKq/jNkMlTwGXxLiHn11I0Y8GDv9glA3JdACmKaGwKIcXMRTa7eVzqCAZo4NjGodNkfy2/DzkFvBLw1M2PO6eZizcRBOR0FyRq5EKsEHKl9bNdGOl8aSirfZdLbxHcf1ctCJaMZQ4Ukiim7lTzd75cWvyezmR3mS0CDReAWip99WdoY2Z6QWVoPYsoQU1yjKn7vf45GnsT1t0dinSe8zLAgUZx1JbmTk5NM7zVGP3mzMMZm4Iq1FpxEqF2MFGUrxgVFRnSiVs4HTxQVsTudZX+K4dcckhRfrU1iVyVanFKBnvK0c+GXK5fYtvTyDdNA1jtnhsQqarCKdIerqpt4fbVd0gLZP8Q453TKPZpSQct+RMh2h+hoV1gAZP8TR3BqApHFl4+uaVY6XFKyGNNsziST7Lx7zXRef8Iuq939MTAx6MZtbis0jv/B2S3DcrrFE834zr5YVnpERz2WrmFBENUW39w81VuIAFCsDzc0+bDb/ca9NU10PcmrK27jmanP59FjpLEPJBmrp8ApLSG93Erg0aDRL0i833uGixNMg+yZb3wI5elUifDqn6Cw4Yg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vB20BkKwnsMx7safefmH3dgUw/u2ury1N9a15Io498/+a2ogenVr4FGx4604CP0vtIQMnpm8rI7ffd/BEGj3pz0VZnRLrGvhgmlFwoyINPUwTRDYIDF0gYZNDRiyXfCchSSAvtSzdNcXCG3EgGN/iXqnduezhibPCEybrdWOPFzuEX3esTWypiNhKbOix0tv6PxdWlk97+L18tXVG9o40F/9Gc98XCW/HLnHSc3fl2tLBbEm2DtuMNLMMnKiIWfEEzRjHfkNWbqcMRTVir2SbSzRo4mTQZwy3CpRWsdbJTEkH18XhuVnaUkLVle3cNbxWNzAHX/FypjokcclZYJ44A/V7R1Qmn4lMGTTjEDt5wknBN/+6L2efDdQlmqmB3ZNgfjrAn84l/W8GdIWPpzTwgblI6AajILyr92UYEg64EQzj2OFiy7u2r6eSPiKS+gD
X-Exchange-RoutingPolicyChecked: 
	im57HrPTKPuac3TkSFYxnKRrjpTCELGWgE4Nbfa4+KLuF4MDybyW59XWdRuAeglHGfC2LAhyykh3hxqCqa/9CH7fUffXr2Oxa0npPpaleDX+iLPEIL6/0/PwjIk1sVQ9n0R7vFrOFtNqA2eIINgl6igtVcYhQ/tfq6YIEkYsPCM9ld4JqJKE8gMBVIyJ/pyIK7eCxqw0N2reJDgpUhFKTNCrN3nqGY2FvoA0XzHlcUmNZiJbj/1LIaoLvNTXGkAOZRmpk2nD+zF/EnYOfvElRnnXXB2Uvepfb0yBma6+iAECWUgdlRDRD1O0ewWc+PNgsKU5cFMmE15en16/UvljWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:31:09.4239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57627700-edc8-4b6f-1d55-08df1032d99d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7063
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI1OSBTYWx0ZWRfXyrisWnohK8OU
 YbUB4U8Qr8z6C3JdOuiHWnODOHOCytWgdpY1zhYqIa8LhbY45cbxcg6dYofP1B4LiYD6ujXkyDH
 l52oZbrMQTFAR1ryga/00iGa9BJEEgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI1OSBTYWx0ZWRfX8zTDmjc5rrXx
 g6JRuyBHCXDns1LJkoPjKG4bDdvs3zPyH75C4EDiV+ct2sKkFmTiBOE8U4JFoNTMWXd05VInKK9
 osJfmbEoNtrQUatJ6/dJV7+aSs5fyp88udhetR79CJILd5gpH6zEkF43M0SYfXJjSZyiIBCjjkw
 sYJXgsRnISGizQT0CSY5ZqGDZOBj8QLHTtVBKU6HboaxH75us5o+fuO8HfBDji0dmVRTcgtbugx
 J6aW9y5U5QlZKG3Vp0/hcLWqufyz/uxqOxe2aOlrh4FNgHHa3JgCW852DlLG50mkZExhjQwnZ4D
 inXJJyoOUlq2bikv/fgR3Udw0IwK/96rH1XCauLe0LUIIOIgUFzvSGegAFEEW0ri+V/ruE6dShA
 ZeVz3xHphSJJuvkERsF+GBzTxZNFxqHYPGcLJiM5Z3TCIZWGx+oEtpKeV8ltnVVEJp/ESCL0Agr
 65qCq6l3Dw6sKBvtLWA==
X-Proofpoint-ORIG-GUID: bIfr-L2ahOJCVO_Oe3goXu17RplM2CcK
X-Proofpoint-GUID: bIfr-L2ahOJCVO_Oe3goXu17RplM2CcK
X-Authority-Analysis: v=2.4 cv=UJ5Ijyfy c=1 sm=1 tr=0 ts=6aa448f1 cx=c_pps
 a=r+591f3cnXeovruRxJw0Jg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=_G5YW2nmTQNbAYYp1rUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110259
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17666

Split force-h264-youtube into its own package, enabled only on boards that
support H264 YouTube hardware accelerated playback.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
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


