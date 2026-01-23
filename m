Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE31D778B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 21:30:50 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6357.1769203842949142119
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 13:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xQAszAwJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.23, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctkk/kI5uiLqdXT4NRMuYEDrVqG0Ku7oEfWLDpw8uGuAGtijXyHs24G6wxtNdIJA2Sev4S5KsOWx+HBreSHRRwZ09CQ/B3BROxw+sXJuvJ8oJPqIN0IbwKdP+qy9hB6wzX3rP7GB5YTIWjMCbJECP8igp4dU7s4xpkxI9bwbWQYB96PmtXzR8I7Ml5j/JbCERObPilc1pkkdbtnhrgpAJgI3BwgChxMvKwZhhgv8AltcZ7wYyWtxQVg7f1a1TlU+aYFUa+l7OL9bEpT5QqgvTXeCTPwO2F7av9EXMD4LCPE8PxkieAL7fjyf7Ocb7WodTbTuKQwS9oavRD/Kh+7uGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEPn35vlzeoNiedgT4j/G973LKlaCO14rAkyj0S2lZc=;
 b=F/KulWzEFYkQgnfEuAw9rFrf6CtOScG5xJrMa0ZAtmhIYCCv8qG15B3TO4SLRaRoB4NOGkCQYzNozOb9b115FocZ/6OuoWrML7Gos/tCxIjILR+qU+xTj6cETq/pA+eNUaO8xpsV1o6yPMr5CNvh+mTS/r0Adhw6jd/Be/ZChqU+3oeopmuyxn4/gWGHZJcRhx6uo+yLj8yobj5u2AoGkrOPN2zGyuF5v24N57osjMr4FDB79m14O2KO4Zhlj6AwdkLdAewHHhmiMmjJp6aQdFxh626y2a33qYDAIz1fl3T6sqO4Kngk1UAtQFsUREcHunEgNP91217VsJnZJoPiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEPn35vlzeoNiedgT4j/G973LKlaCO14rAkyj0S2lZc=;
 b=xQAszAwJuklZWzQCFOMqgaDvo71VQfMHeiEgJO2VgeQyUtnX930+uOgMt3NEnYkLQ+8xe4KM4K8IRWkHW4Js8A+EObyZlBaRGX963bffpal8cnWdQKhIIk0VAga/qwPHOT/c79amb0+R2p6I3HXHIrL0AKvot9Y2cp5JdA5AUBY=
Received: from MN2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:208:23e::35)
 by DS0PR10MB6102.namprd10.prod.outlook.com (2603:10b6:8:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 21:30:39 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::23) by MN2PR14CA0030.outlook.office365.com
 (2603:10b6:208:23e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 21:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 21:30:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:30:38 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:30:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 15:30:37 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NLUb0W2967804;
	Fri, 23 Jan 2026 15:30:37 -0600
Message-ID: <5ba0de48-895c-47cd-a9ee-b00fabd09ca6@ti.com>
Date: Fri, 23 Jan 2026 15:30:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core
 packagegroup to include valgrind
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105222205.2503660-1-afd@ti.com>
 <7ce43428-3d8f-4f94-8aba-6ca0e3fbc8b2@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <7ce43428-3d8f-4f94-8aba-6ca0e3fbc8b2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|DS0PR10MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: c56a54b2-cc7d-48e2-a80b-08de5ac6a72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ysElUrh66mpC8T7rFfAmZ3f2PX9BetTF8Lin3zO+yXx+3C1CcRnU2RW4cwD9?=
 =?us-ascii?Q?Vik2ftYpfcJqvem1JK2wfq+Ps6xMuegCjF3Z3LPIGgPrFE6uRjrFvpr32nmp?=
 =?us-ascii?Q?SYdBjUDTSlhJEld9dg3DyKtGEZEDuxPvykP9NR7sNAJhlH35AwJpjGb/YBTS?=
 =?us-ascii?Q?8IMednc1WOhQ9G8LZLBRMzoM2o17WdvL37QlDBYlik5w3NaDqtZqUYNAdSRs?=
 =?us-ascii?Q?fdIVCol51SglNeLYseYJGAaGmkQ3Iymebt/0P8M9tM2sC009TbvEjonH/cYH?=
 =?us-ascii?Q?f9Dv1EJ+bcNbIVWo6SH2YIwKwWznlrSdLp8rv6RXf2doKQT0DTu4qJbC7c28?=
 =?us-ascii?Q?JAePYAXlgdFV7kPElKZHQHELxVNxZdheZ4ayE4enDeIEMRx5wUInSl1z46OW?=
 =?us-ascii?Q?yLN+UxX3oeL5PdInXXuPokXLjR1a7vnV45mNYt5/CnSaZy47LcZ44BttrISs?=
 =?us-ascii?Q?4ZPUINpzLSWgDdGMGXfKFK3pyBQ8mD9YcfpGA1dN2O2cEtQD6GSWoSzjIc27?=
 =?us-ascii?Q?ICHtWaG3hFWyeBrHQ6bR0rV9EN8ngz92UhoFqr2YMyY3sx+n6WjHNmJdt2T/?=
 =?us-ascii?Q?A6d1jMaxJ0LVmvsQ4WAmQWoGT/uuTdWkE1KnUbqF199ikDkGSYuuLuIlCsy0?=
 =?us-ascii?Q?4qx3DfYkQzQGCooepP8fQvIdqT/1SeqsaxF1P+MPD3LXMNkrLje7ZoqTUt2V?=
 =?us-ascii?Q?UEdf4sFCjjZGCWgYu9IxCpyaSsX4io+jTh8AWL/KQF74z9LvlMe4eif+Zq2C?=
 =?us-ascii?Q?JUK5Tz5+lXHz7rlYzluSHg4uW49SzNfH5vCZhQlGUhezC4W6ul7DGQyq0pri?=
 =?us-ascii?Q?JWhyB8iBIO5MXzyiZ9+rM2lJWF6qrfwWE9ru9nN1j8O+3/aR1W338XEfQQ3x?=
 =?us-ascii?Q?YPpxZIVG2xL3DuM17nI86EJfM0dmyOGWSobJX6FOZPadak4mW4cHqYwa+QhA?=
 =?us-ascii?Q?RX2MzYJOt+5ppK9lJxt7u3HpqgM/nxXuIzu/PD1eIradpLOyL8BwXzOB35eO?=
 =?us-ascii?Q?77JG0vltUBHZSUirq5NSXZqRBp/hjbCr2gMM7xGf5tYuOxtao8iXAJwVVTX8?=
 =?us-ascii?Q?UTlUe0QuuerDIFmavi4Yn+E6M6szXJb0hk4gPrS+KG2ILDmln/+UQ+8qQAMc?=
 =?us-ascii?Q?fEqYhjAyYalUaqgK2phzHQjhfEB4geJ1vDcnGIAGk9pkwpR/1JP2nGLjOVwv?=
 =?us-ascii?Q?CzvwpsCdj5eU1r3POihFdFJI5vBU5EtWtSgq7OUiqV4tKFFOR+/8DuDoN251?=
 =?us-ascii?Q?RaltKVNMeb63djxtw7BAsnnz1w5et8cRXSLoLDqnGeKQV5YFPti0vEWy/HGQ?=
 =?us-ascii?Q?/q6xHTt7EFOES2yOU3fxd98xhwx86sOQPwLaUQDbOpC/Gq4I96isFXtqX7fa?=
 =?us-ascii?Q?8F6ZXH9ttW7S7svNnADj7bh4djF9oIm/tDQ7pm+viGvnVYT0fYDojnyPr8yB?=
 =?us-ascii?Q?fuJPfGRE+DtfX9lmdePbk4TBId6etYa1nWXaX3s73vnks4Ouutt7MZ4hfydc?=
 =?us-ascii?Q?coPgUMVe3kqx1OxyTlxFBfMdWRgCw9BSKAholQ3BEW7AyFn055zgHUFSCNvR?=
 =?us-ascii?Q?XqbtG4Sgkr7l4ORyRacg/Wj6LXRBwkM0D3ohOhh2D11je1dOJkFhE0cXhszR?=
 =?us-ascii?Q?UJOnCNj6vFGeNN1eZmJ3zfcFs4kpzzKLnTjsF8WZ6NAN1hG0x6UwbFse4Hnj?=
 =?us-ascii?Q?+26zCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:30:38.6684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c56a54b2-cc7d-48e2-a80b-08de5ac6a72b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6102
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 21:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17034

On 1/22/26 4:42 PM, Ryan Eatmon wrote:
>=20
>=20
> Build issue with this patch.=C2=A0 Including that packagegroup includes t=
he lttng package which is a tracing tool.=C2=A0 That code requires that the=
 kernel have CONFIG_TRACEPOINTS turned on to compile, but it is not turned =
on for our kernels.
>=20

Looks like there was a fix for this, but it is not functioning as it should=
,

https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/ltt=
ng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.=
patch

> We need to resolve this issue before we can take this patch series.
>=20
> scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62px=
x_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng-=
tracepoint.c: In function 'lttng_tracepoint_coming':
> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c:227:36: error: 'struct module' has no member named 'num_trace=
points'
>  =C2=A0 227 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D =
0; i < tp_mod->mod->num_tracepoints; i++) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~
> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c:232:61: error: 'struct module' has no member named 'tracepoin=
ts_ptrs'
>  =C2=A0 232 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D lttng_tracepoint_ptr_deref(&tp_=
mod->mod->tracepoints_ptrs[i]);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~
> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c: In function 'lttng_tracepoint_going':
> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c:268:36: error: 'struct module' has no member named 'num_trace=
points'
>  =C2=A0 268 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D =
0; i < tp_mod->mod->num_tracepoints; i++) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~
> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62p=
xx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttng=
-tracepoint.c:273:61: error: 'struct module' has no member named 'tracepoin=
ts_ptrs'
>  =C2=A0 273 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D lttng_tracepoint_ptr_deref(&tp_=
mod->mod->tracepoints_ptrs[i]);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~
>=20
>=20
>=20
>=20
> On 1/5/2026 4:22 PM, Andrew Davis wrote:
>> This packagegroup includes valgrind and handles the arch compatibility
>> selection for us.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 =
+-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.b=
b b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index bc067857..a35e8321 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -34,12 +34,12 @@ DEVTOOLS =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-debug \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-profile \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtc \
>> =C2=A0 "
>> =C2=A0 IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'val=
grind', '', d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>> =C2=A0 "
>=20


