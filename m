Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 312A95298D
	for <meta-arago@arago-project.org>;
	Tue,  6 Dec 2016 03:54:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB63slpl026015
	for <meta-arago@arago-project.org>; Mon, 5 Dec 2016 21:54:47 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB63slJp032190
	for <meta-arago@arago-project.org>; Mon, 5 Dec 2016 21:54:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 21:54:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB63slMw027771;
	Mon, 5 Dec 2016 21:54:47 -0600
Date: Mon, 5 Dec 2016 22:54:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20161206035445.GE28380@edge>
References: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH 1/2] setup-uboot-env: am335x, am437x, am57xx: update for latest default env
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
X-List-Received-Date: Tue, 06 Dec 2016 03:54:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 01, 2016 at 07:29:51AM -0500, Jacob Stiffler wrote:
> * Latest default environment requires the the 'devtype' variable is
>   set for loading images such as the kernel.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  setup-uboot-env-am335x.sh     | 4 ++--
>  setup-uboot-env-am43x.sh      | 4 ++--
>  setup-uboot-env-am57xx-evm.sh | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
> index 1a65d5b..ba75b14 100644
> --- a/setup-uboot-env-am335x.sh
> +++ b/setup-uboot-env-am335x.sh
> @@ -211,7 +211,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  	    else
> @@ -219,7 +219,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  
> diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
> index b93b371..f7f2d95 100644
> --- a/setup-uboot-env-am43x.sh
> +++ b/setup-uboot-env-am43x.sh
> @@ -168,7 +168,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  	    else
> @@ -177,7 +177,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  
> diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
> index 4988b96..574c111 100644
> --- a/setup-uboot-env-am57xx-evm.sh
> +++ b/setup-uboot-env-am57xx-evm.sh
> @@ -178,7 +178,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  	    else
> @@ -186,7 +186,7 @@ else
>  		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
> -		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
> +		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
>  		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

