Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6E18B52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 18:23:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HINPZN016120
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 13:23:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HINO9U020913
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 13:23:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 13:23:24 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
	Change SDK install prefix from ti-sdk to processor-sdk.
Thread-Index: AQHQXZR8QVrQ8c+DGkuBCnCKZm5PnJ0axAeA//+smBCAAGAQgP//1B9ggAZcfZA=
Date: Tue, 17 Mar 2015 18:23:24 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410F5C5@DFLE09.ent.ti.com>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
	<20150313135747.GS24885@edge>,
	<4B26FB5A64EBA14C87266869E037F958141089C4@DFLE09.ent.ti.com>
	<3EBFF9EC-8235-48BC-B224-08BA0A431701@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814108A9C@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814108A9C@DFLE09.ent.ti.com>
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
X-List-Received-Date: Tue, 17 Mar 2015 18:23:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've begun looking into the changes needed to modifying the prefix during i=
nstallation, and I'm not sure quite what to do. Why does this detection nee=
d to happen?=20

I guess for installing images from the SDK, I can get that patch from insta=
llation, but if user wants to enter another SDK location, is there any need=
 to verify that the directory has the assumed format? Can the script return=
 an error if the images cannot be found within that directory?

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Stiffler, Jacob
Sent: Friday, March 13, 2015 1:07 PM
To: Cooper Jr., Franklin
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: Chang=
e SDK install prefix from ti-sdk to processor-sdk.

Yes, but there is a lot of extra logic which would not be needed.

-----Original Message-----
From: Cooper Jr., Franklin
Sent: Friday, March 13, 2015 10:43 AM
To: Stiffler, Jacob
Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: Chang=
e SDK install prefix from ti-sdk to processor-sdk.

Well I guess Denys is right and we should play nice with others.

Sdk_install.sh part would be easy.

Replace  "*ti-sdk.*.[0-9]/" with the name of the directory since you alread=
y know it.

Then it works for anyone=20




> On Mar 13, 2015, at 9:02 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> I'm not sure if we can do that now that the versioning has been reset to =
1.0.0.0.
>=20
> However, I do plan on submitting an updated patch after this first releas=
e. This method of autodetecting the SDK installation directory is somewhat =
broken with installbuilder since the user may choose any directory which ma=
y or may not have the correct format.
>=20
> It seems that the sdk_install.sh script should do some modifications to g=
et the explicit directory within the script, but it appears this would take=
 more changes which I haven't yet had a chance to look into.
>=20
> -  Jake
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 13, 2015 9:58 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: Cha=
nge SDK install prefix from ti-sdk to processor-sdk.
>=20
> This is going to affect all the SDKs - ti-sdk was chosen on purpose to be=
 generic enough to cover all our SDKs, not some specific one...
>=20
>=20
>> On Fri, Mar 13, 2015 at 09:49:04AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> create-sdcard.sh |   14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/create-sdcard.sh b/create-sdcard.sh index
>> ca02ad2..17ae564 100644
>> --- a/create-sdcard.sh
>> +++ b/create-sdcard.sh
>> @@ -74,7 +74,7 @@ if [ "$AMIROOT" !=3D "root" ] ; then fi
>>=20
>> THEPWD=3D$EXEPATH
>> -PARSEPATH=3D`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
>> +PARSEPATH=3D`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
>>=20
>> if [ "$PARSEPATH" !=3D "" ] ; then
>> PATHVALID=3D1
>> @@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>>=20
>>    #check that in the right directory
>>=20
>> -    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
>> +    THEEVMSDK=3D`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
>>=20
>>    if [ $PATHVALID -eq 1 ]; then
>>    echo "now installing:  $THEEVMSDK"
>> @@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>>            then
>>                echo "Directory exists"
>>                echo ""
>> -                PARSEPATH=3D`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0=
-9]/'`
>> +                PARSEPATH=3D`echo $SDKFILEPATH | grep -o=20
>> + '.*processor-sdk.*.[0-9]/'`
>>                #echo $PARSEPATH
>>=20
>>                if [ "$PARSEPATH" !=3D "" ] ; then @@ -731,7 +731,7 @@=20
>> if [ $FILEPATHOPTION -eq 1 ] ; then
>>                #echo $PATHVALID
>>                if [ $PATHVALID -eq 1 ] ; then
>>=20
>> -                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9=
]'`
>> +                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o=20
>> + 'processor-sdk-.*[0-9]'`
>>                echo "Is this the correct SDK: $THEEVMSDK"
>>                echo ""
>>                read -p 'Is this correct? [y/n] : ' ISRIGHTPATH @@
>> -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>>                    *)  echo "Please enter y or n";ENTERCORRECTLY=3D0;;
>>                    esac
>>                else
>> -                echo "Invalid SDK path make sure to include ti-sdk-xxxx=
"
>> +                echo "Invalid SDK path make sure to include processor-s=
dk-xxxx"
>>                ENTERCORRECTLY=3D0
>>                fi
>>=20
>> @@ -804,7 +804,7 @@ cat << EOM
>>       e.x. $:  /home/user/MyCustomTars/boot.tar.gz
>>=20
>>   If files are located in a directory write the directory path
>> -      e.x. $: /ti-sdk/board-support/prebuilt-images/
>> +      e.x. $: /processor-sdk/board-support/prebuilt-images/
>>=20
>>   NOTE: Not all platforms will have an MLO file and this file can
>>         be ignored for platforms that do not support an MLO.
>> @@ -937,7 +937,7 @@ cat << EOM
>>       e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
>>=20
>>   If files are located in a directory write the directory path
>> -      e.x. $: /ti-sdk/targetNFS/
>> +      e.x. $: /processor-sdk/targetNFS/
>>=20
>> #####################################################################
>> ###########
>>=20
>> --
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

