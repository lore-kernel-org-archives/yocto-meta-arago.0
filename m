Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98250C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 20:33:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.26156.1737491595944368583
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 12:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XMX1QNgf;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKXCJX867436
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 14:33:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737491593;
	bh=hHnJxjGYkpY4oWYDJ89LUBZb33pD6euD9UDctfcHxAo=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=XMX1QNgfPUhVVmhWHP2k0qC8lARVq7+q14owwGPg+EDWuBurKlCK9TJTy72ZMwWIG
	 VK3z0FHFUvYSQpNOp03MZLaAueQMYP39hqZb1AkxPYfZskUiHS3XuDEtfBy+C/LyVA
	 b875JSL8HkI/X8G8pffLEY9H+MNAeFACB0CfKsxk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKXCWd001712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 14:33:12 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 14:33:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 14:33:12 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LKXCOp129572;
	Tue, 21 Jan 2025 14:33:12 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Jan 2025 14:33:12 -0600
Message-ID: <D781D6FY7AIX.2F49V6R0Y4UH8@ti.com>
CC: <reatmon@ti.com>, <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250116192950.3391293-2-rs@ti.com>
 <20250120211347.GK21836@denix.org>
 <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
 <c674881a-737a-489d-95c8-175021597b77@ti.com>
 <20250121191714.GO21836@denix.org>
In-Reply-To: <20250121191714.GO21836@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 20:33:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15732

On Tue Jan 21, 2025 at 1:17 PM CST, Denys Dmytriyenko wrote:
> On Tue, Jan 21, 2025 at 12:54:39PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> > On 1/21/25 9:16 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> > >
> > >
> > >On 1/20/2025 3:13 PM, Denys Dmytriyenko wrote:
> > >>On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via lists.yoc=
toproject.org wrote:
> > >>>From: Randolph Sapp <rs@ti.com>
> > >>>
> > >>>Remove any explicit dependencies on meta-arago-demos. These were the
> > >>>last of the "demos" in this layer and they were only being built for
> > >>>legacy devices. Demos should primarily be in layers above this unles=
s
> > >>>they are used for functionality testing.
> > >>
> > >>Why not move those pieces to meta-arago-demos then?
> > >>
> > >>E.g. move the packagegroups there and add bbappends for the default i=
mage and
> > >>world recipes, etc.
> > >
> > >Basically make meta-arago-demos an island unto itself.=C2=A0 If you in=
clude it,=20
> > >then you get it, if you don't then no harm.=C2=A0 Make sense.
> > >
> >=20
> > Will we test with and without this layer? If not then we will end up br=
eaking
> > things and missing dependencies between layers.
> >=20
> > Seems like a lot of maintenence for a layer with just a couple demos. D=
emos
> > that should probably all go up into focus SDK layers anyway.
>
> Should meta-arago-demos be deprecated and removed in its entirety then? O=
r=20
> does it only apply to a few select that are still in meta-arago-distro?

Yeah, current plan is to drop this layer entirely, just wanted to do it in =
a
sane order. I put a note of that in the tear-off section. Still waiting on =
these
patches to be merged before continuing though. Still got a few more patches=
 for
reworking Qt dependencies and enabling Qt6.

> > >>>Signed-off-by: Randolph Sapp <rs@ti.com>
> > >>>---
> > >>>
> > >>>Trying to do this gracefully. Break the dependency first, then updat=
e the
> > >>>oe-layersetup configs, then drop the layer entirely.
> > >>>
> > >>>=C2=A0 .../images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +-------
> > >>>=C2=A0 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 ---------
> > >>>=C2=A0 .../packagegroup-arago-tisdk-addons.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> > >>>=C2=A0 .../packagegroup-arago-tisdk-hmi.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 -------------------
> > >>>=C2=A0 .../recipes-core/packagegroups/ti-demos.bb=C2=A0=C2=A0=C2=A0 =
| 18 ----------
> > >>>=C2=A0 .../recipes-core/packagegroups/ti-world.bb=C2=A0=C2=A0=C2=A0 =
| 10 +-----
> > >>>=C2=A0 6 files changed, 2 insertions(+), 95 deletions(-)
> > >>>=C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-hmi.bb
> > >>>=C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegrou=
ps/ti-demos.bb
> > >>>
> > >>>diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> > >>>index 6c46c423..10493415 100644
> > >>>--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> > >>>+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> > >>>@@ -23,24 +23,13 @@ IMAGE_INSTALL +=3D "\
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra=
 \
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra'=
,d)} \
> > >>>-=C2=A0=C2=A0=C2=A0 ti-demos \
> > >>>+=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'','packagegroup-arago-base-tisdk-server-extra',d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} =
\
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-sysrepo \
> > >>>=C2=A0 "
> > >>>=C2=A0 export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE_S=
UFFIX}"
> > >>>-EXTRABROWSERS =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
> > >>>-"
> > >>>-
> > >>>-PYTHON2APPS =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
"${EXTRABROWSERS}",'',d)} \
> > >>>-"
> > >>>-
> > >>>=C2=A0 DEVTOOLS =3D " \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
> > >>>@@ -50,7 +39,6 @@ DEVTOOLS =3D " \
> > >>>=C2=A0 "
> > >>>=C2=A0 IMAGE_INSTALL +=3D "\
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta=
-python2", "${PYTHON2APPS}", "", d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES',=
 'armv7a', 'valgrind', '', d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
> > >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packag=
egroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> > >>>index 3e0a2720..8690a874 100644
> > >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb
> > >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb
> > >>>@@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdbserver-c6x-dev \
> > >>>=C2=A0 "
> > >>>-PDM_ANOMALY_PKG_DEV =3D "\
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl'=
, 'pdm-anomaly-detection-dev', '', d)} \
> > >>>-"
> > >>>-
> > >>>-
> > >>>=C2=A0 EXTRA_PACKAGES =3D ""
> > >>>-#EXTRA_PACKAGES:append:ti33x =3D " \
> > >>>-#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
> > >>>-#"
> > >>>-#EXTRA_PACKAGES:append:ti43x =3D " \
> > >>>-#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
> > >>>-#"
> > >>>-#EXTRA_PACKAGES:append:omap-a15 =3D " \
> > >>>-#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
> > >>>-#"
> > >>>-#EXTRA_PACKAGES:append:am65xx =3D " \
> > >>>-#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
> > >>>-#"
> > >>>=C2=A0 IPCDEV =3D " \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-ipc-dev \
> > >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-addons.bb
> > >>>index 6b6533f5..b0d76b28 100644
> > >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb
> > >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb
> > >>>@@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 =3D " \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf \
> > >>>=C2=A0 "
> > >>>-# acontis-atemsys
> > >>>=C2=A0 #EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
> > >>>=C2=A0 #EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
> > >>>-# acontis-atemsys
> > >>>=C2=A0 #EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
> > >>>=C2=A0 RDEPENDS:${PN} =3D "\
> > >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-hmi.bb
> > >>>deleted file mode 100644
> > >>>index a8261bf2..00000000
> > >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-hmi.bb
> > >>>+++ /dev/null
> > >>>@@ -1,36 +0,0 @@
> > >>>-SUMMARY =3D "Task to add HMI related packages"
> > >>>-LICENSE =3D "MIT"
> > >>>-PR =3D "r0"
> > >>>-
> > >>>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >>>-
> > >>>-inherit packagegroup
> > >>>-
> > >>>-HMI =3D " \
> > >>>-"
> > >>>-
> > >>>-
> > >>>-HMI:append:ti33x =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 evse-hmi \
> > >>>-=C2=A0=C2=A0=C2=A0 protection-relays-hmi \
> > >>>-=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
> > >>>-"
> > >>>-
> > >>>-HMI:append:ti43x =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 evse-hmi \
> > >>>-=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
> > >>>-"
> > >>>-
> > >>>-HMI:append:omap-a15 =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 evse-hmi \
> > >>>-=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
> > >>>-"
> > >>>-
> > >>>-HMI:append:am65xx =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 evse-hmi \
> > >>>-=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
> > >>>-"
> > >>>-
> > >>>-RDEPENDS:${PN} =3D "\
> > >>>-=C2=A0=C2=A0=C2=A0 ${HMI} \
> > >>>-"
> > >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.b=
b b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> > >>>deleted file mode 100644
> > >>>index 7bccb4de..00000000
> > >>>--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> > >>>+++ /dev/null
> > >>>@@ -1,18 +0,0 @@
> > >>>-SUMMARY =3D "TI World packagegroup"
> > >>>-LICENSE =3D "MIT"
> > >>>-
> > >>>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >>>-
> > >>>-inherit packagegroup
> > >>>-
> > >>>-PDM_ANOMALY_PKG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'openg=
l', 'pdm-anomaly-detection', '', d)}"
> > >>>-
> > >>>-PDM_ANOMALY =3D ""
> > >>>-PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
> > >>>-PDM_ANOMALY:ti43x =3D "${PDM_ANOMALY_PKG}"
> > >>>-PDM_ANOMALY:omap-a15 =3D "${PDM_ANOMALY_PKG}"
> > >>>-PDM_ANOMALY:am65xx =3D "${PDM_ANOMALY_PKG}"
> > >>>-
> > >>>-RDEPENDS:${PN} =3D "\
> > >>>-=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY} \
> > >>>-"
> > >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.b=
b b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> > >>>index 438dd8d0..fc3eac74 100644
> > >>>--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> > >>>+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> > >>>@@ -15,14 +15,7 @@ CHROMIUM:append:k3 =3D "\
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chromium-ozone-wayland \
> > >>>=C2=A0 "
> > >>>-EXTRABROWSERS =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
> > >>>-=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
> > >>>-"
> > >>>-
> > >>>=C2=A0 PYTHON2APPS =3D " \
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
"${EXTRABROWSERS}",'',d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTI=
ONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROM=
IUM}",'',d),'',d)} \
> > >>>=C2=A0 "
> > >>>@@ -45,11 +38,10 @@ RDEPENDS:${PN} =3D "\
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra=
 \
> > >>>-=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra'=
,d)} \
> > >>>+=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',=
'','packagegroup-arago-base-tisdk-server-extra',d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTI=
ONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES',=
 'armv7a', 'valgrind', '', d)} \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-misc \
> > >>>-=C2=A0=C2=A0=C2=A0 ti-demos \
> > >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PREFERRED_PROVIDER_virtual/docker} =
\
> > >>>=C2=A0 "
> > >>>--=20
> > >>>2.47.1


