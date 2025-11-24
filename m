Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A83CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 14:35:58 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18072.1763994949452219363
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 06:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bX/KOjH0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.19, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/a+/Kxjlkd07u+TlFLXCpI5WyJDMd2+lfyrrSKpvSS4Meo5RsJdbSBfWPjlfivGavXseBXXeFUpt0y+8OUAHUYTS0xLHci2U+MdyWi5UWZ/Jvc59w9LkaH89jfYN3ctNxc5ChxoczjYLILzyl9eK0E+kVxY1PXetFZvctMxDXE2mENJjGR6WMnG6QhdsfSVB1VVVvn2cfZmKNsNCxI71yjeRYz8+3zmr2WWYiHozOzaciMr3EbxYBzTmtezTir76z6nXKXGEgaO+HInJrl8FxDI9HFLreggBa+rMCcLfhqSKQbOy8SU426BFzyWMQRzi+g5t+01KEzcyamsMlLuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWwxrM4uFkWBmYUlUkNBllQI+j3s5p008NDwDzrXKCc=;
 b=XULsbfEgc/lxekP5TYCW9TVrtWP3m90VY9VNbNUJcyLYFNJHQuMlmKgEHyxs5cLHCBkl5r7GDQWDVq8MHjxhR/Fa+IMPw61nz0C7inr8yD+xCK7P5oz5dSRpz/Wd7HTlrMrEshgSbfnVOJhZttEP8Y017sWs9HumMfUQy/GYXqbESJvYonrEXwFu2qgH7XagtxOPkTpMJUKlMsmHrZA9OD+a4DD4mfkCPsaQJlOio9Cr2NBKWv7pbzCClP7JEJnneXcVEx+q6Oz5EYk03gTBNydhWy3bY3nLicPZMKC5nq1Lh5B39EPEMtG9GxHFtIqplbvnrWp/xyxVkxvAnVVTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWwxrM4uFkWBmYUlUkNBllQI+j3s5p008NDwDzrXKCc=;
 b=bX/KOjH0pH8JSkyAUC+OmL/myXlRVsVCj7vFGx1UEJpgFat3wkQQLUE2ThsGArf6XHJPygJU8I8z3Nf8DTF8RKSDaGBtRlHEM2ejVKCw02nTlzD+Go1ywPONIkyRSHhAhkDSxACWF0JpbCOT3EslwAACjmkuWcqqBA1+b22aEqk=
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by CH3PR10MB7836.namprd10.prod.outlook.com (2603:10b6:610:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:35:44 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::5d) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 14:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 14:35:42 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:35:40 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:35:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 08:35:40 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOEZc5d2061836;
	Mon, 24 Nov 2025 08:35:39 -0600
From: sadik <s-sadik@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramchaneni <prudhvi@ti.com>
Subject: [meta-arago][master][PATCH v2] coremark: add Coremark CPU benchmark
Date: Mon, 24 Nov 2025 20:05:32 +0530
Message-ID: <20251124143532.1964817-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CH3PR10MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: c29501f0-d491-48a9-8861-08de2b66bf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmhpZGpBV1R3cGk5cTZzTm1iYVRWZ0EzdnpBSzFPRW9kQW5GSG1acTF0ZVpK?=
 =?utf-8?B?WFNXeU1iU3p2MGNKb3ZVODZrN0IxeldlVUU0bG93WkFsNlkxWVdHcUtKK0Ez?=
 =?utf-8?B?MFhFcE96eHpEQTZHUi9FZTR3NmM0bU1XMU0ydzhCeC9XbUM4dGlpaXpnNGto?=
 =?utf-8?B?ZjhqdGt3K3I0a1FubG1CWnM1VCtVT0FMQmNGdEJIQ3BhdlBNaDNIUmdjejZC?=
 =?utf-8?B?akpzRUpZN01meTBaTUZ5VnplclY5Wm9aanUrMFZKb2VyMmxSY3lEZUNTMGsv?=
 =?utf-8?B?amNyQVFoRnJDanUra3U5dGlmWnBVVlNKWVpHemwwQjlwQ2ZCU1lXUTNWRFE4?=
 =?utf-8?B?MURoUUhwZDFoa3NQTWVPYkE2QmZqYjZqWVRrQTFXRjFFbThqZ0tuOW1TWE03?=
 =?utf-8?B?cWhzNUY2MmtoQVhOaGw3akxwekN5V1djOEJBR0Vkd0QvaVY0V0pUeDJQMkVi?=
 =?utf-8?B?bnRhaWY5dmh0OGE3RDBlblFmKzVNK1BHSnplSm5mS0gzQjAwcXJCSlRRNDJR?=
 =?utf-8?B?UVZ3eENjUUExTjNHZldZOGpobFdQeTlHOEVvSGk0bDNBZktyQ24rWGFyQWEr?=
 =?utf-8?B?SHFUdVdzMkorMmhBNUI2MDVjc1YxaFRLSzJjb1FIdmV3VjBBVVdnb2pPejE3?=
 =?utf-8?B?Ly84enpUenhTbTR5UkFoaldPeE9MNlBrSFRCdnBlOWtYZFphTU1zSVBUeXVO?=
 =?utf-8?B?V1prVUNtNmZiSjFTMHhEZHlnT0VxeHl4aVU5T3pZVWR4STE2VUx6ZFF0YzRJ?=
 =?utf-8?B?MFBjSlVmakpoM0dXQmRVT3MvalBBOGd5VkdiNjNUZ0ZDbWdLWmF4L3hBOUNR?=
 =?utf-8?B?MDlsWjF4KzBhTUdrYmJka2RtMEVoc0NrYjgwWTZrU3JHbDB4elhRV1pLcWw0?=
 =?utf-8?B?Y3J3dThKZEFBM0RmaWYvRXZyZmtzczBhNDFubURWS01DOGFKWU02WlBUUkNm?=
 =?utf-8?B?RXdwbGVWSzBDUG1UaXM4N0pBS3lsQnMrdW9YQ1hOelJLUkVTNTU2bHdHcEFL?=
 =?utf-8?B?VFR4SUJldWZDOWxkU29GMThQdkk3NTVFSm1kZXBBMmZRc0w5UUJtV25MTUF4?=
 =?utf-8?B?MlV2WnNja01VM0VzZXFHc0FoUHFqQ0hEOXFvZzQyYVdVWUtmMXR4MUlHT1VJ?=
 =?utf-8?B?c0U3SFBkN3l6bGxnL2VESmJ1MGxGSGlwQno5SWo1MXZXSXM3OW1wKzBsekxW?=
 =?utf-8?B?bjJsNHlhVGJYWlU4Vkc2U2phUXZDd0FNSnRSTk9YRFlxY0RaczVXUjhjSlR2?=
 =?utf-8?B?cy92cWVaT2g5RTJCNmdkU0I3RVdBL3V5Qm9sUlZNRmtSeUw5MUFoZ25YY3k2?=
 =?utf-8?B?cnU2QXBuMThNMFhRLzRabXJJT0VhZjI4YTYvZWxzN1ViMldBUnZ5aC85WlQ5?=
 =?utf-8?B?aitwdHJhbkNpc3BNOHdWZVVvelRUOWQ1QW10T2o2T0tCeVIyVjVDYzNuUjNz?=
 =?utf-8?B?RGxwVUxDMVJWSjI3YjdoMHdEbWVtVGpkTzQ1SXdIQUtQNkFkeHh2VXUrSWZm?=
 =?utf-8?B?UGZnVXdHWDAvdFA5eGhNMkkvbmw0V2Q0a3JMNWVFUlFiUjVEUlVya1ErZEhT?=
 =?utf-8?B?eHIyLy9hTFpDMUhqYktacE1tSUVRNzNOMWtBQkJmNGNyb0sya1c4Z0pucUNp?=
 =?utf-8?B?enpvSFBpSC9Jd0szVWpBRUlUVGJPaXpXZ3lpaUNzeWhpQmtoMEpreHV0R25N?=
 =?utf-8?B?M1BKV2dkdHJSMC83bUdNMjBiRm95VnlLM3RTOFlQa3ZoVStjSXFIKzVvRXVs?=
 =?utf-8?B?c2JDSTVvaXRnb3kzTGlxRFB5ZWtoNGVNRVBVV1l6OXg2TUhlVTg1TjNUNlFq?=
 =?utf-8?B?Qll3VnljenV3NFhNSTUxSThwN2crc2w2NFhzUzJBNWNOU2plVjhVSEVGVnFE?=
 =?utf-8?B?WDZydWlGaHErOUVNSWMxZFVHRFlxUExhZTdxR3RMOVJTTWVwMHNjemdVc2xp?=
 =?utf-8?B?VmhuMFZwb1M2ZGkrUDR1QjFhZXAzUDZvbC8rdEdXdVZEU0UxdDZhWmtUdTlL?=
 =?utf-8?B?c1pHemxWL0xqT0tGaEljcng2K1hZOEFxZklZb29pKzYwTHE2Tm9GejdjV2V4?=
 =?utf-8?B?WUJ3dy9KYmsweXZ4bm9wOHdyTFdwY1hjdjRZNm9TaFNhRHlrMGFKekovRVgw?=
 =?utf-8?Q?LJ5c=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:35:42.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29501f0-d491-48a9-8861-08de2b66bf25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7836
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Nov 2025 14:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16831

Add CoreMark benchmark recipe to measure CPU
performance on TI platforms,Integrate CoreMark
into ti-test package group alongside arm-benchmarks.

CoreMark is an industry-standard CPU benchmark from EEMBC
(Embedded Microprocessor Benchmark Consortium) that provides
a standardized method to test the performance of processors.

Signed-off-by: sadik <s-sadik@ti.com>

---

Changes in v2:
 - separate patch for master branch.
 - Include Coremark licese file in licenses
 - Use oe_runmake with compiler flags for cross-compilation
 - change subject line to include recipe name
 - append _git to recipe name for tracking of version
 - include package version in recipe

Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707

---
 meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
 .../coremark/coremark_git.bb                  | 17 ++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta-arago-test/licenses/Coremark
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_git=
.bb

diff --git a/meta-arago-test/licenses/Coremark b/meta-arago-test/licenses/C=
oremark
new file mode 100644
index 00000000..c6e062f8
--- /dev/null
+++ b/meta-arago-test/licenses/Coremark
@@ -0,0 +1,91 @@
+COREMARK=C2=AE ACCEPTABLE USE AGREEMENT
+This ACCEPTABLE USE AGREEMENT (this =E2=80=9CAgreement=E2=80=9D) is offere=
d by Embedded Microprocessor Benchmark Consortium, a California nonprofit c=
orporation (=E2=80=9CLicensor=E2=80=9D), to users of its CoreMark=C2=AE sof=
tware (=E2=80=9CLicensee=E2=80=9D) exclusively on the following terms.
+
+Licensor offers benchmarking software (=E2=80=9CSoftware=E2=80=9D) pursuan=
t to an open source license, but carefully controls use of its benchmarks a=
nd their associated goodwill. Licensor has registered its trademark in one =
of the benchmarks available through the Software, COREMARK, Ser. No. 85/487=
,290; Reg. No. 4,179,307 (the =E2=80=9CTrademark=E2=80=9D), and promotes th=
e use of a standard metric as a benchmark for assessing the performance of =
embedded systems. Solely on the terms described herein, Licensee may use an=
d display the Trademark in connection with the generation of data regarding=
 measurement and analysis of computer and embedded system benchmarking via =
the Software (the =E2=80=9CLicensed Use=E2=80=9D).
+
+Article 1 =E2=80=93 License Grant.
+1.1. License. Subject to the terms and conditions of this Agreement, Licen=
sor hereby grants to Licensee, and Licensee hereby accepts from Licensor, a=
 personal, non-exclusive, royalty-free, revocable right and license to use =
and display the Trademark during the term of this Agreement (the =E2=80=9CT=
erm=E2=80=9D), solely and exclusively in connection with the Licensed Use. =
During the Term, Licensee (i) shall not modify or otherwise create derivati=
ve works of the Trademark, and (ii) may use the Trademark only to the exten=
t permitted under this License. Neither Licensee nor any affiliate or agent=
 thereof shall otherwise use the Trademark without the prior express writte=
n consent of Licensor, which may be withheld in its sole and absolute discr=
etion. All rights not expressly granted to Licensee hereunder shall remain =
the exclusive property of Licensor.
+
+1.2. Modifications to the Software. Licensee shall not use the Trademark i=
n connection with any use of a modified, derivative, or otherwise altered c=
opy of the Software.
+
+1.3. Licensor=E2=80=99s Use. Nothing in this Agreement shall preclude Lice=
nsor or any of its successors or assigns from using or permitting other ent=
ities to use the Trademark, whether or not such entity directly or indirect=
ly competes or conflicts with Licensee=E2=80=99s Licensed Use in any manner.
+
+1.4. Term and Termination. This Agreement is perpetual unless terminated b=
y either of the parties. Licensee may terminate this Agreement for convenie=
nce, without cause or liability, for any reason or for no reason whatsoever=
, upon ten (10) business days written notice. Licensor may terminate this A=
greement effective immediately upon notice of breach. Upon termination, Lic=
ensee shall immediately remove all implementations of the Trademark from th=
e Licensed Use, and delete all digitals files and records of all materials =
related to the Trademark.
+
+Article 2 =E2=80=93 Ownership.
+2.1. Ownership. Licensee acknowledges and agrees that Licensor is the owne=
r of all right, title, and interest in and to the Trademark, and all such r=
ight, title, and interest shall remain with Licensor. Licensee shall not co=
ntest, dispute, challenge, oppose, or seek to cancel Licensor=E2=80=99s rig=
ht, title, and interest in and to the Trademark. Licensee shall not prosecu=
te any application for registration of the Trademark. Licensee shall displa=
y appropriate notices regarding ownership of the Trademark in connection wi=
th the Licensed Use.
+
+2.2. Goodwill. Licensee acknowledges that Licensee shall not acquire any r=
ight, title, or interest in the Trademark by virtue of this Agreement other=
 than the license granted hereunder, and disclaims any such right, title, i=
nterest, or ownership. All goodwill and reputation generated by Licensee=E2=
=80=99s use of the Trademark shall inure to the exclusive benefit of Licens=
or. Licensee shall not by any act or omission use the Trademark in any mann=
er that disparages or reflects adversely on Licensor or its Licensed Use or=
 reputation. Licensee shall not take any action that would interfere with o=
r prejudice Licensor=E2=80=99s ownership or registration of the Trademark, =
the validity of the Trademark or the validity of the license granted by thi=
s Agreement. If Licensor determines and notifies Licensee that any act take=
n in connection with the Licensed Use (i) is inaccurate, unlawful or offens=
ive to good taste; (ii) fails to provide for proper trademark notices, or (=
iii) otherwise violates Licensee=E2=80=99s obligations under this Agreement=
, the license granted under this Agreement shall terminate.
+
+Article 3 =E2=80=93 Indemnification.
+3.1. Indemnification Generally. Licensee agrees to indemnify, defend, and =
hold harmless (collectively =E2=80=9Cindemnify=E2=80=9D or =E2=80=9Cindemni=
fication=E2=80=9D) Licensor, including Licensor=E2=80=99s members, managers=
, officers, and employees (collectively =E2=80=9CRelated Persons=E2=80=9D),=
 from and against, and pay or reimburse Licensor and such Related Persons f=
or, any and all third-party actions, claims, demands, proceedings, investig=
ations, inquiries (collectively, =E2=80=9CClaims=E2=80=9D), and any and all=
 liabilities, obligations, fines, deficiencies, costs, expenses, royalties,=
 losses, and damages (including reasonable outside counsel fees and expense=
s) associated with such Claims, to the extent that such Claim arises out of=
 (i) Licensee=E2=80=99s material breach of this Agreement, or (ii) any alle=
gation(s) that Licensee=E2=80=99s actions infringe or violate any third-par=
ty intellectual property right, including without limitation, any U.S. copy=
right, patent, or trademark, or are otherwise found to be tortious or crimi=
nal (whether or not such indemnified person is a named party in a legal pro=
ceeding).
+
+3.2. Notice and Defense of Claims. Licensor shall promptly notify Licensee=
 of any Claim for which indemnification is sought, following actual knowled=
ge of such Claim, provided however that the failure to give such notice sha=
ll not relieve Licensee of its obligations hereunder except to the extent t=
hat Licensee is materially prejudiced by such failure. In the event that an=
y third-party Claim is brought, Licensee shall have the right and option to=
 undertake and control the defense of such action with counsel of its choic=
e, provided however that (i) Licensor at its own expense may participate an=
d appear on an equal footing with Licensee in the defense of any such Claim=
, (ii) Licensor may undertake and control such defense in the event of the =
material failure of Licensee to undertake and control the same; and (iii) t=
he defense of any Claim relating to the intellectual property rights of Lic=
ensor or its licensors and any related counterclaims shall be solely contro=
lled by Licensor with counsel of its choice. Licensee shall not consent to =
judgment or concede or settle or compromise any Claim without the prior wri=
tten approval of Licensor (whose approval shall not be unreasonably withhel=
d), unless such concession or settlement or compromise includes a full and =
unconditional release of Licensor and any applicable Related Persons from a=
ll liabilities in respect of such Claim.
+
+Article 4 =E2=80=93 Miscellaneous.
+4.1. Relationship of the Parties. This Agreement does not create a partner=
ship, franchise, joint venture, agency, fiduciary, or employment relationsh=
ip between the parties.
+
+4.2. No Third-Party Beneficiaries. Except for the rights of Related Person=
s under Article 3 (Indemnification), there are no third-party beneficiaries=
 to this Agreement.
+
+4.3. Assignment. Licensee=E2=80=99s rights hereunder are non-assignable, a=
nd may not be sublicensed.
+
+4.4. Equitable Relief. Licensee acknowledges that the remedies available a=
t law for any breach of this Agreement will, by their nature, be inadequate=
. Accordingly, Licensor may obtain injunctive relief or other equitable rel=
ief to restrain a breach or threatened breach of this Agreement or to speci=
fically enforce this Agreement, without proving that any monetary damages h=
ave been sustained, and without the requirement of posting of a bond prior =
to obtaining such equitable relief.
+
+4.5. Governing Law. This Agreement will be interpreted, construed, and enf=
orced in all respects in accordance with the laws of the State of Californi=
a, without reference to its conflict of law principles.
+
+4.6. Attorneys=E2=80=99 Fees. If any legal action, arbitration or other pr=
oceeding is brought for the enforcement of this Agreement, or because of an=
 alleged dispute, breach, default, or misrepresentation in connection with =
any of the provisions of this Agreement, the successful or prevailing party=
 shall be entitled to recover its reasonable attorneys=E2=80=99 fees and ot=
her reasonable costs incurred in that action or proceeding, in addition to =
any other relief to which it may be entitled.
+
+4.7. Amendment; Waiver. This Agreement may not be amended, nor may any rig=
hts under it be waived, except in writing by Licensor.
+
+4.8. Severability. If any provision of this Agreement is held by a court o=
f competent jurisdiction to be contrary to law, the provision shall be modi=
fied by the court and interpreted so as best to accomplish the objectives o=
f the original provision to the fullest extent permitted by law, and the re=
maining provisions of this Agreement shall remain in effect.
+
+4.9. Entire Agreement. This Agreement constitutes the entire agreement bet=
ween the parties and supersedes all prior and contemporaneous agreements, p=
roposals or representations, written or oral, concerning its subject matter.
+
+Apache License
+Version 2.0, January 2004
+
+http://www.apache.org/licenses/
+
+TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+Definitions.
+"License" shall mean the terms and conditions for use, reproduction, and d=
istribution as defined by Sections 1 through 9 of this document.
+
+"Licensor" shall mean the copyright owner or entity authorized by the copy=
right owner that is granting the License.
+
+"Legal Entity" shall mean the union of the acting entity and all other ent=
ities that control, are controlled by, or are under common control with tha=
t entity. For the purposes of this definition, "control" means (i) the powe=
r, direct or indirect, to cause the direction or management of such entity,=
 whether by contract or otherwise, or (ii) ownership of fifty percent (50%)=
 or more of the outstanding shares, or (iii) beneficial ownership of such e=
ntity.
+
+"You" (or "Your") shall mean an individual or Legal Entity exercising perm=
issions granted by this License.
+
+"Source" form shall mean the preferred form for making modifications, incl=
uding but not limited to software source code, documentation source, and co=
nfiguration files.
+
+"Object" form shall mean any form resulting from mechanical transformation=
 or translation of a Source form, including but not limited to compiled obj=
ect code, generated documentation, and conversions to other media types.
+
+"Work" shall mean the work of authorship, whether in Source or Object form=
, made available under the License, as indicated by a copyright notice that=
 is included in or attached to the work (an example is provided in the Appe=
ndix below).
+
+"Derivative Works" shall mean any work, whether in Source or Object form, =
that is based on (or derived from) the Work and for which the editorial rev=
isions, annotations, elaborations, or other modifications represent, as a w=
hole, an original work of authorship. For the purposes of this License, Der=
ivative Works shall not include works that remain separable from, or merely=
 link (or bind by name) to the interfaces of, the Work and Derivative Works=
 thereof.
+
+"Contribution" shall mean any work of authorship, including the original v=
ersion of the Work and any modifications or additions to that Work or Deriv=
ative Works thereof, that is intentionally submitted to Licensor for inclus=
ion in the Work by the copyright owner or by an individual or Legal Entity =
authorized to submit on behalf of the copyright owner. For the purposes of =
this definition, "submitted" means any form of electronic, verbal, or writt=
en communication sent to the Licensor or its representatives, including but=
 not limited to communication on electronic mailing lists, source code cont=
rol systems, and issue tracking systems that are managed by, or on behalf o=
f, the Licensor for the purpose of discussing and improving the Work, but e=
xcluding communication that is conspicuously marked or otherwise designated=
 in writing by the copyright owner as "Not a Contribution."
+
+"Contributor" shall mean Licensor and any individual or Legal Entity on be=
half of whom a Contribution has been received by Licensor and subsequently =
incorporated within the Work.
+
+Grant of Copyright License. Subject to the terms and conditions of this Li=
cense, each Contributor hereby grants to You a perpetual, worldwide, non-ex=
clusive, no-charge, royalty-free, irrevocable copyright license to reproduc=
e, prepare Derivative Works of, publicly display, publicly perform, sublice=
nse, and distribute the Work and such Derivative Works in Source or Object =
form.
+
+Grant of Patent License. Subject to the terms and conditions of this Licen=
se, each Contributor hereby grants to You a perpetual, worldwide, non-exclu=
sive, no-charge, royalty-free, irrevocable (except as stated in this sectio=
n) patent license to make, have made, use, offer to sell, sell, import, and=
 otherwise transfer the Work, where such license applies only to those pate=
nt claims licensable by such Contributor that are necessarily infringed by =
their Contribution(s) alone or by combination of their Contribution(s) with=
 the Work to which such Contribution(s) was submitted. If You institute pat=
ent litigation against any entity (including a cross-claim or counterclaim =
in a lawsuit) alleging that the Work or a Contribution incorporated within =
the Work constitutes direct or contributory patent infringement, then any p=
atent licenses granted to You under this License for that Work shall termin=
ate as of the date such litigation is filed.
+
+Redistribution. You may reproduce and distribute copies of the Work or Der=
ivative Works thereof in any medium, with or without modifications, and in =
Source or Object form, provided that You meet the following conditions:
+
+You must give any other recipients of the Work or Derivative Works a copy =
of this License; and You must cause any modified files to carry prominent n=
otices stating that You changed the files; and You must retain, in the Sour=
ce form of any Derivative Works that You distribute, all copyright, patent,=
 trademark, and attribution notices from the Source form of the Work, exclu=
ding those notices that do not pertain to any part of the Derivative Works;=
 and If the Work includes a "NOTICE" text file as part of its distribution,=
 then any Derivative Works that You distribute must include a readable copy=
 of the attribution notices contained within such NOTICE file, excluding th=
ose notices that do not pertain to any part of the Derivative Works, in at =
least one of the following places: within a NOTICE text file distributed as=
 part of the Derivative Works; within the Source form or documentation, if =
provided along with the Derivative Works; or, within a display generated by=
 the Derivative Works, if and wherever such third-party notices normally ap=
pear. The contents of the NOTICE file are for informational purposes only a=
nd do not modify the License. You may add Your own attribution notices with=
in Derivative Works that You distribute, alongside or as an addendum to the=
 NOTICE text from the Work, provided that such additional attribution notic=
es cannot be construed as modifying the License.
+
+You may add Your own copyright statement to Your modifications and may pro=
vide additional or different license terms and conditions for use, reproduc=
tion, or distribution of Your modifications, or for any such Derivative Wor=
ks as a whole, provided Your use, reproduction, and distribution of the Wor=
k otherwise complies with the conditions stated in this License.
+
+Submission of Contributions. Unless You explicitly state otherwise, any Co=
ntribution intentionally submitted for inclusion in the Work by You to the =
Licensor shall be under the terms and conditions of this License, without a=
ny additional terms or conditions. Notwithstanding the above, nothing herei=
n shall supersede or modify the terms of any separate license agreement you=
 may have executed with Licensor regarding such Contributions.
+
+Trademarks. This License does not grant permission to use the trade names,=
 trademarks, service marks, or product names of the Licensor, except as req=
uired for reasonable and customary use in describing the origin of the Work=
 and reproducing the content of the NOTICE file.
+
+Disclaimer of Warranty. Unless required by applicable law or agreed to in =
writing, Licensor provides the Work (and each Contributor provides its Cont=
ributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIN=
D, either express or implied, including, without limitation, any warranties=
 or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR =
A PARTICULAR PURPOSE. You are solely responsible for determining the approp=
riateness of using or redistributing the Work and assume any risks associat=
ed with Your exercise of permissions under this License.
+
+Limitation of Liability. In no event and under no legal theory, whether in=
 tort (including negligence), contract, or otherwise, unless required by ap=
plicable law (such as deliberate and grossly negligent acts) or agreed to i=
n writing, shall any Contributor be liable to You for damages, including an=
y direct, indirect, special, incidental, or consequential damages of any ch=
aracter arising as a result of this License or out of the use or inability =
to use the Work (including but not limited to damages for loss of goodwill,=
 work stoppage, computer failure or malfunction, or any and all other comme=
rcial damages or losses), even if such Contributor has been advised of the =
possibility of such damages.
+
+Accepting Warranty or Additional Liability. While redistributing the Work =
or Derivative Works thereof, You may choose to offer, and charge a fee for,=
 acceptance of support, warranty, indemnity, or other liability obligations=
 and/or rights consistent with this License. However, in accepting such obl=
igations, You may act only on Your own behalf and on Your sole responsibili=
ty, not on behalf of any other Contributor, and only if You agree to indemn=
ify, defend, and hold each Contributor harmless for any liability incurred =
by, or claims asserted against, such Contributor by reason of your acceptin=
g any such warranty or additional liability.
+
+END OF TERMS AND CONDITIONS
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/m=
eta-arago-test/recipes-benchmark/coremark/coremark_git.bb
new file mode 100644
index 00000000..1e002c06
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "The benchmark utility to measure the performance of CPU"
+
+LICENSE =3D "Coremark"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
+
+SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3D=
https"
+PV =3D "1.01+git"
+SRCREV =3D "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
+
+do_compile() {
+    oe_runmake PORT_DIR=3Dlinux CC=3D"${CC}" XCFLAGS=3D"${CFLAGS}" LFLAGS_=
END=3D"${LDFLAGS}" compile
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark
+}
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 586cbe15..22957218 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -96,6 +96,7 @@ TI_TEST_BASE:append:armv7ve =3D " \
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
     arm-ddr-bandwidth \
+    coremark \
     input-utils \
     ltp-ddt \
     openssl-perf \
--=20
2.34.1


