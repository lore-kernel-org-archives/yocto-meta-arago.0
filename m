Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6332AC77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:19:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17649.1682201957713694405
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 15:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 047F140301;
	Sat, 22 Apr 2023 22:19:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY4mybXZ9_fj; Sat, 22 Apr 2023 22:19:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C572340021;
	Sat, 22 Apr 2023 22:19:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4CDC0163831; Sat, 22 Apr 2023 18:18:34 -0400 (EDT)
Date: Sat, 22 Apr 2023 18:18:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 2/2] ltp-ddt: Add
 support for version 20230127
Message-ID: <20230422221834.GE9226@denix.org>
References: <20230422220722.10360-1-reatmon@ti.com>
 <20230422220722.10360-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422220722.10360-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 22:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14335

On Sat, Apr 22, 2023 at 05:07:22PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The internal testing team would like to move to this version as the
> basis for our internal ltp-ddt.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Add missing space on :append line.
> 
>  .../ltp-ddt/ltp-ddt_20230127.bb               | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> new file mode 100644
> index 00000000..10b93a87
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> @@ -0,0 +1,47 @@
> +FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
> +FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
> +
> +require recipes-extended/ltp/ltp_${PV}.bb
> +
> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> +HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
> +
> +PROVIDES += "ltp"
> +
> +DEPENDS += "alsa-lib"
> +
> +PE = "1"
> +PR = "r7"
> +PV:append = "+git${SRCPV}"
> +
> +SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
> +BRANCH ?= "master"
> +
> +SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
> +SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
> +
> +SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h "

Gulp. While both :prepend and :append need to ensure whitespaces are 
explicitly added to separate entries in the list, those are needed at 
different places. It is tailing space for :prepend and leading space 
for :append, of course. Or use += here to be safe...


> +SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
> +
> +export prefix = "/opt/ltp"
> +export exec_prefix = "/opt/ltp"
> +
> +EXTRA_OEMAKE:append = " \
> +    KERNEL_USR_INC=${WORKDIR} \
> +    ALSA_INCPATH=${STAGING_INCDIR} \
> +    ALSA_LIBPATH=${STAGING_LIBDIR} \
> +"
> +
> +RDEPENDS:${PN} += "\
> +    acl \
> +    at \
> +    pm-qa \
> +    serialcheck \
> +    memtester \
> +"
> +
> +do_install:prepend() {
> +	# Upstream ltp recipe wants to remove this test case in do_install
> +	install -d ${D}${prefix}/runtest/
> +	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
> +}
> -- 
> 2.17.1

