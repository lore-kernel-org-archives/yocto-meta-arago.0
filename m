Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B41C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 20:32:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.435.1785270754341297698
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 13:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eRc5nEJF;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mdn9Qm3H;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SIAgps193454;
	Tue, 28 Jul 2026 15:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3tZJwc/cjbejT
	x56yEevX9/z50qzY1L/z3wN02PwwY8=; b=eRc5nEJFzQEsgv4sgzSWkjSUaTTXF
	l3N2iCRbAT1gBfoXMnRJqSNCZGKKmXt8HIvWt3kosBhmOsz6fkd2NGTKO+pQORpU
	n2DR2lj8vZJG2r1Tcy2tN3L2Ui0mKYHvCFWBkPj5PtsPJfqk5xOQdM9DIaSsrrvU
	8tPZWRUunXRGEgU/0vCR36PYLYBwM6ElcXggwIFXgmuLF6ZtmyN/m5QjImYcpxhm
	8czvobAVfYSOn6N8D+zvkcqlW6mDAN5mQwRwDXJ+/PdUdO1czikR018R7aofqGC/
	HV7ZiHcIHC9FitJy2U0z73b5RqlDomaJz/m0koZelOmP8erFerNT+C7qQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexkaum-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 15:32:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqiAlUIONluq4tLHejPg3SXf/VRLBYt/4RSgye1uEqTWDTdxIZp+pYB3gFtnNoflmML734EPwsCS6jh/sGlYXPWU403UzQFmU0qBGLbpSgZd0dVFloqrwq4yxK9qMOVOR/mcUvqT7oby3ylO5jG2V96/ZVujCZ0t5VZiE6B/mTdVdyztS5JFK6IyvX+lPZ2rsDTs6C214+cezLPwvO9JX0my62xigdlhfsSOgVLy+7R+u+nK09Cklc1iWXi5l9tI0169GRnRVAXR7/VF6e/QVDd4Zl1XY/1cVbOHyckIMpJzOi6K2UcXux8Vf2T+ikEy04lBEdg082gQin03p2dEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tZJwc/cjbejTx56yEevX9/z50qzY1L/z3wN02PwwY8=;
 b=KS/d6jRrbVgCr/ffJnv1MQVr6joHwPy5HFB8pFZfEI8hx6PwOzs7zgEK+0+6QfNwzz90jTwHewFhXlNUKuobtd1ihcIkfAKN6EjA3zgQPk5OCSRuDYfmm15L37BTUnFsa2PTtpAHaEG+uU9SNtRFkCE2u/qDECWjPL8Y45KHfROsXPNcpM0i4fFlXR+vvBcYhDFY3+rPiESqHCdfvIBnKmMDY2Csx6LXpjuryeTUoPgNSjb67/vV3SdbO974HZkA0Menm4KujSLWA1VDxqRoEJQzH+Hs1yl8esX4JLq4Q9GEjgrShS162oo+dDDsxcdUmaL6RaLGclGO8VcrLKQolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tZJwc/cjbejTx56yEevX9/z50qzY1L/z3wN02PwwY8=;
 b=mdn9Qm3HlIC/MlrAkV6WvFHqt7/PRmoSun7j8SpR1UsSQo60FZ+LkOdPjfL2LeA07cUj6p1xthkjERB2/ua2g3RogbY3gbsfu7ai8r8+snUAr8MygMx2Bu9JCCacMCeBPpi7rofaTDp+zQM8H4hlpPo+YGJQ0UMrDreLkQzVr34=
Received: from BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31)
 by LV3PR10MB7913.namprd10.prod.outlook.com (2603:10b6:408:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 20:32:22 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::6) by BLAPR03CA0146.outlook.office365.com
 (2603:10b6:208:32e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 20:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 20:32:21 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 15:32:21 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 15:32:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 15:32:21 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SKWLeF4046780;
	Tue, 28 Jul 2026 15:32:21 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wooTN-0000000C2Z4-0tSY;
	Tue, 28 Jul 2026 15:32:21 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] coresdk-12.01.00.05-config: add config for CoreSDK 12.01.00.05 release
Date: Tue, 28 Jul 2026 15:32:21 -0500
Message-ID: <20260728203221.2869787-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|LV3PR10MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: c245fb99-640c-4176-88aa-08deece753c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|13003099007|6133799003|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	KFYbM+aLNs7JXO4LFpJv8ZUnVr7QwuMovdD9KkX9GnStdu9p2or9eyQTVU/49hn7i8Zy0vPp65DhVfA90jxxVhSS+uD4D7L5EjuLtyzowKjxCTdvNitOt9UIRvI42bae0urhczVyfOLpEgY6mKQ+GNLsJLS0s2MI/ILKinJ3AcfLKieJoXb/Rcm8yWKAkPH848FJewVCFjPzsOUTQq42pXpzg/2ozUv2HJcrwh5rIxI88Pq/PxL6xq3WigC3A+DwUz6yyI+i4RmUaHGEx89WYb5V6mzKXVJr6CqXcCtDngHHJtqLsNZsUZt0DIsZmwfPLXTUvYA2IJBgbGiPxecWXlIT/zk/qf3nD61wAcUCLcA0NwDwT/Rh2eCflD9JKPmxPWgxP/WDyIm1B7b9HdEC5Jl28zyIxXxMtIT3LfiiMt1Mw5drbyhxkeS/CWWXwDshVGKJ3fWUEPkq88PhScrsgC55G+qsiHUHMVmygTsLu6IEJPw5vEy7muQKgDX69xWWB43nNt71rVDNnVcYoP0X2oTfoUQD4MH9Gd5Ko4h6uyEJjxiFBBoqV0MtO1wRefozFRiEE66vblGGExiZZUJbntfUA8r5Wu8hE7gk8v0CeTx1s0nB0rzIvxqci+fNf2SVxVQg+f94c5ENxkW8V7RFDQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sP0bqPaVo8zW+hcXh1VAvmktOuF5JKLPlbaOuKVFJruVPEYQ+xbOA16XDQkpVvZZmNQdh03q7HwoiM0fdsqPlxdwRmAGws9XwVyqv7C8La0diEsvHq+mm3Gd8El8NYoCxbJ/9J1NKvzHrh345M0Wp44O9SbY3QIan/ET48ODWeJV0MrJ4M/Gud8t2kbW13WbzuTvQcMT7tkUnEVrPRjr5gsJ8/Q5uGXcIl6m7TVuCaMzod6T/kpyxtPMV4CspoBlLQ6J1Nc/Iq9gHN1AueeCwrxfWzrikwJTTPJEzuR1FOEuX59c1Q9SE7EuYJP39zsA3/gacp9oxjvrnfS055b0V9KEs7vOeTqhRtbvGYJEsX+Uh03xnUPgo0HIWGje+tMrZ4MHzDIwxYI9HQD52bY5OMJqS3AK5Xf0849pqzW6x5X99zpuCjY4xYQ4HIrHYimR
X-Exchange-RoutingPolicyChecked: 
	Qxer48OfYstYxAVopeLlCGdjzAzXnQLizRa3qjabTW7koZANBbvvAUMYlcV2B+UqYuhoec54aa2lzMimqooRT986qRlIEYw8i+ELtpRP6/FhbPkC7IjuyFuWTfjL+Wc549MqXdKC0WWyf4hHm/sb0S0ADlXE+oVF/nQ/olHUxpn0H+2Stjbww79tQWnFWSgKZ1RaIOlsrW+mfHWnNxR4NipoIWKgiAZZO9QUsBecjh68EFDL7csIQzDtIhnkIcz+JgqWxRu8XTkjrs+j3RfdeqJYEgoJAzdU4ZEWp3HAyQhMlmhfHgA/vXrXmg4oO69yulu3RnQsmBYbvT/C7j+1Jg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:32:21.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c245fb99-640c-4176-88aa-08deece753c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7913
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE3NSBTYWx0ZWRfX+xGgo1q0BbBZ
 4LEI6KSnMm4RWnjMq3hqpRr0bW0sIdWFgJFttT/DvubuWQcNwtvUA04+WRMrgKAmxvQXszkl7WJ
 xdQgQMA60q7tb1IpV3vUwqWxfdAkdoJI/UDmJuO9yAdZU3bHagY/w/xbHfu4H10V8+eENnmvlCF
 Ei33rv4n3kqOgiAkiJmMtH4JHdgzfMajcHk3dYnUIXbiTXXw4XD0krXz/zUKOWF4ZzpZkIpxJdA
 tW51fMjsX0NqeTrFWQ3cMRFxpsTFlePdlfj+nd1ywpQxZImfpqBIFiHyNhGKbYwAR60XxbSbbkN
 J6whWNLlpuKxzUYdcH7HMk4RCqqSgnbtPiAjXRdurC0WHjuOrgeQlcv1Mb0OyZyVe9vhq46EB90
 wOLzQK6Z/mej2+1qTcfdElKDed4Lrj13Tm3KkOqWmZ8uUO/4qVwdlvgdnzc/MzXw6Ol0k/lpqt8
 TjOAHQiE5h+P+KX+O2g==
X-Proofpoint-ORIG-GUID: UJu_--y5DT1akfb3foW1o4Ic8sL-Btl5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE3NSBTYWx0ZWRfX5iliHFJ9FX7d
 dT0/zMp8pCE3B+wdWKN/9G4H6Q/lHQc3HVQ8UwlysXPmozgk+75V80YecoRTFioY1JjAWhDEmWo
 s/ONaplKGvOh22tToSKsibXSI5i3s6w=
X-Proofpoint-GUID: UJu_--y5DT1akfb3foW1o4Ic8sL-Btl5
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a6911e0 cx=c_pps
 a=f333RhXzhOQaWIE8hCCRDA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8
 a=WNDY76dxAAAA:8 a=SSmOFEACAAAA:8 a=sozttTNsAAAA:8 a=aCBHbJtabseJpx1P89YA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280175
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jul 2026 20:32:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17597

From: LCPD Automation Script <lcpdbld@list.ti.com>

Add config for CoreSDK 12.01.00.05 release.

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../coresdk-12.01.00.05-config.conf.json}     |  2 +-
 .../coresdk/coresdk-12.01.00.05-config.txt    | 18 ++++++++++++++
 .../coresdk-12.01.00.05-config.yml}           | 16 ++++++-------
 ...fig.xml => coresdk-12.01.00.05-config.xml} | 24 +++++++++----------
 4 files changed, 39 insertions(+), 21 deletions(-)
 copy bitbake-setup/{arago-wrynose-config.conf.json => coresdk/coresdk-12.01.00.05-config.conf.json} (98%)
 create mode 100644 configs/coresdk/coresdk-12.01.00.05-config.txt
 copy kas/{arago-wrynose-chromium-config.yml => coresdk/coresdk-12.01.00.05-config.yml} (79%)
 copy src/configs/coresdk/{coresdk-12.00.00.07-config.xml => coresdk-12.01.00.05-config.xml} (75%)

diff --git a/bitbake-setup/arago-wrynose-config.conf.json b/bitbake-setup/coresdk/coresdk-12.01.00.05-config.conf.json
similarity index 98%
copy from bitbake-setup/arago-wrynose-config.conf.json
copy to bitbake-setup/coresdk/coresdk-12.01.00.05-config.conf.json
index a401cb3..4ff1e2e 100644
--- a/bitbake-setup/arago-wrynose-config.conf.json
+++ b/bitbake-setup/coresdk/coresdk-12.01.00.05-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for wrynose",
+  "description": "TI CoreSDK v12.01.00.05",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
diff --git a/configs/coresdk/coresdk-12.01.00.05-config.txt b/configs/coresdk/coresdk-12.01.00.05-config.txt
new file mode 100644
index 0000000..355a6e5
--- /dev/null
+++ b/configs/coresdk/coresdk-12.01.00.05-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,ef0611a598fd7ba909804be0c6314ed7c85725b9,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/coresdk/coresdk-12.01.00.05-config.yml
similarity index 79%
copy from kas/arago-wrynose-chromium-config.yml
copy to kas/coresdk/coresdk-12.01.00.05-config.yml
index 5745c67..f2123c1 100644
--- a/kas/arago-wrynose-chromium-config.yml
+++ b/kas/coresdk/coresdk-12.01.00.05-config.yml
@@ -11,6 +11,7 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
     path: "sources/bitbake"
     layers:
       .: disabled
@@ -18,32 +19,28 @@ repos:
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "wrynose"
+    commit: "12.01.00.05"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
 
-  meta-browser:
-    url: "https://github.com/OSSystems/meta-browser.git"
-    branch: "wrynose"
-    commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
-    path: "sources/meta-browser"
-    layers:
-      meta-chromium:
-
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.11"
+    commit: "ef0611a598fd7ba909804be0c6314ed7c85725b9"
     path: "sources/meta-qt6"
 
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
     path: "sources/meta-virtualization"
 
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -56,6 +53,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "wrynose"
+    commit: "12.01.00.05"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -66,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -74,6 +73,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/src/configs/coresdk/coresdk-12.00.00.07-config.xml b/src/configs/coresdk/coresdk-12.01.00.05-config.xml
similarity index 75%
copy from src/configs/coresdk/coresdk-12.00.00.07-config.xml
copy to src/configs/coresdk/coresdk-12.01.00.05-config.xml
index 4fd143e..90d820c 100644
--- a/src/configs/coresdk/coresdk-12.00.00.07-config.xml
+++ b/src/configs/coresdk/coresdk-12.01.00.05-config.xml
@@ -1,20 +1,19 @@
 <?xml version='1.0'?>
 <config>
-    <description>TI CoreSDK v12.00.00.07</description>
+    <description>TI CoreSDK v12.01.00.05</description>
 
     <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
     <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
 
-    <bitbake url='https://git.openembedded.org/bitbake' branch='master' commit='05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
 
     <repos>
-        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='master' commit='12.00.00.07'>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
@@ -23,21 +22,21 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e252b51fd261a4cb05be932f0143ac444693a1ea' disabled='true'>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='wrynose' commit='HEAD' disabled='true'>
             <layers/>
         </repo>
-        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='dev' commit='f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.11' commit='ef0611a598fd7ba909804be0c6314ed7c85725b9'>
             <layers/>
         </repo>
-        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='master' commit='b8968685998a052e5bed0f68a546be800c6849ed'>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
             <layers/>
         </repo>
-        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='b5bb24b356d8200e2f4b088bc052eb668502ce33'>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -47,20 +46,21 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='12.00.00.07'>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='master' commit='37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='ec113301d73271d08bf4193c2509a34ad12385b6'>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
             <layers>
                 <layer>meta</layer>
             </layers>
-- 
2.43.0


