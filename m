Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8578DE87859
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:59:00 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1256.1770145139126550245
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 10:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZhJkzWeh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.19, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDt6PRqdngQNYufRdlRLhRcBkPG9U7ZZ7XAh0/B7jq+ukXhk/R4saJGqirClHyVfxVw8dN8R3tWrjXMZ9othMBtbnP+ros6K+Aq1jTXHJKttZbFcFH9eDrw8i0qZNAj6O57gp2ZM2euPrqjoCOEQzZ9AkEdl4mItF7OCjWNrrUJR3m1cQzy4pfLARuVrfn/c5vZj/30VMxt6VO0N2q7buXQd2vKWGfkjYDCod6XIiXQXa/rEFLTpHZ67pjO8oc6s3lJpVVFO4lTHX4feYXrjHFR/InwMl6q+5P2YHezwzUM79C6E0c+LSh0McNxuwa9Ome3Aj3q8Dmu7OV5b+rJ1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3wBFRlKdAvcQONHMGNCdkRUSRyAaCd8uR1rgrgSq04=;
 b=a2AM/LWu/Slvrzh5Du/Ag5b3YeVnpWdvr4lA5a6Hkots6TWKFqlo3mIuSaRBjZWsoe09cQ5AgvE5rLFHTXE4rD5tZZkdTV+RWXRfGEUkuQEqs+65rXHCujLq91Ac7v3tgMCi/yQA4a8ardPli4nCD+SZVJOHtzKsPvVs4BORxdhOOCwIcIT++qeX5xZNFYJ6isIegn1J0F+66ZX0zEKlY0yx/6y2W3scd1UIHlhpVqphTVsxc7usQA7ac3wrmHCgKm2XV8LpAQVQ9z2OSERjanNOe6nGKhB2LSLZN+F0/LOTwDiMOlQXCmgnIO2aCQti64aTi92Dvz3ExR649xE/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3wBFRlKdAvcQONHMGNCdkRUSRyAaCd8uR1rgrgSq04=;
 b=ZhJkzWehw2VBjnRUEwBw7chkMJbdAyivrBWg945fc8GyCi0/Q442IWL7Ua/Iiv/UzORIWiuzz6cjgWQSAy1UBiBmNNF/I+XAOk9mM3CfUFPi3efwtYUVAp3OpR26e87Ylr68iP53rjfrG5buClLzIygiIYg5j/qdXAuceDMBDBM=
Received: from SN6PR05CA0023.namprd05.prod.outlook.com (2603:10b6:805:de::36)
 by CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 18:58:55 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::1d) by SN6PR05CA0023.outlook.office365.com
 (2603:10b6:805:de::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 18:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:58:53 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:58:53 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:58:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:58:53 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613Iwq4d3996301;
	Tue, 3 Feb 2026 12:58:52 -0600
Message-ID: <ddeb60f2-b8a6-4d7d-861b-36f11012afa7@ti.com>
Date: Tue, 3 Feb 2026 12:58:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove
 tisdk name from Arago packagegroups
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-3-afd@ti.com>
 <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CO1PR10MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cf8445-5d5d-4a8b-b891-08de635646a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zqFKxNnDGR8HD1/I2744W4e26sCqeC5obBoRAbYZbfimeQYxzkObZ5+qOJf5?=
 =?us-ascii?Q?BLg9cKqD0FHrA/1iyU2xQsPXJEaE15298nJQQRQkxYe+5Kk1FNmxTuqLi8lL?=
 =?us-ascii?Q?sU88t+pAnbfxF5y3T7S9fVEFUPcRDCDJujNWH7XCfqZHQ+qXwf/bJwQtsY4G?=
 =?us-ascii?Q?IrID6iqOp59HzmoMRSJI3kVUrTz52pnQ0VjJQZw6y1VJgb3vEQF/0806b58O?=
 =?us-ascii?Q?nbLLVnXSMB7tMm5TnBKfDqy4sg7wf/GkbqFvZltRhc6OxOE7mYgvhZILJFkH?=
 =?us-ascii?Q?6q6F8zi6Zw9IdCRJ1yfie7YGyWMETwvbyGFNsUSwa2+CVfvHLtCBqVWqxENy?=
 =?us-ascii?Q?tnn62Mz3cUfLl6Sg36SgnQJ/xAk59fGd7j1Sx75XtPtZntWn/q/7wWL3r73P?=
 =?us-ascii?Q?gIerLNRBlrcx3a9u3cQgu498QtmwGhcQLPHYO3xAciKBiBuz9S6plWdK7X5a?=
 =?us-ascii?Q?k0HzgnCRc5de0Zl++mKX8BNo4Ve0EdEEYXTY1ZmC1GtQ3ypa/CImkYEWb+yn?=
 =?us-ascii?Q?BAUYTdRO5rZRahSCaGzb5WkkpZnmSiwQkgrSrXkGJqAIW71dI3KFkh1+yMAY?=
 =?us-ascii?Q?kbqhOxuHuwLEMi/IFBSEbCb4g4Emae1Q87LGynLNRS5P9nakwZhXVeunbNVc?=
 =?us-ascii?Q?ABQpf7zAxN9JpIjHz7DwrHaHPJuEcgGMKEmH+71DItgm96D9hmVnG59Mvfz0?=
 =?us-ascii?Q?K0mmXmvCTvVwrsMipE4vvYt5nJLR4YmeuJ9wOz9nv59RRFTmqr0MDT7eKexP?=
 =?us-ascii?Q?Q81lLgDxewRBHMseYfmDW/z5g1F830sSwYhyVNS4JaGDvZEKhPHA2KjfmS2U?=
 =?us-ascii?Q?ggOJRvXfKcbal81UvZUQyuES/IrazV32qZEe2szX0LQyn7DohNrHIM3wB6ui?=
 =?us-ascii?Q?fk3t+4w6omX5QPzH9i7KOcI+dM/Q6gAdZApfSEhcAzTOy+OC5RwiHSK6zRrV?=
 =?us-ascii?Q?BO0/FZz734XpGYtmlOT8u5U4S4+G8p+Eu0Ctk8sTROhGQ1v0e/A9nrA7OGB9?=
 =?us-ascii?Q?l30KWIRu+DLnSYOUOj8FjIQiRz+nSvT9ObW8AJgv43qHpsUCeMTJTeDp3drD?=
 =?us-ascii?Q?n0RHAvsj3AZy2H7ssv8Me5rBiCLyQqdw9si06g1KIv5e+iRByZUXOZGhnY1V?=
 =?us-ascii?Q?GwKMPW5s5KkvHZ/viHzjZfbAiTVRTeiObwrZ2pVxdQUcQ6PcLbLAO1HvFe8i?=
 =?us-ascii?Q?uxmwvYxe4XwJ5POtbjdFKoE9Qyl0+iI0d3gQyxGogP6Llkx/phita0y97bpv?=
 =?us-ascii?Q?TDY31Pf3Vlw00XLm5AYi5nhfp3flqMr2cuXB6zNmypuI3jPRMw/8ZSqLQwfw?=
 =?us-ascii?Q?xJ6QvCsgcJFGuls0m7ueH0GbJZW6PPIA6y2FDonHJSPQyjrmtYggB89ZRL54?=
 =?us-ascii?Q?Q8DncwWLTghv4BZt/mTHHXLCvD8Zn+zNPFzwIuCjNr7SgOAfXZ6ddSV8tSba?=
 =?us-ascii?Q?wnJNxcMW+nyfznCj+a/AeA49D8KroeeKetNSS7eiiBdKoKQ47djWEwieNz9Y?=
 =?us-ascii?Q?DQM6O/OTtdPDre6IY2MCn4EOhUMOSrE+ZJsbAPhix0h94ySjbpmbTnULpJj8?=
 =?us-ascii?Q?fSNGS50bajGksphRjqeQlOIe7BiyxZbN+5iIFn7brbrLSEVCm3DYUgKlAdo9?=
 =?us-ascii?Q?tA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mDtjaQ96RVLCf25G/LYWp2p6v94/aawMFh4j6QXCNEUW6GynuzB629kWQ/b+sNYxrTriKTKNNtU17iqs4swrdKv9SbHkRuCRHfjsp8cm45UZKw2P03PJozTmNQBVVGCMj2eXmf0CCbCu4936NPk+Nmqmg8Uwueb0FWMxHzaSmJljqDvdD9Z/6lamHNh2OL0cKEWfweuc+pSAsY2DIuHTGJAQtPKazfMmsR6Aauqeml/a16zmrF42cwb9SJx8ErIyKS/jk6Xgmc+dBaWJEow/dG7IDVbjc6kZX2r+Rb8I1HSDRtrNGKIVay/guWDz5TljBMrhD8PglCf1vhSG4gAYR/t9RRJI0WFIwhbPWfuNb3fVA5++vRPhz4HlxDuxCsuzwDMIszDTSY2pxnFHxGN7mFX3iBHAZCANcPDHuhxrFP03tep/T/yo/GUJsZe+LOHT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:58:53.6153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cf8445-5d5d-4a8b-b891-08de635646a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4675
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 18:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17072

On 2/3/26 12:07 PM, Ryan Eatmon wrote:
>=20
> There are still a few remaining files with tisdk in the name after this p=
atch:
>=20
>  > find . -name "*tisdk*"
> ./meta-arago-distro/recipes-tisdk
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
> ./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv

This recipe I've been wanting to remove for other reasons (DEPLOYDIR messin=
ess), plan
is either merge this into the U-Boot recipe as it is the consumer of the de=
ployed
uEnv.txt. Or just move it to meta-tisdk where is actually used for somethin=
g.
(the version of uEnv.txt in meta-arago is just an empty placeholder file).

> ./meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> ./meta-arago-distro/classes/tisdk-bundle.bbclass
> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
> ./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.b=
b
> ./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolcha=
in-tisdk-target.bb
> ./meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-ara=
go-tisdk-host.bb
>=20
>=20

To be honest I don't know enough about the original intent of the Arago too=
lchain
and bundle to feel safe messing with them. I think they should either move =
into
meta-tisdk, or just be removed depending on discussions on switching to the=
 Yocto
provided "Standard SDK"[0]. But that would be a project outside of this ren=
aming
PR.

Andrew

[0] https://docs.yoctoproject.org/sdk-manual/using.html

> Are we planning on addressing the above as well at some point?
>=20
>=20
>=20
> On 1/30/2026 4:08 PM, Andrew Davis wrote:
>> These packagegroups are all "arago" packagegroups, the tisdk in the
>> name is a leftover from when the TI Core SDK was generated directly
>> from Arago. Some packagegroups already do not have this in their names
>> but many still do, update the names to be uniformly "arago".
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../recipes-core/images/arago-default-image.bb=C2=A0=C2=A0 | 16 +=
+++++++--------
>> =C2=A0 .../recipes-core/images/arago-thinlinux-image.bb |=C2=A0 6 +++---
>> =C2=A0 ...b =3D> packagegroup-arago-addons-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...dk-addons.bb =3D> packagegroup-arago-addons.bb} |=C2=A0 0
>> =C2=A0 ...b =3D> packagegroup-arago-base-server-extra.bb} |=C2=A0 0
>> =C2=A0 ...ackagegroup-arago-connectivity-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...ity.bb =3D> packagegroup-arago-connectivity.bb} |=C2=A0 0
>> =C2=A0 ...b =3D> packagegroup-arago-crypto-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...dk-crypto.bb =3D> packagegroup-arago-crypto.bb} |=C2=A0 0
>> =C2=A0 ...=3D> packagegroup-arago-graphics-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...raphics.bb =3D> packagegroup-arago-graphics.bb} |=C2=A0 0
>> =C2=A0 ...t.bb =3D> packagegroup-arago-gtk-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...go-tisdk-gtk.bb =3D> packagegroup-arago-gtk.bb} |=C2=A0 0
>> =C2=A0 ... packagegroup-arago-multimedia-sdk-target.bb} |=C2=A0 0
>> =C2=A0 ...media.bb =3D> packagegroup-arago-multimedia.bb} |=C2=A0 0
>> =C2=A0 ...-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} |=C2=A0 0
>> =C2=A0 .../packagegroup-arago-toolchain-tisdk-target.bb | 12 ++++++-----=
-
>> =C2=A0 .../recipes-core/packagegroups/ti-world.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 16 ++++++++--------
>> =C2=A0 18 files changed, 25 insertions(+), 25 deletions(-)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-addons-sdk-target.bb =3D> packagegroup-arago-addons-sdk-target=
.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-addons.bb =3D> packagegroup-arago-addons.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-base-tisdk-server-extra.bb =3D> packagegroup-arago-base-server-extra=
.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-connectivity-sdk-target.bb =3D> packagegroup-arago-connectivit=
y-sdk-target.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-connectivity.bb =3D> packagegroup-arago-connectivity.bb} (100%=
)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-crypto-sdk-target.bb =3D> packagegroup-arago-crypto-sdk-target=
.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-crypto.bb =3D> packagegroup-arago-crypto.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-graphics-sdk-target.bb =3D> packagegroup-arago-graphics-sdk-ta=
rget.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-graphics.bb =3D> packagegroup-arago-graphics.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-gtk-sdk-target.bb =3D> packagegroup-arago-gtk-sdk-target.bb} (=
100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-gtk.bb =3D> packagegroup-arago-gtk.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-multimedia-sdk-target.bb =3D> packagegroup-arago-multimedia-sd=
k-target.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-multimedia.bb =3D> packagegroup-arago-multimedia.bb} (100%)
>> =C2=A0 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup=
-arago-tisdk-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} (100%)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.b=
b b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> index becd3e9b..7804e7bc 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> @@ -17,17 +17,17 @@ IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-console \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-test \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-test-extras \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-graphics','',d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-gtk','',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-graphics','',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-gtk','',d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','o=
pencl','packagegroup-arago-opencl','',d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','v=
ulkan','packagegroup-arago-vulkan','',d)} \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-connectivity \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-crypto \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-connectivity \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-crypto \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-multimedia \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-addons \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-addons-extra \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-sysrepo \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-sysrepo \
>> =C2=A0 "
>> =C2=A0 DEVTOOLS =3D " \
>> diff --git a/meta-arago-distro/recipes-core/images/arago-thinlinux-image=
.bb b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> index a30acbfb..a7ed2e8d 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> @@ -16,9 +16,9 @@ SYSTEMD_DEFAULT_TARGET =3D "${@bb.utils.contains('DIST=
RO_FEATURES','opengl','graph
>> =C2=A0 IMAGE_INSTALL +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-base \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-console \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-graphics','',d)} \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-connectivity \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-crypto \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-graphics','',d)} \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-connectivity \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-crypto \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
>> =C2=A0 "
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-addons-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-addons-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-addons.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-addons.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-base-server-extra.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk-server-extra.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base-server-extra.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/pack=
agegroups/packagegroup-arago-connectivity-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-connectivity-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/p=
ackagegroup-arago-connectivity.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-connectivity.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-crypto-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-crypto-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-crypto.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-crypto.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packageg=
roups/packagegroup-arago-graphics-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-graphics-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-graphics.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-graphics.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-gtk-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-gtk-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-gtk.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-gtk.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packag=
egroups/packagegroup-arago-multimedia-sdk-target.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-multimedia-sdk-target.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-multimedia.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-multimedia.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-sysrepo.bb
>> similarity index 100%
>> rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-sysrepo.bb
>> rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-sysrepo.bb
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-toolchain-tisdk-target.bb
>> index d3a90595..2baa1045 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-to=
olchain-tisdk-target.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-to=
olchain-tisdk-target.bb
>> @@ -8,20 +8,20 @@ inherit packagegroup
>> =C2=A0 TISDK_TOOLCHAIN_BASE_TARGET =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-standalone-sdk-target =
\
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia-sdk-target \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-multimedia-sdk-target \
>> =C2=A0 "
>> =C2=A0 TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-connectivity-sdk-target \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-crypto-sdk-target \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-connectivity-sdk-target \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-crypto-sdk-target \
>> =C2=A0 "
>> =C2=A0 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 =3D ""
>> =C2=A0 RDEPENDS:${PN} =3D "\
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-gtk-sdk-target','',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-gtk-sdk-target','',d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${TISDK_TOOLCHAIN_BASE_TARGET} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-graphics-sdk-target','',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-graphics-sdk-target','',d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','o=
pencl','packagegroup-arago-opencl-sdk-target','',d)} \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-sdk-target \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-addons-sdk-target \
>> =C2=A0 "
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/=
meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>> index 25642831..86ba27c2 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>> @@ -30,14 +30,14 @@ RDEPENDS:${PN} =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-base \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-console \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-test \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-graphics','',d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-tisdk-gtk','',d)} \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-connectivity \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-crypto \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>> -=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','','=
packagegroup-arago-base-tisdk-server-extra',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-graphics','',d)} \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','pac=
kagegroup-arago-gtk','',d)} \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-connectivity \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-crypto \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-multimedia \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-addons \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-arago-addons-extra \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','','=
packagegroup-arago-base-server-extra',d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS"=
, "meta-python2", "${PYTHON2APPS}", "", d)} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', 'ar=
mv7a', 'valgrind', '', d)} \
>=20


