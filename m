Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0037ACF31BF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:41:56 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5948.1763556105483567984
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 04:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nUkkYE18;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.85.51, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTWiVJRfkLlT1L9M2fDsyT1eb3G9Ab7nYUf4U2qxDVKuvciXskRrou9nA3ZTYKfNFsxhLUxzBXlKyty2GsOjHx3nsxfevAKH4FbHgSu/9BWttzWvfZEUgOa+3M4nm0NCLrqwBGI+pOr0fEy2b5s7oVMqCxHH+AHDpLM+tzfFPszbnGxmIW1z89hbHxT4Z4eV9ZVrgPW9S08VZJb91/D2wR/LkyCbvOg8S8Pgw4R0dJtDqrEA8zD210pCpDjro3RTC7rYkyPvhOfkdstHZ2NQjtdOiA8jN+PXXuASA3iK7/Kqwqjc6bR2aBDABNt1WV+iRpeMlPPTm1uqylCcA1IFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opkk+G4WY5eW3fKGDkeetipOhC1F9jdkTfk5/tz6FQc=;
 b=pjJnjfOplqAo3m7br5v21P1QE57O6jydjpgxTVCg7f5b4gwF9a786z94DmHEedqfYyqJcjjlhFOtbcbZejOxbO5nUb/4o9ggBNwqeJLvSUNSUzvqIIpTCByACGF3WDAN2v1rO8xM9rhkCHERn6MZyb+oNfjnEC3858NN2AlPj6Eha0LRFclIR3JEt3IKsPkuZMLdiWeSP95bV03J73pjMyQhsBduhvYwA8dc5e734SAvqcZbDbGcc+/PNinMTpkF4FggZEltCQkShHxTm1/OSppFM2a7KwrcMvfIYjvdIoJI5WIOrrZe7hlKNmEu+UOwCIqTMzkmU2RfcIDabmdXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opkk+G4WY5eW3fKGDkeetipOhC1F9jdkTfk5/tz6FQc=;
 b=nUkkYE18lKqCyvvsjHWd2tm64LLFNkJP+NdPTIQup24qBk6anXQ+lS574QPzDi93nZtVeesXNSdYOJLDW8+QtZBq5KMB026lkwULZoEv/32dNfK78qTcW1L41HkaIQSZYLvANhjW8uZ53n1CYvVAszLd+gSX0FNKgU6lU5IhbHk=
Received: from BYAPR07CA0093.namprd07.prod.outlook.com (2603:10b6:a03:12b::34)
 by PH7PR10MB5878.namprd10.prod.outlook.com (2603:10b6:510:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Wed, 19 Nov
 2025 12:41:40 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::f3) by BYAPR07CA0093.outlook.office365.com
 (2603:10b6:a03:12b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 12:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 12:41:39 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 06:41:38 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 06:41:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 06:41:37 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJCfafO1885274;
	Wed, 19 Nov 2025 06:41:36 -0600
From: sadik <s-sadik@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramchaneni <prudhvi@ti.com>
Subject: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CPU benchmark
Date: Wed, 19 Nov 2025 18:11:15 +0530
Message-ID: <20251119124115.1228847-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH7PR10MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2f349e-1ade-40d6-1194-08de2768fc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDBHQ1BqeXdsajZybERRTGhTUVUvODlJMmhtVVRRN3UwRFBvUmg5ZjdOdkk2?=
 =?utf-8?B?Wmg1bW9Vd3pVVS9YMEp6dGp2Vzc3ZUEvZnArWnJCQ3djVXdIbS8wcHg4b0xw?=
 =?utf-8?B?NmNwb21ReXdKc2dVWnRMTFRvcXRyZXpWdzhMRXRDUEpQWkpQNDJFV2o5Tnkv?=
 =?utf-8?B?dzlPaXM3S0RycGlMczIvV3A0b2t6YW5GQTlST3VmNVVreHk1SkJwVjFJTkZK?=
 =?utf-8?B?czFOcC92My96R0JDN0UrTStlSFJXczEraGJYQVEzNFRMSHJqa011WXVLNnN0?=
 =?utf-8?B?eUhMYnF4eHpQbnpNU0xaRk12WDQvaXEwL1BMWjBkYzhuQm4xc2xnQkQzZXBq?=
 =?utf-8?B?M1laWmxRcWQ2MWZFS0lkVmJQMzQ3SHBOVURUVHNUd3hzUHlteGd1YmtKWGRi?=
 =?utf-8?B?WnJPWjJ5UStqODI1bldJNUNxYXhDVEdTVU1rR3lIVytSZHh0cVhzczNNUllr?=
 =?utf-8?B?b0syNGVablVOeVJaTE5weWUzeDZUZ2c5TTVhUTBTNkJWR1NWdm1qMDQvakFL?=
 =?utf-8?B?MGZCMEtROGlvRmtuc2orNHd5cGVjRS9HWmcvNlpaOE9RTjh1OVZCNjJKSzN4?=
 =?utf-8?B?ZlltOCtFakIralJKQWRjd21ibmdWRlJwTjhuM1ZraFVOK2lCbnRxSFpBNXR5?=
 =?utf-8?B?M3Nzc2hrN3RqQWRTdzJRMUhUSFV4dmJ0NEcyVStkbkMvY3FzZzB3ZFovMTVp?=
 =?utf-8?B?aXcvQ1psUTg2ckNTanpLN0ZES1Z3UkUwa0NLN2Z2Z1VYcHhjSHBGNVRwbHZo?=
 =?utf-8?B?ZlZsS3pGaldkbWdBSHRxNm54THd0SU4wMUlneWF3bHJGTFlXN05TbGw0Z0ZG?=
 =?utf-8?B?Wi9DeE1peWkzUW0wN3NLQXJ0UzZXamQzS0VPTzlhVkNhNW1BRTlTQmVyV2Rn?=
 =?utf-8?B?NTRpbFF4MkdzWnJIU0djUFZpbEpNRFhoeUhlSklMdFRXTDdOaC9mR2xCVkJZ?=
 =?utf-8?B?YzVibzI5S2VvUVN0WmV4MHo3Qzl6Q1QrSTZkdGNqTFh6enlqaEVCYmJ1dyti?=
 =?utf-8?B?S2lSWjRsRzhVMGVZRlhNaWpoZjFZVFhjWERoUCtkNENETkhaUHFGMVViOFIz?=
 =?utf-8?B?TjIvV2lGbGErS1gwbm5LTlpDWjF4bElNRGpWMm1jZFhydXFZc0tiMGpSenBs?=
 =?utf-8?B?TDVudE4yMzFzazJ3eTVCV0lOK0llYUxma21pUzh6OHhLZ2s0L3VPVDJVa2dI?=
 =?utf-8?B?RmlLbkNZb01DR1NwcmNqK0d1OFRMTXE3ZDF1VEFMNnZiRUJYQW01am1JYzhJ?=
 =?utf-8?B?YlRGSGM4SFczV0N2V0s5SVVTZTlmVFBYRlFacmwxZkZSVGJlb1F5WEJrSEVO?=
 =?utf-8?B?QlZhU21tbGw0SkxIUWtTaTFlRUN4bENRQ3lUMnpxOC9sUUlKRnhYbG05YmQw?=
 =?utf-8?B?Q2RlR1MrNXBRUnBseTNiMGRJSnZSbDBtUVZVSUFHdk5zWkZQczBXcE5mSlR0?=
 =?utf-8?B?Mk1JcndYc0xOTGt5ZmtaMHhib1piQnVUbFlqbGFvODJjYkNjbVQ3ay9qMGdt?=
 =?utf-8?B?VExrOVVRVmt5TnpobFBPemQxbWJXL1gxYkJidFpoMVdjMnB6aTFzODR6OGRQ?=
 =?utf-8?B?OGpINXRBcmhtOHpVNFYxTW41cHFjYzJYLzRFTmppSXlBL1NLWUh0TUg4Zk5S?=
 =?utf-8?B?M2xTb056TC95NGZSRDZJZHI2YmZMd0VnR05pUHZUVHlQN1ErbUhMUDhhM05T?=
 =?utf-8?B?UHFsMy9QOCtIWmg0M1RLMlRhYVlCaS9kenRhQm1SdmUxWExIb1JXbGlLL3Mx?=
 =?utf-8?B?NzFZK2RscmhDTXh0WmZJcEVXSXFzeHVYWFJ1VklhR1d6WGs3V3FranpGdHdB?=
 =?utf-8?B?K1VyLzkzbE4zSDl2dkk2UURIbVcwSVJxZ3AwSVZMUWJKQllOR1JUcmttY1RD?=
 =?utf-8?B?dEtSSzJiMENLc0Rncit3MjhIUGtvbzBpMzViZHFzTHNmLzM0Sk1CR2Z1Y3Ba?=
 =?utf-8?B?WVlyQkF6Yytucll3QldmcXdUeU1jRHBSZFVVU1NnR0RiWE5sMnVDeG8wV0xS?=
 =?utf-8?B?b2VoU3BEOFdoWC9LYThzSWtRTTRRenFnSUZyQ2xaYkFUN2pJYTVDdE53Zlkv?=
 =?utf-8?B?V2Q4WXU5Ry9wWHJyZ2VwZlplVldlNlRUekcvVFRaeTliMGtRc1BTdFRXRVBl?=
 =?utf-8?Q?rlsE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:41:39.9007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2f349e-1ade-40d6-1194-08de2768fc8c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5878
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 12:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16793

Add CoreMark benchmark recipe to measure CPU
performance on TI platforms,Integrate CoreMark
into ti-test package group alongside arm-benchmarks.

CoreMark is an industry-standard CPU benchmark from=20
EEMBC(Embedded Microprocessor Benchmark Consortium)=20
that provides a standardized method to test the=20
performance of processors.

Signed-off-by: sadik <s-sadik@ti.com>
---

Changes in v5:
- change subject line to include recipe name
- append _git to recipe name for tracking of version

Link to v4:https://lists.yoctoproject.org/g/meta-arago/message/16784

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

---
 meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
 .../coremark/coremark_git.bb                  | 18 ++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 3 files changed, 110 insertions(+)
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
index 00000000..7655a445
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Industry-standard benchmark that measures CPU performance"
+
+LICENSE =3D "Coremark"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668a=
ebe1"
+
+SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3D=
https"
+SRCREV =3D "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
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


