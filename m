Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CEAC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 19:25:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.116856.1692041132843802133
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 12:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5E6540C98;
	Mon, 14 Aug 2023 19:25:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VcXf-yvP_hw; Mon, 14 Aug 2023 19:25:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 860B440C30;
	Mon, 14 Aug 2023 19:25:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A1D56163C62; Mon, 14 Aug 2023 15:25:28 -0400 (EDT)
Date: Mon, 14 Aug 2023 15:25:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Aniket Limaye <a-limaye@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [meta-arago] [kirkstone][PATCH 5/6] meta-arago:
 remove extra plumbing for internal toolchain
Message-ID: <20230814192528.GH3359@denix.org>
References: <20230706212335.1893675-1-denis@denix.org>
 <20230706212335.1893675-6-denis@denix.org>
 <dfefcf02-11bd-75bb-4400-33e7e30463bf@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfefcf02-11bd-75bb-4400-33e7e30463bf@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Aug 2023 19:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14841

On Fri, Aug 11, 2023 at 05:00:30PM +0530, Aniket Limaye wrote:
> Hi Denys,
> 
> This is probably not about this new patch series for the r5f
> toolchain. I am facing issues with the internal toolchain for A72
> 
> I was trying out u-boot and linux builds with these new internal
> toolchains and everything works fine EXCEPT for u-boot-a72 build:
> 
> I get this error : "aarch64-oe-linux-ld.bfd: cannot find -lgcc: No
> such file or directory"
> 
> I narrowed down the error to incorrect Ldir being parsed in the
> u-boot Makefile here [1] which expects absolute path for the
> print-libgcc-file-name.
> 
> The build with the external toolchain works coz that prints the
> absolute path while the yocto internal toolchain is returning just
> the filename: ./bin/aarch64-none-linux-gnu-gcc
> -print-libgcc-file-name #Prints full path to libgcc.a file
> 
> ./linux-devkit/sysroots/x86_64-arago-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-gcc
> -print-libgcc-file-name #Prints just "libgcc.a". The dirname for
> this returns "."
> 
> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2023.04#n895
> 
> As it stands, I am unable to build u-boot with the internal
> toolchain. Either something needs to be fixed in the toolchain
> itself or I am missing some flag / Env variable?

Aniket,

You need to pass the correct --sysroot to gcc.

And the environment-setup-aarch64-oe-linux script properly sets CC variable 
already with the correct --sysroot of the installed linux-devkit:

$ echo $CC
aarch64-oe-linux-gcc -mbranch-protection=standard --sysroot=/tmp/sdk/sysroots/aarch64-oe-linux

$ $CC -print-libgcc-file-name
/tmp/sdk/sysroots/aarch64-oe-linux/usr/lib/aarch64-oe-linux/11.4.0/libgcc.a

You can pass this to the U-boot Makefile:

$ make CC="$CC" <any other vars> <target>

As a reference, u-boot recipe passes at least CROSS_COMPILE, CC and HOSTCC.

-- 
Denys

