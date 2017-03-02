Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5583752AD3
	for <meta-arago@arago-project.org>;
	Thu,  2 Mar 2017 21:06:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22L5sG0026596
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 15:05:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488488754;
	bh=lqluXztpi7qr7pQwxBWp4DAsJoI/jTq71TGQ1MTtoyE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=O5aOg2uZR54LbcL6B29e3eD2UB3YILYUK2S+QReamI9Cn05YMPsjLE2umIRGPUZv3
	fujXil2f6cVQELAinkT8dD/tUCHH9vDtuThui0JAfG5hgQsPEHGiQ0gZ67vkvWNYq7
	NsJcen/uxb0rgGRJt0RpjZcs2PRyBFWMFOmooqcM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22L5ngY011484
	for <meta-arago@arago-project.org>; Thu, 2 Mar 2017 15:05:49 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 15:05:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22L5mB1026118;
	Thu, 2 Mar 2017 15:05:48 -0600
Date: Thu, 2 Mar 2017 16:05:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20170302210547.GU12614@edge>
References: <1488487884-6257-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488487884-6257-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] LibArch: added K2G support for PSDK-RTOS.
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
X-List-Received-Date: Thu, 02 Mar 2017 21:06:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 02, 2017 at 03:51:24PM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/libarch-rtos/libarch-rtos_git.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/libarch-rtos/libarch-rtos_git.bb b/recipes-ti/libarch-rtos/libarch-rtos_git.bb
> index ce9cd49..e959f29 100644
> --- a/recipes-ti/libarch-rtos/libarch-rtos_git.bb
> +++ b/recipes-ti/libarch-rtos/libarch-rtos_git.bb
> @@ -4,7 +4,7 @@ include recipes-ti/libarch/libarch.inc
>  
>  PR = "${INC_PR}.tisdk-int3"
>  
> -COMPATIBLE_MACHINE_append = "|c667x-evm"
> +COMPATIBLE_MACHINE_append = "|c667x-evm|k2g-evm"

This is not in meta-arago ^^^^^^^^^^^^^^^^^^^^^^


>  DEPENDS_remove = "opencl \
>                    opencl-monitor \
> @@ -18,19 +18,17 @@ DEPENDS_append = " ti-ipc-rtos \
>  "
>  
>  TARGET_c667x-evm = "SOC_C6678"
> +TARGET_k2g-evm   = "SOC_K2G"
>  
>  # Variables required to compile libarch examples
>  export IPC_DIR       = "${IPC_INSTALL_DIR}"
>  export OMP_DIR       = "${OMP_INSTALL_DIR}"
> -export C6678_PDK_DIR = "${PDK_INSTALL_DIR}"
> +export PDK_DIR       = "${PDK_INSTALL_DIR}"
>  export EDMA3_DIR     = "${EDMA3_LLD_INSTALL_DIR}"
>  export LIBARCH_DIR   = "${S}/exports/libarch_${PV}"
>  
>  do_compile() {
>      make -f build/Makefile TARGET=${TARGET} LIBOS=LIB_RTOS
> -
> -    cd ${LIBARCH_DIR}/examples
> -    make TARGET=${TARGET} LIBOS=LIB_RTOS
>  }
>  
>  deltask do_create_srcipk
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

