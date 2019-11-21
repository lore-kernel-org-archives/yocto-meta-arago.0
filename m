Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 68E2B529F6
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2019 18:18:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xALIGwU9048064
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2019 12:16:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574360218;
	bh=XJe/jVr1fvmJJ0LirodDQmwHn+2Fcm+rNbBdWDFFk74=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DQd5RazPC+LwwHp+xBFEJ/0rD6Hw2ihn+Dnb9M4TYVBTnvcNfNz8FX/e4kUj+GTvo
	gi6Oco573y9covXB7zZPumA/rmCnuD2fvVjOFvzIl2ciZ5MOzs4n/dIHNI7w7hluEU
	V3/gTFz8OAMrIb8egGSxKqGt2Z1iC7CCGdBd/yZM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xALIGwVx005292
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2019 12:16:58 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 21 Nov 2019 12:16:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 21 Nov 2019 12:16:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xALIGtpa071772;
	Thu, 21 Nov 2019 12:16:55 -0600
Date: Thu, 21 Nov 2019 13:16:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20191121181655.GD27719@beryl>
References: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, grygorii.strashko@ti.com, nsekhar@ti.com
Subject: Re: [thud/master] [PATCH] branding: core: Autoload rpmsg_kdrv_switch for j7-evm
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
X-List-Received-Date: Thu, 21 Nov 2019 18:18:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nikhil,

This is the wrong place to do it. If rpmsg_kdrv_switch is in-tree module, then 
simply add this to the kernel recipe:

KERNEL_MODULE_AUTOLOAD_append_j7-evm = " rpmsg_kdrv_switch"

-- 
Denys


On Wed, Nov 20, 2019 at 04:43:43PM +0530, Nikhil Devshatwar wrote:
> rpmsg_kdrv_switch kernel module is needed for the cpsw9g virtual net
> driver. Since there is no symbol dependency, rpmsg_kdrv_switch
> does not get loaded automatically.
> 
> Add branding file override for j7-evm to autoload this module.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Fixes: LCPD-17113
> 
>  meta-arago-distro/conf/distro/include/branding-core.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index cab9831..c70f8d1 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -11,3 +11,8 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
>  
>  # Raise priority for sample IPC FW images
>  ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
> +
> +# Autoload the kernel module
> +KERNEL_MODULE_AUTOLOAD_EXTRAS = ""
> +KERNEL_MODULE_AUTOLOAD_EXTRAS_j7-evm += "rpmsg_kdrv_switch"
> +KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

