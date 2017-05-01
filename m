Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7B33A529A8
	for <meta-arago@arago-project.org>;
	Mon,  1 May 2017 21:48:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41LmTpM017480
	for <meta-arago@arago-project.org>; Mon, 1 May 2017 16:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493675309;
	bh=Dc2yk0y0hHUB836Aa3ywEuUzsUb4a1b6aIeNXHyPHes=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=d++Y++Jeu/cv7hwaB1RSu1iKt1IvBzmFODoI/D9v9AsnXCcwqK8LPatCb1iG0dZRL
	PvmKiYLw9UiYJ1dimPlALoFn2p7UiXspNJvHwFsY2yRw1w5ekUj7bCiWyGZzyNnliU
	rYJTh8+wcxqJbSxPtnaDDdWS+VjnaeX4ze9JMKUY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41LmTR0018356
	for <meta-arago@arago-project.org>; Mon, 1 May 2017 16:48:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 16:48:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41LmSWd000331;
	Mon, 1 May 2017 16:48:28 -0500
Date: Mon, 1 May 2017 17:48:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170501214828.GX31608@edge>
References: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
	<1493410824-49935-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493410824-49935-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v3 2/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package
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
X-List-Received-Date: Mon, 01 May 2017 21:48:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 28, 2017 at 04:20:24PM -0400, Sam Nelson wrote:
> ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
> examples
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous patch
> Remove for omap-a15

Does it mean omap-a15 won't have ipc examples? Don't you need to add them to 
another packagegroup?


> ---
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 784c5b4..56be64e 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -106,6 +106,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>      ipsecmgr-mod \
>      k2-initramfs \
>      parse-ip \
> +    ti-ipc-examples-linux \
>      "
>  
>  # The following packages are not yet ready for k2g-evm
> @@ -116,6 +117,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>  
>  ARAGO_TI_PKGS = ""
>  ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
> +ARAGO_TI_PKGS_append_omapl138 = " ti-ipc-examples-linux"
>  
>  # Disable netapi due to libnl and xfrm conflict
>  #    netapi
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

