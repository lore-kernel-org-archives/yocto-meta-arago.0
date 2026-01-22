Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B9FD3EE92
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 16:43:51 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32460.1769066253526713840
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 23:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=f49TCYpU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.42, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjBhBxPYASK2qv1nbGWgilz2AQdRg1VUPRZykw0pijeT4+1bk0I2MEdHHdNUMP/p0jbtNBoA9qOao+8ecymMlZ1qLSoXciA0Xd6orTZ+aEZF/hxk5qILrW8piJ1vVKOzkS81gq+i1DSeE5D8W1KVGp/8NHfowCLksOh66mdH+QXSvH6Hae2sIQFP0xnCcWh5kIVa22N4jrwsV80Fq+prdgSStP3/2494h/RL9PZyY4d3Yk6ozJXglrs0LQviceamImjgz2vc1OHKdFModCkSxsuTy9+MpqA2GtUhMihrnSaCw27Mhadqk+geMADupDfmZDQI2N0c2U/GSsVVETXsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/avZxRK2sHDCTM4DR5qa8puUCDeGsT9EQbCbCUJYLs=;
 b=HtEPcgolt46E9FnRMHu8umiiIB8BcbU9Dmu/xzlY1SsVxMCb42AQC07vfEJKurHS72EQWQptXvn4xZSA9HZqvCD9UnTfAxZAOhLM32uAFqoqTxUWscysvCUiMPpBsxs3HcG3mFw1rUFPPmv4cCIsiCbF9sGo7/iyulpVAbtUfQeTatodu8dLN/0PKHZDjY225YzJakadB/gnlUiMU57feZ7J4DKb1g+8wAJN5qLyKJzimGNRU+xgD16vTnXW6C+Anb5I7A1jOk7uTNe9HaHsC1NuN61+MUFncslDdI0jJmiLRHoTIDVemHuvyLGRYjipK9M/K3wOeh1IQoP6pEbAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/avZxRK2sHDCTM4DR5qa8puUCDeGsT9EQbCbCUJYLs=;
 b=f49TCYpU4vxlST1DW0thPgqkhO6/wE2PRblEgrG6mML2DFcQIFEpQPwO9IeXZq8BhJ6jq6bTY+OJ8ME+5+74X//zD5OaQYpjxv3Py34Rh2u7HUQKLlsxcgTNasHQcw/Ss/tmg+NHf/VqAB8ASUCkJ1oN0bBIEMuTV4iv2LOoR6A=
Received: from BYAPR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:40::18)
 by LV3PR10MB7983.namprd10.prod.outlook.com (2603:10b6:408:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 07:03:16 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::1a) by BYAPR04CA0005.outlook.office365.com
 (2603:10b6:a03:40::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 07:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 22 Jan 2026 07:03:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 01:02:27 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 01:02:27 -0600
Received: from DFLE212.ent.ti.com ([fe80::c5a2:1949:9cdd:d894]) by
 DFLE212.ent.ti.com ([fe80::c5a2:1949:9cdd:d894%23]) with mapi id
 15.02.2562.020; Thu, 22 Jan 2026 01:02:27 -0600
From: "Singh, Vishnu" <v-singh1@ti.com>
To: "Hegde, Yogesh" <y-hegde@ti.com>
CC: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Eatmon, Ryan" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>
Subject: Re: [meta-arago] [master][RFC PATCH] packagegroup-arago-tisdk-connectivity: Enable zeroconf ip support
Thread-Topic: [meta-arago] [master][RFC PATCH]
 packagegroup-arago-tisdk-connectivity: Enable zeroconf ip support
Thread-Index: AQHci2s4i4uM/q18hEG8CjbNvlsXGLVdwwGw
Date: Thu, 22 Jan 2026 07:02:27 +0000
Message-ID: <7fb12e2ff5b64281a5e27cab636dd4d3@ti.com>
References: <20260119110339.3585220-1-v-singh1@ti.com>
 <20260122064911.njy4xh57r356ag2g@yogi-work-pc>
In-Reply-To: <20260122064911.njy4xh57r356ag2g@yogi-work-pc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.68.220]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|LV3PR10MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcced67-5b52-4c22-8104-08de59845064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bbMsl7vSPU7lZx3A6otf/ExUR1olN6p1tCl3BeXaJc/QOI659dxIcZiJ/8XH?=
 =?us-ascii?Q?s6GHtmMTfVz/kjo+uBrbYETMYLyLrExAhsBLTv/OxEpQAZctilcyYlAiOvQv?=
 =?us-ascii?Q?dNlDMWGD3ewla5ifubIA+ZblL/PrzRHPiJi+FPBmdCwQzrtt5NjtK9nWor5/?=
 =?us-ascii?Q?UxA8VEZ113ezjIxqgRDjIkY9qs+cm08wu95niRAOp0lyobLzhONDHpJHRyXH?=
 =?us-ascii?Q?B243b1gFUqf5PzOWPkCQC+7zUqIdlUMXVX6QXyLzO5FBJ0zhrr+rlJKXO8LU?=
 =?us-ascii?Q?TrbHfDZJx87ubwKCAbodRWbVM/BT6Q2yqi6QP/l9zr3Uj02usAVgle4ATDCU?=
 =?us-ascii?Q?0lff7OR2s0T4DSbkPv1IUXi8qMvX43+vuOmugoDv4L7wDS48xkp1dR8oNKGI?=
 =?us-ascii?Q?XEHU+E4oXd9e6sNWTmJl4EU5CVEYtJZJRSysP66tIu3tN2j98C71Yn/yrAkc?=
 =?us-ascii?Q?yAi31zdUit6BIO3/ah+dgzpMOnyIgeqtaOdu4FPHGQmzJHMSUBrOlDDV+y7Z?=
 =?us-ascii?Q?zjPd4E0pU7KArXCPNg64Y92zTn3DxoGoDJdbC+Dq8MoNgJUJJYP6RyWDyTol?=
 =?us-ascii?Q?BKYnbK6pzif1ze37a9HT/9Ex1rXkbWBIupbMreDN72eu8oLQ+83FDtYKAa/A?=
 =?us-ascii?Q?xRz2402wfmHu005LYA2+7XYu8qsnMbb1JslznTnRjMpkbtr9+2QfcwiPhi7A?=
 =?us-ascii?Q?GUw+1JxA9U4tqsfB3D9C4UOIZSz2qMB1D8SLUt5d27lm94/W39VE2H0D5L+G?=
 =?us-ascii?Q?tQTAOOwWI7lIUrXWC3vBmkDAkn88khYL1vPiQz1+GcSLVepnkRIRTKg1ZNgF?=
 =?us-ascii?Q?u/uTPkjvkkWABeYbr+Likt0kD5J6vhBfouWFCycUgfEb7okshCZyY6C2ZltE?=
 =?us-ascii?Q?rHiO11K4J+DAdM3rtPLaXmu3kB4N9djNF5XZGEgs02lZYbCSwAOHzDSy5cNL?=
 =?us-ascii?Q?LjbqxDusIVef6F0m7KTr/LSjxSyM+KevABuwmKdM97DJz1AMnLtSAyYM3sWp?=
 =?us-ascii?Q?t+D8PM2J8h+1CEFURk9BonGn7sE8+rJJrKPRZSjTLCc8F7saUYYJUnnme28q?=
 =?us-ascii?Q?K1+rJ9GLPO+l5CtqRQXXAxIhvAMCKyL4aJU2d1vmL7lFpTMhpbP6NL3CNo1n?=
 =?us-ascii?Q?rISXUVstVtvVNqqZfgDJNQl7bDnmHyrosn8BlnwGP8V7pyRAwYxiSrMbFf23?=
 =?us-ascii?Q?hgSKQuRbzjAva+jSeMFQZwAG7RWc+qp3sPW57ACfIPx9Mjp2e0OaGrN7U6V/?=
 =?us-ascii?Q?dD4juwSgpUU01MdDXpAzskusMnAOoWHwBwDKlM4T9WbvlGKMM5+WhuHFZ6le?=
 =?us-ascii?Q?3Suz7nEi9Opg2UnKK/edD+/PRo3ECiTX9tvEYPpWMjWa7sTUy9JdIZfDj4o+?=
 =?us-ascii?Q?gkkT3o+N/hWkYOroh2/8bDN88+vXgjTz14s5XXCSPjHRrrFPbPsbZAGtBzKh?=
 =?us-ascii?Q?EDyzyGYFSEUy7E3/RxRoaSLzhd+N3ZNjypKJlcxKstv3bHXx8V6zIYqUgTXZ?=
 =?us-ascii?Q?7DNgt/vW9IHsZ2OEwSJSuGOyjwIJ7eqtxqteGe6wvQP7iQxd7TR00l8lYVMd?=
 =?us-ascii?Q?5LVB2TUvEhbOQurI2boFgDkWfmZnhhw7SNMuqPinrZfeo74yQZbta7YFN9CK?=
 =?us-ascii?Q?skkb97wot9yyxkhi0phLqmwIAoa61FGlJWGuabzlFZHt3Hr/ng94mL70O0z4?=
 =?us-ascii?Q?jVHZ9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:03:15.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcced67-5b52-4c22-8104-08de59845064
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7983
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 16:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17009

Will be sending new patch, as the new zeroconf-autoip service is not requir=
ed.

-----Original Message-----
From: Hegde, Yogesh <y-hegde@ti.com>=20
Sent: Thursday, January 22, 2026 12:19 PM
To: Singh, Vishnu <v-singh1@ti.com>
Cc: meta-arago@lists.yoctoproject.org; Eatmon, Ryan <reatmon@ti.com>; denis=
@denix.org
Subject: Re: [meta-arago] [master][RFC PATCH] packagegroup-arago-tisdk-conn=
ectivity: Enable zeroconf ip support

On 16:33-20260119, vishnu singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
>=20
> Dante DEP useage zeroconf for Dante network IP addresses.
> Zeroconf provide the IP network without manual configuation, and=20
> avahi-autoipd is for auto ip assignment.
> To get the zeroconf ip at bootup, zeroconf-autoip service is used.
There are few typos in description. useage -> usage and configuation -> con=
figuration.=20
>=20
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>  .../zeroconf-autoip/zeroconf-autoip.bb        | 30 +++++++++++++++++++
>  .../zeroconf-autoip/zeroconf-autoip/README    |  1 +
>  .../zeroconf-autoip/zeroconf-autoip@.service  | 12 ++++++++ =20
> .../packagegroup-arago-tisdk-connectivity.bb  |  7 +++++
>  4 files changed, 50 insertions(+)
>  create mode 100644=20
> meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip
> .bb  create mode 100644=20
> meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip
> /README  create mode 100644=20
> meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoip
> /zeroconf-autoip@.service
>=20
> diff --git=20
> a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip.bb=20
> b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip.bb
> new file mode 100644
> index 00000000..4b59a7e6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-
> +++ autoip.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Zerconf autoip"
Typo Zerconf -> Zeroconf.
> +DESCRIPTION =3D "Zeroconf IP assignment using avahi autoipd"
> +LICENSE =3D "MIT"
README file contains TI-TFL, It is a bit confusing due to 2 different licen=
ses mentioned. Can you clarify the correct license and include the correct =
license text in the README.=20
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D102e8ceedf1b96837ba2eefc0d47f4=
e6"
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +COMPATIBLE_MACHINE =3D "am62dxx"
> +
> +SRC_URI =3D "file://zeroconf-autoip@.service \
> +	file://README \
> +"
> +
> +S =3D "${UNPACKDIR}"
> +
> +inherit systemd
> +
> +SYSTEMD_SERVICE:${PN} =3D "zeroconf-autoip@eth0.service zeroconf-autoip@=
eth1.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	install -m 0644 ${WORKDIR}/zeroconf-autoip@.service=20
> +${D}${systemd_system_unitdir}/ }
> +
> +FILES:${PN}=3D " \
> +	${systemd_system_unitdir} \
> +	${systemd_system_unitdir}/zeroconf-autoip@.service \ "
systemd bbclass automatically handles service files, I think it is safe to =
drop the FILES variable completely.=20
> +PR =3D "r0"
> diff --git=20
> a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip/README=20
> b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip/README
> new file mode 100644
> index 00000000..1ad1d419
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-
> +++ autoip/README
> @@ -0,0 +1 @@
> +TI-TFL
> diff --git=20
> a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip/zeroconf-autoip@.service=20
> b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-auto
> ip/zeroconf-autoip@.service
> new file mode 100644
> index 00000000..952a8c60
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-
> +++ autoip/zeroconf-autoip@.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3Dzerocnf-autoipd for %i interface After=3Dnetwork.target
> +
> +[Service]
> +ExecStart=3D/usr/sbin/avahi-autoipd --force-bind %i=20
> +ExecStop=3D/usr/sbin/avahi-autoipd -k %i Restart=3Don-failure
> +RestartSec=3D30
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git=20
> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> k-connectivity.bb=20
> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> k-connectivity.bb
> index 0a8d4493..66aa4872 100644
> ---=20
> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> k-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> +++ tisdk-connectivity.bb
> @@ -53,6 +53,11 @@ BT_TI =3D "\
>      bt-enable \
>      bt-fw \
>  "
> +ZEROCONF_TI =3D "\
> +	zeroconf \
> +	avahi-autoipd \
Since services in zeroconf-autoip uses avahi-autoipd, best to include avahi=
-autoipd as RDEPENDS in zeroconf-autoip recipe.
> +	zeroconf-autoip \
> +"
> =20
>  CONNECTIVITY_RDEPENDS =3D " \
>      htop \
> @@ -68,6 +73,8 @@ CONNECTIVITY_RDEPENDS =3D " \ =20
> CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
>  CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
>  CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"
> +CONNECTIVITY_RDEPENDS:append:am62dxx =3D " ${ZEROCONF_TI}"
> +
> =20
>  RDEPENDS:${PN} =3D "\
>      ${CONNECTIVITY_RDEPENDS} \
> --
> 2.50.1
>=20
>=20
>=20
>=20

Thanks
Yogesh=20

