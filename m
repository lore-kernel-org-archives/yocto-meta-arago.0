Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA2C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 19:17:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24451.1737487039841091737
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 11:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4929A40C21;
	Tue, 21 Jan 2025 19:17:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOPnTCkFQHNG; Tue, 21 Jan 2025 19:17:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B7D940B13;
	Tue, 21 Jan 2025 19:17:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C0F5816415B; Tue, 21 Jan 2025 14:17:14 -0500 (EST)
Date: Tue, 21 Jan 2025 14:17:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, rs@ti.com, c-shilwant@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
Message-ID: <20250121191714.GO21836@denix.org>
References: <20250116192950.3391293-2-rs@ti.com>
 <20250120211347.GK21836@denix.org>
 <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
 <c674881a-737a-489d-95c8-175021597b77@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c674881a-737a-489d-95c8-175021597b77@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 19:17:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15729

On Tue, Jan 21, 2025 at 12:54:39PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 1/21/25 9:16 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 1/20/2025 3:13 PM, Denys Dmytriyenko wrote:
> >>On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via lists.yoc=
toproject.org wrote:
> >>>From: Randolph Sapp <rs@ti.com>
> >>>
> >>>Remove any explicit dependencies on meta-arago-demos. These were the
> >>>last of the "demos" in this layer and they were only being built for
> >>>legacy devices. Demos should primarily be in layers above this unles=
s
> >>>they are used for functionality testing.
> >>
> >>Why not move those pieces to meta-arago-demos then?
> >>
> >>E.g. move the packagegroups there and add bbappends for the default i=
mage and
> >>world recipes, etc.
> >
> >Basically make meta-arago-demos an island unto itself.=A0 If you inclu=
de it,=20
> >then you get it, if you don't then no harm.=A0 Make sense.
> >
>=20
> Will we test with and without this layer? If not then we will end up br=
eaking
> things and missing dependencies between layers.
>=20
> Seems like a lot of maintenence for a layer with just a couple demos. D=
emos
> that should probably all go up into focus SDK layers anyway.

Should meta-arago-demos be deprecated and removed in its entirety then? O=
r=20
does it only apply to a few select that are still in meta-arago-distro?


> >>>Signed-off-by: Randolph Sapp <rs@ti.com>
> >>>---
> >>>
> >>>Trying to do this gracefully. Break the dependency first, then updat=
e the
> >>>oe-layersetup configs, then drop the layer entirely.
> >>>
> >>>=A0 .../images/tisdk-default-image.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 14 +-------
> >>>=A0 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 ---------
> >>>=A0 .../packagegroup-arago-tisdk-addons.bb=A0=A0=A0=A0=A0=A0=A0 |=A0=
 2 --
> >>>=A0 .../packagegroup-arago-tisdk-hmi.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 | 36 -------------------
> >>>=A0 .../recipes-core/packagegroups/ti-demos.bb=A0=A0=A0 | 18 -------=
---
> >>>=A0 .../recipes-core/packagegroups/ti-world.bb=A0=A0=A0 | 10 +-----
> >>>=A0 6 files changed, 2 insertions(+), 95 deletions(-)
> >>>=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-hmi.bb
> >>>=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/=
ti-demos.bb
> >>>
> >>>diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>>index 6c46c423..10493415 100644
> >>>--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>>+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>>@@ -23,24 +23,13 @@ IMAGE_INSTALL +=3D "\
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-multimedia \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-addons \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-addons-extra \
> >>>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','packageg=
roup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> >>>-=A0=A0=A0 ti-demos \
> >>>+=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packa=
gegroup-arago-base-tisdk-server-extra',d)} \
> >>>=A0=A0=A0=A0=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-sysrepo \
> >>>=A0 "
> >>>=A0 export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE_SUFF=
IX}"
> >>>-EXTRABROWSERS =3D " \
> >>>-=A0=A0=A0 qtwebbrowser-examples \
> >>>-=A0=A0=A0 qtwebengine-qmlplugins \
> >>>-=A0=A0=A0 qtwebengine-examples \
> >>>-"
> >>>-
> >>>-PYTHON2APPS =3D " \
> >>>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRAB=
ROWSERS}",'',d)} \
> >>>-"
> >>>-
> >>>=A0 DEVTOOLS =3D " \
> >>>=A0=A0=A0=A0=A0 linux-libc-headers-dev \
> >>>=A0=A0=A0=A0=A0 build-essential \
> >>>@@ -50,7 +39,6 @@ DEVTOOLS =3D " \
> >>>=A0 "
> >>>=A0 IMAGE_INSTALL +=3D "\
> >>>-=A0=A0=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2"=
, "${PYTHON2APPS}", "", d)} \
> >>>=A0=A0=A0=A0=A0 ${DEVTOOLS} \
> >>>=A0=A0=A0=A0=A0 ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'val=
grind', '', d)} \
> >>>=A0=A0=A0=A0=A0 docker \
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/pack=
agegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>>index 3e0a2720..8690a874 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb
> >>>@@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
> >>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 gdbserver-c6x-dev \
> >>>=A0 "
> >>>-PDM_ANOMALY_PKG_DEV =3D "\
> >>>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-an=
omaly-detection-dev', '', d)} \
> >>>-"
> >>>-
> >>>-
> >>>=A0 EXTRA_PACKAGES =3D ""
> >>>-#EXTRA_PACKAGES:append:ti33x =3D " \
> >>>-#=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${PDM_ANOMALY_PKG_DEV} \
> >>>-#"
> >>>-#EXTRA_PACKAGES:append:ti43x =3D " \
> >>>-#=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${PDM_ANOMALY_PKG_DEV} \
> >>>-#"
> >>>-#EXTRA_PACKAGES:append:omap-a15 =3D " \
> >>>-#=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${PDM_ANOMALY_PKG_DEV} \
> >>>-#"
> >>>-#EXTRA_PACKAGES:append:am65xx =3D " \
> >>>-#=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ${PDM_ANOMALY_PKG_DEV} \
> >>>-#"
> >>>=A0 IPCDEV =3D " \
> >>>=A0=A0=A0=A0=A0 ti-ipc-dev \
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/p=
ackagegroup-arago-tisdk-addons.bb
> >>>index 6b6533f5..b0d76b28 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb
> >>>@@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 =3D " \
> >>>=A0=A0=A0=A0=A0 protobuf \
> >>>=A0 "
> >>>-# acontis-atemsys
> >>>=A0 #EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
> >>>=A0 #EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
> >>>-# acontis-atemsys
> >>>=A0 #EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
> >>>=A0 RDEPENDS:${PN} =3D "\
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-hmi.bb
> >>>deleted file mode 100644
> >>>index a8261bf2..00000000
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-hmi.bb
> >>>+++ /dev/null
> >>>@@ -1,36 +0,0 @@
> >>>-SUMMARY =3D "Task to add HMI related packages"
> >>>-LICENSE =3D "MIT"
> >>>-PR =3D "r0"
> >>>-
> >>>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>-
> >>>-inherit packagegroup
> >>>-
> >>>-HMI =3D " \
> >>>-"
> >>>-
> >>>-
> >>>-HMI:append:ti33x =3D " \
> >>>-=A0=A0=A0 evse-hmi \
> >>>-=A0=A0=A0 protection-relays-hmi \
> >>>-=A0=A0=A0 mmwavegesture-hmi \
> >>>-"
> >>>-
> >>>-HMI:append:ti43x =3D " \
> >>>-=A0=A0=A0 evse-hmi \
> >>>-=A0=A0=A0 mmwavegesture-hmi \
> >>>-"
> >>>-
> >>>-HMI:append:omap-a15 =3D " \
> >>>-=A0=A0=A0 evse-hmi \
> >>>-=A0=A0=A0 mmwavegesture-hmi \
> >>>-"
> >>>-
> >>>-HMI:append:am65xx =3D " \
> >>>-=A0=A0=A0 evse-hmi \
> >>>-=A0=A0=A0 mmwavegesture-hmi \
> >>>-"
> >>>-
> >>>-RDEPENDS:${PN} =3D "\
> >>>-=A0=A0=A0 ${HMI} \
> >>>-"
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.b=
b b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> >>>deleted file mode 100644
> >>>index 7bccb4de..00000000
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> >>>+++ /dev/null
> >>>@@ -1,18 +0,0 @@
> >>>-SUMMARY =3D "TI World packagegroup"
> >>>-LICENSE =3D "MIT"
> >>>-
> >>>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>-
> >>>-inherit packagegroup
> >>>-
> >>>-PDM_ANOMALY_PKG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'openg=
l', 'pdm-anomaly-detection', '', d)}"
> >>>-
> >>>-PDM_ANOMALY =3D ""
> >>>-PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
> >>>-PDM_ANOMALY:ti43x =3D "${PDM_ANOMALY_PKG}"
> >>>-PDM_ANOMALY:omap-a15 =3D "${PDM_ANOMALY_PKG}"
> >>>-PDM_ANOMALY:am65xx =3D "${PDM_ANOMALY_PKG}"
> >>>-
> >>>-RDEPENDS:${PN} =3D "\
> >>>-=A0=A0=A0 ${PDM_ANOMALY} \
> >>>-"
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.b=
b b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >>>index 438dd8d0..fc3eac74 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >>>@@ -15,14 +15,7 @@ CHROMIUM:append:k3 =3D "\
> >>>=A0=A0=A0=A0=A0 chromium-ozone-wayland \
> >>>=A0 "
> >>>-EXTRABROWSERS =3D " \
> >>>-=A0=A0=A0 qtwebbrowser-examples \
> >>>-=A0=A0=A0 qtwebengine-qmlplugins \
> >>>-=A0=A0=A0 qtwebengine-examples \
> >>>-"
> >>>-
> >>>=A0 PYTHON2APPS =3D " \
> >>>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRAB=
ROWSERS}",'',d)} \
> >>>=A0=A0=A0=A0=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-l=
ayer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'=
',d)} \
> >>>=A0 "
> >>>@@ -45,11 +38,10 @@ RDEPENDS:${PN} =3D "\
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-multimedia \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-addons \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-tisdk-addons-extra \
> >>>-=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','packageg=
roup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> >>>+=A0=A0=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packa=
gegroup-arago-base-tisdk-server-extra',d)} \
> >>>=A0=A0=A0=A0=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-pyt=
hon2", "${PYTHON2APPS}", "", d)} \
> >>>=A0=A0=A0=A0=A0 ${DEVTOOLS} \
> >>>=A0=A0=A0=A0=A0 ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'val=
grind', '', d)} \
> >>>=A0=A0=A0=A0=A0 packagegroup-arago-misc \
> >>>-=A0=A0=A0 ti-demos \
> >>>=A0=A0=A0=A0=A0 ${PREFERRED_PROVIDER_virtual/docker} \
> >>>=A0 "
> >>>--=20
> >>>2.47.1

