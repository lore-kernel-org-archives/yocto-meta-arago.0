Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 03848529F1
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2015 11:15:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QBFwfA018060
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 06:15:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QBFuOa002651
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 06:15:56 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 26 Mar 2015 06:15:56 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SDK.
Thread-Index: AQHQZzHbJ4SipVjcEUa+VRt3gj1U750uAl4AgAAA+YCAAJmiQA==
Date: Thu, 26 Mar 2015 11:15:56 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411B5BF@DFLE09.ent.ti.com>
References: <1427311700-20869-1-git-send-email-j-stiffler@ti.com>,
	<C38133F3-91EC-4F10-AE0A-CA8281A929E5@ti.com>
	<28FF0448-3D50-477E-9EE2-ABFE6F42B8F5@ti.com>
In-Reply-To: <28FF0448-3D50-477E-9EE2-ABFE6F42B8F5@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] omap3-sgx-modules: Add source to SDK.
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
X-List-Received-Date: Thu, 26 Mar 2015 11:15:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have tested this patch locally and in our nightly builds.=20

See my response to your comments below.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, March 25, 2015 5:02 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SDK.




> On Mar 25, 2015, at 3:58 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
>=20
> Overall this needs more testing. additional comments below
>=20
>> On Mar 25, 2015, at 2:28 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> * omap3-sgx-modules provides out-of-tree drivers which are required=20
>> for graphics.
>> * These sources need to be provided so that whenever there is a=20
>> kernel modification, the user can easily rebuild these moduels to reenab=
le graphics.
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> .../conf/distro/arago-source-ipk.conf              |    3 ++
>> .../ti-tisdk-makefile/Makefile_omap3-sgx-modules   |   29 ++++++++++++++=
++++++
>> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 +++++++-
>> 3 files changed, 42 insertions(+), 1 deletion(-) create mode 100644=20
>> meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/M
>> akefile_omap3-sgx-modules
>>=20
>> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf=20
>> b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>> index b457504..40c7058 100644
>> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>> @@ -94,6 +94,9 @@ SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "example-=
applications/pru-${PV}"
>> CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
>> SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-driv=
ers/${PN}-${PV}"
>>=20
>> +CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
>> +SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-driver=
s/${PN}-${PV}"
>> +
> We shouldn't call it omap3-sgx-modules since that name has no meaning wit=
hin the Graphics SDK nor anywhere outside of OE. Plus omap3 part is confusi=
ng from an SDK perspective.
What would you suggest?
>=20
> Now when you do sourceipk is it only including a certain portion of the g=
raphics SdK or is it packaging the entire contents of the graphics Sdk.
>=20
> You may need to be careful but I though when you installed the graphics S=
DK that it puts installation paths inside its various make files. This can =
cause a problem since these paths will be from your build machine.
This is only the module source, as specified in the recipe:=20
TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
>=20
>> CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
>> SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/extra=
-drivers/${PN}-${PV}"
>>=20
>> diff --git=20
>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>> /Makefile_omap3-sgx-modules=20
>> b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>> /Makefile_omap3-sgx-modules
>> new file mode 100644
>> index 0000000..2bc0ba5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make
>> +++ file/Makefile_omap3-sgx-modules
>> @@ -0,0 +1,29 @@
>> +omap3-sgx-modules: linux
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @echo      Building omap3-sgx-modules
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @cd board-support/extra-drivers; \
>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>> +    make ARCH=3Darm KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR) BUILD=3Drele=
ase=20
>> +TI_PLATFORM=3D__PLATFORM_SGX__ SUPPORT_XORG=3D0
> Make sure you test this and compare against how we build the recipe in OE=
. I remembered in the past you needed a special flag passed in to insure PM=
 runtime worked.
I got the make options directly from the recipe.
>=20
> So really you need to test this by removing all the sgx modules from the =
SDK and let the make install run on ur filesystem and see if everything  st=
ill works. This includes suspend and resume while an sgx demo is running.
How do you  test this?
>> +
>> +omap3-sgx-modules_clean:
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @echo      Cleaning omap3-sgx-modules
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @cd board-support/extra-drivers; \
>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>> +    make ARCH=3Darm KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR) clean
>> +
>> +omap3-sgx-modules_install:
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @echo      Installing omap3-sgx-modules
>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    @if [ ! -d $(DESTDIR) ] ; then \
>> +        echo "The extracted target filesystem directory doesn't exist."=
; \
>> +        echo "Please run setup.sh in the SDK's root directory and then =
try again."; \
>> +        exit 1; \
>> +    fi
>> +    @cd board-support/extra-drivers; \
>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>> +    make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd`=20
>> +INSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET)=20
>> +modules_install
> This will cause problems as is. The graphics recipe for reasons I never i=
nstalls the graphics modules differently then the graphics SDK.
> Typing from my phone. *reasons I never liked=20
> So you will end with two versions of the graphics SDK in ur fs and both w=
ill try to load and maybe possibly fail.
>=20
> So either update the OE recipe to use the makefile install or update this=
 part to mimic the OE way it built things.
> *built and installs things
It seems that the recipe tries to fake that these modules are not out-of-tr=
ee, and I guess yocto can hide this by updating the necessary /lib/modules/=
<k_ver>/modules.* files. Without installing it like this, then the modules =
cannot be found by "modprobe".
>> +
>> diff --git=20
>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>> _1.0.bb=20
>> b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>> _1.0.bb
>> index ffedd4c..a31bb69 100644
>> ---=20
>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>> _1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make
>> +++ file_1.0.bb
>> @@ -34,9 +34,10 @@ SRC_URI =3D "\
>>    file://Makefile_dual-camera-demo \
>>    file://Makefile_image-gallery \
>>    file://Makefile_cryptodev \
>> +    file://Makefile_omap3-sgx-modules \
>> "
>>=20
>> -PR =3D "r41"
>> +PR =3D "r42"
>>=20
>> MAKEFILES_COMMON =3D "linux \
>>                    matrix-gui \
>> @@ -69,6 +70,7 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
>>                           linux-dtbs \
>>                           wireless \
>>                           cryptodev \
>> +                           omap3-sgx-modules \
>> "
>> MAKEFILES_append_ti43x =3D " u-boot-spl \
>>                           ${QUICK_PLAYGROUND} \ @@ -76,6 +78,7 @@=20
>> MAKEFILES_append_ti43x =3D " u-boot-spl \
>>                           linux-dtbs \
>>                           wireless \
>>                           cryptodev \
>> +                           omap3-sgx-modules \
>>                           dual-camera-demo \
>>                           image-gallery \ "
>> @@ -95,6 +98,10 @@ MAKEFILES_append_am180x-evm =3D " pru \=20
>> PLATFORM_ARCH =3D "armv7-a"
>> PLATFORM_ARCH_omapl138 =3D "armv5te"
>>=20
>> +PLATFORM_SGX =3D ""
>> +PLATFORM_SGX_ti33x =3D "ti335x"
>> +PLATFORM_SGX_ti43x =3D "ti43xx"
>> +
>> KERNEL_BUILD_CMDS =3D "${@base_conditional('KERNEL_IMAGETYPE','uImage','=
LOADADDR=3D${UBOOT_LOADADDRESS} uImage','zImage',d)}"
>>=20
>> KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-bone=
.dtb am335x-boneblack.dtb"
>> @@ -150,6 +157,8 @@ do_install () {
>>=20
>>    sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/"=20
>> ${D}/Makefile
>>=20
>> +    sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
>> +
>>    cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
>>=20
>>    if [ "$?" =3D=3D "0" ]
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

