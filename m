Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8DA855299E
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 14:02:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DE2Sro016811
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 09:02:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DE2RPb021575
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 09:02:27 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 13 Mar 2015 09:02:27 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
	Change SDK install prefix from ti-sdk to processor-sdk.
Thread-Index: AQHQXZR8QVrQ8c+DGkuBCnCKZm5PnJ0axAeA//+smBA=
Date: Fri, 13 Mar 2015 14:02:27 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141089C4@DFLE09.ent.ti.com>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
	<20150313135747.GS24885@edge>
In-Reply-To: <20150313135747.GS24885@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Fri, 13 Mar 2015 14:02:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not sure if we can do that now that the versioning has been reset to 1.=
0.0.0.

However, I do plan on submitting an updated patch after this first release.=
 This method of autodetecting the SDK installation directory is somewhat br=
oken with installbuilder since the user may choose any directory which may =
or may not have the correct format.

 It seems that the sdk_install.sh script should do some modifications to ge=
t the explicit directory within the script, but it appears this would take =
more changes which I haven't yet had a chance to look into.

-  Jake

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 13, 2015 9:58 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: Chang=
e SDK install prefix from ti-sdk to processor-sdk.

This is going to affect all the SDKs - ti-sdk was chosen on purpose to be g=
eneric enough to cover all our SDKs, not some specific one...


On Fri, Mar 13, 2015 at 09:49:04AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  create-sdcard.sh |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index ca02ad2..17ae564 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -74,7 +74,7 @@ if [ "$AMIROOT" !=3D "root" ] ; then
>  fi
> =20
>  THEPWD=3D$EXEPATH
> -PARSEPATH=3D`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
> +PARSEPATH=3D`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
> =20
>  if [ "$PARSEPATH" !=3D "" ] ; then
>  PATHVALID=3D1
> @@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
> =20
>  	#check that in the right directory
> =20
> -	THEEVMSDK=3D`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +	THEEVMSDK=3D`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
> =20
>  	if [ $PATHVALID -eq 1 ]; then
>  	echo "now installing:  $THEEVMSDK"
> @@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  			then
>  				echo "Directory exists"
>  				echo ""
> -				PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0-9]/'`
> +				PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*processor-sdk.*.[0-9]/'`
>  				#echo $PARSEPATH
> =20
>  				if [ "$PARSEPATH" !=3D "" ] ; then
> @@ -731,7 +731,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  				#echo $PATHVALID
>  				if [ $PATHVALID -eq 1 ] ; then
> =20
> -				THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +				THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'processor-sdk-.*[0-9]'`
>  				echo "Is this the correct SDK: $THEEVMSDK"
>  				echo ""
>  				read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> @@ -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  					*)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
>  					esac
>  				else
> -				echo "Invalid SDK path make sure to include ti-sdk-xxxx"
> +				echo "Invalid SDK path make sure to include processor-sdk-xxxx"
>  				ENTERCORRECTLY=3D0
>  				fi
> =20
> @@ -804,7 +804,7 @@ cat << EOM
>        e.x. $:  /home/user/MyCustomTars/boot.tar.gz
> =20
>    If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/board-support/prebuilt-images/
> +      e.x. $: /processor-sdk/board-support/prebuilt-images/
> =20
>    NOTE: Not all platforms will have an MLO file and this file can
>          be ignored for platforms that do not support an MLO.
> @@ -937,7 +937,7 @@ cat << EOM
>        e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
> =20
>    If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/targetNFS/
> +      e.x. $: /processor-sdk/targetNFS/
> =20
>  ########################################################################=
########
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

