Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3A082529B5
	for <meta-arago@arago-project.org>;
	Tue, 13 Oct 2015 17:24:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9DHOjTi006859
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:24:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHOjc8000502
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:24:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 12:24:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHOiuS008093;
	Tue, 13 Oct 2015 12:24:44 -0500
Date: Tue, 13 Oct 2015 13:24:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151013172428.GJ28164@edge>
References: <1444401783-24716-1-git-send-email-j-stiffler@ti.com>
	<1444401783-24716-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1444401783-24716-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] opencl-monitor: Move firmware to allow for other firmwares
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
X-List-Received-Date: Tue, 13 Oct 2015 17:24:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can update-alternatives help here?


On Fri, Oct 09, 2015 at 10:43:03AM -0400, Jacob Stiffler wrote:
> * Add symlink to make opencl-monitor firmware the default.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> index 336d068..9ff4b5b 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD"
>  include ocl.inc
>  require recipes-ti/includes/ti-paths.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  inherit cmake
>  
> @@ -47,6 +47,20 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
>  export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
>  export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
>  
> +do_install_append() {
> +    mv ${D}/lib/firmware/dra7-dsp1-fw.xe66 \
> +       ${D}/lib/firmware/dra7-dsp1-fw.xe66.ocl
> +
> +    mv ${D}/lib/firmware/dra7-dsp2-fw.xe66 \
> +       ${D}/lib/firmware/dra7-dsp2-fw.xe66.ocl
> +
> +    ln -s dra7-dsp1-fw.xe66.ocl \
> +          ${D}/lib/firmware/dra7-dsp1-fw.xe66
> +
> +    ln -s dra7-dsp2-fw.xe66.ocl \
> +          ${D}/lib/firmware/dra7-dsp2-fw.xe66
> +}
> +
>  MONITOR_FIRMWARE = ""
>  MONITOR_FIRMWARE_dra7xx = "${base_libdir}/firmware/*"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

