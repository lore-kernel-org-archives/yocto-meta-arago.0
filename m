Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4535AC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:10:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11717.1647619823285514056
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kD3yVCVg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IGAJZQ071369;
	Fri, 18 Mar 2022 11:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647619819;
	bh=5sudfwr1per6e0ZOO3M6vzUpkCatZmqPAPHSu1RYXpk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=kD3yVCVgf4D0CQ1CBuLRktN+J9DihRZULQBw0IghAqsoZUXdSp6HU9QOEoAf/wj6f
	 IJm7h4ZHPSbHgv0/vS2Yon0JHIQ0XQai5J4qpto4pd8IOUMlOD1h43yUJiB2H+0FsM
	 CydYfDkHfDpXKBl+8or5J0DfWZpwUW06vWEQBvzA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IGAJBh012522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 11:10:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 11:10:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 11:10:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IGAIkt097679;
	Fri, 18 Mar 2022 11:10:18 -0500
Date: Fri, 18 Mar 2022 11:10:18 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Dave
 Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan" <j-humphreys@ti.com>,
 praneeth <praneeth@ti.com>,
        minas <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil"
	<nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [dunfell/master PATCH V2 03/12] tisdk-tiny-image:
 Add some usability notes
Message-ID: <20220318161018.esa56i7lt24o55jo@album>
References: <20220318143735.17642-1-nm@ti.com>
 <16DD80717DAD77C5.12046@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16DD80717DAD77C5.12046@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13654

On 09:37-20220318, Nishanth Menon via lists.yoctoproject.org wrote:
> Lets clarify the usage of tiny image as something meant as a building
> block and not something that folks can directly use.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes since v1:
> * Review comments incorporated
> 
> V1: https://lore.kernel.org/all/20220309021316.28370-3-nm@ti.com/
>  .../recipes-core/images/tisdk-tiny-image.bb              | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> index 85ae3728e86e..352cc2d1aa44 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> @@ -1,3 +1,12 @@
> +# Arago TI SDK super minimal base image for initramfs
> +#
> +# Image meant for basic boot of linux kernel. Intended as
> +# bare system, this image does not package the kernel in the
> +# standard /boot folder in rootfs. Instead, it provides a base
> +# rootfs allowing kernel to be deployed elsewhere
> +# (tftp/separate boot partition/jtag log etc..) and boot
> +# the image.


This and elsewhere, should we use instead:

SUMMARY = "Arago TI SDK super minimal base image for initramfs"

DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as \
bare system, this image does not package the kernel in the \
standard /boot folder in rootfs. Instead, it provides a base \
rootfs allowing kernel to be deployed elsewhere \
(tftp/separate boot partition/jtag log etc..) and boot \
the image.\
"

and should we also create a HOMEPAGE = "wiki link?"


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

