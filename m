Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF209C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:39:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5401.1682545178919777433
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zy++PPgD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLda4A069059;
	Wed, 26 Apr 2023 16:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682545176;
	bh=4UzrgOU4U8TkAO2jBbvrtm5g44HS8ktf5SawfWlNDls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Zy++PPgDaIV21FVT8m+ExY4CfvpFnOXGHlb3ug2RSPvIKW6kLwe2Dx+j6MnKgt3V2
	 Q7WCljC+JPPmUG7Qvec6YjSEXJ9LdAXcdC4oCewFBHxa5qumJ5Jp4iGi0H/Pp9bRCv
	 SHfWCkShVSi5CbFmDlfFBkJap6iog95Y1QrHNf5Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLdZZo093358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:39:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 16:39:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 26 Apr 2023 16:39:35 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLdZGl031793;
	Wed, 26 Apr 2023 16:39:35 -0500
Message-ID: <6a65058c-f120-b454-af7b-072cdc9aed9d@ti.com>
Date: Wed, 26 Apr 2023 16:39:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 0/6] Vulkan prep and some
 cleanup
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230426213214.3501230-1-rs@ti.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230426213214.3501230-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14356

On 4/26/23 16:32, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Enable limited x11 support to help with the Vulkan WSI layers. Adjust
> PACKAGECONFIG strings for a few packages so they still prefer the Wayland
> backend properly and still use GLES instead of GL.
> 
> Also attempt a little bit of patch cleanup. Expect a few more cleanup
> patches with the non-root Weston patchset when that comes out.
> 
> Randolph Sapp (6):
>    arago.conf: drop the explicit removal of x11, add vulkan
>    qtwayland: override the packageconfig to prefer wayland
>    qtwayland: drop the fix-wayland-texture-sharing patch
>    qtwayland: drop the plugins-decorations patch
>    qtwayland: add comment about why this append exists
>    glfw: convert to append and drop patches
> 
>   meta-arago-distro/conf/distro/arago.conf      |  4 +-
>   ...land-texture-sharing-custom-composit.patch | 52 -------------------
>   ...ons-bradient-display-window-icon-onl.patch | 42 ---------------
>   .../recipes-qt/qt5/qtwayland_git.bbappend     |  9 ++--
>   ...xt-remove-check-for-Wayland-Egl-prov.patch | 27 ----------
>   .../recipes-graphics/glfw/glfw_%.bbappend     |  6 +++
>   .../recipes-graphics/glfw/glfw_git.bb         | 24 ---------
>   7 files changed, 10 insertions(+), 154 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
>   delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
>   create mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
>   delete mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
> 

Well rats. Some master updates slipped past me. This no longer applies 
to master, but it still applies to kirkstone just fine.

