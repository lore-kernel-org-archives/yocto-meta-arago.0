Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B68CA52B92
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 21:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC74840C81;
	Fri, 16 Apr 2021 22:00:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DHY6Em1XPz9G; Fri, 16 Apr 2021 22:00:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F256407FE;
	Fri, 16 Apr 2021 22:00:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5B4171745B8; Fri, 16 Apr 2021 18:00:18 -0400 (EDT)
Date: Fri, 16 Apr 2021 18:00:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210416220018.GF15937@denix.org>
References: <20210416203437.7334-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210416203437.7334-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: Re: [dunfell/master][PATCH] oe-layertool-setup: Let user change parallel build options
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
X-List-Received-Date: Fri, 16 Apr 2021 21:59:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I guess this is for [oe-layersetup] project, not [dunfell/master] branch of 
meta-arago, recipe oe-layertool-setup :)


You are changing local.conf, which is user-modifiable anyway, so what's the 
point in making it weak here?


On Fri, Apr 16, 2021 at 03:34:37PM -0500, Gowtham Tammana wrote:
> Change BB_NUMBER_THREADS and PARALLEL_MAKE to weak assignment so that
> these can be changed when building recipes. Useful on machines with
> lower resources.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> 
> Changing parallel build options is the only way I can build the complete image
> on my system :).
> 
> Thanks,
> Gowtham
> 
>  oe-layertool-setup.sh                           | 4 ++--
>  sample-files/local-amsdk.conf.sample            | 4 ++--
>  sample-files/local-arago.conf.sample            | 4 ++--
>  sample-files/local-arago64.conf.sample          | 4 ++--
>  sample-files/local-glsdk.conf.sample            | 4 ++--
>  sample-files/local-poky.conf.sample             | 4 ++--
>  sample-files/local-processor-sdk-64.conf.sample | 4 ++--
>  sample-files/local-processor-sdk.conf.sample    | 4 ++--
>  sample-files/local.conf.sample                  | 4 ++--
>  9 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index aa16042..df1523f 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -753,8 +753,8 @@ EOM
>      # set the number of threads
>      threads=`cat /proc/cpuinfo | grep -c processor`
>      tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
> -    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${tnum}\"/" $confdir/local.conf
> -    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${tnum}\"/" $confdir/local.conf
> +    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${tnum}\"/" $confdir/local.conf
> +    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${tnum}\"/" $confdir/local.conf
>  
>      # Find if old DL_DIR was set
>      if [ -e $confdir/local.conf.bak ]
> diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-amsdk.conf.sample
> index 756286d..ac39788 100644
> --- a/sample-files/local-amsdk.conf.sample
> +++ b/sample-files/local-amsdk.conf.sample
> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago.conf.sample
> index 96dfaf9..62f0f92 100644
> --- a/sample-files/local-arago.conf.sample
> +++ b/sample-files/local-arago.conf.sample
> @@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-arago64.conf.sample b/sample-files/local-arago64.conf.sample
> index f48db77..68f0bff 100644
> --- a/sample-files/local-arago64.conf.sample
> +++ b/sample-files/local-arago64.conf.sample
> @@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-glsdk.conf.sample b/sample-files/local-glsdk.conf.sample
> index acd094f..189730a 100644
> --- a/sample-files/local-glsdk.conf.sample
> +++ b/sample-files/local-glsdk.conf.sample
> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-poky.conf.sample
> index 34b6b10..ba5d4c1 100644
> --- a/sample-files/local-poky.conf.sample
> +++ b/sample-files/local-poky.conf.sample
> @@ -135,12 +135,12 @@ PATCHRESOLVE = "noop"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
> index 75e59f1..9087be9 100644
> --- a/sample-files/local-processor-sdk-64.conf.sample
> +++ b/sample-files/local-processor-sdk-64.conf.sample
> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-files/local-processor-sdk.conf.sample
> index d5af93a..59b11e6 100644
> --- a/sample-files/local-processor-sdk.conf.sample
> +++ b/sample-files/local-processor-sdk.conf.sample
> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "0"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sample
> index d971b97..e60bedc 100644
> --- a/sample-files/local.conf.sample
> +++ b/sample-files/local.conf.sample
> @@ -135,12 +135,12 @@ PATCHRESOLVE = "noop"
>  # These two options control how much parallelism BitBake should use. The first 
>  # option determines how many tasks bitbake should run in parallel:
>  #
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS ?= "1"
>  # 
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
> -PARALLEL_MAKE = "-j 1"
> +PARALLEL_MAKE ?= "-j 1"
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example
> -- 
> 2.31.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

