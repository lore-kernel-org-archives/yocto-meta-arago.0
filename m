Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 87058529E4
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2015 12:12:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB7CCdW7027909;
	Mon, 7 Dec 2015 06:12:39 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7CCdlo005336;
	Mon, 7 Dec 2015 06:12:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Dec 2015 06:12:38 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB7CCcrP006610;
	Mon, 7 Dec 2015 06:12:38 -0600
Message-ID: <566577B6.20606@ti.com>
Date: Mon, 7 Dec 2015 07:12:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1449282304-13964-1-git-send-email-denis@denix.org>
	<1449282304-13964-2-git-send-email-denis@denix.org>
In-Reply-To: <1449282304-13964-2-git-send-email-denis@denix.org>
Subject: Re: [PATCH 2/2] opencl-monitor: fix alternatives handling
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
X-List-Received-Date: Mon, 07 Dec 2015 12:12:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

NAK


This breaks opencl-monitor for keystone as there is no dra7-dsp$i-fw.xe66.

Why was this change necessary? According to the documentation, 
update-alternatives will automatically do this renaming.

Frm openembedded-core/meta/classes/update-alternative.bbclass:
 >>>
# NOTE: If the ALTERNATIVE_LINK_NAME and ALTERNATIVE_TARGET are the same,
# ALTERNATIVE_TARGET will have '.{BPN}' appended to it.  If the file
# referenced has not been renamed, it will also be renamed.  (This avoids
# the need to rename alternative files in the do_install step, but still
# supports it if necessary for some reason.)
<<<

- Jake


On 12/4/2015 9:25 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> index fbc4949..6657ba8 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> @@ -47,9 +47,15 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
>   export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
>   export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
>   
> +do_install_append() {
> +	for i in 1 2; do mv ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66 ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66.${BPN}; done
> +}
> +
>   ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
> -ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "/lib/firmware/dra7-dsp1-fw.xe66"
> -ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "/lib/firmware/dra7-dsp2-fw.xe66"
> +ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
> +ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
> +ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
> +ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"
>   ALTERNATIVE_PRIORITY = "100"
>   
>   MONITOR_FIRMWARE = ""


