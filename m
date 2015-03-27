Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A250E52A0B
	for <meta-arago@arago-project.org>;
	Fri, 27 Mar 2015 13:15:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2RDFvEC005000
	for <meta-arago@arago-project.org>; Fri, 27 Mar 2015 08:15:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2RDFulE007284
	for <meta-arago@arago-project.org>; Fri, 27 Mar 2015 08:15:56 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 27 Mar 2015 08:15:56 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SDK.
Thread-Index: AQHQZzHbJ4SipVjcEUa+VRt3gj1U750uAl4AgAAA+YCAAJmiQIAAfQiA//+6fnCAAcnKAP//st1A
Date: Fri, 27 Mar 2015 13:15:56 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411B938@DFLE09.ent.ti.com>
References: <1427311700-20869-1-git-send-email-j-stiffler@ti.com>,
	<C38133F3-91EC-4F10-AE0A-CA8281A929E5@ti.com>
	<28FF0448-3D50-477E-9EE2-ABFE6F42B8F5@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411B5BF@DFLE09.ent.ti.com>
	<6204FCC2-801E-4308-8244-1AE1E6516747@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411B902@DFLE09.ent.ti.com>
	<FCA7ACD8-5C23-4E8E-928B-D6C2693989CE@ti.com>
In-Reply-To: <FCA7ACD8-5C23-4E8E-928B-D6C2693989CE@ti.com>
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
X-List-Received-Date: Fri, 27 Mar 2015 13:15:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Before I resubmit this patch, what is your opinion on using "sgx-modules-${=
PV}" for the directory name nad "sgx-modules" for the Makefile target?

Also, I am currently testing changing the recipe installation to match the =
makefile, and will prepend this to the patch set once I have verified the c=
hange.

Thanks,
Jake=20



-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, March 27, 2015 8:49 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SDK.




> On Mar 27, 2015, at 7:30 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> 1) I checked, no prebuilt binaries are provided, and the clean is unneces=
sary.=20
> 2) No build system paths are included.
> 3) suspend and resume were functional while running the sgx 3D demos.
> 4) The kernel is automatically built with a different version due to the =
creation of a sdk branch in the git repo.
>=20
Awesome. Just renaming the directory containing the modules is all think th=
at's left. It's the same reason why sitara-linux-ti-staging and linux-ti-st=
aging recipes are simply set to linux-${PV}
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, March 26, 2015 9:40 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to SD=
K.
>=20
> From another email I saw are you saying that a user needs to run clean an=
d then compile and install via the top level makefile?
>=20
> Something isn't right since ANY sources included in the SDK board=20
> support shouldn't have anything prebuilt. They should be clean sources=20
> that simply needs to be compiled by the user
>=20
> more below
>=20
>=20
>> On Mar 26, 2015, at 6:15 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> I have tested this patch locally and in our nightly builds.=20
>>=20
>> See my response to your comments below.
>>=20
>> -----Original Message-----
>> From: Cooper Jr., Franklin
>> Sent: Wednesday, March 25, 2015 5:02 PM
>> To: Stiffler, Jacob
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH 1/2] omap3-sgx-modules: Add source to S=
DK.
>>=20
>>=20
>>=20
>>=20
>>> On Mar 25, 2015, at 3:58 PM, Cooper Jr., Franklin <fcooper@ti.com> wrot=
e:
>>>=20
>>> Overall this needs more testing. additional comments below
>>>=20
>>>> On Mar 25, 2015, at 2:28 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote=
:
>>>>=20
>>>> * omap3-sgx-modules provides out-of-tree drivers which are required=20
>>>> for graphics.
>>>> * These sources need to be provided so that whenever there is a=20
>>>> kernel modification, the user can easily rebuild these moduels to reen=
able graphics.
>>>>=20
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>> .../conf/distro/arago-source-ipk.conf              |    3 ++
>>>> .../ti-tisdk-makefile/Makefile_omap3-sgx-modules   |   29 ++++++++++++=
++++++++
>>>> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 +++++++-
>>>> 3 files changed, 42 insertions(+), 1 deletion(-) create mode 100644=20
>>>> meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile
>>>> /
>>>> M
>>>> akefile_omap3-sgx-modules
>>>>=20
>>>> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>>>> b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>>>> index b457504..40c7058 100644
>>>> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>>>> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>>>> @@ -94,6 +94,9 @@ SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples =3D "exampl=
e-applications/pru-${PV}"
>>>> CREATE_SRCIPK_pn-ti-ocf-crypto-module =3D "1"
>>>> SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module =3D "board-support/extra-dr=
ivers/${PN}-${PV}"
>>>>=20
>>>> +CREATE_SRCIPK_pn-omap3-sgx-modules =3D "1"
>>>> +SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules =3D "board-support/extra-driv=
ers/${PN}-${PV}"
>>>> +
>>> We shouldn't call it omap3-sgx-modules since that name has no meaning w=
ithin the Graphics SDK nor anywhere outside of OE. Plus omap3 part is confu=
sing from an SDK perspective.
>> What would you suggest?
> Idk naming it in a way people will recognize wat it is and wat it is for.
>>>=20
>>> Now when you do sourceipk is it only including a certain portion of the=
 graphics SdK or is it packaging the entire contents of the graphics Sdk.
>>>=20
>>> You may need to be careful but I though when you installed the graphics=
 SDK that it puts installation paths inside its various make files. This ca=
n cause a problem since these paths will be from your build machine.
>> This is only the module source, as specified in the recipe:=20
>> TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
>> S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> Can u do a grep and confirm no paths are included?
>>>=20
>>>> CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx =3D "1"
>>>> SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx =3D "board-support/ext=
ra-drivers/${PN}-${PV}"
>>>>=20
>>>> diff --git
>>>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefi
>>>> l
>>>> e
>>>> /Makefile_omap3-sgx-modules
>>>> b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefi
>>>> l
>>>> e
>>>> /Makefile_omap3-sgx-modules
>>>> new file mode 100644
>>>> index 0000000..2bc0ba5
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-ma
>>>> +++ k
>>>> +++ e
>>>> +++ file/Makefile_omap3-sgx-modules
>>>> @@ -0,0 +1,29 @@
>>>> +omap3-sgx-modules: linux
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @echo      Building omap3-sgx-modules
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @cd board-support/extra-drivers; \
>>>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>>>> +    make ARCH=3Darm KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR)
>>>> +BUILD=3Drelease TI_PLATFORM=3D__PLATFORM_SGX__ SUPPORT_XORG=3D0
>>> Make sure you test this and compare against how we build the recipe in =
OE. I remembered in the past you needed a special flag passed in to insure =
PM runtime worked.
>> I got the make options directly from the recipe.
>>>=20
>>> So really you need to test this by removing all the sgx modules from th=
e SDK and let the make install run on ur filesystem and see if everything  =
still works. This includes suspend and resume while an sgx demo is running.
>> How do you  test this?
> http://processors.wiki.ti.com/index.php/Linux_Core_Power_Management_Us
> er%27s_Guide#Suspend.2FResume
>>>> +
>>>> +omap3-sgx-modules_clean:
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @echo      Cleaning omap3-sgx-modules
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @cd board-support/extra-drivers; \
>>>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>>>> +    make ARCH=3Darm KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR) clean
>>>> +
>>>> +omap3-sgx-modules_install:
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @echo      Installing omap3-sgx-modules
>>>> +    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +    @if [ ! -d $(DESTDIR) ] ; then \
>>>> +        echo "The extracted target filesystem directory doesn't exist=
."; \
>>>> +        echo "Please run setup.sh in the SDK's root directory and the=
n try again."; \
>>>> +        exit 1; \
>>>> +    fi
>>>> +    @cd board-support/extra-drivers; \
>>>> +    cd `find . -maxdepth 1 -name "omap3-sgx-modules*"`; \
>>>> +    make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd`
>>>> +INSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET)=20
>>>> +modules_install
>>> This will cause problems as is. The graphics recipe for reasons I never=
 installs the graphics modules differently then the graphics SDK.
>>> Typing from my phone. *reasons I never liked So you will end with=20
>>> two versions of the graphics SDK in ur fs and both will try to load and=
 maybe possibly fail.
>>>=20
>>> So either update the OE recipe to use the makefile install or update th=
is part to mimic the OE way it built things.
>>> *built and installs things
>> It seems that the recipe tries to fake that these modules are not out-of=
-tree, and I guess yocto can hide this by updating the necessary /lib/modul=
es/<k_ver>/modules.* files. Without installing it like this, then the modul=
es cannot be found by "modprobe".
> If this is the case then how did this work for u?
> Did you try modifying the kernel and using the rebuilt kernel and modules=
 to verify that this works.
>>>> +
>>>> diff --git
>>>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefi
>>>> l
>>>> e
>>>> _1.0.bb
>>>> b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefi
>>>> l
>>>> e
>>>> _1.0.bb
>>>> index ffedd4c..a31bb69 100644
>>>> ---
>>>> a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefi
>>>> l
>>>> e
>>>> _1.0.bb
>>>> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-ma
>>>> +++ k
>>>> +++ e
>>>> +++ file_1.0.bb
>>>> @@ -34,9 +34,10 @@ SRC_URI =3D "\
>>>>  file://Makefile_dual-camera-demo \  file://Makefile_image-gallery=20
>>>> \  file://Makefile_cryptodev \
>>>> +    file://Makefile_omap3-sgx-modules \
>>>> "
>>>>=20
>>>> -PR =3D "r41"
>>>> +PR =3D "r42"
>>>>=20
>>>> MAKEFILES_COMMON =3D "linux \
>>>>                  matrix-gui \
>>>> @@ -69,6 +70,7 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
>>>>                         linux-dtbs \
>>>>                         wireless \
>>>>                         cryptodev \
>>>> +                           omap3-sgx-modules \
>>>> "
>>>> MAKEFILES_append_ti43x =3D " u-boot-spl \
>>>>                         ${QUICK_PLAYGROUND} \ @@ -76,6 +78,7 @@=20
>>>> MAKEFILES_append_ti43x =3D " u-boot-spl \
>>>>                         linux-dtbs \
>>>>                         wireless \
>>>>                         cryptodev \
>>>> +                           omap3-sgx-modules \
>>>>                         dual-camera-demo \
>>>>                         image-gallery \ "
>>>> @@ -95,6 +98,10 @@ MAKEFILES_append_am180x-evm =3D " pru \=20
>>>> PLATFORM_ARCH =3D "armv7-a"
>>>> PLATFORM_ARCH_omapl138 =3D "armv5te"
>>>>=20
>>>> +PLATFORM_SGX =3D ""
>>>> +PLATFORM_SGX_ti33x =3D "ti335x"
>>>> +PLATFORM_SGX_ti43x =3D "ti43xx"
>>>> +
>>>> KERNEL_BUILD_CMDS =3D "${@base_conditional('KERNEL_IMAGETYPE','uImage'=
,'LOADADDR=3D${UBOOT_LOADADDRESS} uImage','zImage',d)}"
>>>>=20
>>>> KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-bo=
ne.dtb am335x-boneblack.dtb"
>>>> @@ -150,6 +157,8 @@ do_install () {
>>>>=20
>>>>  sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/"=20
>>>> ${D}/Makefile
>>>>=20
>>>> +    sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
>>>> +
>>>>  cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
>>>>=20
>>>>  if [ "$?" =3D=3D "0" ]
>>>> --
>>>> 1.7.9.5
>>>>=20
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

