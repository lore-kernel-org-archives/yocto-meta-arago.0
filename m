Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 38F3C52998
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 18:30:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OIUc2N016766
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 13:30:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OIUcv9008660
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 13:30:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 13:30:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OIUc9T028420;
	Tue, 24 Sep 2013 13:30:38 -0500
Date: Tue, 24 Sep 2013 14:30:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130924183037.GA5945@edge>
References: <1380047609-24150-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380047609-24150-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Tue, 24 Sep 2013 18:30:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks mostly Ok to me.

On Tue, Sep 24, 2013 at 01:33:29PM -0500, Chase Maupin wrote:
> * This script took a parameter using -d to set the DL_DIR but
>   ignored that setting.  Now if that is set make the the DL_DIR
>   value in conf/local.conf
> * When running this script to get updates changes that were made
>   to DL_DIR were lost because local.conf was copied over.  Now
>   the script will use the old DL_DIR setting.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  oe-layertool-setup.sh |   19 +++++++++++++++++--
>  1 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index 55cd174..32ed133 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/sh -x

Do you need this change?


>  # OE Build Enviroment Setup Script
>  #
> @@ -732,6 +732,22 @@ EOM
>      threads=`cat /proc/cpuinfo | grep -c processor`
>      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${threads}\"/" $confdir/local.conf
>      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${threads}\"/" $confdir/local.conf
> +
> +    # Find if old DL_DIR was set
> +    if [ -e $confdir/local.conf.bak ]
> +    then
> +        old_dldir=`cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g'`
> +    else
> +        old_dldir="$dldir"
> +    fi
> +
> +    # If command line option was not set use the old dldir
> +    if [ "x$dldir" == "x" ]
> +    then
> +        dldir=$old_dldir
> +    fi
> +
> +    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
>  }
>  
>  
> @@ -838,7 +854,6 @@ cd -
>  sourcedir="$oebase/sources"
>  builddir="$oebase/build"
>  confdir="$builddir/conf"
> -dldir="$oebase/downloads"
>  
>  check_input
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

