Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BB229520E5
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2020 16:59:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 099GukXU099920
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2020 11:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602262606;
	bh=f5hLA3XOg0xO9nK4gauXhwQBnA1bPuRjbQN4N0nWaZ4=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=hsBdAGSSE9qKowSWc0ii04jIlTl3gSRY4RqkSB03yLB+qMZ6e80AuO12IkGmAJAtK
	lYHXlUp79HlvogMhSR5qeLgsjZRnQ6LyVe+nZS0ytrNG84K3Va2NYWRINbknJT04/A
	NMIdDEdpjnUZOjruS/4utm6VKnfeAKldp1YH9ZaY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 099GukxD055041
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2020 11:56:46 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 9 Oct 2020 11:56:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 9 Oct 2020 11:56:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 099GujM6122181
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2020 11:56:46 -0500
Date: Fri, 9 Oct 2020 12:56:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20201009165645.GM23230@beryl>
References: <1602200997-36918-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1602200997-36918-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [oe-layersetup][PATCH] arago-dunfell/next: un-pin meta-arm layer
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
X-List-Received-Date: Fri, 09 Oct 2020 16:59:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, this is meant for oe-layersetup per subject prefix

On Thu, Oct 08, 2020 at 07:49:57PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> It was pinned down some time ago due to baremetal toolchain conflicts, which
> got resolved since.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  configs/arago-dunfell-config.txt      | 2 +-
>  configs/arago-dunfell-next-config.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index c9428d9..e8ad1fa 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
> -meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index 3f225b7..8820086 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
> -meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> -- 
> 2.7.4
> 

