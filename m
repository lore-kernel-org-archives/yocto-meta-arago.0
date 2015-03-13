Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0D3865299E
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 13:57:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DDvnV5026137
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:57:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDvmYF009896
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:57:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 08:57:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDvlFH019340;
	Fri, 13 Mar 2015 08:57:47 -0500
Date: Fri, 13 Mar 2015 09:57:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150313135747.GS24885@edge>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH] create-sdcard: Change SDK install prefix from ti-sdk to processor-sdk.
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
X-List-Received-Date: Fri, 13 Mar 2015 13:57:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is going to affect all the SDKs - ti-sdk was chosen on purpose to be 
generic enough to cover all our SDKs, not some specific one...


On Fri, Mar 13, 2015 at 09:49:04AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  create-sdcard.sh |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index ca02ad2..17ae564 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -74,7 +74,7 @@ if [ "$AMIROOT" != "root" ] ; then
>  fi
>  
>  THEPWD=$EXEPATH
> -PARSEPATH=`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
> +PARSEPATH=`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
>  
>  if [ "$PARSEPATH" != "" ] ; then
>  PATHVALID=1
> @@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  
>  	#check that in the right directory
>  
> -	THEEVMSDK=`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +	THEEVMSDK=`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
>  
>  	if [ $PATHVALID -eq 1 ]; then
>  	echo "now installing:  $THEEVMSDK"
> @@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  			then
>  				echo "Directory exists"
>  				echo ""
> -				PARSEPATH=`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0-9]/'`
> +				PARSEPATH=`echo $SDKFILEPATH | grep -o '.*processor-sdk.*.[0-9]/'`
>  				#echo $PARSEPATH
>  
>  				if [ "$PARSEPATH" != "" ] ; then
> @@ -731,7 +731,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  				#echo $PATHVALID
>  				if [ $PATHVALID -eq 1 ] ; then
>  
> -				THEEVMSDK=`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +				THEEVMSDK=`echo $SDKFILEPATH | grep -o 'processor-sdk-.*[0-9]'`
>  				echo "Is this the correct SDK: $THEEVMSDK"
>  				echo ""
>  				read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> @@ -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  					*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
>  					esac
>  				else
> -				echo "Invalid SDK path make sure to include ti-sdk-xxxx"
> +				echo "Invalid SDK path make sure to include processor-sdk-xxxx"
>  				ENTERCORRECTLY=0
>  				fi
>  
> @@ -804,7 +804,7 @@ cat << EOM
>        e.x. $:  /home/user/MyCustomTars/boot.tar.gz
>  
>    If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/board-support/prebuilt-images/
> +      e.x. $: /processor-sdk/board-support/prebuilt-images/
>  
>    NOTE: Not all platforms will have an MLO file and this file can
>          be ignored for platforms that do not support an MLO.
> @@ -937,7 +937,7 @@ cat << EOM
>        e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
>  
>    If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/targetNFS/
> +      e.x. $: /processor-sdk/targetNFS/
>  
>  ################################################################################
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

