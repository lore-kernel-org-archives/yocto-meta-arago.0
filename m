Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F819C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:38:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22042.1738337898865469825
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 07:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 59FD140C2E;
	Fri, 31 Jan 2025 15:38:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYc1wMx9R-yX; Fri, 31 Jan 2025 15:38:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 29E9640ACD;
	Fri, 31 Jan 2025 15:38:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6B24D1641EB; Fri, 31 Jan 2025 10:38:13 -0500 (EST)
Date: Fri, 31 Jan 2025 10:38:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-limaye@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, u-kumar1@ti.com
Subject: Re: [meta-arago][master][PATCH] ti-test: Add mcrc64 test
 application
Message-ID: <20250131153813.GL21836@denix.org>
References: <20250130100105.507586-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130100105.507586-1-a-limaye@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Jan 2025 15:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15787

On Thu, Jan 30, 2025 at 03:30:48PM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
> From: Udit Kumar <u-kumar1@ti.com>
> 
> Add mcrc64 test application recipe.
> This application is documented at[0].
> 
> [0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/MCRC64.html
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> ---
>  .../recipes-core/packagegroups/ti-test.bb     |   1 +
>  .../recipes-kernel/mcrc64/files/mcrc64.c      | 114 ++++++++++++++++++
>  .../recipes-kernel/mcrc64/mcrc64.bb           |  19 +++
>  3 files changed, 134 insertions(+)
>  create mode 100644 meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>  create mode 100644 meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb

...

> diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> new file mode 100644
> index 00000000..b0352585
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Application to test MCRC64 driver"

SUMMARY


> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://mcrc64.c;beginline=1;endline=33;md5=070547e79367134fcfdf7fdb5e3ef7e3"
> +
> +SRC_URI = "file://mcrc64.c"
> +
> +S = "${WORKDIR}/sources"
> +UNPACKDIR = "${S}"
> +
> +do_compile() {
> +	${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -o mcrc64
> +}
> +
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 mcrc64 ${D}${bindir}
> +}
> -- 
> 2.48.1

