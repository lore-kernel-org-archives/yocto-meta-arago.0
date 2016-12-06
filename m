Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id CE8235298D
	for <meta-arago@arago-project.org>;
	Tue,  6 Dec 2016 03:55:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB63tUfk026795
	for <meta-arago@arago-project.org>; Mon, 5 Dec 2016 21:55:30 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB63tU8Z000660
	for <meta-arago@arago-project.org>; Mon, 5 Dec 2016 21:55:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 21:55:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB63tUmW028433;
	Mon, 5 Dec 2016 21:55:30 -0600
Date: Mon, 5 Dec 2016 22:55:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20161206035530.GF28380@edge>
References: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
	<1480595392-18576-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1480595392-18576-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-k2g-evm.sh: update for latest default env
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
X-List-Received-Date: Tue, 06 Dec 2016 03:55:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 01, 2016 at 07:29:52AM -0500, Jacob Stiffler wrote:
> * We now need to call "findfdt" so that "name_fdt" is defined.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


Please push both of these in.


> ---
>  setup-uboot-env-k2g-evm.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> index f41d278..c80e506 100755
> --- a/setup-uboot-env-k2g-evm.sh
> +++ b/setup-uboot-env-k2g-evm.sh
> @@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.m
>  do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
>  do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
>  
> -do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode} run_mon run_kern'\"" $cwd/setupBoard.minicom
> +do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
>  
>  do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

