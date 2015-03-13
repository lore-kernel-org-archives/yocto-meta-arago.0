Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3C8D95297F
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 13:50:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DDombT010030
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:50:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDolbE011266
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:50:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 13 Mar 2015 08:50:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
	Change SDK	install prefix from ti-sdk to processor-sdk.
Thread-Index: AQHQXZSEbW3TDXCrnUSTySMmjU9/3J0abkA4
Date: Fri, 13 Mar 2015 13:50:46 +0000
Message-ID: <F0482336-45C3-49E7-B1E0-0D432A0D7F88@ti.com>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-setup-scripts][PATCH] create-sdcard: Change SDK	install prefix from ti-sdk to processor-sdk.
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
X-List-Received-Date: Fri, 13 Mar 2015 13:50:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Send that patch to me as an attachment so I can commit it.


> On Mar 13, 2015, at 8:49 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> create-sdcard.sh |   14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index ca02ad2..17ae564 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -74,7 +74,7 @@ if [ "$AMIROOT" !=3D "root" ] ; then
> fi
>=20
> THEPWD=3D$EXEPATH
> -PARSEPATH=3D`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
> +PARSEPATH=3D`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
>=20
> if [ "$PARSEPATH" !=3D "" ] ; then
> PATHVALID=3D1
> @@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>=20
>    #check that in the right directory
>=20
> -    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
> +    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
>=20
>    if [ $PATHVALID -eq 1 ]; then
>    echo "now installing:  $THEEVMSDK"
> @@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>            then
>                echo "Directory exists"
>                echo ""
> -                PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0-=
9]/'`
> +                PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*processor-sd=
k.*.[0-9]/'`
>                #echo $PARSEPATH
>=20
>                if [ "$PARSEPATH" !=3D "" ] ; then
> @@ -731,7 +731,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>                #echo $PATHVALID
>                if [ $PATHVALID -eq 1 ] ; then
>=20
> -                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]=
'`
> +                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'processor-sdk-=
.*[0-9]'`
>                echo "Is this the correct SDK: $THEEVMSDK"
>                echo ""
>                read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
> @@ -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>                    *)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
>                    esac
>                else
> -                echo "Invalid SDK path make sure to include ti-sdk-xxxx"
> +                echo "Invalid SDK path make sure to include processor-sd=
k-xxxx"
>                ENTERCORRECTLY=3D0
>                fi
>=20
> @@ -804,7 +804,7 @@ cat << EOM
>       e.x. $:  /home/user/MyCustomTars/boot.tar.gz
>=20
>   If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/board-support/prebuilt-images/
> +      e.x. $: /processor-sdk/board-support/prebuilt-images/
>=20
>   NOTE: Not all platforms will have an MLO file and this file can
>         be ignored for platforms that do not support an MLO.
> @@ -937,7 +937,7 @@ cat << EOM
>       e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
>=20
>   If files are located in a directory write the directory path
> -      e.x. $: /ti-sdk/targetNFS/
> +      e.x. $: /processor-sdk/targetNFS/
>=20
> #########################################################################=
#######
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

