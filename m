Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01960CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:05:52 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3513.1791835546978666466
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 13:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jG+y9wu1;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=fDma2Rzw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: b-brnich@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69CJNuU82318264
	for <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 15:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kmOuuAuAULUvE
	V1A3OXzZ1oM2Wg8P38d3nTV9VKM5ts=; b=jG+y9wu11GwWCmRl01sFmk2zVuw2b
	geAg44wO8jlNFqYXtGpOED4j6QeOCtSBSjEsgsO/WcQtK0yGfojRdtjTDlMBeG6r
	t4MrLR+wMRZubi0HFOtMD7YYgedXA4Nn+lZ2vIalKnUt+IiqMsvwtM97ZTmxJP8g
	fclNhZZPcg9qC6jnk0skEr9pMkgh+F7feonYrpTUQbBsa4j2tquHG1hMnZXBxLUa
	TNjuCwpcqM7PEGhwAQLJmUuadNrez01WJGvf51IbeFk4/4SHKl6/RH6MFo5U8frv
	cj0Fu9Tqh8EFFSmjr5af8Z5NOkJofljNYAEBsA9BiW8a54z7TPdPJZI6g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h87an8cu0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 15:05:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTucA7gjOmV7YMwzdP9dyqMwCikB3rkl1eQC/eVWBUF0WunKwJ+AghkYUA/DN0RySsKA+wIasOsR+ccY03teMCaz71srGbcEOfYKCab7lI+8Nu4mWGjjmfSGtz4ZcApvoVs/BUn3UbTowNW3tA0nde8eSruo2QRYoCRqPhKYCA2G4n+QYaMWzpavKvy3UthtpjlVHl3+W9LPraubPXo10QtyDLViUiXguZ42P3sYnJZRm5NXrEDz3kZ1rilsjGT6pgMspdz1B/HzSy/y1nHJM5owCyLYDRqeOCDIRlYOoLJ07P3PsE1mm9zVBLmeGkTytrvFR0y4TXEgDSd0x6jOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmOuuAuAULUvEV1A3OXzZ1oM2Wg8P38d3nTV9VKM5ts=;
 b=UvTIFMkqYz3Y29WwG4s/qzVDNM1eScAhOIY5NCfgLhVjuhdpimC1/BZtXkrMOci5c4rM2Bc7cVynxbfZByi+mXuK2HXWlRi0tF1RAL8Y6CyxcteQ2oF9T941jEMiUNL4MftdRh1rbWv5DBh/QN73hxTZfKp/dyzCVySSa+3iot3JreTD4d7B8jvNHQBMGXPDc0uvWEEzwH9UVxGgrSf3dftKFvXT8CW9F3Gmlksn5L+mnQPjdiybrym/TrDYv7Kn90F0dbn1TygYLGugpdghg75V/rjVDQK6hZUhAN2cqqITBlgaeS+JHmVNwg+PPmMrDTZlH6UcPfz/vwy3Dv7j+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmOuuAuAULUvEV1A3OXzZ1oM2Wg8P38d3nTV9VKM5ts=;
 b=fDma2RzwC5kkVJX0PxCnvRrwGl9xqQIXGi7GHcYVWm7ALFu5OHnXzVvIveqZ5lizZRcrlTJsE7whTYVNKDMNLB9lHNromLYJVp1dchugVGl9LvXk1kbVbDlgrGLcPloiraPZCRehH9roAkqI8xtJ5P1oPKGq6kQfWFvrwv65jEw=
Received: from BN9PR03CA0201.namprd03.prod.outlook.com (2603:10b6:408:f9::26)
 by PH7PR10MB6626.namprd10.prod.outlook.com (2603:10b6:510:209::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Mon, 12 Oct
 2026 20:05:33 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::9b) by BN9PR03CA0201.outlook.office365.com
 (2603:10b6:408:f9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 20:05:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 20:05:33 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 15:05:09 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 15:05:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 15:05:09 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69CK59VD2109134;
	Mon, 12 Oct 2026 15:05:09 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        "Darren
 Etheridge" <detheridge@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>
Subject: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Port SIGSEGV Fix During Caps Negotiation
Date: Mon, 12 Oct 2026 15:05:09 -0500
Message-ID: <20261012200509.848642-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH7PR10MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: e652f940-7262-4dd2-2aae-08df289c2c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|10067099003|18002099003|3023799007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	osurIIdzXmmIWC6Kys0S1+/GrxkLIE9w3I1yLF39Czs1MwFkiPDRKX97e8wZB+T8+J1lpW3OXKv6Hdd4FyUFGvXtowXR6Ge4bjgOdr9KJozuSrbt6VvHwcSpf2TqndSn7n1U4CSCoyHj6et/dhImIG5MQy7ARd9gMcoreUUaT3hldUT8roRmC8NLWMicCbs21nr8Vo0C1aXuv+ST9Gph/gZ+IEB9hNhR25oUXzUluAfpnyhs2EyVTNk5z1LLdTzUqZrihdp/gZ3xJCZIRhy8aR+MltziZ0H44SVLcYtTHSQN80n77+3uln4HWj6rg/w2qKdETS6aVlCBYq8y6n/SGCfrv43Fs8WOZV/8cvL42WVBgQj+lcp9hOiauw7U4W/bRYZBGhE+AqRpWKqgway8QvufWWqlXyTfvBOb6xOxkJ0KUtMe6Kq76c1sKgvE0C0pPz3pkGEg6YdbuTB4qRIhKneIz7TBjw2AlEMLiwNrlKFwQWhPi6on5q9JZxyk2HsUzQVDmMl8dgMvMz2q3dV3LxxJPg3lLgIZoPIi6fA7MQmYU5khp1cRO8TpFLrjCZFgnw3xy4//5txe+VdzDZPgWsCxVkB0hk4jfGiVhXb+Dr0Bo8tesvxdYejWU7GNelkzphk24vq9DOV4tzx45LtPDg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(10067099003)(18002099003)(3023799007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MHwV8aO8KU/BlILCOPOnNYgCazJi2jP1muT8iN8vwljz/W95+5BcM5U3MqlzVIlVOrTHuEcGPjpSKlVu+2mmc/gwzwLu61XucoA97D9BamJVG2bkC/R7L0jdPGW0Zn54PkMI83BK3DNXnbaeVWteBFyxm4SVoFTGWXsfWOTgsBnmOnIJBns0DhVS2auVqeenpbmNTiyprMaMEs6AaFAUiGbdVZfL3dRFXHOjqk3PJsJc+aTfn0O5wl9MxxScDlmoFuGuecffpekORo0B+KArahZQz7Qdf28xD4/96M8c1fKidgnt7ok6mfR7syjRb6zvYiZyeKCOc4BpLUThz7HVQbQ90Tad0Y5wCmXxxrP8y+KGtmOxtI/YWZsFVKcFyHemDUAv3RRQBgl4Ry9rjCbdmUhgfCEqxXYn0c7rkeOOVnY67HwYn8G+3sAB2mWq0pQR
X-Exchange-RoutingPolicyChecked: 
	ELS/lOHgcQFsnySjkMGnUrSiLh2W9hondwauy89pn9ZF/i6KIZX5L9T9BqVMFEAzr+3cU9vCxv2Iyfe5iRroDiz5QpxHEihh99B9z3LKE1FEmNZ+OdhEiIWOd8B7DZOlPE8aZHCFa2gTSAbb+oq1rFFY4yfX/XM0axE8UQU61RR3I3RwGKZe+NFsFhtGO3VszPicfTntICtpT++v3Hw8aJqFBL1UgwSoA5u35woSZ7aCVhf1hysjlJx3936WI4QQhWJJ0vL0ujkNOfoBEmxiJw4iBVVpCbhEYe5HSeEbcDC/jyyWS28x/l3Tnj/e1fHdEemW8T5adrlTg1+Izrt6ng==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:05:33.2676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e652f940-7262-4dd2-2aae-08df289c2c59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6626
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3OSBTYWx0ZWRfXzYLeN5Vr4rn2
 OvYoPG0UFtT4obCOsBsEeEcARReb/pSR+eb+zvM70DdUqfmfO1Lzd4VVJgbAC9nN1Rf0mv7PmX8
 ceVG8HfrV4WTEdEUJY3+5xdoDgqDuT8=
X-Authority-Analysis: v=2.4 cv=bPWDs/+Z c=1 sm=1 tr=0 ts=6acd3d9a cx=c_pps
 a=bo0f5OQ5EW/jR9k4kEC/jg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8 a=8AirrxEcAAAA:8
 a=dT3yMTfB-hmoPWt2gNsA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: VKOzAv1-6UtyNouHkas_xjHCu83jYyhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3OSBTYWx0ZWRfX26P2lnE4iFnj
 IbFZkR19166bzFuZYMZmIGbEqvxynzjY6nG+aBh0Q5U1oTjRg6mXZBvSqlqopXYVgopatXlmZE/
 /NBTKDQUlipUwgdtwdnhC/qbVg51q05KvDP2+aWZgkRQJsEua4QiSebnW+zxLGj27aPVbBYKygF
 ucUJkP1m83tT2NwVAlbtqS71EltlPmteiz5zSTEASzFMW7GkoQ84ICKJWq/FgtkuFDOLFzjBb33
 vyzUloSXU7P/EKe5D9zxegVFK9XqqN8LDBfvsP31GJBAqL9poQYaNtlMYmS5Vi6ORJzpHVfqLO3
 7+SvEarP5jfpubie9Zmyu1fASzcRcKbe99z6RT6m7J9UtN5u3t+VQlA3JQYWVoWhmucThmapmgc
 oW9Fv5SBLEeB3th5Q51r3djwm1/p/W9ZALLGiJ9uMMYH2f4yIhiRpnYvn67n/dtkmd5A63DBEFF
 UKHtMKjpaveeErCTIBw==
X-Proofpoint-ORIG-GUID: VKOzAv1-6UtyNouHkas_xjHCu83jYyhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120079
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 20:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17739

Multistream cases are periodically failing because of improper caps
negotiation. This fix has already been backported in upstream gstreamer
and was part of official 1.28.8 release.

This patch will be dropped from meta-arago once oe-core migrates to latest
1.28.x version.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

Wrynose is only on version 1.28.5 - it will be quite some time before
the migration is done to 1.28.8. Without this patch, multistream decode
isn't reliable.

Master is closer - currently sitting at 1.28.7. Gstreamer just released
1.28.8 on Octber 8th and master will soon move so I don't plan to port this
to master.

 ...t-corrupt-the-caller-s-filter-caps-w.patch | 55 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.28-arago.inc  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-v4l2-object-Don-t-corrupt-the-caller-s-filter-caps-w.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-v4l2-object-Don-t-corrupt-the-caller-s-filter-caps-w.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-v4l2-object-Don-t-corrupt-the-caller-s-filter-caps-w.patch
new file mode 100644
index 00000000..31b147ad
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-v4l2-object-Don-t-corrupt-the-caller-s-filter-caps-w.patch
@@ -0,0 +1,55 @@
+From 872040cd7cc755bd970e4642a521168d6e19df63 Mon Sep 17 00:00:00 2001
+From: Qi Hou <qi.hou@nxp.com>
+Date: Wed, 23 Sep 2026 15:31:30 +0900
+Subject: [PATCH] v4l2: object: Don't corrupt the caller's filter caps when
+ probing
+
+In gst_v4l2_object_probe_caps(), the DMABuf candidate branch built the
+temporary format_caps with gst_caps_append_structure() and then called
+gst_caps_set_features() on the incoming filter caps to attach
+GST_CAPS_FEATURE_MEMORY_DMABUF.
+
+That is wrong for three reasons:
+
+  - filter is owned by the caller (the pad caps query), so modifying it
+    leaks a side effect back to the caller and can hit a writability
+    assertion when the caps refcount is greater than one.
+  - only structure index 0 was touched, leaving any other structure in
+    the filter untouched.
+  - the feature belongs on the candidate caps we are about to intersect
+    against the filter, not on the filter itself, so the pre-probe
+    intersection test could pick the wrong formats.
+
+Attach the memory:DMABuf feature to the candidate structure directly via
+gst_caps_append_structure_full(), which is what the rest of the file
+(gst_v4l2_object_get_caps_helper(), gst_v4l2_object_update_and_append())
+already does, and leave filter untouched.
+
+No functional change intended for the resulting probed caps; this only
+fixes the filter corruption and makes the cheap pre-probe rejection test
+behave as documented.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12529>
+Upstream-Status: Backport [1.28.8]
+---
+ sys/v4l2/gstv4l2object.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 7d35c34..9dd0c46 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -5475,9 +5475,10 @@ gst_v4l2_object_probe_caps (GstV4l2Object * v4l2object, GstCaps * filter)
+       GstCaps *format_caps = gst_caps_new_empty ();
+
+       if (dmabuf_tmpl) {
+-        gst_caps_append_structure (format_caps,
+-            gst_structure_copy (dmabuf_tmpl));
+-        gst_caps_set_features (filter, 0,
++	/* Tag the candidate structure itself with the DMABuf memory feature
++         * instead of corrupting the caller owned filter caps. */
++        gst_caps_append_structure_full (format_caps,
++            gst_structure_copy (dmabuf_tmpl),
+             gst_caps_features_new_single_static_str
+             (GST_CAPS_FEATURE_MEMORY_DMABUF));
+         add_alternate_variant (v4l2object, format_caps, dmabuf_tmpl,
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index a2204efb..2d3d85bb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -8,6 +8,7 @@ SRC_URI:append = " \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
     file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
+    file://0008-v4l2-object-Don-t-corrupt-the-caller-s-filter-caps-w.patch \
 "
 
 PR:append = ".arago0"
-- 
2.34.1


