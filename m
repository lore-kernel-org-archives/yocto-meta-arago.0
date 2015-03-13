Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2FD515299E
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 13:56:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DDuumV006779
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:56:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDutvx009219
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:56:55 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 13 Mar 2015 08:56:55 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard:
	Change SDK	install prefix from ti-sdk to processor-sdk.
Thread-Index: AQHQXZS1RMH2OEGRIkKhiLNDYWeQTp0ab+kg
Date: Fri, 13 Mar 2015 13:56:55 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141089AA@DFLE09.ent.ti.com>
References: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
	<F0482336-45C3-49E7-B1E0-0D432A0D7F88@ti.com>
In-Reply-To: <F0482336-45C3-49E7-B1E0-0D432A0D7F88@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 13 Mar 2015 13:56:57 -0000
X-Groupsio-MsgNum: 5166
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_4B26FB5A64EBA14C87266869E037F958141089AADFLE09entticom_"

--_002_4B26FB5A64EBA14C87266869E037F958141089AADFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, March 13, 2015 9:51 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH] create-sdcard: Chang=
e SDK install prefix from ti-sdk to processor-sdk.

Send that patch to me as an attachment so I can commit it.


> On Mar 13, 2015, at 8:49 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> create-sdcard.sh |   14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/create-sdcard.sh b/create-sdcard.sh index=20
> ca02ad2..17ae564 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -74,7 +74,7 @@ if [ "$AMIROOT" !=3D "root" ] ; then fi
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
> +                PARSEPATH=3D`echo $SDKFILEPATH | grep -o=20
> + '.*processor-sdk.*.[0-9]/'`
>                #echo $PARSEPATH
>=20
>                if [ "$PARSEPATH" !=3D "" ] ; then @@ -731,7 +731,7 @@ if=
=20
> [ $FILEPATHOPTION -eq 1 ] ; then
>                #echo $PATHVALID
>                if [ $PATHVALID -eq 1 ] ; then
>=20
> -                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]=
'`
> +                THEEVMSDK=3D`echo $SDKFILEPATH | grep -o=20
> + 'processor-sdk-.*[0-9]'`
>                echo "Is this the correct SDK: $THEEVMSDK"
>                echo ""
>                read -p 'Is this correct? [y/n] : ' ISRIGHTPATH @@=20
> -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
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
> ######################################################################
> ##########
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_002_4B26FB5A64EBA14C87266869E037F958141089AADFLE09entticom_
Content-Type: application/octet-stream;
	name="0001-create-sdcard-Change-SDK-install-prefix-from-ti-sdk-.patch"
Content-Description: 0001-create-sdcard-Change-SDK-install-prefix-from-ti-sdk-.patch
Content-Disposition: attachment;
	filename="0001-create-sdcard-Change-SDK-install-prefix-from-ti-sdk-.patch";
	size=2725; creation-date="Fri, 13 Mar 2015 13:56:40 GMT";
	modification-date="Fri, 13 Mar 2015 13:56:36 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyOWM1ZGE3NTllMjQ0MzQ5NDVhMjVkM2UyNGJkODA1YzUyMmEyMzViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYWNvYiBTdGlmZmxlciA8ai1zdGlmZmxlckB0aS5jb20+CkRh
dGU6IEZyaSwgMTMgTWFyIDIwMTUgMDk6NDc6MDEgLTA0MDAKU3ViamVjdDogW1BBVENIXSBjcmVh
dGUtc2RjYXJkOiBDaGFuZ2UgU0RLIGluc3RhbGwgcHJlZml4IGZyb20gdGktc2RrIHRvCiBwcm9j
ZXNzb3Itc2RrLgoKU2lnbmVkLW9mZi1ieTogSmFjb2IgU3RpZmZsZXIgPGotc3RpZmZsZXJAdGku
Y29tPgotLS0KIGNyZWF0ZS1zZGNhcmQuc2ggfCAgIDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ny
ZWF0ZS1zZGNhcmQuc2ggYi9jcmVhdGUtc2RjYXJkLnNoCmluZGV4IGNhMDJhZDIuLjE3YWU1NjQg
MTAwNjQ0Ci0tLSBhL2NyZWF0ZS1zZGNhcmQuc2gKKysrIGIvY3JlYXRlLXNkY2FyZC5zaApAQCAt
NzQsNyArNzQsNyBAQCBpZiBbICIkQU1JUk9PVCIgIT0gInJvb3QiIF0gOyB0aGVuCiBmaQogCiBU
SEVQV0Q9JEVYRVBBVEgKLVBBUlNFUEFUSD1gZWNobyAkVEhFUFdEIHwgZ3JlcCAtbyAnLip0aS1z
ZGsuKi5bMC05XS8nYAorUEFSU0VQQVRIPWBlY2hvICRUSEVQV0QgfCBncmVwIC1vICcuKnByb2Nl
c3Nvci1zZGsuKi5bMC05XS8nYAogCiBpZiBbICIkUEFSU0VQQVRIIiAhPSAiIiBdIDsgdGhlbgog
UEFUSFZBTElEPTEKQEAgLTcwMyw3ICs3MDMsNyBAQCBpZiBbICRGSUxFUEFUSE9QVElPTiAtZXEg
MSBdIDsgdGhlbgogCiAJI2NoZWNrIHRoYXQgaW4gdGhlIHJpZ2h0IGRpcmVjdG9yeQogCi0JVEhF
RVZNU0RLPWBlY2hvICRQQVJTRVBBVEggfCBncmVwIC1vICd0aS1zZGstLipbMC05XSdgCisJVEhF
RVZNU0RLPWBlY2hvICRQQVJTRVBBVEggfCBncmVwIC1vICdwcm9jZXNzb3Itc2RrLS4qWzAtOV0n
YAogCiAJaWYgWyAkUEFUSFZBTElEIC1lcSAxIF07IHRoZW4KIAllY2hvICJub3cgaW5zdGFsbGlu
ZzogICRUSEVFVk1TREsiCkBAIC03MjAsNyArNzIwLDcgQEAgaWYgWyAkRklMRVBBVEhPUFRJT04g
LWVxIDEgXSA7IHRoZW4KIAkJCXRoZW4KIAkJCQllY2hvICJEaXJlY3RvcnkgZXhpc3RzIgogCQkJ
CWVjaG8gIiIKLQkJCQlQQVJTRVBBVEg9YGVjaG8gJFNES0ZJTEVQQVRIIHwgZ3JlcCAtbyAnLip0
aS1zZGsuKi5bMC05XS8nYAorCQkJCVBBUlNFUEFUSD1gZWNobyAkU0RLRklMRVBBVEggfCBncmVw
IC1vICcuKnByb2Nlc3Nvci1zZGsuKi5bMC05XS8nYAogCQkJCSNlY2hvICRQQVJTRVBBVEgKIAog
CQkJCWlmIFsgIiRQQVJTRVBBVEgiICE9ICIiIF0gOyB0aGVuCkBAIC03MzEsNyArNzMxLDcgQEAg
aWYgWyAkRklMRVBBVEhPUFRJT04gLWVxIDEgXSA7IHRoZW4KIAkJCQkjZWNobyAkUEFUSFZBTElE
CiAJCQkJaWYgWyAkUEFUSFZBTElEIC1lcSAxIF0gOyB0aGVuCiAKLQkJCQlUSEVFVk1TREs9YGVj
aG8gJFNES0ZJTEVQQVRIIHwgZ3JlcCAtbyAndGktc2RrLS4qWzAtOV0nYAorCQkJCVRIRUVWTVNE
Sz1gZWNobyAkU0RLRklMRVBBVEggfCBncmVwIC1vICdwcm9jZXNzb3Itc2RrLS4qWzAtOV0nYAog
CQkJCWVjaG8gIklzIHRoaXMgdGhlIGNvcnJlY3QgU0RLOiAkVEhFRVZNU0RLIgogCQkJCWVjaG8g
IiIKIAkJCQlyZWFkIC1wICdJcyB0aGlzIGNvcnJlY3Q/IFt5L25dIDogJyBJU1JJR0hUUEFUSApA
QCAtNzQxLDcgKzc0MSw3IEBAIGlmIFsgJEZJTEVQQVRIT1BUSU9OIC1lcSAxIF0gOyB0aGVuCiAJ
CQkJCSopICBlY2hvICJQbGVhc2UgZW50ZXIgeSBvciBuIjtFTlRFUkNPUlJFQ1RMWT0wOzsKIAkJ
CQkJZXNhYwogCQkJCWVsc2UKLQkJCQllY2hvICJJbnZhbGlkIFNESyBwYXRoIG1ha2Ugc3VyZSB0
byBpbmNsdWRlIHRpLXNkay14eHh4IgorCQkJCWVjaG8gIkludmFsaWQgU0RLIHBhdGggbWFrZSBz
dXJlIHRvIGluY2x1ZGUgcHJvY2Vzc29yLXNkay14eHh4IgogCQkJCUVOVEVSQ09SUkVDVExZPTAK
IAkJCQlmaQogCkBAIC04MDQsNyArODA0LDcgQEAgY2F0IDw8IEVPTQogICAgICAgZS54LiAkOiAg
L2hvbWUvdXNlci9NeUN1c3RvbVRhcnMvYm9vdC50YXIuZ3oKIAogICBJZiBmaWxlcyBhcmUgbG9j
YXRlZCBpbiBhIGRpcmVjdG9yeSB3cml0ZSB0aGUgZGlyZWN0b3J5IHBhdGgKLSAgICAgIGUueC4g
JDogL3RpLXNkay9ib2FyZC1zdXBwb3J0L3ByZWJ1aWx0LWltYWdlcy8KKyAgICAgIGUueC4gJDog
L3Byb2Nlc3Nvci1zZGsvYm9hcmQtc3VwcG9ydC9wcmVidWlsdC1pbWFnZXMvCiAKICAgTk9URTog
Tm90IGFsbCBwbGF0Zm9ybXMgd2lsbCBoYXZlIGFuIE1MTyBmaWxlIGFuZCB0aGlzIGZpbGUgY2Fu
CiAgICAgICAgIGJlIGlnbm9yZWQgZm9yIHBsYXRmb3JtcyB0aGF0IGRvIG5vdCBzdXBwb3J0IGFu
IE1MTy4KQEAgLTkzNyw3ICs5MzcsNyBAQCBjYXQgPDwgRU9NCiAgICAgICBlLnguICQ6ICAvaG9t
ZS91c2VyL015Q3VzdG9tVGFycy9yb290ZnMudGFyLmd6CiAKICAgSWYgZmlsZXMgYXJlIGxvY2F0
ZWQgaW4gYSBkaXJlY3Rvcnkgd3JpdGUgdGhlIGRpcmVjdG9yeSBwYXRoCi0gICAgICBlLnguICQ6
IC90aS1zZGsvdGFyZ2V0TkZTLworICAgICAgZS54LiAkOiAvcHJvY2Vzc29yLXNkay90YXJnZXRO
RlMvCiAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLS0gCjEuNy45LjUKCg==

--_002_4B26FB5A64EBA14C87266869E037F958141089AADFLE09entticom_--
