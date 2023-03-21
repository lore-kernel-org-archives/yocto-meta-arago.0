Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACBAC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 22:10:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28525.1679436641333156231
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 15:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA87540C46
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZLG1W2urXD3 for <meta-arago@lists.yoctoproject.org>;
	Tue, 21 Mar 2023 22:10:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B4FB40C06
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F3E681637C5; Tue, 21 Mar 2023 18:10:07 -0400 (EDT)
Date: Tue, 21 Mar 2023 18:10:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [kirkstone/master][PATCH 4/4]
 packagegroup-arago-base-tisdk: adjust for removal of OPTEEOUTPUTMACHINE
Message-ID: <20230321221007.GK18050@denix.org>
References: <20230321190428.2818600-1-denis@denix.org>
 <174E8491A33B0884.22739@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174E8491A33B0884.22739@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14270

Please use v2 of this patch.


On Tue, Mar 21, 2023 at 07:04:28PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> OPTEEOUTPUTMACHINE usage was removed from K3 platforms in meta-ti. Since K3
> platforms all use optee, include corresponding components unconditionally.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk.bb            | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 292676c1..1c63fe89 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -27,5 +27,7 @@ RDEPENDS:${PN} = "\
>      nfs-utils-client \
>      cifs-utils \
>      phytool \
> -    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti k3', "${OPTEE_PKGS}", "", d)} \
> +    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
>  "
> +
> +RDEPENDS:${PN}:append:k3 = "${OPTEE_PKGS}"
> -- 
> 2.25.1

