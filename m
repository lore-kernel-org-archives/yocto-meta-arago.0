Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 49FCC52004
	for <meta-arago@arago-project.org>;
	Thu,  5 May 2016 18:43:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u45IhBkT008472
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 13:43:11 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45IhA3w005755
	for <meta-arago@arago-project.org>; Thu, 5 May 2016 13:43:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 May 2016 13:43:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u45IhAqx018046;
	Thu, 5 May 2016 13:43:10 -0500
Date: Thu, 5 May 2016 14:42:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160505184254.GK12998@edge>
References: <1462471748-17612-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1462471748-17612-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH] create-sdcard: use parted instead of sfdisk
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
X-List-Received-Date: Thu, 05 May 2016 18:43:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 05, 2016 at 02:09:08PM -0400, Jacob Stiffler wrote:
> * The options for sfdisk since version 2.26

Truncated sentence?


> * Ubuntu 16.04 contains sfdisk version 2.27.1
> * In order to retain compatibility from Ubuntu 12.04 through 16.04,i
>   use parted instead.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  create-sdcard.sh | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index 46ed5ae..edf57b0 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -501,13 +501,12 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
>  
>  echo DISK SIZE - $SIZE bytes
>  
> -CYLINDERS=`echo $SIZE/255/63/512 | bc`
> +parted -s $DRIVE mklabel msdos
> +parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> +parted -s $DRIVE set 1 boot on
> +parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
> +parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
>  
> -sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> -,9,0x0C,*
> -10,300,,-
> -310,,,-
> -EOF
>  
>  cat << EOM
>  
> @@ -560,12 +559,10 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
>  
>  echo DISK SIZE - $SIZE bytes
>  
> -CYLINDERS=`echo $SIZE/255/63/512 | bc`
> -
> -sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE << EOF
> -,9,0x0C,*
> -10,,,-
> -EOF
> +parted -s $DRIVE mklabel msdos
> +parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> +parted -s $DRIVE set 1 boot on
> +parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
>  
>  cat << EOM
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

