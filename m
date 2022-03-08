Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8896.1646751263126005438
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tmuDSbjw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 228EsLYs120349;
	Tue, 8 Mar 2022 08:54:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646751261;
	bh=/o4IfFau6NiRc5K0LPXYLQvT2qChNntRcNhomTtl5pc=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=tmuDSbjw2yFmLi1WPUXiFbakmi7oDDGmOqPwhfUbUJ6s44UOJ5LJQiLDhd1q+kumI
	 u+44BaVFSckipNszGBnwlvUF1TNy9B7kR07hKel7OmclL1gVxXHKUN0aRKeKIiQsDG
	 afD5qIohczEc6SUH5wwmnBsfRtin71H7A6dCmMgQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 228EsL2d063866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 08:54:21 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 08:54:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 08:54:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 228EsL9g051267;
	Tue, 8 Mar 2022 08:54:21 -0600
Date: Tue, 8 Mar 2022 08:54:21 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Dave
 Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan" <j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin" <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [dunfell/master PATCH] recipes-core: images: Add tisdk-thinlinux-image
Message-ID: <20220308145421.mcxvwuaeujxmfsyh@drudge>
References: <16DA6F21B0B58E2E.3140@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16DA6F21B0B58E2E.3140@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 08:46-20220308, Nishanth Menon via lists.yoctoproject.org wrote:
> Currently we have tisdk-tiny-image tisdk-base-image and
> tisdk-default-image which serve certain purpose for the users.
> 
> However, These are either too heavy or too pointed towards validation.
> 
> Hence, let us introduce a basic thinlinux image that has the basic
> system configured for out of box container usage without changing the
> meaning of existing image content definitions.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> NOTE:
> https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=18b28d0b3a2c1ac3ea6e6149496140a2110e7729
> https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=55b210e146a5dfcb1a1eca5cad6ea8fab79a5099
> https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=189de1b80876af739dde88315f5da5b59bc084e1
> 
> Now introduces a regression in the sense that 8.1 release that used to

arrgh.. typo.. should have stated 8.2.1 instead of 8.1

ref: https://git.yoctoproject.org/meta-arago/log/?h=dunfell

> support docker out of box (in base,default images) unfortunately do not
> anymore. Instead users need to mandatorily use a packagefeed to get
> docker enabled.
> 
> This image configuration helps restore that image support.
> 
>  .../images/tisdk-thinlinux-image.bb           | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> new file mode 100644
> index 00000000..c60efb5d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
> @@ -0,0 +1,25 @@
> +# Arago TI Thin Linux image
> +# Minimal bootable image with container to start the next complex system up.
> +
> +require arago-image.inc
> +
> +SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
> +
> +# Allow users to tack on additional packages as interesting.
> +ARAGO_THIN_IMAGE_EXTRA_INSTALL ?= ""
> +
> +IMAGE_INSTALL += "\
> +    packagegroup-arago-base \
> +    packagegroup-arago-console \
> +    packagegroup-arago-base-tisdk \
> +    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
> +    docker \
> +    ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
> +"
> +
> +export IMAGE_BASENAME = "tisdk-thin-image"
> +
> +# Disable ubi/ubifs as the filesystem requires more space than is
> +# available on the HW.
> +IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
> +IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
> -- 
> 2.17.1
> 
> 
> 
> 
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
