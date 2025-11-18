Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B16BCEDD9B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 14:37:01 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13913.1763476602256695331
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 06:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dpBZ2WW+;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.48.7, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tImfslerEjQkT4VPrP5wNdAzdxMhoD+LWmQuGaxqsJ0tTJ5p/XJxS2dzgx0r2X/4WezLiu2aXu0WxI5YhvPt1FCUs+he7auH3xLz/kl/Cug/J2ZZIwc2WNLT8mLf9GGeIh9NVOpt09YKHSTpjVu9JZTQ9zn/8QntzuKi1YdynZwPbVuiTY2pFU5pd+PxMElxlvIXC/5sKrWV0rfA0YtpwVEiKgRh6Avni9Tmm18OrLAUlI3CQCO98+9K/F7er/W1yDsOiByPB0LOB0/WSPzCmIL949sUH23vz9ZNQIuvF+/EqBLJjbwzIqaef9Qm48rt6LnFJdm2ecN85wsZve+GZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+Jh873LP5q5sWUcRCKhvSEzq4YDzg2t3LdX9CAj4iA=;
 b=n3l83fu2ex269L7mseSwDDJc+V0c2ITrgb6wVPACY7lIoFYmSJExLOnKDzWVdmxzi6Q8ybauopRAVbTQgqOueQKZGdpK0mfkfKwC4Kk0fAY3qGgHawl19QqEgPEmsDJQAi2GmYNlh0mz0xufDNgjW6R5HUp/xzbOVHHfLTxnIqWH8+nHD8D79R674NJNY177LoGMtn6duLtS9gz2kC5oi10RIUF3A2SfXNtA5bLuGuw8hpmqnTjA7fQSriui+ZkbchK8lM0yiWf30pKyo/6gikZG67kuTpFWwZJwq76qOj2q7wb7fcH8pcwLXQc5QGrz63dS4pnEz2Pv3TUJsE9xAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+Jh873LP5q5sWUcRCKhvSEzq4YDzg2t3LdX9CAj4iA=;
 b=dpBZ2WW+ASXfwHdIrXtxAKM+XEfucesSnIe1u2V9UATnqWDooP1d/AurGxfBTpDf6bY1L34oMKG+aie0m4QPccnPfhqPKIup4F1aYzSAUClMGTgicVtCzp2hWU9oHBgEvhR/GD+zfTf4oS1l2RhBmZwKckDbo+GX5NHmrODyuto=
Received: from CH0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:610:e4::28)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:36:39 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::9a) by CH0PR03CA0203.outlook.office365.com
 (2603:10b6:610:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 14:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:36:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 08:36:38 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 08:36:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 08:36:37 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIEaaOT204825;
	Tue, 18 Nov 2025 08:36:36 -0600
From: sadik <s-sadik@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramchaneni <prudhvi@ti.com>
Subject: [meta-arago][scarthgap][PATCH v4] meta-arago-test: Add CoreMark CPU benchmark
Date: Tue, 18 Nov 2025 20:05:23 +0530
Message-ID: <20251118143523.875103-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|SJ2PR10MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: a3494d1c-1275-474b-a9ec-08de26afe25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFRvMnc3Q1dQS2EyL2FtQTJWaWlkUitoVXZNaExISFZYc3NwejlSTzNKUHo1?=
 =?utf-8?B?ZHFNWWFGSDJXdmFVcE1QY2szNnFSeDd3eHRsYkJSVFVDbEI3Vm1XQUxtTGhO?=
 =?utf-8?B?V2Z2RElPd2E5elZHREZ0eDF6TnRESU1Cb29CeEVFTC85ZEdnazN2K1VCZzAz?=
 =?utf-8?B?L3Z1bjBNclpZTm1od2pCRDVncWN3VXpMc2FnbEVsNjYzakdpcUVlUlVxRHB2?=
 =?utf-8?B?ZlplaUpCMko3bUI1RFhsU2twaFlaRzRBNDhoT2xnVVJ2OUpmbWRGcnNiclZm?=
 =?utf-8?B?S1FQdktrQUwvU2lQN3A5SnJnd1p1Z2tKRk1wSFRuNThWSFRKUk5PVWR0TnF1?=
 =?utf-8?B?NEk1b1FNQ0FmT1hYOUJ2ODZLWC9paExwQUFlYmwyWnNqSkxXcDJVVHYxQ2Nm?=
 =?utf-8?B?eDlza05ud0YrQlA0VlN0c2NacDNTY2t0MlZDK09NL0Y4SVBaUDJHbURsbTJz?=
 =?utf-8?B?OUR5eks3ZHhZM1ZhUDdCQ0tqakdJblZSVTE5UG16b2JMU0JwWkh3eHFkdWY1?=
 =?utf-8?B?OWk3RWtNcTJWcjdJMm9KbXl2YThZZUFSVG1BdVpPN3RlOCtGbStNa0E5bE9U?=
 =?utf-8?B?NUlQM01qZmJaY20vK213d1Z4SmdhT3o0WHdWWXFBcHVsOGM3VmZtQXVFdm9H?=
 =?utf-8?B?OVRmcGo5cEhETHoyY0Vjd0JJN2dzNWRwcEFKeUhUQlJnSGdFb1E5Tm0rUGJy?=
 =?utf-8?B?M042dHBFVUtVSXRFcnowdTU3cE9MNkRvWitKWEN4WXZia0xSSkpQYmtSWXN2?=
 =?utf-8?B?Q2t3a2pMSEF1U2RzVlk2V0NlSnlqMm9lZFB4OWI1Qnc2NmxLekVyT2kzZWRJ?=
 =?utf-8?B?SXFMZ2JpbXVjbzdtcWdIMmtIZTFwc0IvdmZudGhCUFZZaXlSTFI1b2hNbnlL?=
 =?utf-8?B?L2lsQVVsN3VTRElxVkZKSGJQeXZ5SFdGNVZ1S1RMYXRzcFBnMm1hRUNQRGND?=
 =?utf-8?B?N245MENwNmhwVjd6b0JhL1JwckFpS25QbFZPUE5hT3MzVWZ4QWplRWJZcXIv?=
 =?utf-8?B?L3RsT3J6Y2lLRjBiTHk1VkdPcEpUVWVabHduT0czcU5MM0xMRHJUN0d0bFha?=
 =?utf-8?B?SjF1OTZRQWRFNE5jVzlZMjVHekg3WWRBZkcvbi92djIxYjA1Q2lzcVFyVHpl?=
 =?utf-8?B?aGkrSC9icVpsWVQzRkYvdnVCVjBiU2J0RUhVcjVaMlpnd1ZRbk9CQTA4RUNE?=
 =?utf-8?B?c25ZbGhDbndZSkUyektTdHMwdU1XSGduY2ZrRS8zcndNRktwOG5KRERqUWEy?=
 =?utf-8?B?YTk0dThjV3Q2YkZqZjk1N2FpQlFYVHE2dWRhQmIybVhuQ3laZDRDSjV4Q3BX?=
 =?utf-8?B?MmMrc1Y1eTBNWFo0S0FjTE5TaG1zQ2FocG5EWW13bEw3OWdJaTJXRGZsODN5?=
 =?utf-8?B?c0ZpUWEzczY5TGdwYzRuN1g4SStTcFcreGVSYXFpdFRwQlJSQzZNN29wWFBw?=
 =?utf-8?B?aUUzV1FvZDdyTTBQTkJRNkZvME9IT1dOSlZFQzZaOHJvVWhwa2NIZnUrT0xu?=
 =?utf-8?B?dU1RaVFkNzUxNDVjbWRGbzlEeXdNVGZpTjdxblFYSmdjYjNqUXFrOWNZYkFD?=
 =?utf-8?B?UXFqQmNYUkFvNXBqaHgwK3VOdjUzZzhLNlBvQ000a3A4OTJRUXowVkF5ajZt?=
 =?utf-8?B?WmphOVgxUXVMVk1SdEhOMTlaVHgxcW5lWEFMcm90SDJXSE1UWG8yaDJFMlFW?=
 =?utf-8?B?UnVjVFVDWndITTRzU0haR1hUam4vMmVpN0draVdVT0lJcWh3N05QZE0zaFpu?=
 =?utf-8?B?L1Q1SElnZDczRGxJYjV5eURpMW43ZUhmcitFd01IbDA5Zy8rUFZvSTJWSll4?=
 =?utf-8?B?N2w4ZEFXdjBmcTRMYjVKcktvRTRLODBMYzhvWkpGaVR4b3FqYTRKRWczK2Zs?=
 =?utf-8?B?Z3BIOTIvekhSU1JoV3RKSm9rRkwxZXlnTCszdFE5cU1STVpRM2FvTGkxNU5Q?=
 =?utf-8?B?Y3g4cjlITExuTlBoZE9OSjZxa3E5ZkdVckZqSlp2OVZjakwzMDFZSU9YclhM?=
 =?utf-8?B?NVBieERJYXQrK0dzWFFocmZiNVdHY1BidzFFT0dmTE92OCtzdVlpRjFUWWRj?=
 =?utf-8?B?LzJXZ2kyOElUUy9aV3BjRER6VW9vRGFxbUgwT0JaNzJ1ZjdwQzBiWWk1T0FR?=
 =?utf-8?Q?1xyI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:36:39.1194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3494d1c-1275-474b-a9ec-08de26afe25d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 14:37:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16784

Add CoreMark benchmark recipe to measure CPU
performance on TI platforms,Integrate CoreMark
into ti-test package group alongside arm-benchmarks.

CoreMark is an industry-standard CPU benchmark from EEMBC
(Embedded Microprocessor Benchmark Consortium) that provides
a standardized method to test the performance of processors.

Signed-off-by: sadik <s-sadik@ti.com>
---

Changes in v4:
- change logs moved after the "---" line
- change the summary of the coremark in recipe

Link to v3:https://lists.yoctoproject.org/g/meta-arago/message/16776

Changes in v3:
- sent patch via UTF-8 encoding


Changes in v2:
- Include Coremark licese file in licenses
- Use oe_runmake with proper compiler flags for cross-compilation
- Removed unnecessary TARGET_CC_ARCH, COMPATIBLE_HOST, and SRC_URI checksum
- Move coremark in alphabetical order in TI_TEST_TI_TOOLS

Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707

 meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
 .../recipes-benchmark/coremark/coremark.bb    | 18 ++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta-arago-test/licenses/Coremark
 create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark.bb

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
diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark.bb b/meta-=
arago-test/recipes-benchmark/coremark/coremark.bb
new file mode 100644
index 00000000..e7c76dbe
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "An industry-standard benchmark that measures the performance =
of CPUs and embedded MCUs."
+
+LICENSE =3D "Coremark"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
+
+SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3D=
https"
+SRCREV =3D "d5fad6bd094899101a4e5fd53af7298160ced6ab"
+
+S =3D "${WORKDIR}/git"
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
index c1166bc2..e05add8b 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -89,6 +89,7 @@ TI_TEST_BASE:append:armv7ve =3D " \
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
     arm-ddr-bandwidth \
+    coremark \
     cpuloadgen \
     input-utils \
     ltp-ddt \
--=20
2.34.1


