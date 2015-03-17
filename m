Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9778752099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 19:28:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HJSump017166
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:28:56 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HJSthf004081
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:28:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 14:28:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
	Change SDK install prefix from ti-sdk to processor-sdk.
Thread-Index: AQHQXZWzwbHxvDF2LkmMCoE6Bz+MHJ0axVOA//+3iIGAAHv5AIAGXrsA//+wxoA=
Date: Tue, 17 Mar 2015 19:28:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C84955E@DFLE08.ent.ti.com>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
	<20150313135747.GS24885@edge>,
	<4B26FB5A64EBA14C87266869E037F958141089C4@DFLE09.ent.ti.com>
	<3EBFF9EC-8235-48BC-B224-08BA0A431701@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814108A9C@DFLE09.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F9581410F5C5@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581410F5C5@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Tue, 17 Mar 2015 19:28:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, March 17, 2015 1:23 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
> Change SDK install prefix from ti-sdk to processor-sdk.
>=20
> I've begun looking into the changes needed to modifying the prefix during
> installation, and I'm not sure quite what to do. Why does this detection =
need
> to happen?
[Franklin] It probably wants to give you feedback early that you are not us=
ing the script within the SDK directory aka most likely doesn't contain the=
 files you need.. The script probably needs some restructuring if you want =
to wait until the last moment to verify that the correct directory is used =
and if it fails jump back to the portion of the script to allow the user to=
 try again or specify another path.

>=20
> I guess for installing images from the SDK, I can get that patch from
> installation, but if user wants to enter another SDK location, is there a=
ny
> need to verify that the directory has the assumed format? Can the script
> return an error if the images cannot be found within that directory?
[Franklin] The script already has the ability to allow you to manually spec=
ify the directory to grab tarball and binaries.=20
However, if you choose the option to use the prebuilt images from the SDK t=
hen the assumption is that you want the prebuilt from the current sdk. If n=
ot run the create sd card script located in the other SDK or select the opt=
ion within the script that will ask you the individual folder name of the r=
ootfs, uboot,kernel and dtb.

Honestly I've heard probably three times in three years someone runs into a=
n issue using the script since they change the name of the SDK directory du=
ring installation.  So it is indeed a problem but it is so infrequent that =
myself and others haven't remembered to fix it. Which is essentially the pr=
oblem your having.


>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Friday, March 13, 2015 1:07 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
> Change SDK install prefix from ti-sdk to processor-sdk.
>=20
> Yes, but there is a lot of extra logic which would not be needed.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, March 13, 2015 10:43 AM
> To: Stiffler, Jacob
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
> Change SDK install prefix from ti-sdk to processor-sdk.
>=20
> Well I guess Denys is right and we should play nice with others.
>=20
> Sdk_install.sh part would be easy.
>=20
> Replace  "*ti-sdk.*.[0-9]/" with the name of the directory since you alre=
ady
> know it.
>=20
> Then it works for anyone
>=20
>=20
>=20
>=20
> > On Mar 13, 2015, at 9:02 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> >
> > I'm not sure if we can do that now that the versioning has been reset t=
o
> 1.0.0.0.
> >
> > However, I do plan on submitting an updated patch after this first rele=
ase.
> This method of autodetecting the SDK installation directory is somewhat
> broken with installbuilder since the user may choose any directory which =
may
> or may not have the correct format.
> >
> > It seems that the sdk_install.sh script should do some modifications to=
 get
> the explicit directory within the script, but it appears this would take =
more
> changes which I haven't yet had a chance to look into.
> >
> > -  Jake
> >
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 13, 2015 9:58 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
> Change SDK install prefix from ti-sdk to processor-sdk.
> >
> > This is going to affect all the SDKs - ti-sdk was chosen on purpose to =
be
> generic enough to cover all our SDKs, not some specific one...
> >
> >
> >> On Fri, Mar 13, 2015 at 09:49:04AM -0400, Jacob Stiffler wrote:
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> create-sdcard.sh |   14 +++++++-------
> >> 1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/create-sdcard.sh b/create-sdcard.sh index
> >> ca02ad2..17ae564 100644
> >> --- a/create-sdcard.sh
> >> +++ b/create-sdcard.sh
> >> @@ -74,7 +74,7 @@ if [ "$AMIROOT" !=3D "root" ] ; then fi
> >>
> >> THEPWD=3D$EXEPATH
> >> -PARSEPATH=3D`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
> >> +PARSEPATH=3D`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
> >>
> >> if [ "$PARSEPATH" !=3D "" ] ; then
> >> PATHVALID=3D1
> >> @@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
> >>
> >>    #check that in the right directory
> >>
> >> -    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
> >> +    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
> >>
> >>    if [ $PATHVALID -eq 1 ]; then
> >>    echo "now installing:  $THEEVMSDK"
> >> @@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
> >>            then
> >>                echo "Directory exists"
> >>                echo ""
> >> -                PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.=
[0-9]/'`
> >> +                PARSEPATH=3D`echo $SDKFILEPATH | grep -o
> >> + '.*processor-sdk.*.[0-9]/'`
> >>                #echo $PARSEPATH
> >>
> >>                if [ "$PARSEPATH" !=3D "" ] ; then @@ -731,7 +731,7 @@
> >> if [ $FILEPATHOPTION -eq 1 ] ; then
> >>                #echo $PATHVALID
> >>                if [ $PATHVALID -eq 1 ] ; then
> >>
> >> -                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0=
-9]'`
> >> +                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o
> >> + 'processor-sdk-.*[0-9]'`
> >>                echo "Is this the correct SDK: $THEEVMSDK"
> >>                echo ""
> >>                read -p 'Is this correct? [y/n] : ' ISRIGHTPATH @@
> >> -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
> >>                    *)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
> >>                    esac
> >>                else
> >> -                echo "Invalid SDK path make sure to include ti-sdk-xx=
xx"
> >> +                echo "Invalid SDK path make sure to include processor=
-sdk-xxxx"
> >>                ENTERCORRECTLY=3D0
> >>                fi
> >>
> >> @@ -804,7 +804,7 @@ cat << EOM
> >>       e.x. $:  /home/user/MyCustomTars/boot.tar.gz
> >>
> >>   If files are located in a directory write the directory path
> >> -      e.x. $: /ti-sdk/board-support/prebuilt-images/
> >> +      e.x. $: /processor-sdk/board-support/prebuilt-images/
> >>
> >>   NOTE: Not all platforms will have an MLO file and this file can
> >>         be ignored for platforms that do not support an MLO.
> >> @@ -937,7 +937,7 @@ cat << EOM
> >>       e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
> >>
> >>   If files are located in a directory write the directory path
> >> -      e.x. $: /ti-sdk/targetNFS/
> >> +      e.x. $: /processor-sdk/targetNFS/
> >>
> >>
> ##########################################################
> ###########
> >> ###########
> >>
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

