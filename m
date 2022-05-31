Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E0AC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:35:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2249.1654025710365239376
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 May 2022 12:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A3F6D40C5F;
	Tue, 31 May 2022 19:35:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPh_mlstbTAv; Tue, 31 May 2022 19:35:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7DC4540C4E;
	Tue, 31 May 2022 19:35:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 210EA17495A; Tue, 31 May 2022 15:35:06 -0400 (EDT)
Date: Tue, 31 May 2022 15:35:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bhargav R <bgvmysore@gmail.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com
Subject: Re: [meta-arago] [PATCH] meta-arago-distro: classes:
 image_types_md5.bbclass: Fix hardcoded filename containing .rootfs to use
 IMAGE_NAME_SUFFIX.
Message-ID: <20220531193506.GD9834@denix.org>
References: <20220528081806.11354-1-bgvmysore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528081806.11354-1-bgvmysore@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 May 2022 19:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13883

On Sat, May 28, 2022 at 01:48:06PM +0530, Bhargav R wrote:
> From: bgvmysore <bgvmysore@gmail.com>
> 
> The filename for md5sum is is hardcoded with .rootfs as suffix.
> The build fails in do_image_tar if IMAGE_NAME_SUFFIX is set to a different value.
> Changing '.rootfs' to ${IMAGE_NAME_SUFFIX} to fix this issue.

FWIW, this is specific to Dunfell and this class is completely deprecated in 
master/Kirkstone.


> Signed-off-by: Bhargav Raviprakash <bgvmysore@gmail.com>
> ---
>  meta-arago-distro/classes/image_types_md5.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-arago-distro/classes/image_types_md5.bbclass
> index 9e2c04fa..4712e1a1 100644
> --- a/meta-arago-distro/classes/image_types_md5.bbclass
> +++ b/meta-arago-distro/classes/image_types_md5.bbclass
> @@ -1,9 +1,9 @@
>  inherit image_types
>  
>  COMPRESSIONTYPES += "gz.md5"
> -COMPRESS_CMD_gz.md5 = "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
> +COMPRESS_CMD_gz.md5 = "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz.md5"
>  IMAGE_TYPES += "tar.gz.md5"
>  
>  COMPRESSIONTYPES += "xz.md5"
> -COMPRESS_CMD_xz.md5 = "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
> +COMPRESS_CMD_xz.md5 = "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz.md5"
>  IMAGE_TYPES += "tar.xz.md5"
> -- 
> 2.34.1

