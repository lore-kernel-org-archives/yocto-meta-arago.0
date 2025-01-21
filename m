Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A69C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 19:29:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.24717.1737487745080789399
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 11:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=CTUCVxzd;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LJT2ax059354
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 21 Jan 2025 13:29:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737487742;
	bh=H5zWJ22pWFGEh/erAIQSWK6hC56lcItPdiCk3j6cNrM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CTUCVxzdL69k77+z+VmWsKMNOncmPpb5YYYGxZUWDgwoZzWjrwQh6kqrQDY3qCGJz
	 zh4vpX4q5FkUlGYfK65ReARJ6ei7qyxeltOplyU3M8dLQbVFRk8iICGQXyHLZpvM2k
	 82f7SfpuTtLrWc0Tpa9lWIg7q5bVSaOMNZ7GXLS8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LJT29u106256;
	Tue, 21 Jan 2025 13:29:02 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 13:29:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 13:29:02 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LJT15I058646;
	Tue, 21 Jan 2025 13:29:02 -0600
Message-ID: <79c2249d-53ce-4a69-9a21-7187d43a9b14@ti.com>
Date: Tue, 21 Jan 2025 13:29:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250116192950.3391293-2-rs@ti.com>
 <20250120211347.GK21836@denix.org>
 <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
 <c674881a-737a-489d-95c8-175021597b77@ti.com>
 <20250121191714.GO21836@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250121191714.GO21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50LJT2ax059354
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 19:29:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15731

On 1/21/25 1:17 PM, Denys Dmytriyenko wrote:
> On Tue, Jan 21, 2025 at 12:54:39PM -0600, Andrew Davis via lists.yoctop=
roject.org wrote:
>> On 1/21/25 9:16 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 1/20/2025 3:13 PM, Denys Dmytriyenko wrote:
>>>> On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via lists.yo=
ctoproject.org wrote:
>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>
>>>>> Remove any explicit dependencies on meta-arago-demos. These were th=
e
>>>>> last of the "demos" in this layer and they were only being built fo=
r
>>>>> legacy devices. Demos should primarily be in layers above this unle=
ss
>>>>> they are used for functionality testing.
>>>>
>>>> Why not move those pieces to meta-arago-demos then?
>>>>
>>>> E.g. move the packagegroups there and add bbappends for the default =
image and
>>>> world recipes, etc.
>>>
>>> Basically make meta-arago-demos an island unto itself.=C2=A0 If you i=
nclude it,
>>> then you get it, if you don't then no harm.=C2=A0 Make sense.
>>>
>>
>> Will we test with and without this layer? If not then we will end up b=
reaking
>> things and missing dependencies between layers.
>>
>> Seems like a lot of maintenence for a layer with just a couple demos. =
Demos
>> that should probably all go up into focus SDK layers anyway.
>=20
> Should meta-arago-demos be deprecated and removed in its entirety then?=
 Or

Yes, and I thought that was already the plan after this patch [0]

Andrew

[0] https://lists.yoctoproject.org/g/meta-arago/message/15695

> does it only apply to a few select that are still in meta-arago-distro?
>=20
>=20
>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>> ---
>>>>>
>>>>> Trying to do this gracefully. Break the dependency first, then upda=
te the
>>>>> oe-layersetup configs, then drop the layer entirely.
>>>>>
>>>>>  =C2=A0 .../images/tisdk-default-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +-------
>>>>>  =C2=A0 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 --------=
-
>>>>>  =C2=A0 .../packagegroup-arago-tisdk-addons.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
>>>>>  =C2=A0 .../packagegroup-arago-tisdk-hmi.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 -------------------
>>>>>  =C2=A0 .../recipes-core/packagegroups/ti-demos.bb=C2=A0=C2=A0=C2=A0=
 | 18 ----------
>>>>>  =C2=A0 .../recipes-core/packagegroups/ti-world.bb=C2=A0=C2=A0=C2=A0=
 | 10 +-----
>>>>>  =C2=A0 6 files changed, 2 insertions(+), 95 deletions(-)
>>>>>  =C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-hmi.bb
>>>>>  =C2=A0 delete mode 100644 meta-arago-distro/recipes-core/packagegr=
oups/ti-demos.bb
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-im=
age.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>>> index 6c46c423..10493415 100644
>>>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>>>> @@ -23,24 +23,13 @@ IMAGE_INSTALL +=3D "\
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia=
 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-ext=
ra \
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,'packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-ext=
ra',d)} \
>>>>> -=C2=A0=C2=A0=C2=A0 ti-demos \
>>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,'','packagegroup-arago-base-tisdk-server-extra',d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL=
} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-sysrepo \
>>>>>  =C2=A0 "
>>>>>  =C2=A0 export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE=
_SUFFIX}"
>>>>> -EXTRABROWSERS =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
>>>>> -"
>>>>> -
>>>>> -PYTHON2APPS =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,"${EXTRABROWSERS}",'',d)} \
>>>>> -"
>>>>> -
>>>>>  =C2=A0 DEVTOOLS =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-libc-headers-dev \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential \
>>>>> @@ -50,7 +39,6 @@ DEVTOOLS =3D " \
>>>>>  =C2=A0 "
>>>>>  =C2=A0 IMAGE_INSTALL +=3D "\
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLECTIONS", "met=
a-python2", "${PYTHON2APPS}", "", d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES=
', 'armv7a', 'valgrind', '', d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docker \
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/pac=
kagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>>>>> index 3e0a2720..8690a874 100644
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-addons-sdk-target.bb
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-addons-sdk-target.bb
>>>>> @@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdbserver-c6x-dev \
>>>>>  =C2=A0 "
>>>>> -PDM_ANOMALY_PKG_DEV =3D "\
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl=
', 'pdm-anomaly-detection-dev', '', d)} \
>>>>> -"
>>>>> -
>>>>> -
>>>>>  =C2=A0 EXTRA_PACKAGES =3D ""
>>>>> -#EXTRA_PACKAGES:append:ti33x =3D " \
>>>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>>>> -#"
>>>>> -#EXTRA_PACKAGES:append:ti43x =3D " \
>>>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>>>> -#"
>>>>> -#EXTRA_PACKAGES:append:omap-a15 =3D " \
>>>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>>>> -#"
>>>>> -#EXTRA_PACKAGES:append:am65xx =3D " \
>>>>> -#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY_PKG_DEV} \
>>>>> -#"
>>>>>  =C2=A0 IPCDEV =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti-ipc-dev \
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-addons.bb
>>>>> index 6b6533f5..b0d76b28 100644
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-addons.bb
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-addons.bb
>>>>> @@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 =3D " \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf \
>>>>>  =C2=A0 "
>>>>> -# acontis-atemsys
>>>>>  =C2=A0 #EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
>>>>>  =C2=A0 #EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
>>>>> -# acontis-atemsys
>>>>>  =C2=A0 #EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
>>>>>  =C2=A0 RDEPENDS:${PN} =3D "\
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-hmi.bb
>>>>> deleted file mode 100644
>>>>> index a8261bf2..00000000
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-hmi.bb
>>>>> +++ /dev/null
>>>>> @@ -1,36 +0,0 @@
>>>>> -SUMMARY =3D "Task to add HMI related packages"
>>>>> -LICENSE =3D "MIT"
>>>>> -PR =3D "r0"
>>>>> -
>>>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> -
>>>>> -inherit packagegroup
>>>>> -
>>>>> -HMI =3D " \
>>>>> -"
>>>>> -
>>>>> -
>>>>> -HMI:append:ti33x =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>>>> -=C2=A0=C2=A0=C2=A0 protection-relays-hmi \
>>>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>>>> -"
>>>>> -
>>>>> -HMI:append:ti43x =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>>>> -"
>>>>> -
>>>>> -HMI:append:omap-a15 =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>>>> -"
>>>>> -
>>>>> -HMI:append:am65xx =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 evse-hmi \
>>>>> -=C2=A0=C2=A0=C2=A0 mmwavegesture-hmi \
>>>>> -"
>>>>> -
>>>>> -RDEPENDS:${PN} =3D "\
>>>>> -=C2=A0=C2=A0=C2=A0 ${HMI} \
>>>>> -"
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.=
bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>>>>> deleted file mode 100644
>>>>> index 7bccb4de..00000000
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>>>>> +++ /dev/null
>>>>> @@ -1,18 +0,0 @@
>>>>> -SUMMARY =3D "TI World packagegroup"
>>>>> -LICENSE =3D "MIT"
>>>>> -
>>>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> -
>>>>> -inherit packagegroup
>>>>> -
>>>>> -PDM_ANOMALY_PKG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'open=
gl', 'pdm-anomaly-detection', '', d)}"
>>>>> -
>>>>> -PDM_ANOMALY =3D ""
>>>>> -PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
>>>>> -PDM_ANOMALY:ti43x =3D "${PDM_ANOMALY_PKG}"
>>>>> -PDM_ANOMALY:omap-a15 =3D "${PDM_ANOMALY_PKG}"
>>>>> -PDM_ANOMALY:am65xx =3D "${PDM_ANOMALY_PKG}"
>>>>> -
>>>>> -RDEPENDS:${PN} =3D "\
>>>>> -=C2=A0=C2=A0=C2=A0 ${PDM_ANOMALY} \
>>>>> -"
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.=
bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>>>> index 438dd8d0..fc3eac74 100644
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
>>>>> @@ -15,14 +15,7 @@ CHROMIUM:append:k3 =3D "\
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chromium-ozone-wayland \
>>>>>  =C2=A0 "
>>>>> -EXTRABROWSERS =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebbrowser-examples \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-qmlplugins \
>>>>> -=C2=A0=C2=A0=C2=A0 qtwebengine-examples \
>>>>> -"
>>>>> -
>>>>>  =C2=A0 PYTHON2APPS =3D " \
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,"${EXTRABROWSERS}",'',d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLEC=
TIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${C=
HROMIUM}",'',d),'',d)} \
>>>>>  =C2=A0 "
>>>>> @@ -45,11 +38,10 @@ RDEPENDS:${PN} =3D "\
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-multimedia=
 \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-tisdk-addons-ext=
ra \
>>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,'packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-ext=
ra',d)} \
>>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES','opengl'=
,'','packagegroup-arago-base-tisdk-server-extra',d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains("BBFILE_COLLEC=
TIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${DEVTOOLS} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('TUNE_FEATURES=
', 'armv7a', 'valgrind', '', d)} \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packagegroup-arago-misc \
>>>>> -=C2=A0=C2=A0=C2=A0 ti-demos \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PREFERRED_PROVIDER_virtual/docker=
} \
>>>>>  =C2=A0 "
>>>>> --=20
>>>>> 2.47.1

