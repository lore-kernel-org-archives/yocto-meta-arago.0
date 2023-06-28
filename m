Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419BCEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:37:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.20016.1687966621395295709
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OdOdGJD5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SFb0nn121037;
	Wed, 28 Jun 2023 10:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687966620;
	bh=EVgSFHBTFd39HIfEIzq0Kv4+9udoaYMAyRNK4wJ8jBY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=OdOdGJD5/trLUybDFKlN2DON8pZ+qzWmKnn5GeI+itO9j+muiZpKcFCC88B1FALx2
	 psJHfiNsPhYPDlpkb02MbvGsHgvMU+nyndihN+z+/iv5B4HeDjdg1GaSFVPHxut8Nq
	 Mnu7qDBcYnVReI9dt7p9tOSFX8XRoxa6yRaE1Uvg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SFaxkb074006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 10:36:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 10:36:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 10:36:59 -0500
Received: from [10.250.37.10] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SFax4r003441;
	Wed, 28 Jun 2023 10:36:59 -0500
Message-ID: <de2c558f-9f92-b674-9561-d52d1e45b0be@ti.com>
Date: Wed, 28 Jun 2023 10:36:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH] misc: Add missing Upstream-Status to
 various patches
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230628145402.11529-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230628145402.11529-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14723

On 6/28/23 9:54 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Master has added a new ERROR_QA check for noncore layers so we need to
> clean up meta-arago as well.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   ...-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch | 2 ++
>   .../0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch     | 2 ++
>   .../psplash/psplash/0001-psplash-Add-Arago-custom-color.patch  | 2 ++
>   .../psplash/psplash/0003-Updated-configurability.patch.patch   | 2 ++
>   .../recipes-core/psplash/psplash/psplash-18bpp.patch           | 2 ++
>   .../libdrm/0001-Add-option-to-run-a-test-indefinitely.patch    | 2 ++
>   .../libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch | 3 +++
>   .../drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch | 3 +++
>   .../0001-Revert-require-GL_EXT_unpack_subimage-commit.patch    | 2 ++
>   ...-backend-drm-Select-plane-based-on-current-attached-C.patch | 2 ++
>   .../0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch  | 2 ++
>   .../0002-wayland-drm-Update-to-version-2.patch                 | 2 ++
>   12 files changed, 26 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
> index fa0eeccc..c538afdc 100644
> --- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
> @@ -11,6 +11,8 @@ Supervision frames. This is done by adding 3 additional attributes
>   to the hsr/prp link type and passing this to Linux HSR/PRP
>   device through the ip link command.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>   ---
>    include/uapi/linux/if_link.h |  3 +++
> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
> index da47888e..98504344 100644
> --- a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
> +++ b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
> @@ -7,6 +7,8 @@ rtcwake will support poweroff as an option for -m with this
>   patch by calling poweroff from the command line and also not disabling
>   the rtc alarm1 interrupt at exit.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
>   ---
>    util-linux/rtcwake.c | 15 +++++++++++----
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> index 80ba58e5..588b103d 100644
> --- a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> +++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH 1/2] psplash: Add Arago custom color
>   
>   * Port custom colors used in psplash-ti from oe-classic.
>   
> +Upstream-Status: Inappropriate [customization for arago]
> +
>   Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>   Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>   ---
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configurability.patch.patch b/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configurability.patch.patch
> index 7c9feec1..2e82b973 100644
> --- a/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configurability.patch.patch
> +++ b/meta-arago-distro/recipes-core/psplash/psplash/0003-Updated-configurability.patch.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH 3/3] Updated configurability.patch
>   * Updating configurability.patch to work with the most recent version
>     (last update 5/10/2012) of psplash.
>   
> +Upstream-Status: Inappropriate [customization for arago]
> +
>   Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>   ---
>    psplash.c |   16 ++++++++--------
> diff --git a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
> index 1001a196..d758217f 100644
> --- a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
> +++ b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH 2/2] upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=1764
>   This is a reworked patch to address a code update in psplash.
>   Original source is unknown.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>   ---
>    psplash-fb.c | 8 +++++++-
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> index 719c8f74..4c62bab8 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> @@ -9,6 +9,8 @@ allows using modetest within ltp-ddt, before this patch modetest
>   was not able to run in ltp-ddt because ltp-ddt sends data to stdin
>   when a test is run
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
>   Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>   
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
> index c9fdfedd..d645bab6 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
> @@ -4,6 +4,9 @@ Date: Tue, 13 Jun 2017 15:52:44 +0100
>   Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
>   
>   Add support for the the sync merge ioctl supported by older kernels.
> +
> +Upstream-Status: Pending
> +
>   ---
>    libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++---
>    1 file changed, 41 insertions(+), 3 deletions(-)
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> index 428def61..2786c04d 100644
> --- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
> @@ -6,6 +6,9 @@ Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_info
>   For pre-4.7 kernels, sync_fence_info returns the data from the
>   SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE_INFO
>   ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO form.
> +
> +Upstream-Status: Pending
> +
>   ---
>    libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>    1 file changed, 172 insertions(+)
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> index 13ab5e98..0c0d9089 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> @@ -9,6 +9,8 @@ That commit removed support for GPU drivers without GL_EXT_unpack_subimage
>   which SGX does not support. Add back support for GPUs without this
>   extension.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Andrew Davis <afd@ti.com>
>   ---
>    libweston/renderer-gl/gl-renderer-internal.h |  2 ++
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
> index d9444641..f4dce134 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
> @@ -10,6 +10,8 @@ the corresponding CRTC.
>   This prevents changing a CRTC's primary plane when it is active
>   which is not allowed by the DRM framework.
>   
> +Upstream-Status: Pending

I got this one in upstream now, just not in this version of Weston.

https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/393

Andrew

> +
>   Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
>   Signed-off-by: Andrew Davis <afd@ti.com>
>   ---
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
> index 7cb17509..8abbaaee 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch
> @@ -7,6 +7,8 @@ wayland-drm protocol is missing in the protocols list since this
>   protocol is MESA specific. For waylandsink gstreamer support
>   wayland-drm protocol is needed.
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Ramprasad N <x0038811@ti.com>
>   ---
>    stable/wayland-drm/wayland-drm.xml | 155 +++++++++++++++++++++++++++++++++++++
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
> index 3c9da42e..af0a29e3 100644
> --- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
> +++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols/0002-wayland-drm-Update-to-version-2.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH 2/2] wayland-drm: Update to version 2
>   
>   Update the wayland-drm protocol to version 2
>   
> +Upstream-Status: Pending
> +
>   Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>   ---
>    stable/wayland-drm/wayland-drm.xml | 35 +++++++++++++++++++++++++++++++++--

