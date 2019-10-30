Return-Path: <afd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 286EB529FE
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 15:25:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFOSNx033317
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572449068;
	bh=uF32bxzi/r6vGLfj3Y+xzhSb0ZLfWeEOqNgtKD02wNw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=rEncvSu6FBVroPU743L2gjWo68ieIC6uRHZGbhFanwzolyNZaJx3VbWUlaeTzHuuA
	c/O/PIm6jhxpDZiU1d/7xanV8ZsyBdjTBArF+/EWUTusZ0/zepjlwgRnwLeAqL+d6i
	yiXmUjfP1/pkFdl1oacPYmkyH6JV41L10WksNtpQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFOSjO011948
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:24:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 10:24:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 10:24:14 -0500
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFOQrY009573;
	Wed, 30 Oct 2019 10:24:26 -0500
To: "Ruei, Eric" <a0850410@ti.com>, Denys Dmytriyenko <denys@ti.com>, Eric
	Ruei <e-ruei1@ti.com>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-4-e-ruei1@ti.com> <20191029211322.GJ7518@beryl>
	<622a87d9-d036-a988-1535-414230b68531@ti.com>
	<f7cd0e0e-0a23-8144-6ddf-81bea889f0e4@ti.com>
	<d39958f7-7c70-2b92-a3d0-38de92f012dd@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <cbc548fe-d76f-e43f-9fc1-a8ca767881a9@ti.com>
Date: Wed, 30 Oct 2019 11:24:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d39958f7-7c70-2b92-a3d0-38de92f012dd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/7] HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2019 15:25:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/30/19 11:09 AM, Ruei, Eric wrote:
> On 10/30/2019 11:01 AM, Andrew F. Davis wrote:
>> On 10/30/19 10:41 AM, Ruei, Eric wrote:
>>> On 10/29/2019 5:13 PM, Denys Dmytriyenko wrote:
>>>> On Tue, Oct 29, 2019 at 09:53:45AM -0400, Eric Ruei wrote:
>>>>> This hack is required tentatively until GBM_MODIFIERS is fully
>>>>> supported
>>>>> by Mesa-based EGL.
>>>>>
>>>>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>>>> ---
>>>>>    ...mposito-drm-undef-HAVE_GBM_MODIFIERS.patch | 29
>>>>> +++++++++++++++++++
>>>>>    .../wayland/weston_5.0.0.bbappend             |  3 +-
>>>>>    2 files changed, 31 insertions(+), 1 deletion(-)
>>>>>    create mode 100644
>>>>> meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
>>>>>
>>>>>
>>>>>
>>>>> diff --git
>>>>> a/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
>>>>>
>>>>> b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
>>>>>
>>>>>
>>>>> new file mode 100644
>>>>> index 00000000..56a78e46
>>>>> --- /dev/null
>>>>> +++
>>>>> b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
>>>>>
>>>>>
>>>>> @@ -0,0 +1,29 @@
>>>>> +From e406b4141c23fb762a14a09d565c363ebaccb5a4 Mon Sep 17 00:00:00
>>>>> 2001
>>>>> +From: Eric Ruei <e-ruei1@ti.com>
>>>>> +Date: Sun, 1 Sep 2019 08:28:27 -0400
>>>>> +Subject: [PATCH] HACK: composito-drm: undef HAVE_GBM_MODIFIERS
>>>>> +
>>>>> +HAVE_GBM_MODIFIERS is defined, but not fully supported by the gbm
>>>>> module
>>>>> +yet.
>>>>
>>>> Upstream-Status: Inappropriate [reason]
>>>>
>>>>
>>>
>>> Denys:
>>>
>>> Thanks!This patch is no longer needed and I shall remove it at v2.
>>>
>>
>>
>> Why is this no longer needed? Last time I built this we still had
>> failures without explicitly disabling GBM_MODIFIERS.
>>
>> Andrew
>>
>>
> 
> The HAVE_GBM_MODIFIERS is no longer defined anywhere. Is it expected?
> I am able to rebuild Weston without this patch.
> 

What version of Weston do you have? What keeps the code from trying to
use gbm with modifiers? The build will work as the right functions are
exposed (gbm_surface_create_with_modifiers(), etc..) but when used they
will always return "not supported" and we won't get a surface back.

I still see HAVE_GBM_MODIFIERS used in even the latest Weston[0].

[0]
https://gitlab.freedesktop.org/wayland/weston/blob/master/libweston/backend-drm/drm-gbm.c
Andrew


> Best regards,
> 
> Eric
> 
> 
> 
>>> Eric
>>>
>>>>> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>>>> +---
>>>>> + libweston/compositor-drm.c | 2 ++
>>>>> + 1 file changed, 2 insertions(+)
>>>>> +
>>>>> +diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
>>>>> +index d92ecfcd..88f845a8 100644
>>>>> +--- a/libweston/compositor-drm.c
>>>>> ++++ b/libweston/compositor-drm.c
>>>>> +@@ -68,6 +68,8 @@
>>>>> + #include "linux-dmabuf-unstable-v1-server-protocol.h"
>>>>> + #include "linux-explicit-synchronization.h"
>>>>> +
>>>>> ++#undef HAVE_GBM_MODIFIERS
>>>>> ++
>>>>> + #ifndef DRM_CLIENT_CAP_ASPECT_RATIO
>>>>> + #define DRM_CLIENT_CAP_ASPECT_RATIO    4
>>>>> + #endif
>>>>> +--
>>>>> +2.17.1
>>>>> +
>>>>> diff --git
>>>>> a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
>>>>> b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
>>>>> index 1bdcf7e4..94a5bc60 100644
>>>>> --- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
>>>>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
>>>>> @@ -2,7 +2,7 @@
>>>>>    PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor
>>>>> WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev
>>>>>
>>>>> mtdev"
>>>>>    PACKAGECONFIG[kms] =
>>>>> "--enable-drm-compositor,--disable-drm-compositor,drm udev
>>>>> virtual/libgbm mtdev"
>>>>>    -PR_append = ".arago34"
>>>>> +PR_append = ".arago35"
>>>>>      FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>>>    @@ -26,6 +26,7 @@ SRC_URI += " \
>>>>>            file://0011-compositor-Add-scene-graph-debug-scope.patch \
>>>>>          
>>>>> file://0012-compositor-drm-Add-backend-pointer-to-drm_output.patch \
>>>>>          
>>>>> file://0013-compositor-drm-Add-drm-backend-log-debug-scope.patch \
>>>>> +    file://0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch \
>>>>>    "
>>>>>      INHIBIT_PACKAGE_STRIP = "1"
>>>>> -- 
>>>>> 2.17.1
>>>>>
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>
> 

