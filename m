Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F46EC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:54:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.23622.1737485684617269497
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 10:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JPkt3Odo;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LIse3S054351
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 12:54:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737485680;
	bh=vnV/U6hKAGKWVJfFnRfviazYIBJipmXoISftWrpaoik=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JPkt3Odoe/X9cPAwTbNfTdaVZPEifksV8BaGEAF/vAMXZoF4gcnEezWZ9MlHK1bUy
	 5hFRZ6nR5LEXDZoMA2PuPyixPytLCac10bUJdX/8PUXIgpU6nPdBReSrOWgvqGKwFr
	 TR+lF08spxilJAP/ktRIISCTFQ/E0ZKyUk4OYItk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LIsecL006574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 12:54:40 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 12:54:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 12:54:40 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LIseSU033386;
	Tue, 21 Jan 2025 12:54:40 -0600
Message-ID: <c674881a-737a-489d-95c8-175021597b77@ti.com>
Date: Tue, 21 Jan 2025 12:54:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
To: <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
CC: <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250116192950.3391293-2-rs@ti.com>
 <20250120211347.GK21836@denix.org>
 <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50LIse3S054351
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:54:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15727

On 1/21/25 9:16 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 1/20/2025 3:13 PM, Denys Dmytriyenko wrote:
>> On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via lists.yoct=
oproject.org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Remove any explicit dependencies on meta-arago-demos. These were the
>>> last of the "demos" in this layer and they were only being built for
>>> legacy devices. Demos should primarily be in layers above this unless
>>> they are used for functionality testing.
>>
>> Why not move those pieces to meta-arago-demos then?
>>
>> E.g. move the packagegroups there and add bbappends for the default im=
age and
>> world recipes, etc.
>=20
> Basically make meta-arago-demos an island unto itself.=C2=A0 If you inc=
lude it, then you get it, if you don't then no harm.=C2=A0 Make sense.
>=20

Will we test with and without this layer? If not then we will end up brea=
king
things and missing dependencies between layers.

Seems like a lot of maintenence for a layer with just a couple demos. Dem=
os
that should probably all go up into focus SDK layers anyway.

Andrew

>=20
>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>
>>> Trying to do this gracefully. Break the dependency first, then update=
 the
>>> oe-layersetup configs, then drop the layer entirely.
>>>
>>> =C2=A0 .../images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +-------
>>> =C2=A0 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 ---------
>>> =C2=A0 .../packagegroup-arago-tisdk-addons.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
>>> =C2=A0 .../packagegroup-arago-tisdk-hmi.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 -------------------
>>> =C2=A0 .../recipes-core/packagegroups/ti-demos.bb=C2=A0=C2=A0=C2=A0 |=
 18 ----------
>>> =C2=A0 .../recipes-core/packagegroups/ti-world.bb=C2=A0=C2=A0=C2=A0 |=
 10 +-----
>>> =C2=A0 6 files changed, 2 insertions(+), 95 deletions(-)
>>> =C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-hmi.bb
>>> =C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegroup=
s/ti-demos.bb
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-imag=
e.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> index 6c46c423..10493415 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> @@ -23,24 +23,13 @@ IMAGE_INSTALL +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra =
\
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','=
packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra=
',d)} \
>>> -=C2=A0=C2=A0=C2=A0 ti-demos \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','=
','packagegroup-arago-base-tisdk-server-extra',d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-sysrepo \
>>> =C2=A0 "
>>> =C2=A0 export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE_SU=
FFIX}"
>>> -EXTRABROWSERS =3D " \
>>> -=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
>>> -"
>>> -
>>> -PYTHON2APPS =3D " \
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',"=
${EXTRABROWSERS}",'',d)} \
>>> -"
>>> -
>>> =C2=A0 DEVTOOLS =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>>> @@ -50,7 +39,6 @@ DEVTOOLS =3D " \
>>> =C2=A0 "
>>> =C2=A0 IMAGE_INSTALL +=3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-=
python2", "${PYTHON2APPS}", "", d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', =
'armv7a', 'valgrind', '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>> index 3e0a2720..8690a874 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons-sdk-target.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons-sdk-target.bb
>>> @@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdbserver-c6x-dev \
>>> =C2=A0 "
>>> -PDM_ANOMALY_PKG_DEV =3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'pdm-anomaly-detection-dev', '', d)} \
>>> -"
>>> -
>>> -
>>> =C2=A0 EXTRA_PACKAGES =3D ""
>>> -#EXTRA_PACKAGES:append:ti33x =3D " \
>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>> -#"
>>> -#EXTRA_PACKAGES:append:ti43x =3D " \
>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>> -#"
>>> -#EXTRA_PACKAGES:append:omap-a15 =3D " \
>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>> -#"
>>> -#EXTRA_PACKAGES:append:am65xx =3D " \
>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>> -#"
>>> =C2=A0 IPCDEV =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-ipc-dev \
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-tisdk-addons.bb
>>> index 6b6533f5..b0d76b28 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons.bb
>>> @@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf \
>>> =C2=A0 "
>>> -# acontis-atemsys
>>> =C2=A0 #EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
>>> =C2=A0 #EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
>>> -# acontis-atemsys
>>> =C2=A0 #EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
>>> =C2=A0 RDEPENDS:${PN} =3D "\
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-hmi.bb
>>> deleted file mode 100644
>>> index a8261bf2..00000000
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-hmi.bb
>>> +++ /dev/null
>>> @@ -1,36 +0,0 @@
>>> -SUMMARY =3D "Task to add HMI related packages"
>>> -LICENSE =3D "MIT"
>>> -PR =3D "r0"
>>> -
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> -inherit packagegroup
>>> -
>>> -HMI =3D " \
>>> -"
>>> -
>>> -
>>> -HMI:append:ti33x =3D " \
>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>> -=C2=A0=C2=A0=C2=A0 protection-relays-hmi \
>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>> -"
>>> -
>>> -HMI:append:ti43x =3D " \
>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>> -"
>>> -
>>> -HMI:append:omap-a15 =3D " \
>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>> -"
>>> -
>>> -HMI:append:am65xx =3D " \
>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>> -"
>>> -
>>> -RDEPENDS:${PN} =3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${HMI} \
>>> -"
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb=
 b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>>> deleted file mode 100644
>>> index 7bccb4de..00000000
>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>>> +++ /dev/null
>>> @@ -1,18 +0,0 @@
>>> -SUMMARY =3D "TI World packagegroup"
>>> -LICENSE =3D "MIT"
>>> -
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> -inherit packagegroup
>>> -
>>> -PDM_ANOMALY_PKG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl=
', 'pdm-anomaly-detection', '', d)}"
>>> -
>>> -PDM_ANOMALY =3D ""
>>> -PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
>>> -PDM_ANOMALY:ti43x =3D "${PDM_ANOMALY_PKG}"
>>> -PDM_ANOMALY:omap-a15 =3D "${PDM_ANOMALY_PKG}"
>>> -PDM_ANOMALY:am65xx =3D "${PDM_ANOMALY_PKG}"
>>> -
>>> -RDEPENDS:${PN} =3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY} \
>>> -"
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb=
 b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>> index 438dd8d0..fc3eac74 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>> @@ -15,14 +15,7 @@ CHROMIUM:append:k3 =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chromium-ozone-wayland \
>>> =C2=A0 "
>>> -EXTRABROWSERS =3D " \
>>> -=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
>>> -"
>>> -
>>> =C2=A0 PYTHON2APPS =3D " \
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl',"=
${EXTRABROWSERS}",'',d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIO=
NS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHRO=
MIUM}",'',d),'',d)} \
>>> =C2=A0 "
>>> @@ -45,11 +38,10 @@ RDEPENDS:${PN} =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-extra =
\
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','=
packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra=
',d)} \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl','=
','packagegroup-arago-base-tisdk-server-extra',d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIO=
NS", "meta-python2", "${PYTHON2APPS}", "", d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES', =
'armv7a', 'valgrind', '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-misc \
>>> -=C2=A0=C2=A0=C2=A0 ti-demos \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PREFERRED_PROVIDER_virtual/docker} \
>>> =C2=A0 "
>>> --=20
>>> 2.47.1
>=20

