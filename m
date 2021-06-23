Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1786B52A4F
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 22:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D14840C53;
	Wed, 23 Jun 2021 22:11:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lXDIsicAxeBf; Wed, 23 Jun 2021 22:11:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 109C840BA7;
	Wed, 23 Jun 2021 22:11:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D1CD1174613; Wed, 23 Jun 2021 18:11:19 -0400 (EDT)
Date: Wed, 23 Jun 2021 18:11:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210623221119.GO1528@denix.org>
References: <20210623214320.9645-1-nm@ti.com> <20210623214320.9645-4-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210623214320.9645-4-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup PATCH V2 3/3] configs: arago*.txt: Revise meta-arago repo towards yoctoproject.org primary
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jun 2021 22:11:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 23, 2021 at 04:43:20PM -0500, Nishanth Menon wrote:
> Now that yoctoproject.org git repo is live, lets move references away
> from arago-project.org.
> 
> This is one of the initial cleanup steps towards eventually sunsetting
> the arago-project.org
> 
> See sample-files/gitconfig.sample for examples of how to redirect
> repository using older urls to new locations
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes since V1:
> * Patch is now trimmed to just the relevant arago configurations
> * Updated $subject to be more arago focussed.
> 
> V1: http://arago-project.org/pipermail/meta-arago/2021-June/013225.html
> 
>  configs/arago-dunfell-config.txt      | 2 +-
>  configs/arago-dunfell-next-config.txt | 2 +-
>  configs/arago-master-config.txt       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index 173499bb3f8e..464b835b7a30 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -2,7 +2,7 @@
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  
>  bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
>  # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>  # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index 9f5eeb9a83e7..9657a727fda1 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -2,7 +2,7 @@
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  
>  bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
>  # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>  # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index f989ee125734..07886793a7ab 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -2,7 +2,7 @@
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> +meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
>  #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> -- 
> 2.32.0
> 

