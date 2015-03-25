Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9C88652A31
	for <meta-arago@arago-project.org>;
	Wed, 25 Mar 2015 21:02:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2PL2ABa008969
	for <meta-arago@arago-project.org>; Wed, 25 Mar 2015 16:02:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2PL29Dr027132
	for <meta-arago@arago-project.org>; Wed, 25 Mar 2015 16:02:09 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Wed, 25 Mar 2015 16:02:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SDK.
Thread-Index: AQHQZzHfL84s45vDt0+zjBxImP4dSZ0tro52gAAA+Y4=
Date: Wed, 25 Mar 2015 21:02:09 +0000
Message-ID: <28FF0448-3D50-477E-9EE2-ABFE6F42B8F5@ti.com>
References: <1427311700-20869-1-git-send-email-j-stiffler@ti.com>,
	<C38133F3-91EC-4F10-AE0A-CA8281A929E5@ti.com>
In-Reply-To: <C38133F3-91EC-4F10-AE0A-CA8281A929E5@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Wed, 25 Mar 2015 21:02:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 25, 2015, at 3:58 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
>=20
> Overall this needs more testing. additional comments below
>=20
>> On Mar 25, 2015, at 2:28 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> * omap3-sgx-modules provides out-of-tree drivers which are required for
>> graphics.
>> * These sources need to be provided so that whenever there is a kernel
>> modification, the user can easily rebuild these moduels to reenable grap=
hics.
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> .../conf/distro/arago-source-ipk.conf              |    3 ++
>> .../ti-tisdk-makefile/Makefile_omap3-sgx-modules   |   29 ++++++++++++++=
++++++
>> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 +++++++-
>> 3 files changed, 42 insertions(+), 1 deletion(-)
>> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_omap3-sgx-modules
>>=20
>> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-=
arago-distro/conf/distro/arago-source-ipk.conf
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
>=20
> Now when you do sourceipk is it only including a certain portion of the g=
raphics SdK or is it packaging the entire contents of the graphics Sdk.
>=20
> You may need to be careful but I though when you installed the graphics S=
DK that it puts installation paths inside its various make files. This can =
cause a problem since these paths will be from your build machine.
>=20
>> CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
>> SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/extra=
-drivers/${PN}-${PV}"
>>=20
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-=
makefile/Makefile_omap3-sgx-modules b/meta-arago-distro/recipes-tisdk/ti-ti=
sdk-makefile/ti-tisdk-makefile/Makefile_omap3-sgx-modules
>> new file mode 100644
>> index 0000000..2bc0ba5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil=
e/Makefile_omap3-sgx-modules
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
ase TI_PLATFORM=3D__PLATFORM_SGX__ SUPPORT_XORG=3D0
> Make sure you test this and compare against how we build the recipe in OE=
. I remembered in the past you needed a special flag passed in to insure PM=
 runtime worked.
>=20
> So really you need to test this by removing all the sgx modules from the =
SDK and let the make install run on ur filesystem and see if everything  st=
ill works. This includes suspend and resume while an sgx demo is running.
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
>> +    make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd` INSTALL_MOD_PATH=
=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) modules_install
> This will cause problems as is. The graphics recipe for reasons I never i=
nstalls the graphics modules differently then the graphics SDK.
Typing from my phone. *reasons I never liked=20
> So you will end with two versions of the graphics SDK in ur fs and both w=
ill try to load and maybe possibly fail.
>=20
> So either update the OE recipe to use the makefile install or update this=
 part to mimic the OE way it built things.
*built and installs things
>> +
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-=
makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisd=
k-makefile_1.0.bb
>> index ffedd4c..a31bb69 100644
>> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil=
e_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil=
e_1.0.bb
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
>>                           ${QUICK_PLAYGROUND} \
>> @@ -76,6 +78,7 @@ MAKEFILES_append_ti43x =3D " u-boot-spl \
>>                           linux-dtbs \
>>                           wireless \
>>                           cryptodev \
>> +                           omap3-sgx-modules \
>>                           dual-camera-demo \
>>                           image-gallery \
>> "
>> @@ -95,6 +98,10 @@ MAKEFILES_append_am180x-evm =3D " pru \
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
>>    sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefi=
le
>>=20
>> +    sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
>> +
>>    cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
>>=20
>>    if [ "$?" =3D=3D "0" ]
>> --=20
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

