Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95583D7876D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:37:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12175.1732199865328117551
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 06:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ArveR1Dc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALEbiMj047812;
	Thu, 21 Nov 2024 08:37:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732199864;
	bh=2MCKdTaHBrL9diaqKxfhoGHJoc2ssSwZNRekb2U/zPw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ArveR1DczUbFds8xIwaX0A7c/d+yyW/ycsFQ/XbWg7c77euxVXTz7h4lXioiHhU2e
	 ONwaeUfD/veWVePlpG1UWchvbpVMWIC7qVH5YEN0DX6LlWo+85J8r6U4odS7BJl5Mb
	 GgPT/8mIdw5YxEfwoKVyy3Z1+K/cFyO7+W9ZCEAE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALEbiVB110181;
	Thu, 21 Nov 2024 08:37:44 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 08:37:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 08:37:43 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALEbf0G044851;
	Thu, 21 Nov 2024 08:37:42 -0600
Message-ID: <3b31bdfd-f4e0-4df1-8d5f-fb326a5ba3e1@ti.com>
Date: Thu, 21 Nov 2024 20:07:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v2 1/1] meta-arago: Enable
 SELinux package
To: Aashvij Shenai <a-shenai@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>, <denys@konsulko.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
References: <20241120172921.1881462-1-a-shenai@ti.com>
 <20241120172921.1881462-2-a-shenai@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241120172921.1881462-2-a-shenai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 14:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15623

Hi,

On 20/11/24 22:59, Aashvij Shenai wrote:
> - This patch allows the building of selinux packages conditional on the
>    layer being present via dynamic layers. Only if the meta-selinux layer
>    is present, tisdk-default-image recipe will build the packagegroup.
>
> - meta-selinux maintains a list of kernel configs that are needed for
>    the kernel to include SELinux. Append these configs from the
>    meta-selinux layer into our meta-ti Linux build


s/meta-ti/meta-arago


>
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>   meta-arago-distro/conf/layer.conf                   |  2 ++
>   .../images/tisdk-default-image.bbappend             |  3 +++
>   .../linux/linux-ti-staging_%.bbappend               | 13 +++++++++++++
>   3 files changed, 18 insertions(+)
>   create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
>   create mode 100644 meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend
>
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 00afb5b2..824c5773 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -26,10 +26,12 @@ LAYERDEPENDS_meta-arago-distro = " \
>   
>   LAYERRECOMMENDS_meta-arago-distro = " \
>       chromium-browser-layer \
> +    selinux \
>   "
>   
>   BBFILES_DYNAMIC += " \
>       chromium-browser-layer:${LAYERDIR}/dynamic-layers/chromium-browser-layer/recipes*/*/*.bbappend \
> +    selinux:${LAYERDIR}/dynamic-layers/selinux/recipes*/*/*.bbappend \
>   "
>   
>   BB_DANGLINGAPPENDS_WARNONLY = "true"
> diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
> new file mode 100644
> index 00000000..9c84bd83
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
> @@ -0,0 +1,3 @@
> +PR:append = ".selinux0"
> +
> +IMAGE_INSTALL:append = " packagegroup-core-selinux"
> diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend
> new file mode 100644
> index 00000000..058db4f4
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -0,0 +1,13 @@
> +# The meta-selinux layer includes an selinux.cfg file containing
> +# configs necessary for the Linux kernel to enable SELinux
> +
> +# In order to reduce maintainability issues, the file will
> +# be retained in meta-selinux layer
> +
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'recipes-kernel/linux/linux-yocto_selinux.inc', '', d)}
> +
> +do_configure:append() {
> +    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
> +        cat ${WORKDIR}/selinux.cfg >> ${B}/.config


WORKDIR is fine for scarthgap but for master we should use UNPACKDIR now 
[1][2]
You might have to send a separate version with UNPACKDIR for master


[1]: 
https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa
[2]: 
https://git.ti.com/cgit/arago-project/meta-ti/commit/?id=afcdfa2e638292d43cbe0eed8dc1271c95a1931e


---
Chirag


> +    fi
> +}
> \ No newline at end of file

