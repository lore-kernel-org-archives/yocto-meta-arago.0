Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443B1C982CA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:05:37 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8094.1768575932719827014
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 07:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GGtENIuo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.33, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kefVfvyuvk2DzBfHwpvHo+T6Zf64EUvsD2Ohx9U1ReanfO+Gms7ZlS8ewUri/+VOuMmB6rvPh1qhjp5ZPBDNzLJbrOTAT4JirOG+LqvMcIQovE/dISNAhA8ryZbZOFVpvewg8SOccw75ik4FqzXmWFfTQn/cHXB+R7w7QL5WaVJ8RYdoN7oT7t/Sk0Rp2Gi+c5GA/3LdjclCLB+wKjvtXTS4aZsiOQVCRM2U4uhl1YUIfd4QVNxc+0dgqjRLUbc8rsPQdgTyA8QOQaoB9n92K5Fe3zmzRMV6qiZtHHcTW3kbdXPvKA+kp81lEZlSeQL+r8Z62myQDhJJMHkk6FT/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZvV072WG/1+hRwJ+TGdioEE5BYTY0+yRTSX0wvFSSs=;
 b=Ov1ZFiyAaYtlTsByCevVNUUak7xp+pGLfeYWSZOpOagQwXeDYYHyalCnoqq003mljRyHwjXQ4zqX+x1UdhlFiKIoUrCmaKCh3smf1ew/iltfwAgPJGH+VtSAD2O2CrUpIEaWYhcdF9lhZSFwVaJgyMUn4+RR6qRWdzctX8PfGtI+5iiVURj06xrqPEl0PO8VyWcKeHVhoin3rc31hz7blIiRGqgCAT9tkBi8DWsw8ggEvOc0Zs0JrC+9bIxJ7ZPHGxvkOyJd/ER58hZ2MfJfmJNsKbQEVCqPauR7pD2uTe/o4HbG0UHZY2v0L8dTA7TqIqyR1FbuPJJaRE7Oe7BUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZvV072WG/1+hRwJ+TGdioEE5BYTY0+yRTSX0wvFSSs=;
 b=GGtENIuoQGzaLaeWD015gja8UTu5t5z7QdsapYlbKCwEsNn2wr1AHYU2wUC9m26m6id7FqGAi1xJEcqdLVDwh9lw36rOvNLG5e/W+Z69xfx2tuTaVM6hmzXKgb8aj8PNKIqH29AzC65BfvhXAaY6NXJ6tM/uBpCfp3P2HGyGTn8=
Received: from SJ0PR13CA0111.namprd13.prod.outlook.com (2603:10b6:a03:2c5::26)
 by SA3PR10MB7071.namprd10.prod.outlook.com (2603:10b6:806:319::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:05:29 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5) by SJ0PR13CA0111.outlook.office365.com
 (2603:10b6:a03:2c5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 15:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 15:05:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:05:12 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:05:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 09:05:11 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GF5Bk73450331;
	Fri, 16 Jan 2026 09:05:11 -0600
Message-ID: <1f2bf552-4016-44cb-8dea-321184a965e2@ti.com>
Date: Fri, 16 Jan 2026 09:05:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add
 QT6 PACKAGECONFIG support
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
 <188B3E4EEA27FAFF.3242018@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <188B3E4EEA27FAFF.3242018@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SA3PR10MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: c480a7f4-138d-47b4-c336-08de5510aece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/rsuTAusJtj5QRanvCHURXJ0TdkU3n4wPL6Xf4bnvayaOHK6DzyGFQu4CfCK?=
 =?us-ascii?Q?Nvh9xYjZ1u0tRfowXZW1qEYSRyA95IACrSNoINGi9gm/0byu12fLxTcgMDAB?=
 =?us-ascii?Q?XZh/rMyi64UgRqtcvbp/aWDWKsDVPymkcm/lVKNdgxWpZPtDmv4ehASRpXQ9?=
 =?us-ascii?Q?1J3pFu417SAEH0mnfR6nO16+e/z9D4ETV34vIntNiO/9WaXQ8wZrJVVUh7hD?=
 =?us-ascii?Q?qavhN4Sxuplq9Ir+1FG+B8i7qIQW0sNu+rII+iZRoh+vko/WWcfQxTl0lj01?=
 =?us-ascii?Q?jdnJwmrZR0Zkf569ZbQVPFiWprJqs+ai6+Fxj1CwNy4pKOXDvLHgG/Y0sBFH?=
 =?us-ascii?Q?pcmJjpleUtOKHMNcRNFCUQk6M254mMoB56mhCIOehknP6GjzIbCKegkzyYQ2?=
 =?us-ascii?Q?fwDjLGWQWXEcHinpXkY1LoIFwzH3F7cBMa85Xp8JYui9v0BDbOzB1fx7uTFh?=
 =?us-ascii?Q?kMC6NT2ae3HpWJrHohvHQopyqv6P/wRUGbqL6UQEFlFyn54Lt3dKAQdDaXky?=
 =?us-ascii?Q?Wyllhl17GTwA3iN99HWUHAO+yYs7mNdLwwbL6mijQsqjaujKeHRm5LbQJxTn?=
 =?us-ascii?Q?Iwg7mLkvQTjNnURbexuPLs4a3zRz+SJTT9gwb5WM2IRv8VgSldJJw3UBet6I?=
 =?us-ascii?Q?vWmBdwG9IshblBC6PXi04X92ylFQffrcm5BkNeUO0MaMJGyh+bcjCmrEvrOG?=
 =?us-ascii?Q?EwtRdcPMjEmGdiK98rggVNHXoHHxC24+nBdGWHm+9zef2s2lWN7kjutC9V+1?=
 =?us-ascii?Q?dtjBQAYuKGZvB+mdG0JmgA+SRlLJ5ELYNHpMz6807WBIbJ4EOy+zuPe4SPvP?=
 =?us-ascii?Q?nqAPYmQ022+UXEoRjvqkga+Q9lmAV4NPEjT4BIta3zh8OPhLYcPiKZxMwCzG?=
 =?us-ascii?Q?rox7QEbj5zgVMmGvD7MNWfq5alyEpxDgSRV2c5Hzd2S5qJ72Fofxye579zX+?=
 =?us-ascii?Q?uU03f2pD1n+wzB9XTQgbkZiQqwWM8HM5o8QxI5o1EKM/D+73gwj91Gtdjdrj?=
 =?us-ascii?Q?ZN7ivElmB3VQPr/tlL/b35Ot5pXkNgIfzOerWB6dN0TZhBFVMqiqX+k8wq00?=
 =?us-ascii?Q?ltcMIMbw3z8Z1IrQzN37MwXy21SXw2m+4/gReCcS5METqtWltDeCRFaJFvS3?=
 =?us-ascii?Q?quvcaJN1IodfjQ1ByDANd3J4UBfsfkwptvrA3GWo+03z/6zPokSl25UE31CL?=
 =?us-ascii?Q?AdfO0DzK/FgZOjY+t74R5otLm6h+8tvtJkdrJ5Cdq4kedT9CVRCgsUaCzy6v?=
 =?us-ascii?Q?Ku/ox7HurPt3RNyrrIvudBkqWXx7qJ7MDEEEl41Lll4WA4Y4KL1zVPZkB0JL?=
 =?us-ascii?Q?BOvONB57keCGbzUB3GbtsgnGIxExjvS84mrKl9r4wPlJ5ZwwH+9OVwCfa/5D?=
 =?us-ascii?Q?1yDCBVplaALdCaN+kM/rSgevWxEUqFb1C44lGQET+Y5W3UI6O8MD/NL7QfkU?=
 =?us-ascii?Q?2PHCrD/VnJNomROaxP/84qaIZCjLEBN3Us/XHvAD5cRng62DS7Q/eYtAM54i?=
 =?us-ascii?Q?rvkK38fAPc/dHxj5uvowxk+/804gbsaXuqitiSYvfOQ7YIaNGWr9+SvWs6AI?=
 =?us-ascii?Q?3XYVnju65hfRzLvTnwMJfVjBH+F/t+nA03xQhIwkM/qeQIX/mmN4iSt/ihfZ?=
 =?us-ascii?Q?t28e3d+88JigRNipc9BZJumnWkTM9W6Zwv1Nwk4OYAgDEcilx88qcIbn57IM?=
 =?us-ascii?Q?48h1KA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:05:27.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c480a7f4-138d-47b4-c336-08de5510aece
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 15:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16970



On 1/16/2026 9:02 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 1/16/2026 8:37 AM, Telukula Jeevan Kumar Sahu wrote:
>> GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML=20
>> applications
>> by providing GstGLVideoItem QML element. This plugin is essential for
>> integrating GStreamer pipelines with Qt6 Quick/QML user interfaces.
>>
>> Enable Qt6 PACKAGECONFIG to build the qmlgl plugin when qt6-layer is=20
>> present
>> utilizing dynamic-layer.
>>
>> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>> ---
>> =C2=A0 meta-arago-extras/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
>> =C2=A0 .../gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc=C2=A0 | 11 +=
++++++++++
>> =C2=A0 .../gstreamer1.0-plugins-good_1.26.%.bbappend=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
>> =C2=A0 3 files changed, 19 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.26-qt6.inc
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.26.%.bbappend
>>
>> diff --git a/meta-arago-extras/conf/layer.conf=20
>> b/meta-arago-extras/conf/layer.conf
>> index 3927a913..1a4a5bdd 100644
>> --- a/meta-arago-extras/conf/layer.conf
>> +++ b/meta-arago-extras/conf/layer.conf
>> @@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-extras =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 networking-layer \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openembedded-layer \
>> =C2=A0 "
>> +
>> +BBFILES_DYNAMIC +=3D " \
>> +   =20
>> qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
>> +"
>> diff --git=20
>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good_1.26-qt6.inc b/meta-arago-extras/dynamic-layers=
/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.=
inc
>> new file mode 100644
>> index 00000000..e30440e1
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good_1.26-qt6.inc
>=20
> The -qt6 is not needed in the filename.=C2=A0 The guard just needs to be =
to=20
> the name of the recipe being appended.=C2=A0 That way if you need to add =
more=20
> later we aren't creating multiple .inc files.

I hit send to fast.  The convention we have to use -arago.inc for the=20
filename.  Change the -qt6 to -arago.


>=20
>> @@ -0,0 +1,11 @@
>> +PACKAGECONFIG:append =3D " qt6"
>> +
>> +QT6WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES",=20
>> "wayland", "qtwayland", "", d)}"
>> +
>> +PACKAGECONFIG[qt6] =3D "-Dqt6=3Denabled, -Dqt6=3Ddisabled, qtbase=20
>> qtbase-native qtdeclarative qttools-native ${QT6WAYLANDDEPENDS}"
>> +
>> +# Qt tools like rcc, moc and uic are located in /usr/libexec, instead o=
f
>> +# /usr/bin, which is not in PATH by default.
>> +do_configure:prepend:class-target() {
>> +=C2=A0=C2=A0=C2=A0 export PATH=3D${STAGING_DIR_NATIVE}${libexecdir}:$PA=
TH
>> +}
>> diff --git=20
>> a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dynamic-lay=
ers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%=
.bbappend
>> new file mode 100644
>> index 00000000..27426f4d
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good_1.26.%.bbappend
>> @@ -0,0 +1,4 @@
>> +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6 =3D ""
>> +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6:arago =3D=20
>> "gstreamer1.0-plugins-good_1.26-qt6.inc"
>=20
> Same here, the _QT6 in the variable is not needed.

Same here...  replace _QT6 with _ARAGO.


>=20
>> +
>> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6}
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

