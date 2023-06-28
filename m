Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE3BEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:39:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20067.1687966764822769938
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=sbXZZtRc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SFdK9D108087;
	Wed, 28 Jun 2023 10:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687966760;
	bh=PIHMX3Ukn3AALIEqh2jwN7asTnZDtSh7uhB+ktDbSdc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sbXZZtRc9J76U91rK0ESWvx0i+sf17OQDiDarEv4qCENVCreLFeyiJNKHDMnRmWcm
	 GXvTdUyJ62J8Zv7gL7qOKVXFb6NkEBNZp4YgDw/LwRwh+womj5qHOYAK+xlsWC3kSa
	 FqZYibCUn7bTPc7P3f+55Px4vsx830A4dKQKzerc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SFdK6b031857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 10:39:20 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 10:39:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 10:39:20 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SFdKoq058954;
	Wed, 28 Jun 2023 10:39:20 -0500
Message-ID: <5e9fa5f5-8d34-2e1c-f267-671f8ecd3828@ti.com>
Date: Wed, 28 Jun 2023 10:39:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master][PATCH] misc: Add missing Upstream-Status to
 various patches
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230628145402.11529-1-reatmon@ti.com>
 <de2c558f-9f92-b674-9561-d52d1e45b0be@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <de2c558f-9f92-b674-9561-d52d1e45b0be@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35SFdK9D108087
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:39:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14724



On 6/28/2023 10:36 AM, Andrew Davis wrote:
> On 6/28/23 9:54 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Master has added a new ERROR_QA check for noncore layers so we need to
>> clean up meta-arago as well.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 ...-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch =
| 2 ++
>> =C2=A0 .../0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../psplash/psplash/0001-psplash-Add-Arago-custom-color.patch=C2=
=A0 | 2 ++
>> =C2=A0 .../psplash/psplash/0003-Updated-configurability.patch.patch=C2=
=A0=C2=A0 | 2 ++
>> =C2=A0 .../recipes-core/psplash/psplash/psplash-18bpp.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../libdrm/0001-Add-option-to-run-a-test-indefinitely.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 .../libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch =
| 3 +++
>> =C2=A0 .../drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch =
| 3 +++
>> =C2=A0 .../0001-Revert-require-GL_EXT_unpack_subimage-commit.patch=C2=A0=
=C2=A0=C2=A0 | 2 ++
>> =C2=A0 ...-backend-drm-Select-plane-based-on-current-attached-C.patch =
| 2 ++
>> =C2=A0 .../0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch=C2=
=A0 | 2 ++
>> =C2=A0 .../0002-wayland-drm-Update-to-version-2.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 ++
>> =C2=A0 12 files changed, 26 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink=
-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-arago-distro/=
recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-fo=
r-vlan-tagged-supervisi.patch
>> index fa0eeccc..c538afdc 100644
>> ---=20
>> a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink=
-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>> +++=20
>> b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink=
-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>> @@ -11,6 +11,8 @@ Supervision frames. This is done by adding 3=20
>> additional attributes
>> =C2=A0 to the hsr/prp link type and passing this to Linux HSR/PRP
>> =C2=A0 device through the ip link command.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 include/uapi/linux/if_link.h |=C2=A0 3 +++
>> diff --git=20
>> a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-po=
weroff-with-rtcwake-command.patch b/meta-arago-distro/recipes-core/busybo=
x/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
>> index da47888e..98504344 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-po=
weroff-with-rtcwake-command.patch
>> +++=20
>> b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-po=
weroff-with-rtcwake-command.patch
>> @@ -7,6 +7,8 @@ rtcwake will support poweroff as an option for -m with=
=20
>> this
>> =C2=A0 patch by calling poweroff from the command line and also not di=
sabling
>> =C2=A0 the rtc alarm1 interrupt at exit.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 util-linux/rtcwake.c | 15 +++++++++++----
>> diff --git=20
>> a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arag=
o-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psplash/000=
1-psplash-Add-Arago-custom-color.patch
>> index 80ba58e5..588b103d 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arag=
o-custom-color.patch
>> +++=20
>> b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arag=
o-custom-color.patch
>> @@ -5,6 +5,8 @@ Subject: [PATCH 1/2] psplash: Add Arago custom color
>> =C2=A0 * Port custom colors used in psplash-ti from oe-classic.
>> +Upstream-Status: Inappropriate [customization for arago]
>> +
>> =C2=A0 Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> =C2=A0 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> =C2=A0 ---
>> diff --git=20
>> a/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configur=
ability.patch.patch b/meta-arago-distro/recipes-core/psplash/psplash/0003=
-Updated-configurability.patch.patch
>> index 7c9feec1..2e82b973 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configur=
ability.patch.patch
>> +++=20
>> b/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configur=
ability.patch.patch
>> @@ -6,6 +6,8 @@ Subject: [PATCH 3/3] Updated configurability.patch
>> =C2=A0 * Updating configurability.patch to work with the most recent v=
ersion
>> =C2=A0=C2=A0=C2=A0 (last update 5/10/2012) of psplash.
>> +Upstream-Status: Inappropriate [customization for arago]
>> +
>> =C2=A0 Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 psplash.c |=C2=A0=C2=A0 16 ++++++++--------
>> diff --git=20
>> a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch=20
>> b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
>> index 1001a196..d758217f 100644
>> --- a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.pat=
ch
>> +++ b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.pat=
ch
>> @@ -6,6 +6,8 @@ Subject: [PATCH 2/2] upstream:=20
>> http://bugzilla.o-hand.com/show_bug.cgi?id=3D1764
>> =C2=A0 This is a reworked patch to address a code update in psplash.
>> =C2=A0 Original source is unknown.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 psplash-fb.c | 8 +++++++-
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run=
-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdr=
m/0001-Add-option-to-run-a-test-indefinitely.patch
>> index 719c8f74..4c62bab8 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run=
-a-test-indefinitely.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run=
-a-test-indefinitely.patch
>> @@ -9,6 +9,8 @@ allows using modetest within ltp-ddt, before this=20
>> patch modetest
>> =C2=A0 was not able to run in ltp-ddt because ltp-ddt sends data to st=
din
>> =C2=A0 when a test is run
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-suppo=
rt-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-graphics/drm/li=
bdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
>> index c9fdfedd..d645bab6 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-suppo=
rt-for-pre-v4.7-kernels.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-suppo=
rt-for-pre-v4.7-kernels.patch
>> @@ -4,6 +4,9 @@ Date: Tue, 13 Jun 2017 15:52:44 +0100
>> =C2=A0 Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
>> =C2=A0 Add support for the the sync merge ioctl supported by older ker=
nels.
>> +
>> +Upstream-Status: Pending
>> +
>> =C2=A0 ---
>> =C2=A0=C2=A0 libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++-=
--
>> =C2=A0=C2=A0 1 file changed, 41 insertions(+), 3 deletions(-)
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_in=
fo-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/drm/libdrm=
/0002-Add-sync_fence_info-and-sync_pt_info.patch
>> index 428def61..2786c04d 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_in=
fo-and-sync_pt_info.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_in=
fo-and-sync_pt_info.patch
>> @@ -6,6 +6,9 @@ Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_i=
nfo
>> =C2=A0 For pre-4.7 kernels, sync_fence_info returns the data from the
>> =C2=A0 SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE=
_INFO
>> =C2=A0 ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO =
form.
>> +
>> +Upstream-Status: Pending
>> +
>> =C2=A0 ---
>> =C2=A0=C2=A0 libsync.h | 172 +++++++++++++++++++++++++++++++++++++++++=
+++++++++++++
>> =C2=A0=C2=A0 1 file changed, 172 insertions(+)
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requir=
e-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphic=
s/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> index 13ab5e98..0c0d9089 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requir=
e-GL_EXT_unpack_subimage-commit.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requir=
e-GL_EXT_unpack_subimage-commit.patch
>> @@ -9,6 +9,8 @@ That commit removed support for GPU drivers without=20
>> GL_EXT_unpack_subimage
>> =C2=A0 which SGX does not support. Add back support for GPUs without t=
his
>> =C2=A0 extension.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Andrew Davis <afd@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 libweston/renderer-gl/gl-renderer-internal.h |=C2=A0 2 ++
>> diff --git=20
>> a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-S=
elect-plane-based-on-current-attached-C.patch b/meta-arago-distro/recipes=
-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-a=
ttached-C.patch
>> index d9444641..f4dce134 100644
>> ---=20
>> a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-S=
elect-plane-based-on-current-attached-C.patch
>> +++=20
>> b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-S=
elect-plane-based-on-current-attached-C.patch
>> @@ -10,6 +10,8 @@ the corresponding CRTC.
>> =C2=A0 This prevents changing a CRTC's primary plane when it is active
>> =C2=A0 which is not allowed by the DRM framework.
>> +Upstream-Status: Pending
>=20
> I got this one in upstream now, just not in this version of Weston.
>=20
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/393

Should I change the status then?  Or leave it as Pending and wait for us=20
to remove the patch completely?


> Andrew
>=20
>> +
>> =C2=A0 Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
>> =C2=A0 Signed-off-by: Andrew Davis <afd@ti.com>
>> =C2=A0 ---
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wa=
yland-drm-Add-wayland-drm-protocol-to-stable.patch b/meta-arago-extras/re=
cipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm=
-protocol-to-stable.patch
>> index 7cb17509..8abbaaee 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wa=
yland-drm-Add-wayland-drm-protocol-to-stable.patch
>> +++=20
>> b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wa=
yland-drm-Add-wayland-drm-protocol-to-stable.patch
>> @@ -7,6 +7,8 @@ wayland-drm protocol is missing in the protocols list=20
>> since this
>> =C2=A0 protocol is MESA specific. For waylandsink gstreamer support
>> =C2=A0 wayland-drm protocol is needed.
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 stable/wayland-drm/wayland-drm.xml | 155=20
>> +++++++++++++++++++++++++++++++++++++
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wa=
yland-drm-Update-to-version-2.patch b/meta-arago-extras/recipes-graphics/=
wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
>> index 3c9da42e..af0a29e3 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wa=
yland-drm-Update-to-version-2.patch
>> +++=20
>> b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wa=
yland-drm-Update-to-version-2.patch
>> @@ -5,6 +5,8 @@ Subject: [PATCH 2/2] wayland-drm: Update to version 2
>> =C2=A0 Update the wayland-drm protocol to version 2
>> +Upstream-Status: Pending
>> +
>> =C2=A0 Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>> =C2=A0 ---
>> =C2=A0=C2=A0 stable/wayland-drm/wayland-drm.xml | 35=20
>> +++++++++++++++++++++++++++++++++--

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

