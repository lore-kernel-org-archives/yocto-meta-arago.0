Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB37C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:22:51 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.8726.1741699362859829960
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=l86Hb+Va;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BDMfG2717226
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 08:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741699361;
	bh=FcmMVet3dkYxdnEfcrMxaObL50VqnhKBdVEhbDxo91c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l86Hb+VaflXdqbNeLNUyMfb7nK0q1T1jsGr+vi/G1W/ZD9iuRziysXfcEgeKCZMWG
	 AKXsj6fBiBw3c2WOH3gnkg5vxPu+yZSL0iGQ9/v09pxsWUpQzRyHs+h1YRq+CLatyY
	 aOxrV23M9jUCnv5F7Dcn1Eue7yNV2KAB03fz7V6g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BDMf5A060082;
	Tue, 11 Mar 2025 08:22:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 08:22:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 08:22:40 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BDMegK128959;
	Tue, 11 Mar 2025 08:22:40 -0500
Message-ID: <5be8e47e-5753-4893-b22f-371524842c47@ti.com>
Date: Tue, 11 Mar 2025 08:22:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-gtk: set PACKAGE_ARCH
To: <rs@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250311003556.3131699-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250311003556.3131699-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:22:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15967

On 3/10/25 7:35 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This packagegroup pulls a package that is automatically renamed with
> DEBIAN_NAMES. This is not allowed due to a sanity check that was added
> to prevent issues with packagegroups being aggressively cached and
> DEBIAN_NAMES potentially breaking this cache. See [YOCTO #7298] or
> 5bf3e447d2f in openembedded-core [1].
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=5bf3e447d2f5064495d83a8fad30229bcf1ecc9b
> 
> Fixes: 731fd376 (packagegroups: Do not set package arch when unneeded, 2025-03-03)
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 

Should we just drop this package group? Only has 2 packages, one is just a demo,
and the other (gtk+3) should be installed by DEPENDS only for packages that depend
on it, not unconditionally as done here.

Andrew

> Tagged scarthgap/master as the origional patch was, but I don't think the
> original patch has made it to master yet.
> 
>   .../packagegroups/packagegroup-arago-tisdk-gtk.bb             | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> index cd6dd895..e0a90a31 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> @@ -2,6 +2,10 @@ DESCRIPTION = "Task to add Gtk embedded related packages"
>   LICENSE = "MIT"
>   PR = "r2"
>   
> +# Required for packages that are renamed using DEBIAN_NAMES
> +# [YOCTO #7298]
> +PACKAGE_ARCH = "${TUNE_PKGARCH}"
> +
>   inherit packagegroup
>   
>   RDEPENDS:${PN} = "\

