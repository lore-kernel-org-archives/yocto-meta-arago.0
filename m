Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2478BC4829A
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 22:17:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7472.1707171413913402139
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 14:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MCldDdls;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415MGqEJ044405;
	Mon, 5 Feb 2024 16:16:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707171412;
	bh=bb4ctQWZTbthTfQRIWDqIt9yaU1ijOS7zEVuiQP+txc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MCldDdlszsTLMgLn26rcZNO+tUpawOMDzo3te/zQYyexcdBV4knHi2ahBorpnBIlj
	 yHlWDVfsYk0lbU4lYAeCbZe/GDwS6hvAaUS5+nPYfo5ublqEkp/7ZbUsE4Mr4bVQdp
	 /Ez4KvN1N6vwPWJabRFHt02sC43C9COFRcnL9UNM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415MGqIk102887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 16:16:52 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 16:16:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 16:16:51 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415MGpEq125180;
	Mon, 5 Feb 2024 16:16:51 -0600
Message-ID: <d4f10275-5b3b-41b1-8ba3-10aed3ba8d2d@ti.com>
Date: Mon, 5 Feb 2024 16:16:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH 0/4] cleanup old/add new chromium
Content-Language: en-US, en-US-large
To: Darren Etheridge <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>, <denys@konsulko.com>
References: <20240205191643.19614-1-detheridge@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20240205191643.19614-1-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Feb 2024 22:17:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15110

On 2/5/24 13:16, Darren Etheridge wrote:
> Patch series to add IMG PowerVR GPU accelerated Chromium support into
> Kirkstone.
> 
> Patch 1 and 4 clean up some of the old Chromium cruft that was left in
> the kirkstone branch that I can't imagine can possibly be useful now.
> 
> Then patch 2 and 3 add in a new dynamic layer to provide GPU support to
> Chromium by allowing the PowerVR libraries to be used from within the
> Chromium sandbox.   Also apply an upstream Chromium patch to stop
> Chromium from segfaulting immediately on startup if no input devices are
> detected.
> The dynamic layer will append chromium-ozone-wayland to the
> IMAGE_INSTALL for tisdk-default-image if the meta-browser layer is
> detected.
> 
> Currently we need to pin the meta-browser layer to chromium v111 as there are
> problems with the GPU integration in newer versions.  This pinning will
> be taken care of as part of oe-layersetup once we decide if it becomes a
> new "chromium" configuration, or if we add these layers into the normal
> kirkstone configurations.  Downside is build time increases
> considerably and image size increases.
> 
> All of this working depends on IMG PowerVR DDK23.3 being available in
> meta-ti - Randolph sent these patches for review last week.
> 
> Darren Etheridge (4):
>    meta-arago: distro: chromium: remove old dynamic layer
>    meta-arago: distro: add a bbapend to patch the chromium browser
>    meta-arago: images: update tisdk-default-image to include chromium
>    meta-arago: tisdk-default-image: remove old chromium logic
> 
>   meta-arago-distro/conf/layer.conf             |  4 +-
>   .../chromium-75.0.3770.80-SIOCGSTAMP.patch    | 15 ----
>   .../chromium-ozone-wayland/pulse.patch        | 47 ------------
>   .../chromium-ozone-wayland_%.bbappend         |  8 --
>   ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
>   ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 +++++++++++++++++++
>   ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
>   .../images/tisdk-default-image.bbappend       |  3 +
>   .../images/tisdk-default-image.bb             | 10 ---
>   9 files changed, 139 insertions(+), 82 deletions(-)
>   delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
>   delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/pulse.patch
>   delete mode 100644 meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend
> 

This looks fine and can be applied to master as well.

Reviewed-by: Randolph Sapp <rs@ti.com>

