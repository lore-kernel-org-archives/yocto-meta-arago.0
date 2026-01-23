Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65FED778BE
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 22:26:30 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7775.1769207183516006500
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 14:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ru3D5u3S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3GRL78KP0+i/v8+5nDlO1fdgatgW4GAZoEJILqPsXZF6JEFNOvPmJhfF5+XC/FrKkCnYpz5CsDw7X0ZuDL5Hl8CWUWyi9GqjcUefA8Weemh9umgrCYBxNX4jbupqbZOs00/iyypP6/EruFKEpWXxABRLIlJUFY5sO3SgfskfHEyxMZfpCT3z+4RiF2UaCbbDt9Eu0xVgS9djCQARIv2spy6fqSIvCNByHIzgp5RnI+J9AvAzgRc+6q8NqW7zV5pP6tP99GkuhTAivwnFwCUp+zVRlfZIL3wbohgtvF4WBgE4ZOhq6+rO6K6T7v4wmahbovCK2emgY78j4F31oqzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/3FtFKYdfh1GM67V23JmA1Wb+zALjdLWBNWF5q3JC4=;
 b=A3sC+naWA2RT7sybwJZQSMZYFXw9ipIzJ+ttk+NNQotsyDyEH0Tkp3shV6sxdouijz3O8u5no1zgk0DUYq1DBRn06dcugZJQGTEFatxulYQwdddW0I5XxnQyvf2nwYjkXH34J1UwO1TTzskcwFRVL9mqHPTKKwnD/g23PVfCBZ47RcjZjrRliApocJ7Dq/PSGoxV0y45MMhAb+orwdyqmg1ACTIO1qc/5bmllUYORDj6kuU3yYSgw/QvKJEIpr1CzvAbUoZ0WnbPUmIlHldhio1e7lG/itX8Tnw2C/v+8PHmaPe/OyN0UiogQg0GEnIEs318Pbzl3uOHak82mqitoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/3FtFKYdfh1GM67V23JmA1Wb+zALjdLWBNWF5q3JC4=;
 b=ru3D5u3SE/PXDd6X2P9KGC4iMaO4n0iuwuiODh+AP9fDuBszVQHKTcOCCo7lDiJ8og0qDEhZho+2386oqc+MftztANhmmQEOiIjs6Ij8MEv1WjssxyDWCI+q+jkPW3Nx8WJTWLpgGjrnBxSic1pkabRFitVUazIdQ7YETFdja6U=
Received: from SA9PR13CA0056.namprd13.prod.outlook.com (2603:10b6:806:22::31)
 by SJ0PR10MB4685.namprd10.prod.outlook.com (2603:10b6:a03:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 23 Jan
 2026 22:26:20 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::fb) by SA9PR13CA0056.outlook.office365.com
 (2603:10b6:806:22::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 22:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 22:26:18 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:26:17 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:26:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 16:26:17 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NMQHpr3028761;
	Fri, 23 Jan 2026 16:26:17 -0600
Message-ID: <4b515701-587e-47e4-9e6c-4a36c7fffb16@ti.com>
Date: Fri, 23 Jan 2026 16:26:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core
 packagegroup to include valgrind
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105222205.2503660-1-afd@ti.com>
 <7ce43428-3d8f-4f94-8aba-6ca0e3fbc8b2@ti.com>
 <5ba0de48-895c-47cd-a9ee-b00fabd09ca6@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <5ba0de48-895c-47cd-a9ee-b00fabd09ca6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SJ0PR10MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f7c441-a64d-40c7-d685-08de5ace6e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gLyyJznDcOXN+X2LYLjPJmLpri0+gErbG/Y3PZ/vESEKiJ3T+oRC0vCS7VQG?=
 =?us-ascii?Q?7srbQD3EhxPHjFmW6jRjNlV/27B2GXhIL5kwwHwiF/8BwYGoFdxf4dJqp63l?=
 =?us-ascii?Q?ozqMRfkZpIw/9sWZW8ZgkOGGb1jIbOo9Y+fTtizQNFeb5EYQo6NV7dRHuVA7?=
 =?us-ascii?Q?G2c4KJZ6vCAi1kIAHz45Xd5vgMqpOFEaLMgtDWSDfzWnyPtFIBTaX2ts6zJ9?=
 =?us-ascii?Q?FEt083Kqa0VHI8Q5FUy2cemsBpKjA36h6gzRPlZaoAPP+vrd16LhZ3r0mJoC?=
 =?us-ascii?Q?JCLHspsdg4Tr/IFengPN50VB1qCJDcbe8WYsS46NJxPEnpcGtP437YUz9t0K?=
 =?us-ascii?Q?5ZB82YErWgcs/UNT/tzDL995+d3Ml5P2mzuBI8vxoRFLuh2Dc1SjeHQGjova?=
 =?us-ascii?Q?oYrUcIRyIbCwWcD84zrC2AuLQxiBoMvh7tJbAV/roDrC1+2XRGpZ1+62ewMw?=
 =?us-ascii?Q?aQhs35sG/negzQmzSV0QffE69o3/WK2+WJaipK5kiWsFEwsBpog1N6+EQwwa?=
 =?us-ascii?Q?ScZ2q9vAo7GoTICvLyBlAY7qtHc3qxhh2clOj9flGgY/MvFZDTLrA+jfW/+0?=
 =?us-ascii?Q?A/Aed+x41Zl/kXkQN0CctwHer3vEINnS6oSvG05e8Lc9tXWDlXkyzxD15clJ?=
 =?us-ascii?Q?jOLfpl6r59+r/HKUisPKsrRoMXPCohbSD9uDI2xHuONHJXXcapK0xlZfOzTF?=
 =?us-ascii?Q?s//Gls6ychSoTODhcMhypcLCVlVXw/PvoijmXZyVV8C8YvFZprDMr1DGs0Nz?=
 =?us-ascii?Q?Uu5ecqztGhZ6ntoF4+154KVIcGBXecIuL6q/c8FYdgId/i2o7GrNwQWR0Nuz?=
 =?us-ascii?Q?wewVKNBvIUq7H2/6SobEJzS5awj1Eh/CHCUvdf2vnqYLZFK9jQYITIzrGQPC?=
 =?us-ascii?Q?2lYcudF+yhOGtR7QDWP6g8LyeTNy9uFF1mhrSLbhosil7itAs9hFSDyNIClF?=
 =?us-ascii?Q?mBEn7tUGWGsg/yDZ2lg0DO5sAP9HshYTORw24jnLWVcHmeeHkLOgKc/Ep9y6?=
 =?us-ascii?Q?wLHWuZuozemOggFo8SnJCxmYMu6P3pG7pJvgIB4M6H7A/rAlR6vK1Z+eFOv0?=
 =?us-ascii?Q?4BDhjRVIZnaJ4G8JTRvwsMadpvkoUr5CqERUDhZYF1Q5gSkgpUUt2ZksPPip?=
 =?us-ascii?Q?LCNQv8zkSa0zUqOHoM95+sHcOSRNlTbe8x9s1zvLYk33alVyBvxW2CYKpgnD?=
 =?us-ascii?Q?1yaPf+3ey0MHcdmy1Zbr0zvmHf9/KkU0RqFbhI6r3Ul/fdwile29a7D5U5WQ?=
 =?us-ascii?Q?CFEcW75LKcjjFpDkzOQ+b1gOpX93Ee0YQ9trcRXuVwve+I0M9jI80682P0xq?=
 =?us-ascii?Q?wtH/5zXyrtGIzkzWHatWyxoSZA8krTd1MTJH1yrRfoRbenJf0fPLFYJ8VMvT?=
 =?us-ascii?Q?gjT5a3i9GlIWm8mXhiRbqcLGFidu9qwEcG8ve0E4+4t8bj4BljX3Zr/I4xd1?=
 =?us-ascii?Q?6xbBkQmsRwsnYrl2pyFniUonaB5jr7usSImsKODuD4DtMHQHIpnrbEtf7H33?=
 =?us-ascii?Q?V4x5MzuqTylSV0BreW8jlQr5aV5p9aJQ7djNSJn6sG3MkBsb0n2Nr50k4O+P?=
 =?us-ascii?Q?GIYx+Wpb+KATlIRLCYfDGGhCRSLY+gEFPXOxTLlui2DYSk+GVfBj214WB+GJ?=
 =?us-ascii?Q?4OTm/3Qm5OaajDa9Z1+df4SgLOSrnhFyavGrDDQ1XLrBBa+npwMO0Z+zL1eD?=
 =?us-ascii?Q?bNiy4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:26:18.9418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f7c441-a64d-40c7-d685-08de5ace6e1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4685
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 22:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17039



On 1/23/2026 3:30 PM, Andrew Davis wrote:
> On 1/22/26 4:42 PM, Ryan Eatmon wrote:
>>
>>
>> Build issue with this patch.=C2=A0 Including that packagegroup includes =
the=20
>> lttng package which is a tracing tool.=C2=A0 That code requires that the=
=20
>> kernel have CONFIG_TRACEPOINTS turned on to compile, but it is not=20
>> turned on for our kernels.
>>
>=20
> Looks like there was a fix for this, but it is not functioning as it=20
> should,
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/l=
ttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-war=
n.patch

Sigh.

ifdef CONFIG_LOCALVERSION   # Check if dot-config is included.
   ifeq ($(CONFIG_TRACEPOINTS),)
     $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your=20
kernel configuration)
     DISABLE_MODULE =3D y
   endif # CONFIG_TRACEPOINTS
endif # ifdef CONFIG_LOCALVERSION

ifneq ($(DISABLE_MODULE),y)


 > grep CONFIG_LOCALVERSION .config
CONFIG_LOCALVERSION=3D""
CONFIG_LOCALVERSION_AUTO=3Dy

So the checking code doesn't kick in because CONFIG_LOCALVERSION is ""...

Does the #ifdef return false if the variable is set to "" ?




>> We need to resolve this issue before we can take this patch series.
>>
>> scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c: In function 'lttng_tracepoint_coming':
>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c:227:36: error: 'struct module' has no member named 'num_trac=
epoints'
>> =C2=A0=C2=A0 227 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (=
i =3D 0; i < tp_mod->mod->num_tracepoints; i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c:232:61: error: 'struct module' has no member named 'tracepoi=
nts_ptrs'
>> =C2=A0=C2=A0 232 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D=20
>> lttng_tracepoint_ptr_deref(&tp_mod->mod->tracepoints_ptrs[i]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c: In function 'lttng_tracepoint_going':
>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c:268:36: error: 'struct module' has no member named 'num_trac=
epoints'
>> =C2=A0=C2=A0 268 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (=
i =3D 0; i < tp_mod->mod->num_tracepoints; i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c:273:61: error: 'struct module' has no member named 'tracepoi=
nts_ptrs'
>> =C2=A0=C2=A0 273 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D=20
>> lttng_tracepoint_ptr_deref(&tp_mod->mod->tracepoints_ptrs[i]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>
>>
>>
>>
>> On 1/5/2026 4:22 PM, Andrew Davis wrote:
>>> This packagegroup includes valgrind and handles the arch compatibility
>>> selection for us.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2=
 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=20
>>> b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> index bc067857..a35e8321 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> @@ -34,12 +34,12 @@ DEVTOOLS =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-debug \
>>> +=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-profile \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtc \
>>> =C2=A0 "
>>> =C2=A0 IMAGE_INSTALL +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'va=
lgrind', '',=20
>>> d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>>> =C2=A0 "
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

