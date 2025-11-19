Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F4BCF397F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:29:40 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12876.1763573369053305721
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bdQ4v7U4;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.193.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdXh6/0IHY2cy/12jlvcjKB4PwELzQgixg/cWBdOIvnvERO6djMSoImaIRisbiArIg1ilWoM7SOpKPGEK3iOS7ohqOAESpYIpWgQEKSCYuSw/Mm/6otqLWfZeMPqmTsf1n7TgX02bR2iixbeCsoWB208c/2++ln32tqqaf1WemA378RQtaTlRQMOvIaKZXJX6yxCMnid20wFUCKxkrBQvJndOnUAh6EeNMzGqY6lzcBUlDCgej7CDBAxpeuf0YqBqYvivaOmFqskN8kCM6uH455GaF7ZMeec91ZH8sG+tb+Btq2l2H44qiI9JFFTQkoOWD3rNVXS5s7FKRBt6LWovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyVjr/bl7sZo5pdUzmhgDuIDjzVyJgtEY+ko+uM74Zw=;
 b=ruLuW1JE2eqXTXg+oESVu8ZAh9tapFqflS8VVXoUGTlM+Dp7pHCQX7malG1a8Rv2uG7HorgVjAkso7uC90L46xaYTDxboxXkbUutuZ0kMT56ym7SOzCcKsj+jv0HN/3sL7IhogxvM9iTWh/5SrA5JLDfaayj7GWTGmASchfODVjmVZHKsL5J2oza3vdnX6BxcIMmsCZGLv0SwxqL8Dk8ywS0ZFtdtfEaED1jqZ5U1N5U32VBf3AOM0I4RkqHVZ/uHG95ZziAHn7W0sMCy66CIdYkb2L0sa5oJbchQc8kQ6X/AuvXXJDjT8H5Oslkv+TKPMfJoiWbcQHGemo2IHQfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyVjr/bl7sZo5pdUzmhgDuIDjzVyJgtEY+ko+uM74Zw=;
 b=bdQ4v7U4ZZX6Lo6aFeAAO/oljSILeTRDEtEpZ+/GQf0jS+9/g4kSqxGt14hyM0zyjcRUpofH0hcwZ5e3oWbwigN70vFD/rfpVbmdSBRaBMzhg5zQ6dRoAFFevW/eOm1cyebtImpzoweeK7aC3EyccVjxK3K2BrAfllVcgZi2IDU=
Received: from BN9PR03CA0426.namprd03.prod.outlook.com (2603:10b6:408:113::11)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:29:25 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::b5) by BN9PR03CA0426.outlook.office365.com
 (2603:10b6:408:113::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 17:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 17:29:24 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 11:29:20 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 11:29:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 11:29:19 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJHTJap2270839;
	Wed, 19 Nov 2025 11:29:19 -0600
Message-ID: <2d72b324-77d8-4d3e-b453-bfdbf6df7b28@ti.com>
Date: Wed, 19 Nov 2025 11:29:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CPU
 benchmark
To: sadik <s-sadik@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Prudhvi Veeramchaneni <prudhvi@ti.com>
References: <20251119124115.1228847-1-s-sadik@ti.com>
 <18797884660B36B2.1255594@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18797884660B36B2.1255594@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BY5PR10MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d63bfa0-7fad-4107-7659-08de27912f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/CKLNbTSiiDVe8SITRXnjk+YOC49LxernfMtPVAAu9Pyr4aLo7DwCOJxXupJ?=
 =?us-ascii?Q?R5H+Neg55ugjnuHszpI1RT5E2FSkJ/QnzzAh3beVlCmrtVqYc1APsYSHjmTb?=
 =?us-ascii?Q?JxyIcvsaZVmjIxuJXWQFnhvbj5Htaddd/ofVyz048YwWoAoOPo2lKBM/1IBZ?=
 =?us-ascii?Q?vxVB1GkLY1ajjo9HaWWS7hhCej3RaUvwnaHoU1YRNPaqbfY5XMTYnuwxWgCF?=
 =?us-ascii?Q?mk4zUUpLgg9CzhBvC7WEo+3f4VoW1EVXifIhjtNcUBjQCV4VnfXkoFj0TwGM?=
 =?us-ascii?Q?1QC7jKnAfc57jbdBovtRJIqanAZ4HZDK8btwVFCLrzIfFIWOr1NJR/m/p1Ab?=
 =?us-ascii?Q?4kHtM5HXw87yvqm0Haai6iib+uBxGu/AMWCs6jhOEy4Gm++5aalB+ZJNNG1j?=
 =?us-ascii?Q?3i1fo0b0CgyUlIbmlPNdTnUNa8HLNk0AVwDmFnrBv408A+tAHsxLTv68yKHB?=
 =?us-ascii?Q?LI32n8Il+cM+vpx5iyjPXzU+m54nbOQvJ2BLZvqMHFpRSlYr/nfzsvYHE8sD?=
 =?us-ascii?Q?vnklpT+WPdJxBw1jT0L1PLrypJLQbn36TcRCNS18SSRWiyomZYA1XLmNPkpf?=
 =?us-ascii?Q?XQ0OrkcdlBThKnsUQV33bjFISTiM7MlbP93ZP8YMPKLqqphOdLe9GzWdOYh1?=
 =?us-ascii?Q?anq94nirfxuN59vVTOift8lBM3V/OnElSFJXe9S2yXkEaynLY6tQXpr/Jfpi?=
 =?us-ascii?Q?88bBCCqRowRU8adpar/0IoW1bxekO2zdHPomtw65NW9bkdOqUao6iYHULmur?=
 =?us-ascii?Q?+3wd4mrb9tppkHJj4Y9xdtAm2vrBKi7Thv+Lr3v+WzqBcoiE4ZJZj5mS07nN?=
 =?us-ascii?Q?GGwZEwvwCFWRpj9v3hCXqLAZpkntLNmz5Kw/pY/6mgP745QMLQ9nG51Hs++I?=
 =?us-ascii?Q?/ksBw0ZBSDJPN3ONKLpUBg++C7Ub8zGOXuA08H/qvzo8csWX9itqG9k0J8Dd?=
 =?us-ascii?Q?5SIrVt4zoJYl5Mi0pyYlJDjUhifHJN+M2P9HxYtvMoNk1XCmAOqYmJgvrlZT?=
 =?us-ascii?Q?JksyiquTd19cI0DGjfxWWTIvmEn5SjY7fbI2lhQKUvjZTQ+GyL1fcycgfsgp?=
 =?us-ascii?Q?Y6maCNmCjEDA19s8lSbLGmKfbdCymiZphdQAz1wPgJpfukmWUrNaegfIbd6u?=
 =?us-ascii?Q?FZnvfUHh9bUocGcF8jRcxYkMSBxI8rEpiab82qxylCkHUF3EeP//CyoxnT/q?=
 =?us-ascii?Q?PcmUWYnAwXaEpSiqg7yLJLsRUE05MHOCqptasgaEYQkOe5gQ5GyKIvSDP/xD?=
 =?us-ascii?Q?YPAhbzrzkb89OvK/PnOY2iiUqW4TSWPQO+XM3Ckexx5wAXuhNdvjzzApWiwg?=
 =?us-ascii?Q?Qv5wamTu+B/jl00wy+EdZhhBa+m2kDAFDJhU22YhKPwcswQfGY8t6mP+kJ56?=
 =?us-ascii?Q?QQd+hkSHV7vWk64HkakNoSqj4+jjIfD8M9Rt0zILIHvUkQWFvBj0Ya3oU2fB?=
 =?us-ascii?Q?B0s+535gWyNbX6vRn8CYC+1xuJUcKTUyoPU79F6JvrKKvAovjWhSYSrgzhHp?=
 =?us-ascii?Q?+Z0Keai8pp++/M2+Mhdge46WrWKWg/iziHw7ujJwyd6/eLjNGb5I0wE4YxNW?=
 =?us-ascii?Q?tcBARMXdPzZUNhM3TCA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:29:24.5641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d63bfa0-7fad-4107-7659-08de27912f0d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16796



On 11/19/2025 11:27 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 11/19/2025 6:41 AM, sadik wrote:
>> Add CoreMark benchmark recipe to measure CPU
>> performance on TI platforms,Integrate CoreMark
>> into ti-test package group alongside arm-benchmarks.
>>
>> CoreMark is an industry-standard CPU benchmark from
>> EEMBC(Embedded Microprocessor Benchmark Consortium)
>> that provides a standardized method to test the
>> performance of processors.
>>
>> Signed-off-by: sadik <s-sadik@ti.com>
>> ---
>>
>> Changes in v5:
>> - change subject line to include recipe name
>> - append _git to recipe name for tracking of version
>>
>> Link to v4:https://lists.yoctoproject.org/g/meta-arago/message/16784
>>
>> Changes in v4:
>> - change logs moved after the "---" line
>> - change the summary of the coremark in recipe
>>
>> Link to v3:https://lists.yoctoproject.org/g/meta-arago/message/16776
>>
>> Changes in v3:
>> - sent patch via UTF-8 encoding
>>
>> Changes in v2:
>> - Include Coremark licese file in licenses
>> - Use oe_runmake with proper compiler flags for cross-compilation
>> - Removed unnecessary TARGET_CC_ARCH, COMPATIBLE_HOST, and SRC_URI=20
>> checksum
>> - Move coremark in alphabetical order in TI_TEST_TI_TOOLS
>>
>> Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707
>>
>> ---
>> =C2=A0 meta-arago-test/licenses/Coremark=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 91 +++++++++++++++++++
>> =C2=A0 .../coremark/coremark_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++=
+
>> =C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 3 files changed, 110 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-test/licenses/Coremark
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>>
>> diff --git a/meta-arago-test/licenses/Coremark=20
>> b/meta-arago-test/licenses/Coremark
>> new file mode 100644
>> index 00000000..c6e062f8
>> --- /dev/null
>> +++ b/meta-arago-test/licenses/Coremark
>> @@ -0,0 +1,91 @@
>> +COREMARK=C2=AE ACCEPTABLE USE AGREEMENT
>> +This ACCEPTABLE USE AGREEMENT (this =E2=80=9CAgreement=E2=80=9D) is off=
ered by=20
>> Embedded Microprocessor Benchmark Consortium, a California nonprofit=20
>> corporation (=E2=80=9CLicensor=E2=80=9D), to users of its CoreMark=C2=AE=
 software=20
>> (=E2=80=9CLicensee=E2=80=9D) exclusively on the following terms.
>> +
>> +Licensor offers benchmarking software (=E2=80=9CSoftware=E2=80=9D) purs=
uant to an=20
>> open source license, but carefully controls use of its benchmarks and=20
>> their associated goodwill. Licensor has registered its trademark in=20
>> one of the benchmarks available through the Software, COREMARK, Ser.=20
>> No. 85/487,290; Reg. No. 4,179,307 (the =E2=80=9CTrademark=E2=80=9D), an=
d promotes the=20
>> use of a standard metric as a benchmark for assessing the performance=20
>> of embedded systems. Solely on the terms described herein, Licensee=20
>> may use and display the Trademark in connection with the generation of=20
>> data regarding measurement and analysis of computer and embedded=20
>> system benchmarking via the Software (the =E2=80=9CLicensed Use=E2=80=9D=
).
>> +
>> +Article 1 =E2=80=93 License Grant.
>> +1.1. License. Subject to the terms and conditions of this Agreement,=20
>> Licensor hereby grants to Licensee, and Licensee hereby accepts from=20
>> Licensor, a personal, non-exclusive, royalty-free, revocable right and=20
>> license to use and display the Trademark during the term of this=20
>> Agreement (the =E2=80=9CTerm=E2=80=9D), solely and exclusively in connec=
tion with the=20
>> Licensed Use. During the Term, Licensee (i) shall not modify or=20
>> otherwise create derivative works of the Trademark, and (ii) may use=20
>> the Trademark only to the extent permitted under this License. Neither=20
>> Licensee nor any affiliate or agent thereof shall otherwise use the=20
>> Trademark without the prior express written consent of Licensor, which=20
>> may be withheld in its sole and absolute discretion. All rights not=20
>> expressly granted to Licensee hereunder shall remain the exclusive=20
>> property of Licensor.
>> +
>> +1.2. Modifications to the Software. Licensee shall not use the=20
>> Trademark in connection with any use of a modified, derivative, or=20
>> otherwise altered copy of the Software.
>> +
>> +1.3. Licensor=E2=80=99s Use. Nothing in this Agreement shall preclude=20
>> Licensor or any of its successors or assigns from using or permitting=20
>> other entities to use the Trademark, whether or not such entity=20
>> directly or indirectly competes or conflicts with Licensee=E2=80=99s Lic=
ensed=20
>> Use in any manner.
>> +
>> +1.4. Term and Termination. This Agreement is perpetual unless=20
>> terminated by either of the parties. Licensee may terminate this=20
>> Agreement for convenience, without cause or liability, for any reason=20
>> or for no reason whatsoever, upon ten (10) business days written=20
>> notice. Licensor may terminate this Agreement effective immediately=20
>> upon notice of breach. Upon termination, Licensee shall immediately=20
>> remove all implementations of the Trademark from the Licensed Use, and=20
>> delete all digitals files and records of all materials related to the=20
>> Trademark.
>> +
>> +Article 2 =E2=80=93 Ownership.
>> +2.1. Ownership. Licensee acknowledges and agrees that Licensor is the=20
>> owner of all right, title, and interest in and to the Trademark, and=20
>> all such right, title, and interest shall remain with Licensor.=20
>> Licensee shall not contest, dispute, challenge, oppose, or seek to=20
>> cancel Licensor=E2=80=99s right, title, and interest in and to the Trade=
mark.=20
>> Licensee shall not prosecute any application for registration of the=20
>> Trademark. Licensee shall display appropriate notices regarding=20
>> ownership of the Trademark in connection with the Licensed Use.
>> +
>> +2.2. Goodwill. Licensee acknowledges that Licensee shall not acquire=20
>> any right, title, or interest in the Trademark by virtue of this=20
>> Agreement other than the license granted hereunder, and disclaims any=20
>> such right, title, interest, or ownership. All goodwill and reputation=20
>> generated by Licensee=E2=80=99s use of the Trademark shall inure to the=
=20
>> exclusive benefit of Licensor. Licensee shall not by any act or=20
>> omission use the Trademark in any manner that disparages or reflects=20
>> adversely on Licensor or its Licensed Use or reputation. Licensee=20
>> shall not take any action that would interfere with or prejudice=20
>> Licensor=E2=80=99s ownership or registration of the Trademark, the valid=
ity of=20
>> the Trademark or the validity of the license granted by this=20
>> Agreement. If Licensor determines and notifies Licensee that any act=20
>> taken in connection with the Licensed Use (i) is inaccurate, unlawful=20
>> or offensive to good taste; (ii) fails to provide for proper trademark=20
>> notices, or (iii) otherwise violates Licensee=E2=80=99s obligations unde=
r this=20
>> Agreement, the license granted under this Agreement shall terminate.
>> +
>> +Article 3 =E2=80=93 Indemnification.
>> +3.1. Indemnification Generally. Licensee agrees to indemnify, defend,=20
>> and hold harmless (collectively =E2=80=9Cindemnify=E2=80=9D or =E2=80=9C=
indemnification=E2=80=9D)=20
>> Licensor, including Licensor=E2=80=99s members, managers, officers, and=
=20
>> employees (collectively =E2=80=9CRelated Persons=E2=80=9D), from and aga=
inst, and pay=20
>> or reimburse Licensor and such Related Persons for, any and all=20
>> third-party actions, claims, demands, proceedings, investigations,=20
>> inquiries (collectively, =E2=80=9CClaims=E2=80=9D), and any and all liab=
ilities,=20
>> obligations, fines, deficiencies, costs, expenses, royalties, losses,=20
>> and damages (including reasonable outside counsel fees and expenses)=20
>> associated with such Claims, to the extent that such Claim arises out=20
>> of (i) Licensee=E2=80=99s material breach of this Agreement, or (ii) any=
=20
>> allegation(s) that Licensee=E2=80=99s actions infringe or violate any=20
>> third-party intellectual property right, including without limitation,=20
>> any U.S. copyright, patent, or trademark, or are otherwise found to be=20
>> tortious or criminal (whether or not such indemnified person is a=20
>> named party in a legal proceeding).
>> +
>> +3.2. Notice and Defense of Claims. Licensor shall promptly notify=20
>> Licensee of any Claim for which indemnification is sought, following=20
>> actual knowledge of such Claim, provided however that the failure to=20
>> give such notice shall not relieve Licensee of its obligations=20
>> hereunder except to the extent that Licensee is materially prejudiced=20
>> by such failure. In the event that any third-party Claim is brought,=20
>> Licensee shall have the right and option to undertake and control the=20
>> defense of such action with counsel of its choice, provided however=20
>> that (i) Licensor at its own expense may participate and appear on an=20
>> equal footing with Licensee in the defense of any such Claim, (ii)=20
>> Licensor may undertake and control such defense in the event of the=20
>> material failure of Licensee to undertake and control the same; and=20
>> (iii) the defense of any Claim relating to the intellectual property=20
>> rights of Licensor or its licensors and any related counterclaims=20
>> shall be solely controlled by Licensor with counsel of its choice.=20
>> Licensee shall not consent to judgment or concede or settle or=20
>> compromise any Claim without the prior written approval of Licensor=20
>> (whose approval shall not be unreasonably withheld), unless such=20
>> concession or settlement or compromise includes a full and=20
>> unconditional release of Licensor and any applicable Related Persons=20
>> from all liabilities in respect of such Claim.
>> +
>> +Article 4 =E2=80=93 Miscellaneous.
>> +4.1. Relationship of the Parties. This Agreement does not create a=20
>> partnership, franchise, joint venture, agency, fiduciary, or=20
>> employment relationship between the parties.
>> +
>> +4.2. No Third-Party Beneficiaries. Except for the rights of Related=20
>> Persons under Article 3 (Indemnification), there are no third-party=20
>> beneficiaries to this Agreement.
>> +
>> +4.3. Assignment. Licensee=E2=80=99s rights hereunder are non-assignable=
, and=20
>> may not be sublicensed.
>> +
>> +4.4. Equitable Relief. Licensee acknowledges that the remedies=20
>> available at law for any breach of this Agreement will, by their=20
>> nature, be inadequate. Accordingly, Licensor may obtain injunctive=20
>> relief or other equitable relief to restrain a breach or threatened=20
>> breach of this Agreement or to specifically enforce this Agreement,=20
>> without proving that any monetary damages have been sustained, and=20
>> without the requirement of posting of a bond prior to obtaining such=20
>> equitable relief.
>> +
>> +4.5. Governing Law. This Agreement will be interpreted, construed,=20
>> and enforced in all respects in accordance with the laws of the State=20
>> of California, without reference to its conflict of law principles.
>> +
>> +4.6. Attorneys=E2=80=99 Fees. If any legal action, arbitration or other=
=20
>> proceeding is brought for the enforcement of this Agreement, or=20
>> because of an alleged dispute, breach, default, or misrepresentation=20
>> in connection with any of the provisions of this Agreement, the=20
>> successful or prevailing party shall be entitled to recover its=20
>> reasonable attorneys=E2=80=99 fees and other reasonable costs incurred i=
n that=20
>> action or proceeding, in addition to any other relief to which it may=20
>> be entitled.
>> +
>> +4.7. Amendment; Waiver. This Agreement may not be amended, nor may=20
>> any rights under it be waived, except in writing by Licensor.
>> +
>> +4.8. Severability. If any provision of this Agreement is held by a=20
>> court of competent jurisdiction to be contrary to law, the provision=20
>> shall be modified by the court and interpreted so as best to=20
>> accomplish the objectives of the original provision to the fullest=20
>> extent permitted by law, and the remaining provisions of this=20
>> Agreement shall remain in effect.
>> +
>> +4.9. Entire Agreement. This Agreement constitutes the entire=20
>> agreement between the parties and supersedes all prior and=20
>> contemporaneous agreements, proposals or representations, written or=20
>> oral, concerning its subject matter.
>> +
>> +Apache License
>> +Version 2.0, January 2004
>> +
>> +http://www.apache.org/licenses/
>> +
>> +TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
>> +Definitions.
>> +"License" shall mean the terms and conditions for use, reproduction,=20
>> and distribution as defined by Sections 1 through 9 of this document.
>> +
>> +"Licensor" shall mean the copyright owner or entity authorized by the=20
>> copyright owner that is granting the License.
>> +
>> +"Legal Entity" shall mean the union of the acting entity and all=20
>> other entities that control, are controlled by, or are under common=20
>> control with that entity. For the purposes of this definition,=20
>> "control" means (i) the power, direct or indirect, to cause the=20
>> direction or management of such entity, whether by contract or=20
>> otherwise, or (ii) ownership of fifty percent (50%) or more of the=20
>> outstanding shares, or (iii) beneficial ownership of such entity.
>> +
>> +"You" (or "Your") shall mean an individual or Legal Entity exercising=20
>> permissions granted by this License.
>> +
>> +"Source" form shall mean the preferred form for making modifications,=20
>> including but not limited to software source code, documentation=20
>> source, and configuration files.
>> +
>> +"Object" form shall mean any form resulting from mechanical=20
>> transformation or translation of a Source form, including but not=20
>> limited to compiled object code, generated documentation, and=20
>> conversions to other media types.
>> +
>> +"Work" shall mean the work of authorship, whether in Source or Object=20
>> form, made available under the License, as indicated by a copyright=20
>> notice that is included in or attached to the work (an example is=20
>> provided in the Appendix below).
>> +
>> +"Derivative Works" shall mean any work, whether in Source or Object=20
>> form, that is based on (or derived from) the Work and for which the=20
>> editorial revisions, annotations, elaborations, or other modifications=20
>> represent, as a whole, an original work of authorship. For the=20
>> purposes of this License, Derivative Works shall not include works=20
>> that remain separable from, or merely link (or bind by name) to the=20
>> interfaces of, the Work and Derivative Works thereof.
>> +
>> +"Contribution" shall mean any work of authorship, including the=20
>> original version of the Work and any modifications or additions to=20
>> that Work or Derivative Works thereof, that is intentionally submitted=20
>> to Licensor for inclusion in the Work by the copyright owner or by an=20
>> individual or Legal Entity authorized to submit on behalf of the=20
>> copyright owner. For the purposes of this definition, "submitted"=20
>> means any form of electronic, verbal, or written communication sent to=20
>> the Licensor or its representatives, including but not limited to=20
>> communication on electronic mailing lists, source code control=20
>> systems, and issue tracking systems that are managed by, or on behalf=20
>> of, the Licensor for the purpose of discussing and improving the Work,=20
>> but excluding communication that is conspicuously marked or otherwise=20
>> designated in writing by the copyright owner as "Not a Contribution."
>> +
>> +"Contributor" shall mean Licensor and any individual or Legal Entity=20
>> on behalf of whom a Contribution has been received by Licensor and=20
>> subsequently incorporated within the Work.
>> +
>> +Grant of Copyright License. Subject to the terms and conditions of=20
>> this License, each Contributor hereby grants to You a perpetual,=20
>> worldwide, non-exclusive, no-charge, royalty-free, irrevocable=20
>> copyright license to reproduce, prepare Derivative Works of, publicly=20
>> display, publicly perform, sublicense, and distribute the Work and=20
>> such Derivative Works in Source or Object form.
>> +
>> +Grant of Patent License. Subject to the terms and conditions of this=20
>> License, each Contributor hereby grants to You a perpetual, worldwide,=20
>> non-exclusive, no-charge, royalty-free, irrevocable (except as stated=20
>> in this section) patent license to make, have made, use, offer to=20
>> sell, sell, import, and otherwise transfer the Work, where such=20
>> license applies only to those patent claims licensable by such=20
>> Contributor that are necessarily infringed by their Contribution(s)=20
>> alone or by combination of their Contribution(s) with the Work to=20
>> which such Contribution(s) was submitted. If You institute patent=20
>> litigation against any entity (including a cross-claim or counterclaim=20
>> in a lawsuit) alleging that the Work or a Contribution incorporated=20
>> within the Work constitutes direct or contributory patent=20
>> infringement, then any patent licenses granted to You under this=20
>> License for that Work shall terminate as of the date such litigation=20
>> is filed.
>> +
>> +Redistribution. You may reproduce and distribute copies of the Work=20
>> or Derivative Works thereof in any medium, with or without=20
>> modifications, and in Source or Object form, provided that You meet=20
>> the following conditions:
>> +
>> +You must give any other recipients of the Work or Derivative Works a=20
>> copy of this License; and You must cause any modified files to carry=20
>> prominent notices stating that You changed the files; and You must=20
>> retain, in the Source form of any Derivative Works that You=20
>> distribute, all copyright, patent, trademark, and attribution notices=20
>> from the Source form of the Work, excluding those notices that do not=20
>> pertain to any part of the Derivative Works; and If the Work includes=20
>> a "NOTICE" text file as part of its distribution, then any Derivative=20
>> Works that You distribute must include a readable copy of the=20
>> attribution notices contained within such NOTICE file, excluding those=20
>> notices that do not pertain to any part of the Derivative Works, in at=20
>> least one of the following places: within a NOTICE text file=20
>> distributed as part of the Derivative Works; within the Source form or=20
>> documentation, if provided along with the Derivative Works; or, within=20
>> a display generated by the Derivative Works, if and wherever such=20
>> third-party notices normally appear. The contents of the NOTICE file=20
>> are for informational purposes only and do not modify the License. You=20
>> may add Your own attribution notices within Derivative Works that You=20
>> distribute, alongside or as an addendum to the NOTICE text from the=20
>> Work, provided that such additional attribution notices cannot be=20
>> construed as modifying the License.
>> +
>> +You may add Your own copyright statement to Your modifications and=20
>> may provide additional or different license terms and conditions for=20
>> use, reproduction, or distribution of Your modifications, or for any=20
>> such Derivative Works as a whole, provided Your use, reproduction, and=20
>> distribution of the Work otherwise complies with the conditions stated=20
>> in this License.
>> +
>> +Submission of Contributions. Unless You explicitly state otherwise,=20
>> any Contribution intentionally submitted for inclusion in the Work by=20
>> You to the Licensor shall be under the terms and conditions of this=20
>> License, without any additional terms or conditions. Notwithstanding=20
>> the above, nothing herein shall supersede or modify the terms of any=20
>> separate license agreement you may have executed with Licensor=20
>> regarding such Contributions.
>> +
>> +Trademarks. This License does not grant permission to use the trade=20
>> names, trademarks, service marks, or product names of the Licensor,=20
>> except as required for reasonable and customary use in describing the=20
>> origin of the Work and reproducing the content of the NOTICE file.
>> +
>> +Disclaimer of Warranty. Unless required by applicable law or agreed=20
>> to in writing, Licensor provides the Work (and each Contributor=20
>> provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR=20
>> CONDITIONS OF ANY KIND, either express or implied, including, without=20
>> limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT,=20
>> MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely=20
>> responsible for determining the appropriateness of using or=20
>> redistributing the Work and assume any risks associated with Your=20
>> exercise of permissions under this License.
>> +
>> +Limitation of Liability. In no event and under no legal theory,=20
>> whether in tort (including negligence), contract, or otherwise, unless=20
>> required by applicable law (such as deliberate and grossly negligent=20
>> acts) or agreed to in writing, shall any Contributor be liable to You=20
>> for damages, including any direct, indirect, special, incidental, or=20
>> consequential damages of any character arising as a result of this=20
>> License or out of the use or inability to use the Work (including but=20
>> not limited to damages for loss of goodwill, work stoppage, computer=20
>> failure or malfunction, or any and all other commercial damages or=20
>> losses), even if such Contributor has been advised of the possibility=20
>> of such damages.
>> +
>> +Accepting Warranty or Additional Liability. While redistributing the=20
>> Work or Derivative Works thereof, You may choose to offer, and charge=20
>> a fee for, acceptance of support, warranty, indemnity, or other=20
>> liability obligations and/or rights consistent with this License.=20
>> However, in accepting such obligations, You may act only on Your own=20
>> behalf and on Your sole responsibility, not on behalf of any other=20
>> Contributor, and only if You agree to indemnify, defend, and hold each=20
>> Contributor harmless for any liability incurred by, or claims asserted=20
>> against, such Contributor by reason of your accepting any such=20
>> warranty or additional liability.
>> +
>> +END OF TERMS AND CONDITIONS
>> diff --git=20
>> a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb=20
>> b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>> new file mode 100644
>> index 00000000..7655a445
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY =3D "Industry-standard benchmark that measures CPU performance"
>> +
>> +LICENSE =3D "Coremark"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f668aebe1"
>> +
>> +SRC_URI =3D=20
>> "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=3Dhttps"
>> +SRCREV =3D "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
>> +
>> +S =3D "${WORKDIR}/git"
>=20
> This patch looks better, and I'll start testing it today.=C2=A0 But I als=
o=20
> need a master version of this patch since this recipe will not work in=20
> master as is.
>=20
> The only change that I think is needed is to remove the line:
>=20
> S =3D "${WORKDIR}/git"
>=20
>=20
>> +
>> +do_compile() {
>> +=C2=A0=C2=A0=C2=A0 oe_runmake PORT_DIR=3Dlinux CC=3D"${CC}" XCFLAGS=3D"=
${CFLAGS}"=20
>> LFLAGS_END=3D"${LDFLAGS}" compile
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${S}/coremark.exe ${D}${bindir}/core=
mark
>> +}
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index c1166bc2..e05add8b 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -89,6 +89,7 @@ TI_TEST_BASE:append:armv7ve =3D " \
>> =C2=A0 TI_TEST_TI_TOOLS =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm-benchmarks \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm-ddr-bandwidth \
>> +=C2=A0=C2=A0=C2=A0 coremark \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuloadgen \

And cpuloadgen was removed in master, so this files also changes...

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltp-ddt \
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

