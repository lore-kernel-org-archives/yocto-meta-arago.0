Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC48C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:31:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.64232.1686587511646029871
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 09:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XOUddwEI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: b-brnich@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35CGVlT5116451;
	Mon, 12 Jun 2023 11:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686587507;
	bh=EvN/eEQzqJcuYAWv1v+tO499lWBUkZKnwb2toTNwkXk=;
	h=From:To:CC:Subject:Date;
	b=XOUddwEIG4OQ7pEXelMSHEpKcjOtWlKKuUowBxeYpncwxrx6S56IQ7IiCa4vH1grT
	 vljS6bAK064kjvpft5iNmfg2qWjUFqZyJ7ddBQsLn7i1aKMf2Bapr6qiVtb2Y3rsZC
	 6WciSe8w/ZmBm163TAN/aHZgMD3t+uPv0SMxf2U4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35CGVlV7079946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 11:31:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 11:31:47 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Mon, 12 Jun 2023 11:31:47 -0500
From: "Brnich, Brandon" <b-brnich@ti.com>
To: "Brnich, Brandon" <b-brnich@ti.com>,
        "Etheridge, Darren"
	<detheridge@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Davis, Andrew" <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
Subject: RE: [meta-arago][master/kirkstone][PATCH v2 0/2] gstreamer updates
Thread-Topic: [meta-arago][master/kirkstone][PATCH v2 0/2] gstreamer updates
Thread-Index: AdmdSyp+5xZc9yjMT3qALRBlG6W4+A==
Date: Mon, 12 Jun 2023 16:31:47 +0000
Message-ID: <ae963694decc43e9906b2c4611c7d0c5@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.28.199]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 16:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14596

Hello all,

> -----Original Message-----
> From: meta-arago@lists.yoctoproject.org <meta-
> arago@lists.yoctoproject.org> On Behalf Of Brandon Brnich via
> lists.yoctoproject.org
> Sent: Thursday, June 8, 2023 1:12 PM
> To: Etheridge, Darren <detheridge@ti.com>; meta-
> arago@lists.yoctoproject.org
> Cc: Davis, Andrew <afd@ti.com>; Denys Dmytriyenko <denis@denix.org>
> Subject: [EXTERNAL] [meta-arago][master/kirkstone][PATCH v2 0/2]
> gstreamer updates
>=20
> Hello all,
>=20
> This series addresses concerns in previous[0] thread.
>=20
> Removing all of the old gstreamer patches as we are dropping support. As =
a
> result, kmssink flag needs to be set in arago.conf
>=20

Any comments on this series? Pretty important to get kmssink enablement.

Please let me know if there is there anything I need to change in order to =
get this merged.

Best,=20
Brandon

> [0] https://lists.yoctoproject.org/g/meta-arago/topic/99070450#14497
>=20
> Brandon Brnich (2):
>   conf: arago: Add support for kmssink
>   receipes-multimedia: gstreamer: Remove old gstreamer files
>=20
>  meta-arago-distro/conf/distro/arago.conf      |    3 +
>  ...emove-wayland-as-required-dependency.patch |   32 -
>  ...mallocator-Add-DRM-allocator-support.patch |  469 --------  ...s-add-
> support-for-meson-build-system.patch |  140 ---  ...sink-Add-mouse-drag-
> and-drop-support.patch |  426 -------
>  .../0002-parsers-bug-fixes-on-parsers.patch   |  145 ---
>  ...drm-and-tidss-in-the-list-of-drivers.patch |  160 ---  ...dsink-Add-d=
rm-
> support-in-waylandsink.patch |  703 ------------  ...waylandsink-Add-inpu=
t-
> device-support.patch | 1022 -----------------
>  .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |   37 -
>  ...e-formats-table-to-include-YUV422-mu.patch |   61 -
>  ...for-drm-memory-support-in-try_import.patch |   33 -
>  ...rc-Increase-minimum-num-buffers-by-3.patch |   29 -
>  ...Use-generic-dmabuf-import-in-v4l2src.patch |   43 -
>  .../gstreamer1.0-plugins-good_1.18.%.bbappend |   12 -
>  15 files changed, 3 insertions(+), 3312 deletions(-)  delete mode 100644
> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-
> DRM-allocator-support.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-
> add-support-for-meson-build-system.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-
> mouse-drag-and-drop-support.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-
> on-parsers.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-
> omapdrm-and-tidss-in-the-list-of-drivers.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-
> drm-support-in-waylandsink.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-
> input-device-support.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-
> formats-table-to-include-YUV422-mu.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-
> drm-memory-support-in-try_import.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-
> minimum-num-buffers-by-3.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-
> generic-dmabuf-import-in-v4l2src.patch
>  delete mode 100644 meta-arago-extras/recipes-
> multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
>=20
> --
> 2.34.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14542): https://lists.yoctoproject.org/g/meta-
> arago/message/14542
> Mute This Topic: https://lists.yoctoproject.org/mt/99412841/7553481
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [b-
> brnich@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


