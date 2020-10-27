Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 02AAD52986
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 18:56:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RIrLkq058476
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603824801;
	bh=3uOhlNbRNxURmbbi+ZDvJv16Dljim7DwTuo4Iyn4Zh8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ot/nKRJTmJ1dIG/zUbVsapztZqjik1DbCFOLspjTwdbqffwvT/qM4xzzcjvKlZVFX
	+mmGiy/+vfojF8JA+LaTtYaHWLGH7WFqImyJGCmofun/6/Jpl3L+8bvGK5AfAV+ZRa
	ChEgjQ2Z8BdL2zTY6ZsY8YoUqD7xXbAi0jXxIliY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RIrLHJ089855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:53:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 13:53:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 13:53:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RIrLRZ042488;
	Tue, 27 Oct 2020 13:53:21 -0500
Date: Tue, 27 Oct 2020 14:53:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201027185321.GW19741@beryl>
References: <20201027184115.23835-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201027184115.23835-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] oe-layer-setup: Clean up -next configs that are no longer supported
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
X-List-Received-Date: Tue, 27 Oct 2020 18:56:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 27, 2020 at 01:41:15PM -0500, Dan Murphy wrote:
> From: Dan Murphy <dmurphy@ti.com>
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  configs/arago-morty-next-config.txt     | 14 --------------
>  configs/arago-morty-next-rel-config.txt | 14 --------------
>  configs/arago-rocko-next-config.txt     | 13 -------------
>  configs/arago-thud-next-config.txt      | 14 --------------
>  4 files changed, 55 deletions(-)
>  delete mode 100644 configs/arago-morty-next-config.txt
>  delete mode 100644 configs/arago-morty-next-rel-config.txt
>  delete mode 100644 configs/arago-rocko-next-config.txt
>  delete mode 100644 configs/arago-thud-next-config.txt
> 
> diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-config.txt
> deleted file mode 100644
> index a8553522860d..000000000000
> --- a/configs/arago-morty-next-config.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> -meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> -meta-ti,git://git.yoctoproject.org/meta-ti,morty-next,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-morty-next-rel-config.txt b/configs/arago-morty-next-rel-config.txt
> deleted file mode 100644
> index dfd6f473b672..000000000000
> --- a/configs/arago-morty-next-rel-config.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,morty-next-rel,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> -meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> -meta-ti,git://git.yoctoproject.org/meta-ti,morty-next-rel,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-rocko-next-config.txt b/configs/arago-rocko-next-config.txt
> deleted file mode 100644
> index 01b1c66442ea..000000000000
> --- a/configs/arago-rocko-next-config.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,rocko-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
> -meta-ti,git://git.yoctoproject.org/meta-ti,rocko-next,HEAD,layers=
> -meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-thud-next-config.txt b/configs/arago-thud-next-config.txt
> deleted file mode 100644
> index 5c930b1dab54..000000000000
> --- a/configs/arago-thud-next-config.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# This file takes repo entries in the format
> -# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> -
> -bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
> -meta-arago,git://arago-project.org/git/meta-arago.git,thud-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
> -meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -meta-ti,git://git.yoctoproject.org/meta-ti,thud-next,HEAD,layers=
> -meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
> -oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
> -OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> -- 
> 2.28.0.585.ge1cfff676549
> 

