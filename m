Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60853EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:45:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.20254.1687967145987395036
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=STKPmPpb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SFjju5123279;
	Wed, 28 Jun 2023 10:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687967145;
	bh=pi+EO+PenzmowVNu0YOsKat/CvL+pemu7Zcmp7OYu6o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=STKPmPpbzsi6urQkCKxdOcz6VX0ynQd+i8wwBjJw3/gIIr/Bc0DICq3rQTI2mlc0x
	 8cwLZChKTw2T6JyYvnFztNY0cWEAD1TIxVSjcSQ3zu0bJ0nUgoB0w16IEcJlabAQDV
	 eKI6oAeivA9Im4Xao4DaoqCc6u5/IKlEz8k85EI4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SFjjgG019914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 10:45:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 10:45:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 10:45:44 -0500
Received: from [10.250.37.10] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SFjivl014018;
	Wed, 28 Jun 2023 10:45:44 -0500
Message-ID: <1c5461b4-30ed-0e89-bc5a-503109a84d0f@ti.com>
Date: Wed, 28 Jun 2023 10:45:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH] misc: Add missing Upstream-Status to
 various patches
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230628145402.11529-1-reatmon@ti.com>
 <de2c558f-9f92-b674-9561-d52d1e45b0be@ti.com>
 <5e9fa5f5-8d34-2e1c-f267-671f8ecd3828@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <5e9fa5f5-8d34-2e1c-f267-671f8ecd3828@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 35SFjju5123279
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14725

On 6/28/23 10:39 AM, Ryan Eatmon wrote:
>=20
>=20
> On 6/28/2023 10:36 AM, Andrew Davis wrote:
>> On 6/28/23 9:54 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Master has added a new ERROR_QA check for noncore layers so we need t=
o
>>> clean up meta-arago as well.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 ...-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch=
 | 2 ++
>>> =C2=A0 .../0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 .../psplash/psplash/0001-psplash-Add-Arago-custom-color.patch=C2=
=A0 | 2 ++
>>> =C2=A0 .../psplash/psplash/0003-Updated-configurability.patch.patch=C2=
=A0=C2=A0 | 2 ++
>>> =C2=A0 .../recipes-core/psplash/psplash/psplash-18bpp.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 .../libdrm/0001-Add-option-to-run-a-test-indefinitely.patch=C2=
=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 .../libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch=
 | 3 +++
>>> =C2=A0 .../drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch=
 | 3 +++
>>> =C2=A0 .../0001-Revert-require-GL_EXT_unpack_subimage-commit.patch=C2=
=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 ...-backend-drm-Select-plane-based-on-current-attached-C.patch=
 | 2 ++
>>> =C2=A0 .../0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch=C2=
=A0 | 2 ++
>>> =C2=A0 .../0002-wayland-drm-Update-to-version-2.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 ++
>>> =C2=A0 12 files changed, 26 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2=
/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-a=
rago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-ad=
d-support-for-vlan-tagged-supervisi.patch
>>> index fa0eeccc..c538afdc 100644
>>> --- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-i=
plink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>>> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-i=
plink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>>> @@ -11,6 +11,8 @@ Supervision frames. This is done by adding 3 additi=
onal attributes
>>> =C2=A0 to the hsr/prp link type and passing this to Linux HSR/PRP
>>> =C2=A0 device through the ip link command.
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 include/uapi/linux/if_link.h |=C2=A0 3 +++
>>> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcw=
ake-Allow-poweroff-with-rtcwake-command.patch b/meta-arago-distro/recipes=
-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.pa=
tch
>>> index da47888e..98504344 100644
>>> --- a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-All=
ow-poweroff-with-rtcwake-command.patch
>>> +++ b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-All=
ow-poweroff-with-rtcwake-command.patch
>>> @@ -7,6 +7,8 @@ rtcwake will support poweroff as an option for -m wit=
h this
>>> =C2=A0 patch by calling poweroff from the command line and also not d=
isabling
>>> =C2=A0 the rtc alarm1 interrupt at exit.
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 util-linux/rtcwake.c | 15 +++++++++++----
>>> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-pspl=
ash-Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash=
/psplash/0001-psplash-Add-Arago-custom-color.patch
>>> index 80ba58e5..588b103d 100644
>>> --- a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add=
-Arago-custom-color.patch
>>> +++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add=
-Arago-custom-color.patch
>>> @@ -5,6 +5,8 @@ Subject: [PATCH 1/2] psplash: Add Arago custom color
>>> =C2=A0 * Port custom colors used in psplash-ti from oe-classic.
>>> +Upstream-Status: Inappropriate [customization for arago]
>>> +
>>> =C2=A0 Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>> =C2=A0 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> =C2=A0 ---
>>> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0003-Upda=
ted-configurability.patch.patch b/meta-arago-distro/recipes-core/psplash/=
psplash/0003-Updated-configurability.patch.patch
>>> index 7c9feec1..2e82b973 100644
>>> --- a/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-con=
figurability.patch.patch
>>> +++ b/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-con=
figurability.patch.patch
>>> @@ -6,6 +6,8 @@ Subject: [PATCH 3/3] Updated configurability.patch
>>> =C2=A0 * Updating configurability.patch to work with the most recent =
version
>>> =C2=A0=C2=A0=C2=A0 (last update 5/10/2012) of psplash.
>>> +Upstream-Status: Inappropriate [customization for arago]
>>> +
>>> =C2=A0 Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 psplash.c |=C2=A0=C2=A0 16 ++++++++--------
>>> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/psplash-1=
8bpp.patch b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp=
.patch
>>> index 1001a196..d758217f 100644
>>> --- a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.pa=
tch
>>> +++ b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.pa=
tch
>>> @@ -6,6 +6,8 @@ Subject: [PATCH 2/2] upstream: http://bugzilla.o-hand=
.com/show_bug.cgi?id=3D1764
>>> =C2=A0 This is a reworked patch to address a code update in psplash.
>>> =C2=A0 Original source is unknown.
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 psplash-fb.c | 8 +++++++-
>>> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-o=
ption-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphi=
cs/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
>>> index 719c8f74..4c62bab8 100644
>>> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-t=
o-run-a-test-indefinitely.patch
>>> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-t=
o-run-a-test-indefinitely.patch
>>> @@ -9,6 +9,8 @@ allows using modetest within ltp-ddt, before this pat=
ch modetest
>>> =C2=A0 was not able to run in ltp-ddt because ltp-ddt sends data to s=
tdin
>>> =C2=A0 when a test is run
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
>>> =C2=A0 Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>>> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsy=
nc-add-support-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-gra=
phics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
>>> index c9fdfedd..d645bab6 100644
>>> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-=
support-for-pre-v4.7-kernels.patch
>>> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-=
support-for-pre-v4.7-kernels.patch
>>> @@ -4,6 +4,9 @@ Date: Tue, 13 Jun 2017 15:52:44 +0100
>>> =C2=A0 Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
>>> =C2=A0 Add support for the the sync merge ioctl supported by older ke=
rnels.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++=
---
>>> =C2=A0=C2=A0 1 file changed, 41 insertions(+), 3 deletions(-)
>>> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-s=
ync_fence_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphic=
s/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
>>> index 428def61..2786c04d 100644
>>> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fen=
ce_info-and-sync_pt_info.patch
>>> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fen=
ce_info-and-sync_pt_info.patch
>>> @@ -6,6 +6,9 @@ Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_=
info
>>> =C2=A0 For pre-4.7 kernels, sync_fence_info returns the data from the
>>> =C2=A0 SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FIL=
E_INFO
>>> =C2=A0 ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO=
 form.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
>>> =C2=A0=C2=A0 1 file changed, 172 insertions(+)
>>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-R=
evert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/rec=
ipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-c=
ommit.patch
>>> index 13ab5e98..0c0d9089 100644
>>> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-r=
equire-GL_EXT_unpack_subimage-commit.patch
>>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-r=
equire-GL_EXT_unpack_subimage-commit.patch
>>> @@ -9,6 +9,8 @@ That commit removed support for GPU drivers without G=
L_EXT_unpack_subimage
>>> =C2=A0 which SGX does not support. Add back support for GPUs without =
this
>>> =C2=A0 extension.
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Andrew Davis <afd@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 libweston/renderer-gl/gl-renderer-internal.h |=C2=A0 2 +=
+
>>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-b=
ackend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-di=
stro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-=
on-current-attached-C.patch
>>> index d9444641..f4dce134 100644
>>> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-=
drm-Select-plane-based-on-current-attached-C.patch
>>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-=
drm-Select-plane-based-on-current-attached-C.patch
>>> @@ -10,6 +10,8 @@ the corresponding CRTC.
>>> =C2=A0 This prevents changing a CRTC's primary plane when it is activ=
e
>>> =C2=A0 which is not allowed by the DRM framework.
>>> +Upstream-Status: Pending
>>
>> I got this one in upstream now, just not in this version of Weston.
>>
>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/393
>=20
> Should I change the status then?=C2=A0 Or leave it as Pending and wait =
for us to remove the patch completely?
>=20

I'd just leave it as is, it should get removed here soon enough.

Same for the below two, could be changed to "Inappropriate" but both just=
 need
removed at some point so no big deal.

Andrew

>=20
>> Andrew
>>
>>> +
>>> =C2=A0 Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
>>> =C2=A0 Signed-off-by: Andrew Davis <afd@ti.com>
>>> =C2=A0 ---
>>> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-proto=
cols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch b/meta-ara=
go-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add=
-wayland-drm-protocol-to-stable.patch
>>> index 7cb17509..8abbaaee 100644
>>> --- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/00=
01-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
>>> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/00=
01-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
>>> @@ -7,6 +7,8 @@ wayland-drm protocol is missing in the protocols list=
 since this
>>> =C2=A0 protocol is MESA specific. For waylandsink gstreamer support
>>> =C2=A0 wayland-drm protocol is needed.
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Ramprasad N <x0038811@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 stable/wayland-drm/wayland-drm.xml | 155 +++++++++++++++=
++++++++++++++++++++++
>>> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-proto=
cols/0002-wayland-drm-Update-to-version-2.patch b/meta-arago-extras/recip=
es-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-=
2.patch
>>> index 3c9da42e..af0a29e3 100644
>>> --- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/00=
02-wayland-drm-Update-to-version-2.patch
>>> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/00=
02-wayland-drm-Update-to-version-2.patch
>>> @@ -5,6 +5,8 @@ Subject: [PATCH 2/2] wayland-drm: Update to version 2
>>> =C2=A0 Update the wayland-drm protocol to version 2
>>> +Upstream-Status: Pending
>>> +
>>> =C2=A0 Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>>> =C2=A0 ---
>>> =C2=A0=C2=A0 stable/wayland-drm/wayland-drm.xml | 35 ++++++++++++++++=
+++++++++++++++++--
>=20

