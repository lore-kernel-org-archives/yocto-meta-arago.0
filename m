Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051DECF9C42
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 16:13:57 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.329.1763655227891932553
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 08:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XAbGw6Ol;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.201.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ou5+3p5eoeFvFU92jGOQVdgUQFaYo9KJSdKEhRqQBEL0yWR3OhJNvl+ko+J3JMPQiSxrVkpDFYspab8XLUbQOJH3hGT1ZZzNnIISNl1h2p4k6yfqBfhtlRI8XdVQCFD6o4SVTkpFfG/7bMcs2m9KkdYP0Fb2o1kPp6bbTKwguZ0VBD7hcO963Rtf9sfiV43PPVyiIv857AGkBRwx5b+IZ9zaRTFsz4BFac2X3KlJ21HQ9TxB/dMKbrJhYC009XahP9XPBH3oyN1RgtWfo4OYN9ysv1WFI+8a1giiePso6NIPjXQqM/4+MMP60RAmtcPuYG0UMN/SJeS1Zs4wb//JHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBAC0sb002jPWJFtYZdDwuMeS0VgNzXweLdio+6vgaA=;
 b=MBXMeYBbHxDXO8+irMg4atS4gK1iT9Ua0t5sRjax9O1dAKGJgfznE+UVB6jnhk3xFbxxL0OArkN1VWk2jZnVBHJr0crn+AE4L2Du9gO7suy+rrFxQJ1UgCKjsuSG7Kvjj7Tcv+NScICeGFWslXaPRfrhjqYcjEveYwmIZsX03DgHTtLHnvCBt0m/EHbag5BmYZJNxbs4FCR7cE0vQD0i5DYaDNV5LPFNKt33zVAyT4I9x6XqcsseQWw1ogwTndv/ZE5wHDMP9saZu2Yjuie2yVN1UvL/XycTZ3QWO9d6mmTtrnXOKUwJmvkDMgitsETgMp8yZaZVhEfqNjXLZKmdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBAC0sb002jPWJFtYZdDwuMeS0VgNzXweLdio+6vgaA=;
 b=XAbGw6Olbn+KRh+5kReGs92wq4hCqmoRZ/Iav6hqaufN8SyLsrf1TZ/EPm7N0XuD9L6ky/u8PN6/gNCkCLj4OBRq+baynSS1dnlgisv89yAumOe0iv50QDlEd6g0BDOhF5xU9U1Bi4VzUEUkoU4BPozKns4MBPwoen6KUjQDY+M=
Received: from DS7PR03CA0293.namprd03.prod.outlook.com (2603:10b6:5:3ad::28)
 by CH2PR10MB4245.namprd10.prod.outlook.com (2603:10b6:610:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 16:13:45 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3ad:cafe::3b) by DS7PR03CA0293.outlook.office365.com
 (2603:10b6:5:3ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 16:13:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 16:13:43 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 10:13:37 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 10:13:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 10:13:37 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKGDbW33914080;
	Thu, 20 Nov 2025 10:13:37 -0600
Message-ID: <3e4961b5-14cc-4440-83e9-4c17321e8460@ti.com>
Date: Thu, 20 Nov 2025 10:13:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] nnshark: Set missing PV
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20251119215228.185294-1-reatmon@ti.com>
 <1f1d3c0e-ee93-48a9-969b-cd2e617a3b65@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1f1d3c0e-ee93-48a9-969b-cd2e617a3b65@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH2PR10MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f958d6-c7be-4b4d-7b06-08de284fc6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?weKH4QTB6OyoHbZruj8oVnA+DQk53tF6MWIhiXpkT1cjRAVmrLHavtK3bs2j?=
 =?us-ascii?Q?O5+zKpUYTAk8w6SOhmQRzrI2rFOL25iW27ymnbCroviT+y3LLJNcHYf6Hzpm?=
 =?us-ascii?Q?3159g3qttXMHS/QF8uLOCEiDkWl0N2eENvaaX0ZsHc+CYd3VKUqeutG9Ga8v?=
 =?us-ascii?Q?7tvj3vNbUQ1ZXTP/8UKUGhmhWfgxZ1GfTGbrHqRfrHhOGT3kVg28yLcm/Osu?=
 =?us-ascii?Q?laZUt2iIJYJ7AkbKhJSKtNjivPhwUdeX9OmO20V4ykJDF73u9UPKM/8zk/W8?=
 =?us-ascii?Q?3GM/euEZJ4khhCJNYWA2Gu3V5CC+PQhFgnQv9zkyfVIm1rVF4jJ01o8fA3BD?=
 =?us-ascii?Q?dCkK+aMn92EY4pt83fZrzRXVKgUtsl7SalP+uhyaCVClT06EYb8kiRJWy2Ch?=
 =?us-ascii?Q?FmXug5uXeNA5YJi8PDCGqxsrcX2ca4/UA+IGa6SenX8g9w1rctudgtBhmZHJ?=
 =?us-ascii?Q?sMXfxorfIDuEr7J/+d8l7uNfscvCpujmlVyx/Ag1UjND05k96hM5UBFIX8fb?=
 =?us-ascii?Q?z64QfEh2EmT1baRQdWjRSOXhu4DZ21SGeBS/4c4yRq7833ORa6zMna0iaTdU?=
 =?us-ascii?Q?jSXprS8zRaO24PDusLMJGhfYJeGrOxF4anPun9YrD4WrVhpctwfaWZSVA141?=
 =?us-ascii?Q?gNmiaHiT27CEnBFPuCfiqb77yr8AfUI6rgH419rspEerwIEREtJSEyYnXmy5?=
 =?us-ascii?Q?jh5rQIWq7SUXSWRk90RSj0FzOCoy12tYke8MKHFMnFP+4m6ZbklhVqP+foSx?=
 =?us-ascii?Q?yAK2sVDhR10UzBh/l4AyatYOxmfmEBnXswQiw3r7lfkBk6zflkmDnjbkMWhy?=
 =?us-ascii?Q?vliModFqUcaBlTxmbXhdaiPnJHWUETvyCl4YPb1KpCfcTKtFGsX7sD/Fyke6?=
 =?us-ascii?Q?jNXPmsZEsM0WTWLM9iAGIU5oNVdFFMiHqZ2WnHPUhMQf0aS4dSl0mny4DiHj?=
 =?us-ascii?Q?bL0sFa/hkL+Pks1PIaLK2FFqldhLkGBBmw7GEYJ1mMpAL3hPEnt2RhcvVHhJ?=
 =?us-ascii?Q?KfwJTCp56DiE1VxG9uBtPnOTvdmCnA+zkvXHJ1jDLtu6PBfU5RdNcNKilAtl?=
 =?us-ascii?Q?5KRG6s7GJXqorFnxrmi0vTXbluWJRrV4nha8xqD2VbygLaOdOGOms0PYEYNz?=
 =?us-ascii?Q?/9jkhNGkqoBv+R9JT8M2QvT8BIj6YQ40zhVhjW//tK2557F5sjCI+uMb2/Jf?=
 =?us-ascii?Q?a/jhDkdEZirG4UebxHPRXvgNOmBYnhIEXA94Iq9ihConakhOf3CjbqmCSMI4?=
 =?us-ascii?Q?9RX/HIUpr9IhA11eMq1KL5MGSSOFbGDpmuzvuuw2es/NGvRbEPSwWWhmugg5?=
 =?us-ascii?Q?2iIEp8NbiXknSzFQsh7C4jfxhlwIP9aLWOTqfXBEfXmI9LBJYDpyF0HSa+/i?=
 =?us-ascii?Q?ZzkDfmGImfewsdGIf9foPhK5EBp7/PzXyY2d7yyfrRyzVa5ZNzCY/2lD/H2a?=
 =?us-ascii?Q?4omkPqc2DOJqaP5491DBlAS/mZuKXhLZu2OgJo98fKEEeMmTBLFWxZX8w2Ql?=
 =?us-ascii?Q?yz8IrMgmtyaOpoSkkmImQDxSIgiBGE92+S/5E+6pPXcg/ARg1f94Pbfyow?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:13:43.4581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f958d6-c7be-4b4d-7b06-08de284fc6c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4245
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Nov 2025 16:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16816



On 11/20/2025 10:09 AM, Andrew Davis wrote:
> On 11/19/25 3:52 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Based on the git repo, the latest tag was v0.6.1 and then some
>> additional commits in git.=C2=A0 So tag the current PV to 0.6.1+git.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 +=
+
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb=20
>> b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>> index 505aaa4c..89be15f5 100644
>> --- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>> +++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>> @@ -5,6 +5,8 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3De1caa368743492879002ad032445fa97 \
>>                      =20
>> file://COPYING.LESSER;md5=3D66c40c88533cd228b5b85936709801c8"
>> +PV =3D "0.6.1+git"
>> +
>=20
> That tag was 6 years ago, same issue for Coremark in that other thread,
> seems some projects just gave up on doing tagged releases. I wonder at
> what point the "version" stops making sense and we should fallback to
> only the git sha? Oh well, problem for another time,

Generally I would agree, but if the tag was six years ago and the last=20
commit was three years ago...  So all in all it feels like a dead project.

> Reviewed-by: Andrew Davis <afd@ti.com>
>=20
>> =C2=A0 SRC_URI =3D=20
>> "git://github.com/nnstreamer/nnshark.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Dnnshark \
>>             =20
>> git://github.com/GStreamer/common.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Dcommon;subdir=3D${S}/common \
>> =C2=A0 "
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

