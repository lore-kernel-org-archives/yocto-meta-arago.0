Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4654C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 19:45:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.14141.1647632719377588132
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 12:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50DD840C62;
	Fri, 18 Mar 2022 19:45:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qGk_RA-b76w; Fri, 18 Mar 2022 19:45:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24A5A406B5;
	Fri, 18 Mar 2022 19:45:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D4FE41747D2; Fri, 18 Mar 2022 15:45:15 -0400 (EDT)
Date: Fri, 18 Mar 2022 15:45:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [oe-layersetup PATCH] configs: Switch github repos from git to
 https
Message-ID: <20220318194515.GC23554@denix.org>
References: <20220318172714.17656-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318172714.17656-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 19:45:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13674

On Fri, Mar 18, 2022 at 12:27:14PM -0500, Nishanth Menon wrote:
> github announced removal of support of unencrypted git:// last
> year[1], However, we still use git:// in many of our configurations.
> Switch them over to https://
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Also interesting is why are'nt we hearing wide-spread "oh oh.. it fails
> to build??" comments?

Because the actual builds have been fixed long ago:
https://git.openembedded.org/openembedded-core/commit/?id=b37b61e9a1e448a34957db9ae39285d21352552e
https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=4c6598f599ddd6e9678819449bd6be1fbdf338a7
https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=ae7f4644a637e22db4585cd6dd379cbfe4360766

Bitbake even has a workaround (and a warning) for this:
https://git.openembedded.org/bitbake/commit/?id=f05e19135b3ddee509c0cb427b3b9376bb4738d1
https://git.openembedded.org/bitbake/commit/?id=42526a402357e04794f4cb6f21ac18f562220a9b

These are configs for the layer setup mechanism, which got missed accidentally. 
This is a not well standardized area and people use different setup processes. 


> $ git clone git://github.com/meta-qt5/meta-qt5.git
> Cloning into 'meta-qt5'...
> fatal: remote error:
>   The unauthenticated git protocol on port 9418 is no longer supported.
> Please see https://github.blog/2021-09-01-improving-git-protocol-security-github/ for more information.
> 
> Also, should we start considering shifting all to https:// ?
> 
>  configs/arago-dunfell-config.txt      | 4 ++--
>  configs/arago-dunfell-next-config.txt | 4 ++--
>  configs/arago-master-config.txt       | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index 464b835b7a30..60cc72a8d86f 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -3,9 +3,9 @@
>  
>  bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>  meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
> -# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>  # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index 9657a727fda1..e2eb2023fec5 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -3,9 +3,9 @@
>  
>  bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>  meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>  # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index e4c6d7f0070e..bd0ccec58e16 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -3,8 +3,8 @@
>  
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
>  meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> -#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

