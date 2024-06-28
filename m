Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623BFC30658
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 16:41:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1010.1719592869050660745
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 09:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hMNdbfZk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45SGf3B0085107;
	Fri, 28 Jun 2024 11:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719592863;
	bh=4apvlDRGZ/DDLm0PUUcBKHT4eEGC8PhQAvycm2bgerI=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=hMNdbfZkhIqBqvX3X4GUr0NTuxCcJVM58nYlaGDpFs0u9TC0yPigmUV2LhCFYsYlv
	 Q5iOsAlOFGwPiKz+MnYfQsR/WoOg87GbGnUsx+WAjROdFARQk091Os0ldKfnUa0CDA
	 iV1/K256nYkiRcHZbEic36EmyBupZ5v4k4K3SOpo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45SGf34Q005588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 11:41:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 11:41:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 11:41:03 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45SGf3a6080779;
	Fri, 28 Jun 2024 11:41:03 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Jun 2024 11:41:03 -0500
Message-ID: <D2BSSNT8QZSY.1QELCDQLTS9K2@ti.com>
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap/master][PATCH] vulkan-cts: add
 workaround for createMeshShaderMiscTestsEXT
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.17.0
References: <17DB236B4EF787C6.28936@lists.yoctoproject.org>
In-Reply-To: <17DB236B4EF787C6.28936@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jun 2024 16:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15417

On Fri Jun 21, 2024 at 4:49 PM CDT, Randolph Sapp via lists.yoctoproject.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Remove the CXX flag "-O2" for GCC 13 and 14 on aarch64 platforms.
> There's a bug with ARM GCC that breaks the iteration of "types" in the
> createMeshShaderMiscTestsEXT function. This issue is not present for
> clang or x86_64 GCC 14.
>
> It seems that the array is not initialized before the first iteration.
> In testing this can result in a random value being used. This can
> manifest in LINES type being processed twice, resulting in the following
> error:
>
> FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name
> 'no_lines' added to group 'misc'.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> Taking too long for this to hit master so the backport probably won't com=
e in
> time for scarthgap. Submitting this in the meantime.
>
>  .../recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend      | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-c=
ts_1.3.7.3.bbappend
>
> diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.=
7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.=
7.3.bbappend
> new file mode 100644
> index 00000000..7af2057f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bba=
ppend
> @@ -0,0 +1,2 @@
> +# Workaround an optimization bug that breaks createMeshShaderMiscTestsEX=
T
> +OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 =3D "-O2"

Don't worry about this patch anymore. The guys in meta-openembedded pulled =
my
backport already.

- Randolph

