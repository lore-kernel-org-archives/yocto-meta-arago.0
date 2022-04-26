Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4D4C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:04:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.411.1651007081524362191
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 57EED40C24;
	Tue, 26 Apr 2022 21:04:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAdxfVGeTTFT; Tue, 26 Apr 2022 21:04:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F54740A03;
	Tue, 26 Apr 2022 21:04:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B8791748E1; Tue, 26 Apr 2022 17:04:36 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:04:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Nishanth Menon <nm@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH] Fix non-standard shell usage
Message-ID: <20220426210436.GB9834@denix.org>
References: <20220426200529.19956-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200529.19956-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13801

On Tue, Apr 26, 2022 at 03:05:29PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> Remove some Bashisms that prevent prevent this script from working
> on stock Ubuntu (with Dash default interpreter).
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  oe-layertool-setup.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index f171f94..e05737b 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -780,7 +780,7 @@ print_image_names() {
>      for FOLDER in ${FOLDERS}
>      do
>          RECO=""
> -        if [ "${FOLDER}" == "meta-arago" ]; then
> +        if [ "${FOLDER}" = "meta-arago" ]; then
>              RECO="[recommended]"
>          fi
>          echo "From ${FOLDER}${RECO}:"
> @@ -796,7 +796,7 @@ print_image_names() {
>                      if [ -z "${summary}" ]; then
>                          summary="No Summary available"
>                      fi
> -                    echo -e "\t${name}: ${summary}"
> +                    echo "    ${name}: ${summary}"
>                  done
>              fi
>          done
> -- 
> 2.17.1

