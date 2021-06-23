Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D15AA52A4F
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 22:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A963A40C53;
	Wed, 23 Jun 2021 22:10:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FluPf5k9pkYZ; Wed, 23 Jun 2021 22:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 70B0640BA7;
	Wed, 23 Jun 2021 22:10:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3CD57174613; Wed, 23 Jun 2021 18:10:29 -0400 (EDT)
Date: Wed, 23 Jun 2021 18:10:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210623221029.GN1528@denix.org>
References: <20210623214320.9645-1-nm@ti.com> <20210623214320.9645-3-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210623214320.9645-3-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup PATCH V2 2/3] configs: Get rid of ancient tracking configs
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
X-List-Received-Date: Wed, 23 Jun 2021 22:10:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 23, 2021 at 04:43:19PM -0500, Nishanth Menon wrote:
> Lets get rid of older configs that really don't make much sense.
> 
> https://wiki.yoctoproject.org/wiki/Releases
> 
> Our current support is attempted on dunfell and master at this point in
> time. Lets keeps things laser focussed by removing older tracking
> configs from the system. If folks do need such a configuration, they
> always have the option of picking it from git history.
> 
> While at this, drop the un-maintained latest-all-head-config which is
> redundant since we have master tracking config as well.
> 
> Suggested-by: Denys Dmytriyenko <denis@denix.org>
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> V2: New patch
> 
>  configs/arago-daisy-config.txt      | 12 ------------
>  configs/arago-danny-config.txt      | 11 -----------
>  configs/arago-denzil-config.txt     | 11 -----------
>  configs/arago-dora-config.txt       | 12 ------------
>  configs/arago-dylan-config.txt      | 12 ------------
>  configs/arago-fido-config.txt       | 12 ------------
>  configs/arago-krogoth-config.txt    | 12 ------------
>  configs/arago-morty-config.txt      | 14 --------------
>  configs/arago-rocko-config.txt      | 13 -------------
>  configs/arago-thud-config.txt       | 15 ---------------
>  configs/arago-zeus-config.txt       | 15 ---------------
>  configs/arago-zeus-next-config.txt  | 15 ---------------
>  configs/distroless-morty-config.txt |  7 -------
>  configs/distroless-rocko-config.txt |  7 -------
>  configs/distroless-thud-config.txt  |  7 -------
>  configs/distroless-zeus-config.txt  |  7 -------
>  configs/latest-all-head-config.txt  | 11 -----------
>  configs/poky-morty-config.txt       |  7 -------
>  configs/poky-rocko-config.txt       |  7 -------
>  configs/poky-thud-config.txt        |  7 -------
>  configs/poky-zeus-config.txt        |  7 -------
>  21 files changed, 221 deletions(-)
>  delete mode 100644 configs/arago-daisy-config.txt
>  delete mode 100644 configs/arago-danny-config.txt
>  delete mode 100644 configs/arago-denzil-config.txt
>  delete mode 100644 configs/arago-dora-config.txt
>  delete mode 100644 configs/arago-dylan-config.txt
>  delete mode 100644 configs/arago-fido-config.txt
>  delete mode 100644 configs/arago-krogoth-config.txt
>  delete mode 100644 configs/arago-morty-config.txt
>  delete mode 100644 configs/arago-rocko-config.txt
>  delete mode 100644 configs/arago-thud-config.txt
>  delete mode 100644 configs/arago-zeus-config.txt
>  delete mode 100644 configs/arago-zeus-next-config.txt
>  delete mode 100644 configs/distroless-morty-config.txt
>  delete mode 100644 configs/distroless-rocko-config.txt
>  delete mode 100644 configs/distroless-thud-config.txt
>  delete mode 100644 configs/distroless-zeus-config.txt
>  delete mode 100644 configs/latest-all-head-config.txt
>  delete mode 100644 configs/poky-morty-config.txt
>  delete mode 100644 configs/poky-rocko-config.txt
>  delete mode 100644 configs/poky-thud-config.txt
>  delete mode 100644 configs/poky-zeus-config.txt
> 
> diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
> deleted file mode 100644
> index 5b5bb841b140..000000000000
> --- a/configs/arago-daisy-config.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> diff --git a/configs/arago-danny-config.txt b/configs/arago-danny-config.txt
> deleted file mode 100644
> index 88334d244c87..000000000000
> --- a/configs/arago-danny-config.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,danny,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> diff --git a/configs/arago-denzil-config.txt b/configs/arago-denzil-config.txt
> deleted file mode 100644
> index 6a627c45a828..000000000000
> --- a/configs/arago-denzil-config.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,HEAD,layers=toolchain-layer:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,denzil,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,denzil,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> diff --git a/configs/arago-dora-config.txt b/configs/arago-dora-config.txt
> deleted file mode 100644
> index 84366c254fbb..000000000000
> --- a/configs/arago-dora-config.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.20,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,dora,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dora,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dora,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,dora,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dora,HEAD,layers=meta-linaro-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,dora,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.txt
> deleted file mode 100644
> index 7fcd48dc47ad..000000000000
> --- a/configs/arago-dylan-config.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
> deleted file mode 100644
> index 2fe6152ad847..000000000000
> --- a/configs/arago-fido-config.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,fido,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
> -meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
> deleted file mode 100644
> index 731a69d3a946..000000000000
> --- a/configs/arago-krogoth-config.txt
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
> -meta-ti,git://git.yoctoproject.org/meta-ti,krogoth,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,krogoth,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
> deleted file mode 100644
> index f4014fd3a988..000000000000
> --- a/configs/arago-morty-config.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> -meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> -meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-rocko-config.txt b/configs/arago-rocko-config.txt
> deleted file mode 100644
> index 14038aab407a..000000000000
> --- a/configs/arago-rocko-config.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
> -meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
> deleted file mode 100644
> index 5df05738172a..000000000000
> --- a/configs/arago-thud-config.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,thud,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
> -meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -# meta-ti,git://git.yoctoproject.org/meta-ti,thud,HEAD,layers=
> -meta-ti,git://git.yoctoproject.org/meta-ti,thud-next,HEAD,layers=
> -meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-zeus-config.txt b/configs/arago-zeus-config.txt
> deleted file mode 100644
> index d33b277c5164..000000000000
> --- a/configs/arago-zeus-config.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,zeus,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
> -meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
> -meta-virtualization,git://git.yoctoproject.org/meta-virtualization,zeus,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,zeus,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,zeus,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-zeus-next-config.txt b/configs/arago-zeus-next-config.txt
> deleted file mode 100644
> index 5377781692ba..000000000000
> --- a/configs/arago-zeus-next-config.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,zeus-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
> -meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
> -meta-virtualization,git://git.yoctoproject.org/meta-virtualization,zeus,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,zeus,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -meta-ti,git://git.yoctoproject.org/meta-ti,zeus-next,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,zeus,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/distroless-morty-config.txt b/configs/distroless-morty-config.txt
> deleted file mode 100644
> index 7c5938000fb1..000000000000
> --- a/configs/distroless-morty-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
> -meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/distroless-rocko-config.txt b/configs/distroless-rocko-config.txt
> deleted file mode 100644
> index b84add6be5b9..000000000000
> --- a/configs/distroless-rocko-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
> -meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/distroless-thud-config.txt b/configs/distroless-thud-config.txt
> deleted file mode 100644
> index cdd484b8bf2c..000000000000
> --- a/configs/distroless-thud-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
> -meta-ti,git://git.yoctoproject.org/meta-ti,thud,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/distroless-zeus-config.txt b/configs/distroless-zeus-config.txt
> deleted file mode 100644
> index 724bc2d789c4..000000000000
> --- a/configs/distroless-zeus-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
> -meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,zeus,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/latest-all-head-config.txt b/configs/latest-all-head-config.txt
> deleted file mode 100644
> index f6f164bd5897..000000000000
> --- a/configs/latest-all-head-config.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-angstrom,git://github.com/Angstrom-distribution/meta-angstrom.git,master,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=toolchain-layer:meta-oe:meta-gpe:meta-gnome:meta-efl:meta-xfce:meta-systemd:meta-multimedia:meta-initramfs
> -meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=
> -oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/poky-morty-config.txt b/configs/poky-morty-config.txt
> deleted file mode 100644
> index 6d7046550c2a..000000000000
> --- a/configs/poky-morty-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
> -poky,git://git.yoctoproject.org/poky,morty,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-poky.conf.sample
> diff --git a/configs/poky-rocko-config.txt b/configs/poky-rocko-config.txt
> deleted file mode 100644
> index 413a060b7174..000000000000
> --- a/configs/poky-rocko-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
> -poky,git://git.yoctoproject.org/poky,rocko,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-poky.conf.sample
> diff --git a/configs/poky-thud-config.txt b/configs/poky-thud-config.txt
> deleted file mode 100644
> index 79d53138450e..000000000000
> --- a/configs/poky-thud-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
> -poky,git://git.yoctoproject.org/poky,thud,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-ti,git://git.yoctoproject.org/meta-ti,thud,HEAD,layers=
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-poky.conf.sample
> diff --git a/configs/poky-zeus-config.txt b/configs/poky-zeus-config.txt
> deleted file mode 100644
> index d1d944a3c414..000000000000
> --- a/configs/poky-zeus-config.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
> -poky,git://git.yoctoproject.org/poky,zeus,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-ti,git://git.yoctoproject.org/meta-ti,zeus,HEAD,layers=
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-poky.conf.sample
> -- 
> 2.32.0
> 
k

