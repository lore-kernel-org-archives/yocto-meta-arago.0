Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D23112584F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:37:10 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.631.1773247028597515284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 09:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=j/vVJOSE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.69, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOTxgWTiOGuuHN2KwM/lA4dlAw7552/pAB61UUN69LAxuSmMMRAJfB8bPNqUD7DJ+AcZtKFzhApwqbOry/Y9Wf74qgDVgTdki1kLwGmjfVAy5MsKiqkXAA+ivdzrQZm+jfiCMDWZnIB7MVLe2ro7N7WbsA+jko6lEBMMVac+VHPRy6cj+K+V2C1cCNtwnSR3mucTJYmgYvh4abw6KvF+65xqeMmyCUM1+GlhLCOBTRZICQpnss8+0L5eN6pizKMiFNWm/4B61lcwdIRGB7WPM3AobPFRpqoQ9Q7brrvpX9KnQUkyZGLWMl/pUGbLVTcR7a4G26JU/ZW3+ISTcoPYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n/gWqUM1V2UHooW2PcGmeZSz8HKYnqrmliURyrcpvU=;
 b=B8sRQwQdhz3FuK5OyqPy/Yne4slbSnFldludGmEfFPjV+2i1PpbIhd30A2AnPHu14Du2tcdhO64bn8HAAaNi8J1NE5Y8URwaBPWH7AgIWNU/TUXUwQfc12s/tcAjJQYQuui6AhGxuA+d6UT/IRHRunfdLn2q8jK8SJGRP+f0Qt77uv8JQRjfi09E/7yhzREUKV3YUP4ixYj8h72AeFy7aqvfTK2Ea2R8TMNN5/tdDD0Cg71hqj+NeWZhQP0FG/mwpydX0A3/F0f+X/k1LVvy7xYUdOZzwqR/Z2DzmciTi/XOa6a5ROdAHEcGs2CdOo5MVIs7Ljl0gckJ29HsDD0x+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n/gWqUM1V2UHooW2PcGmeZSz8HKYnqrmliURyrcpvU=;
 b=j/vVJOSEEz15DcmoxDO6aXerlV094tlg6qd6+HFoo3jmwBDwQ+ZfsYadSWCsFW7T7Rg/9K/onuB1E/TFBgIci2TZZ4U4277tQXKqOWlc1jnNVJp04wr4Dw9infMb9bjCUL0/zWEHyNUVx+Re9R6sH/AGvFq8a7ck1vcnPMXxDeE=
Received: from SJ0PR13CA0145.namprd13.prod.outlook.com (2603:10b6:a03:2c6::30)
 by CO1PR10MB4643.namprd10.prod.outlook.com (2603:10b6:303:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 16:37:04 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::c7) by SJ0PR13CA0145.outlook.office365.com
 (2603:10b6:a03:2c6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Wed,
 11 Mar 2026 16:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 16:37:04 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:37:03 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:37:03 -0500
Received: from DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c]) by
 DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c%20]) with mapi id
 15.02.2562.020; Wed, 11 Mar 2026 11:37:03 -0500
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Etheridge, Darren" <detheridge@ti.com>, "Brnich, Brandon"
	<b-brnich@ti.com>, "Christidis, Antonios" <a-christidis@ti.com>
Subject: RE: [meta-arago][master][PATCH v2] ti-test: Add request and
 websocket-client to packagegroup
Thread-Topic: [meta-arago][master][PATCH v2] ti-test: Add request and
 websocket-client to packagegroup
Thread-Index: AQHcsNynKWNQ1Rd/LUKqwaOITlBb7LWpiLbQ
Date: Wed, 11 Mar 2026 16:37:03 +0000
Message-ID: <8fc69fabb29e42f0ba1f36856aa401ae@ti.com>
References: <20260306211447.882107-1-t-lannynd@ti.com>
 <e0c7108f-2c87-470e-aed4-013cd3e65472@ti.com>
In-Reply-To: <e0c7108f-2c87-470e-aed4-013cd3e65472@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.25.112]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CO1PR10MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: deb12a45-ced7-4ff1-072b-08de7f8c6da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|42112799006|1800799024|36860700016|376014|4022899009|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uJnNiPyFJKRcWamE63zkMm3nx5j9TFWiAYwdVGdU5NfZeS9s9xEE/MKRNFHPBPA5up5VoIzVbWm76sO7kkxFVLidoJ+RCwy6HK3VxLEEk+5pslWXaByjSiTd8JphJOb5hwFJcWmXeh+pD8O+RMvz2a4hwF98IQiui24EePKC/2cnaH1NlXhuYKxWPozHbNwPZmcVhtyNtYHtXD+e94q+zcImkgusvHWGjQlLrHnCxlXFtYzmo1vPKUzAvEjbEzxAV+ur5bmn0nnzdfnKeAYqcsgnRTsr0dvsiw3lsQ6EvHbpWZj/B7D04GneCytEi3OZ8ICJZd6tGQruifZw40rzBBXtCDjfZWSYFa6/HH4o2al7VVHfq6yT40/QDdrCJ567pgkWthLnFn0P87eYe+v/FM8pvwDD8lQ2oq/dTyyWTEiN3SOehDLchjNWURrggyHHN1W5u5WOw/RSfr2pGXDJ31DBSefE2c9oAkIDb6PNZPZaM1s9Sc3I3Z+ZvjhzeSsTnb7pjoOAxnOSJraA1QZEK77RzD/TTMCUyejIlgQqjrYKNnTcRkavokp10y0mG2LHyMypcdVAARF2modXARs/YqT3tFk/Xl5hNsQdrn8Dsk9m4lESiqAPAYdehDwLahzOGP2NpYJfPt4SWVZtKha8th7GmLCoCVvmQAsROAKgGmqFH3gBQRngmXkHDaaiyzLT8L97OURrQBcgrfaEPrWIGvBfFDTfulIp/5f0d2vSmb8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(42112799006)(1800799024)(36860700016)(376014)(4022899009)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aGRhh18ghxbDhE+CKkBdd54PDnriCoiTrDVUbkfz//ep8g6BIxIXQLAhXa88P5IqZaT73lLbBA4omjuDLglXDLdMnZsLVa2qBLUF5pkdwbe3n3GgKumpKRRXgMXnSvhjvWkLmQNYVVgHTihxt1JDhqgFf5XiTQ+q3Gy2QfCzFaIVS6J3WOTkCSKONVSNgOvhNrHgwCkViQIBcopdD18wl7MBF29ViFGgsPhDkajRlZ08oHXALSJVrWFID5cnGmhzMfLO5Hoz23kqh+r3tXeiEk85TP0o1Z+uAA75GW1a20SRC/MrZZomiNWjcbJLLJd5hUvB91HF9cIoANJKXQfu6lIRlpSFgRghQUe0lJP06q4T9DCvfCX3J0nQxK7KOE16NrMUC+bN+fThaGz49QSHWSt6nA2Zgv5rmUhsEEvqrJH3tzBOK95e3ex7K0RD0NHe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 16:37:04.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb12a45-ced7-4ff1-072b-08de7f8c6da6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4643
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 16:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17312

On 3/10/2026 5:24 PM, Ryan Eatmon wrote:
> What this patch even tested?  This fails to build because python3-websock=
et-
> client is so old that it no longer fetches.  I'm having to send a patch t=
o meta-
> openembedded to update the recipe.
>=20
Yes, I was able to build and test it, however, it was on the chromium confi=
g, since that is what the packages are used for. Apologies for not testing =
on the core-sdk, and thank you for sending a patch to meta-openembedded.
>=20
> On 3/6/2026 3:14 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> > Add Python packages required for automated Chromium video decode testin=
g.
> >
> > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > ---
> > v2:
> > -Rebased off latest master changes
> >
> >   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > index 65cf7f1e..b09ffcd9 100644
> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > @@ -72,6 +72,8 @@ TI_TEST_EXTRAS =3D " \
> >       python3-pillow \
> >       pytesseract \
> >       python3-numpy \
> > +    python3-requests \
> > +    python3-websocket-client \
> >       ${@bb.utils.contains('DISTRO_FEATURES', 'opencl',
> '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
> >   "
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#17278):
> > https://lists.yoctoproject.org/g/meta-arago/message/17278
> > Mute This Topic: https://lists.yoctoproject.org/mt/118178594/6551054
> > Group Owner: meta-arago+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
> > [reatmon@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
>=20
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

