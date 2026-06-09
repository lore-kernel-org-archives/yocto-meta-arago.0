Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7EACD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:09:46 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.719.1781024981557188408
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=h1K0IEG/;
 spf=pass (domain: ti.com, ip: 40.93.198.0, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmro3JWBeNtnqpu6oaSlKbFV2R2SiNkrzUR5+ZiZcl3zHqA8S/r5LFqV7RPVUg4k+YtUMrC4yMlsXjJIfIkqCx8xrAMVcrxFhMyAqakhCinO9Skt9eplDvtbs1vcOvAKxZYPzcx4nuyRj2Nhomh4Ivvyd0uMluiXu0sCIeU1ZbABgFIodnGl96rTciv4Zw0RdvTXTTbQV77dvDveRgMs99TyWBXi2T13dX4gFtVSVRXJalCqDdzemwvlq3zoTj/KDREVy2q7Nq5BYfD623t26AQjopTeEqgeSgDkTpYQykSLcHnFtKPBMdAca1tuP+I+ZMJVtcxox9B36hndTXmVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA9Je1ElSBVSIUquTE2n/+SfxkwCZoZtxUF4dtukXgc=;
 b=bMMXH5rQk0EtwOeTVnLnmUO8sZZCXZIRW+xmS8AII//04tA2RgxpR5AMuA4cC1Q6peCQtkbhtSZp1mJxOt5NSV51x5A3km0PwYPM/VQEi7rO7mdZC5+FyQNtzSkNxqsPac+1fHGBbIYNgFdg5VyZIxGL1o7DT2XzczKKPcX0El/Aj0bksWutMJnwGnusu4b2qPx1SWSOQq72UIF0TO1cUz0N1NymySeFW/Sv5gX7rcz+mnXVjAnp2DKoib39uWx6pZbHp7LkBVdc/aqRk6A29VwHvklZDIEJQBBj3HljziQoCGVV+Qbjg5MOdEWCsjbqQmhyJOY9Cj+1eGgsVYubqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA9Je1ElSBVSIUquTE2n/+SfxkwCZoZtxUF4dtukXgc=;
 b=h1K0IEG/HYrZQThu6DAUt25Ymcvk6KxqBiXQsNf8eN5ZWzCCMSSQPkmj3cKb9MYXDPG7oeqLoU5qVHM6nkEWUU+JNFZVac1uCDgRFcJMWcMw0Ww+dNjKIFSTb886J4ixz02cZOaVeHFra2cCsDXJZCohqqL4lVsBK9ZeW9xB6jQ=
Received: from SJ0PR05CA0201.namprd05.prod.outlook.com (2603:10b6:a03:330::26)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 17:09:39 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::1b) by SJ0PR05CA0201.outlook.office365.com
 (2603:10b6:a03:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Tue, 9
 Jun 2026 17:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 17:09:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:09:38 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 12:09:37 -0500
Received: from DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c]) by
 DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c%20]) with mapi id
 15.02.2562.037; Tue, 9 Jun 2026 12:09:37 -0500
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: "Hegde, Yogesh" <y-hegde@ti.com>, "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
Subject: RE: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chromium:
 add force-h264-youtube extension
Thread-Topic: [meta-arago][master/wrynose][PATCH] meta-arago-distro: chromium:
 add force-h264-youtube extension
Thread-Index: AQHc99g4JGIoqAMToEur4e4R38lqc7Y2bzUQ
Date: Tue, 9 Jun 2026 17:09:37 +0000
Message-ID: <3881571c2ada40aa93258bbc39896c43@ti.com>
References: <20260608201827.3937832-1-t-lannynd@ti.com>
 <1139b2d2-097b-4ecc-9eb8-9824d5a5e983@ti.com>
In-Reply-To: <1139b2d2-097b-4ecc-9eb8-9824d5a5e983@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.30.104]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|CO1PR10MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ac9546-00cd-40ae-8187-08dec649e3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|42112799006|18002099003|22082099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	BLVyLB0QPwboBVop35tvYcKeykmIuxOfwh0uCnaM8RlyEieSZvYb0qRC8OO99K8vU7U9xKD36d8zLb0Jfjw9XfnsRsLol16YMpl9LEq4NwkqR7qT2z7y7qRDfafpEJWURh6+w0SAT8sdAuL6IGJBYrn8Mxa4Uy1llhTO5JuKZA0302qXbu3VKRXKEBMOX1OTsBHvtkJ/ceR5Dz30hfsdbaMaloMaZKUTIF8qxA8D7TDtofVjMReWFP/Lh85B/PS2dnLWkPlJBp+8SQJMqQNdrHLwG1A/wXQWS1DDSISZ4C7AvJOXOJxBumhAA8YaVZKSum47xg8G4PYQutuzjst03S3EEc3ov3A+jiHJgtkEDx7jwgcYFCf3ffktRrClZC3AKsng8WofVpktszbQcYUuK5WDIQF/mH2ooKtT6eAiKvl4prJAgDzAm2vmdvo4yQ59vGhI/AGSCTg8P2j5m0oQ6MGbkkxnblj2T61ceJlljzIZxyLzn9aaWWpfNrc92apf97OVXVbwoYHKcqmlqE6eYg0r0JjO7M7eY52PXmh6MD9kh7WYdFICo0VuwzM/zKW+sldgbW+EzK7kfmJeCJ3YpE5nb5ulF86rGHofmt87APyuah81ufTnSuyhp9eSdEMgk82xV+cRqpc/zAL/whqqanmV8CpXgBTC0QJ2zaB5LR6qg0XrVIvMqj9YwgR68lbwNUdnYYttPYQxfPmXB+m/Jxz7VjuGTMCgs5kMXRgnT/Y=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(42112799006)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Y6aZPI6pFukIZqKryvvPy/ubCGcM0EIezRb0kI8Pqcs9so2De6UdiT1z5GkKUcM3jOf/jA4AXYVBQCWIeQRwVAyF/6Qa/ThUzc6FbgF/6kHPmHtBomeSn+3I1qvZ4lgYm3TWrybw2353PozD5rvSll0aTVDaitMWq5+NsQF3DqFGEPqujdSsDKt8I2zFf629eiySB1FUSNdL027/z2Wj7kDUxWG/1VR1uKGF34T9fNvue70xN16DRLo+cg+JWE+jOlokHPypUMGQ7no5vtMGoVAu1q6Jc9NnEk4UXD5KIhbz6j/ik/xJfb9E8400mhi3Ha2lZ0pWxyVqPZFuobX7DT4zWHCTOGA5XhmPJzwRznVO2FwHZt5oPwr6RvcqQdszhbwiUX2K00Mk/4Rn5I9Plq5XZmH3Zq6BX6sWpxbv8SWmYUm7lX/2vLbptRbT+Adp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:09:38.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ac9546-00cd-40ae-8187-08dec649e3ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17556

On 6/9/26 1:22 AM, Yogesh Hedge via lists.yoctoproject.org wrote:
> Hi Thorsten,
> Thanks for the patch.
>=20
> On 6/9/26 01:48, Thorsten Lannynd via lists.yoctoproject.org wrote:
> > Install a lightweight Chrome extension that forces YouTube to serve
> > H.264 (avc1) by blocking VP8, VP9, and AV1 via
> MediaSource.isTypeSupported.
> > This enables Wave5 hardware video decoding on YouTube, which only
> > supports
> > H.264 and HEVC, without requiring a third-party extension to be
> > manually installed through the Chrome Web Store before use.
> >
> > Installed at /usr/lib/chromium/extensions/force-h264-youtube
> > and --load-extension is appended to the chromium-wrapper launch script.
> >
> > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>=20
> Is Wave5 hardware video decoding supported on all SoCs?
> If not, please limit the patches to SoCs/machines that support it.

Thank you for the review. I will make the extension not enabled by default.
The only platform that does not support Wave5 but supports Chromium is
AM62x.

>=20
> > ---
> >  .../chromium/chromium-ozone-wayland-arago.inc | 15 +++++++++++++++
> >  .../force-h264-youtube/force_h264.js          |  4 ++++
> >  .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
> >  3 files changed, 38 insertions(+)
> >  create mode 100644
> > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse
> > r/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> >  create mode 100644
> > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse
> > r/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> >
> > diff --git
> > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland-arago.inc
> > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland-arago.inc
> > index ab092fa1..14c12767 100644
> > ---
> > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland-arago.inc
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > +++ browser/chromium/chromium-ozone-wayland-arago.inc
> > @@ -1,5 +1,7 @@
> >  PR:append =3D ".arago0"
> >
> > +EXTENSION_DIR =3D "/usr/lib/chromium/extensions/force-h264-youtube"
> > +
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland:"
> >
> >  PACKAGECONFIG:append =3D " proprietary-codecs"
> > @@ -9,4 +11,17 @@ SRC_URI:append =3D " \
> >                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-a=
ccess-to-
> V4L.patch \
> >                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-strea=
ming-in-
> V4L2.patch \
> >
> > file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch
> > \
> > +                  file://force-h264-youtube/force_h264.js \
> > +                  file://force-h264-youtube/manifest.json \
> >                    "
> > +
> > +do_install:append() {
> > +    install -d ${D}${EXTENSION_DIR}
> > +    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.j=
s \
> > +                    ${WORKDIR}/sources/force-h264-youtube/manifest.jso=
n \
> > +                    ${D}${EXTENSION_DIR}/
> > +    sed -i 's|--ozone-platform=3Dwayland"|--ozone-platform=3Dwayland -=
-load-
> extension=3D${EXTENSION_DIR}"|' \
> > +            ${D}/usr/lib/chromium/chromium-wrapper
> > +}
> > +
> > +FILES:${PN}:append =3D " ${EXTENSION_DIR}"
> > diff --git
> > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > new file mode 100644
> > index 00000000..5e942321
> > --- /dev/null
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > +++ browser/chromium/chromium-ozone-wayland/force-h264-
> youtube/force_h
> > +++ 264.js
> > @@ -0,0 +1,4 @@
> > +(function() {
> > +    var orig =3D MediaSource.isTypeSupported.bind(MediaSource);
> > +    MediaSource.isTypeSupported =3D function(t) { return
> > +/vp8|vp09?|av01/i.test(t) ? false : orig(t); }; })();
> > diff --git
> > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brow
> > ser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > new file mode 100644
> > index 00000000..fc69be22
> > --- /dev/null
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-
> > +++ browser/chromium/chromium-ozone-wayland/force-h264-
> youtube/manifes
> > +++ t.json
> > @@ -0,0 +1,19 @@
> > +{
> > +  "manifest_version": 3,
> > +  "name": "Force H.264",
> > +  "version": "1.0.0",
> > +  "description": "Lightweight extension that forces YouTube to play
> > +H.264 (avc1) by blocking VP8, VP9, and AV1",
> > +  "content_scripts": [
> > +    {
> > +      "matches": [
> > +        "*://*.youtube.com/*",
> > +        "*://*.youtube-nocookie.com/*",
> > +        "*://*.youtu.be/*"
> > +      ],
> > +      "js": ["force_h264.js"],
> > +      "run_at": "document_start",
> > +      "world": "MAIN",
> > +      "all_frames": true
> > +    }
> > +  ]
> > +}
>=20
> ---
> -- Yogesh Hegde


