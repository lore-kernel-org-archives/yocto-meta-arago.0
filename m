Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1EEB252A1B
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 18:33:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SIXQGu006705
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 13:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493404406;
	bh=KXUVE+m8xmnJBp0ToakIrkfLWRxIQHRh8y4JgFwYIVU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tk2rYIDceiJbJI5aInyrQQyKC/WZ8zLdlRkSQUITLTfHXfbOMqMKoFqBqSTJPZ602
	6ELQgYZzNCE4fNRggz5qKrqxeKWMHME4lFj6wt/mShbT7HRKvxF28kcECy2NZ/YH+M
	4CGqIFoDL/5s3DBru7rL5fOXsY6wN/OE/pmbL8Rk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIXK7o031387
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 13:33:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 13:33:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SIXK7m007758;
	Fri, 28 Apr 2017 13:33:20 -0500
Date: Fri, 28 Apr 2017 14:33:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170428183319.GO31608@edge>
References: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
	<1493402320-11537-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493402320-11537-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v2 2/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package
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
X-List-Received-Date: Fri, 28 Apr 2017 18:33:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,


On Fri, Apr 28, 2017 at 01:58:40PM -0400, Sam Nelson wrote:
> ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
> examples
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 784c5b4..f0248d3 100644
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
> @@ -116,6 +117,8 @@ ARAGO_TI_KEYSTONE_PKGS = "\
>  
>  ARAGO_TI_PKGS = ""
>  ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
> +ARAGO_TI_PKGS_append_omap-a15 = " ti-ipc-examples-linux"

"server" packagegroups are not used for omap-a15 devives, hence ipc examples 
won't be added to those platforms, only keystone and omapl138 below.


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

