Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0653FD6CFA7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 22:39:31 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8021.1769207968043266408
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 14:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c/1/4u5N;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.44, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kd1JeuCi0ql2Bl6i1urONCGSTTq22N3N7SxnvNmI/hh+3aq2cJopYEmdDShxK86VVZNRd/+Y40YIAQwSWjuRY0H4I6DylEYX2mkCvOJ+idnFpwHN0fVyCiLrhEivR8G2Xr92dCDl455tinJz0iF57yQkw1o1o9b7RFKc2xs97o1obWCSbT5o1GzSe6pK3Y5mk4BqlRyOwYyIyy4FbR/bc15GrdeMBsgdAm7nhSBFlHfOJWxKNrL6oAP82kfiOKAjNX/diiikHJKqUsM8XuMPcIN33anYHgKJc8B3Gtd+V3mTkOfCu6lqtkO2hMrVGad7JyUn0HVBdMM1VEk4T7/u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz+uh/iVTKWx2gbReLWN+Ub4hOTFC+2W14xoeHYqt2Q=;
 b=sh82mD3W5dC2L0RRUTJZOrLIk76HpA9pV0SsSjuk4yTb4knb2FcZSDzK+Rob3iv1JPL/898hCgbjN4rLLwn6DBbUTMdOr8uKqLks6104Tgi86MK/eXy4SW7pFpd1ORaYfBpON7Ta4HkZnmDeOsMoEpMSVvjw3iq38ngilkapLB2blrp085ZvR7dWDsFdLQdzyHB7OgDHK62+aUdlD5oUxpnV1N9xvp2kZlAdgT+RysI1oa0aNVHgTmhKU8kbXOl5OJnnuZzaNPwKOWncDZqpgEmb/IRkM7dMiBcUqZ2SYlTrBV4rEskAwC5zb8OJCePVlzjI1bX9I1h7bZwrZDF4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz+uh/iVTKWx2gbReLWN+Ub4hOTFC+2W14xoeHYqt2Q=;
 b=c/1/4u5NNPZ4JafvS1gbsp4+BrOuwuzdjOs93+SW76sOCBk3cyPfIC8HCXOp0mDrOGpCMOBo2K5e/MzvtQ68U9gmih+I1AlivcB6d+KoKtr+YIZEqkpd+PofmyW/YuPpGJTxkhxJCJUZl8F3FBcSVkDaInCRshSCoh0NP7gICc8=
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by BN0PR10MB4965.namprd10.prod.outlook.com (2603:10b6:408:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:39:25 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::1) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 22:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 23 Jan 2026 22:39:23 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:39:23 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:39:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 16:39:22 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NMdMXJ3044070;
	Fri, 23 Jan 2026 16:39:22 -0600
Message-ID: <873619a2-8202-418b-9733-b7d674abd5e0@ti.com>
Date: Fri, 23 Jan 2026 16:39:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core
 packagegroup to include valgrind
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105222205.2503660-1-afd@ti.com>
 <7ce43428-3d8f-4f94-8aba-6ca0e3fbc8b2@ti.com>
 <5ba0de48-895c-47cd-a9ee-b00fabd09ca6@ti.com>
 <4b515701-587e-47e4-9e6c-4a36c7fffb16@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4b515701-587e-47e4-9e6c-4a36c7fffb16@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|BN0PR10MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ae1a16-1690-4db5-60c6-08de5ad041c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9F9KspKkDi4oLQT6DKuKuMmDfxqrk7WBszalv7zXRq/SZJXe0ONXOgsEVqnN?=
 =?us-ascii?Q?UZjAByIA+N7YlbPLH0xwwDZOBd91eiQds4UawE5OfB0Ia3MhIOA9cIm1STYm?=
 =?us-ascii?Q?OZ1dObD2UMipdE2Vyb7dqmSnDBX/vbYmAPnxTCN4SMAxNLjikIJCsz0S0eMv?=
 =?us-ascii?Q?cEZF4tYssZqsnsW6dlrJLsPaLblkceQpZWPV5XUqWWGMuXstDoW/MGtOOPXk?=
 =?us-ascii?Q?KJndZ9Vtr7VqRjlIVSQJm9TkSQwJ5t+R+DnHryY1wgMO/UWesrTSFmT6o12p?=
 =?us-ascii?Q?+QYKGzGDbP6WkrKWMRY/2JIH+qML2fFw/1S44iSe39SNZiKJWPODORkjwK74?=
 =?us-ascii?Q?Ez8mObM6NTOOd4zBbMhW6RzRzNkjP4YOLM3y3565b+PXt6wSFJxts9hDHih7?=
 =?us-ascii?Q?1SDcw+4ww9zMTygFHl6+Q/w/Okpg00xb6pjZt2bLHVObR+6ydxHubv+u3pB7?=
 =?us-ascii?Q?QtH++wn2GJtYN7ZWmtIeAUBIjTX7QeCxt91NStpccDg41lpsi7scNHtMz8Z1?=
 =?us-ascii?Q?n/RgYJ+P56wGGPJOuYaJ5PUWjmmsQFADZUWQ13ArvB38HvaEAUtA0TUJkrBo?=
 =?us-ascii?Q?SBRFRApl7QioQ+/B62aBj6st9jbRAwW/wis0eH1M3Ix52TKShgQR5n2thrsE?=
 =?us-ascii?Q?0kSP2K2ZkTJrXnRSy3GRaZCx1EnIBJDtVzLcg6dSY+CNNQ3OPZBx1f104o07?=
 =?us-ascii?Q?vdPs8wL/iCXhx5ycmxgvXYUvf0YRCHEhKhVMl2r+7Rdbq8HEly9iGARNxLGj?=
 =?us-ascii?Q?VwaxPaENMxbo2w8s2kDtPvP9M5XssrwCaowGBKAzhLnO8iZOH1USEIDeWmr0?=
 =?us-ascii?Q?SUt/5Dr1JMoyezSYALZZO1VPNXIY0Ui5xrBvSzT6iPab/Y3Rdf1Ovd9wk93Q?=
 =?us-ascii?Q?t5Ykqkc09NHboOyG/w5HhfFFJrarFqu2Q/X1f2scQQ73f/W5LJObCcqgHAw5?=
 =?us-ascii?Q?4pDNEkdrsqyVd9E8L8fPK6cvopUJBMEJBNYxtyhiDha7QuFpa/rEUS+TF2Tl?=
 =?us-ascii?Q?y+1SyvjGiqIlwQOFZvFj2b2sZgEgC0HapEqb3jRje/6K7QK0drkvqCiqfQvq?=
 =?us-ascii?Q?vjWjYLrwk+GsBit0WidIXSuEL20f4mVrB3uaExm/buA8wBcSS0jmSiCiHLZq?=
 =?us-ascii?Q?W+QJBcdfpfgRhcSU8RirMyAbBg1IzU28h+J6tCewVOu2gwOVoCK2AxWGqJzJ?=
 =?us-ascii?Q?hbwM9iSROrwgOYuLvtYO8R+IGfY1TBXGPjL588TyegWXScxboLZza3xiAqFx?=
 =?us-ascii?Q?equHpMS7iDcW/ig90PBruYOlZZhI6WuptIhY8OsVkhnJtQAV77pYvbEKvu5n?=
 =?us-ascii?Q?m/R+ghixKXn/aWf9SOOzNItDp13k3TcOHQY33sdd+4IiE2ZPmZnZLzvkyBE/?=
 =?us-ascii?Q?es2ETsZmksIFLLI/fc4sFVl0p+1cGzlmgbjA2KBESta/yVMnrlnBVTLkv05V?=
 =?us-ascii?Q?eGXPtpfBQxDGNMnzUOgQ/YnEZtWFH7OrcaReCxFDiovvzTsX24Bzy2WQ9ILH?=
 =?us-ascii?Q?N5mm+4Dhi9VtydS1zv93/Mj/V/kLAPn+gUA/TFc7H/yrtn9iQqoXzQlljMwt?=
 =?us-ascii?Q?ZleDHvDI9wSJ0dxizG4cVUyfNS7hQE0QlgWLaHKpTsyGu13bK2a9WDUI7o7c?=
 =?us-ascii?Q?qSzf3C/+zApNTBEnQOl275QwBaMlli5jalH/g1Eomx8P/x/FEhlxedzJlVdk?=
 =?us-ascii?Q?bVAXVA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:39:23.4823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ae1a16-1690-4db5-60c6-08de5ad041c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4965
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 22:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17040

On 1/23/26 4:26 PM, Ryan Eatmon wrote:
>=20
>=20
> On 1/23/2026 3:30 PM, Andrew Davis wrote:
>> On 1/22/26 4:42 PM, Ryan Eatmon wrote:
>>>
>>>
>>> Build issue with this patch.=C2=A0 Including that packagegroup includes=
 the lttng package which is a tracing tool.=C2=A0 That code requires that t=
he kernel have CONFIG_TRACEPOINTS turned on to compile, but it is not turne=
d on for our kernels.
>>>
>>
>> Looks like there was a fix for this, but it is not functioning as it sho=
uld,
>>
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/=
lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-wa=
rn.patch
>=20
> Sigh.
>=20
> ifdef CONFIG_LOCALVERSION=C2=A0=C2=A0 # Check if dot-config is included.
>  =C2=A0 ifeq ($(CONFIG_TRACEPOINTS),)
>  =C2=A0=C2=A0=C2=A0 $(warning The option CONFIG_TRACEPOINTS needs to be e=
nabled in your kernel configuration)
>  =C2=A0=C2=A0=C2=A0 DISABLE_MODULE =3D y
>  =C2=A0 endif # CONFIG_TRACEPOINTS
> endif # ifdef CONFIG_LOCALVERSION
>=20
> ifneq ($(DISABLE_MODULE),y)
>=20
>=20
>  > grep CONFIG_LOCALVERSION .config
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
>=20
> So the checking code doesn't kick in because CONFIG_LOCALVERSION is ""...
>=20
> Does the #ifdef return false if the variable is set to "" ?
>=20
>=20

You would think it would still work, but yeah I noticed the same, I just
removed the `ifdef CONFIG_LOCALVERSION` check altogether and the rest
of the `ifeq` checks do still work as they should.

Surprised this must have been broken upstream for a while now, either
no one uses lttng-modules/lttng-tools, or everyone just uses a kernel
with `TRACEPOINTS` set. (actually it seems our v6.12 kernel *does* have
this set, the issue is also `CONFIG_KPROBES` must be set too, so even
when we fix the LOCALVERSION thing, we will need to add `KPROBES` to
the first check).

>=20
>=20
>>> We need to resolve this issue before we can take this patch series.
>>>
>>> scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am62=
pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/lttn=
g-tracepoint.c: In function 'lttng_tracepoint_coming':
>>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am6=
2pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/ltt=
ng-tracepoint.c:227:36: error: 'struct module' has no member named 'num_tra=
cepoints'
>>> =C2=A0=C2=A0 227 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for =
(i =3D 0; i < tp_mod->mod->num_tracepoints; i++) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am6=
2pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/ltt=
ng-tracepoint.c:232:61: error: 'struct module' has no member named 'tracepo=
ints_ptrs'
>>> =C2=A0=C2=A0 232 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D lttng_tracepoint_ptr_d=
eref(&tp_mod->mod->tracepoints_ptrs[i]);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am6=
2pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/ltt=
ng-tracepoint.c: In function 'lttng_tracepoint_going':
>>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am6=
2pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/ltt=
ng-tracepoint.c:268:36: error: 'struct module' has no member named 'num_tra=
cepoints'
>>> =C2=A0=C2=A0 268 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for =
(i =3D 0; i < tp_mod->mod->num_tracepoints; i++) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>> /scratch/builds/arago-master-wip/build/build/arago-tmp-default/work/am6=
2pxx_evm-oe-linux/lttng-modules/2.14.3/sources/lttng-modules-2.14.3/src/ltt=
ng-tracepoint.c:273:61: error: 'struct module' has no member named 'tracepo=
ints_ptrs'
>>> =C2=A0=C2=A0 273 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D lttng_tracepoint_ptr_d=
eref(&tp_mod->mod->tracepoints_ptrs[i]);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>>>
>>>
>>>
>>>
>>> On 1/5/2026 4:22 PM, Andrew Davis wrote:
>>>> This packagegroup includes valgrind and handles the arch compatibility
>>>> selection for us.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | =
2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image=
.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>> index bc067857..a35e8321 100644
>>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>> @@ -34,12 +34,12 @@ DEVTOOLS =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-debug \
>>>> +=C2=A0=C2=A0=C2=A0 packagegroup-core-tools-profile \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtc \
>>>> =C2=A0 "
>>>> =C2=A0 IMAGE_INSTALL +=3D "\
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'v=
algrind', '', d)} \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>>>> =C2=A0 "
>>>
>>
>=20


