Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6A15B52A4B
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 19:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5BFE740C53;
	Wed, 23 Jun 2021 19:09:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GKR5N031o1od; Wed, 23 Jun 2021 19:09:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27DE0409E0;
	Wed, 23 Jun 2021 19:09:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D616B174603; Wed, 23 Jun 2021 15:09:39 -0400 (EDT)
Date: Wed, 23 Jun 2021 15:09:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210623190939.GH1528@denix.org>
References: <20210623023538.32735-1-nm@ti.com>
	<20210623023538.32735-3-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210623023538.32735-3-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup PATCH 2/3] configs: Redirect older meta-ti to yoctoproject primary repo
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
X-List-Received-Date: Wed, 23 Jun 2021 19:09:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'd suggest moving out such old "legacy" configs up till at least Rocko into a 
separate folder (if not remove completely):

Rocko
Pyro
Morty
Krogoth
Jethro
Fido
Dizzy
Daisy
Dora
Dylan
Danny
Denzil

E.g. "Denzil" was released all the way back in 2012!
https://wiki.yoctoproject.org/wiki/Releases



On Tue, Jun 22, 2021 at 09:35:37PM -0500, Nishanth Menon wrote:
> Redirect the older meta-ti references from arago-project to yoctoproject
> primary repository.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  configs/arago-daisy-config.txt     | 2 +-
>  configs/arago-danny-config.txt     | 2 +-
>  configs/arago-denzil-config.txt    | 2 +-
>  configs/arago-dora-config.txt      | 2 +-
>  configs/arago-dylan-config.txt     | 2 +-
>  configs/arago-fido-config.txt      | 2 +-
>  configs/latest-all-head-config.txt | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
> index 5b5bb841b140..944ae3c1dbda 100644
> --- a/configs/arago-daisy-config.txt
> +++ b/configs/arago-daisy-config.txt
> @@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,daisy,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-danny-config.txt b/configs/arago-danny-config.txt
> index 88334d244c87..b3efb76348b3 100644
> --- a/configs/arago-danny-config.txt
> +++ b/configs/arago-danny-config.txt
> @@ -4,7 +4,7 @@
>  bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,danny,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,danny,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
>  oe-core,git://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-denzil-config.txt b/configs/arago-denzil-config.txt
> index 6a627c45a828..818e4222bea9 100644
> --- a/configs/arago-denzil-config.txt
> +++ b/configs/arago-denzil-config.txt
> @@ -4,7 +4,7 @@
>  bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,HEAD,layers=toolchain-layer:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,denzil,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,denzil,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,HEAD,layers=
>  oe-core,git://git.openembedded.org/openembedded-core,denzil,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
> diff --git a/configs/arago-dora-config.txt b/configs/arago-dora-config.txt
> index 84366c254fbb..d4f4de9bf639 100644
> --- a/configs/arago-dora-config.txt
> +++ b/configs/arago-dora-config.txt
> @@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.20,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,dora,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dora,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dora,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,dora,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,dora,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dora,HEAD,layers=meta-linaro-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,dora,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.txt
> index 7fcd48dc47ad..3054a9dd7630 100644
> --- a/configs/arago-dylan-config.txt
> +++ b/configs/arago-dylan-config.txt
> @@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf6290
>  meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,dylan,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
> index 2fe6152ad847..86a40773045e 100644
> --- a/configs/arago-fido-config.txt
> +++ b/configs/arago-fido-config.txt
> @@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,fido,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,fido,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/latest-all-head-config.txt b/configs/latest-all-head-config.txt
> index f6f164bd5897..aeb634d07ac0 100644
> --- a/configs/latest-all-head-config.txt
> +++ b/configs/latest-all-head-config.txt
> @@ -4,7 +4,7 @@ bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-angstrom,git://github.com/Angstrom-distribution/meta-angstrom.git,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=toolchain-layer:meta-oe:meta-gpe:meta-gnome:meta-efl:meta-xfce:meta-systemd:meta-multimedia:meta-initramfs
> -meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=
>  oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -- 
> 2.32.0
> 

