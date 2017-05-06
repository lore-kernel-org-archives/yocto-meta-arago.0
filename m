Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 9B446529E6
	for <meta-arago@arago-project.org>;
	Sat,  6 May 2017 01:08:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v46187nj011903
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 20:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494032887;
	bh=dqylh6wC1ojY6roolFVVcj1HT2MKG/WOZAsVl8T7Uhs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Pg/Varvt4xk4Wo6AeyBuk8ehLRGvayG74+XIStOpzrG74/byqOLFCmUtyEIFQWJ7l
	6Sla0Wb+YlZa4nehZ8fubhi0iZcVLVZDWPhkO3Gq7KBurpO8noRaeR8w32xJLkZmo6
	7XSDhm/3AXAkk7YxQDUSgO/C/eRzNqmxQ577y5qY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v46187X0023203
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 20:08:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 May 2017 20:08:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v46187Nh006203;
	Fri, 5 May 2017 20:08:07 -0500
Date: Fri, 5 May 2017 21:08:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170506010806.GN20769@edge>
References: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v2 1/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package for k2 and omapl138
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
X-List-Received-Date: Sat, 06 May 2017 01:08:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Sorry for misleading you - I was under the impression that server-extra 
packagegroup is the one responsible for server-extra image... Apparently it 
is not and server-extra packagegroup goes directly into the main server image.

Once it failed again for the same reason, I finally looked into it closer and 
the way to feed into server-extra image is through EXTRA_PACKAGES variable 
inside the tisdk-addons packagegroup. I sent a reworked patch after testing it 
locally. Sorry again for the confusion.

BTW, we need to fix this going forward, as it's not very intuitive...

-- 
Denys


On Thu, May 04, 2017 at 11:02:25PM -0400, Sam Nelson wrote:
> ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
> examples
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Updated PR
> ---
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 784c5b4..d9b3391 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r16"
> +PR = "r17"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
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

