Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3424252A1F
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 18:06:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LI6JZK029880
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506017179;
	bh=7qoT+9YUgafwmtPahBFmrE7Cj+DDDWnTqX8c9/GUaEo=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=zTh6xz81FYpivcm+0EOVtPGWQnZy39X7tO9CYm+XKkVbsjG7/FauDcrj4sJhXmjDW
	tgcBEzvBOvzn0rMw7EJc4N/kBm6RY4dBTv+LBbhQuTL5+ELVlkuoalCyOl6ylNPn7w
	y7I6m0tRKy8pQqjjYk+EObVm80i+/1KBxfDal3bY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LI6Ep3016093
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:06:14 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 21 Sep 2017 13:06:13 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processsor-sdk] [PATCH]
	ti-pdk.bbclass: added to enable the building of icss-emac firmware
	binaries
Thread-Index: AQHTMmWc5VM4yrpDEky1vPCAkbDfpqK/o8AQ
Date: Thu, 21 Sep 2017 18:06:13 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825455E3F@DFLE09.ent.ti.com>
References: <1505936620-7090-1-git-send-email-a0271529@ti.com>
	<eef87279-9c58-ce5e-248b-70784aadf6f4@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D7F37F@DLEE08.ent.ti.com>
	<abc38198-9aa6-d875-027d-bd1aa437b333@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D7F3F7@DLEE08.ent.ti.com>
	<8d650b6f-6249-6938-7b6c-a1fc20e1e01e@ti.com>
In-Reply-To: <8d650b6f-6249-6938-7b6c-a1fc20e1e01e@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processsor-sdk] [PATCH] ti-pdk.bbclass: added to enable the building of icss-emac firmware binaries
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
X-List-Received-Date: Thu, 21 Sep 2017 18:06:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed with a small fixup to added the ti-cgt-pru dependency.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, September 20, 2017 7:10 PM
> To: Gou, Hongmei; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [meta-processsor-sdk] [PATCH] ti-
> pdk.bbclass: added to enable the building of icss-emac firmware binaries
>=20
>=20
>=20
> On 9/20/2017 6:07 PM, Gou, Hongmei wrote:
> >> -----Original Message-----
> >> From: Stiffler, Jacob
> >> Sent: Wednesday, September 20, 2017 5:12 PM
> >> To: Gou, Hongmei; meta-arago@arago-project.org
> >> Subject: Re: [EXTERNAL] [meta-arago] [meta-processsor-sdk] [PATCH]
> >> ti-
> >> pdk.bbclass: added to enable the building of icss-emac firmware
> >> binaries
> >>
> >>
> >>
> >> On 9/20/2017 5:01 PM, Gou, Hongmei wrote:
> >>>> -----Original Message-----
> >>>> From: Stiffler, Jacob
> >>>> Sent: Wednesday, September 20, 2017 4:19 PM
> >>>> To: Gou, Hongmei; meta-arago@arago-project.org
> >>>> Subject: Re: [EXTERNAL] [meta-arago] [meta-processsor-sdk] [PATCH]
> >>>> ti-
> >>>> pdk.bbclass: added to enable the building of icss-emac firmware
> >>>> binaries
> >>>>
> >>>>
> >>>>
> >>>> On 9/20/2017 3:43 PM, Hongmei Gou wrote:
> >>>>> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> >>>>> ---
> >>>>>     classes/ti-pdk.bbclass | 115
> >>>> +++++++++++++++++++++++++++++++++++++++++++++++++
> >>>>>     1 file changed, 115 insertions(+)
> >>>>>     create mode 100644 classes/ti-pdk.bbclass
> >>>>>
> >>>>> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass new
> >>>>> file mode 100644 index 0000000..1e3a7cb
> >>>>> --- /dev/null
> >>>>> +++ b/classes/ti-pdk.bbclass
> >>>>> @@ -0,0 +1,115 @@
> >>>>> +require recipes-ti/includes/ti-paths.inc require
> >>>>> +recipes-ti/includes/ti-staging.inc
> >>>>> +
> >>>>> +inherit perlnative
> >>>>> +
> >>>>> +DEPENDS =3D "ti-xdctools ti-cg-xml-native ti-sysbios
> >>>>> +common-csl-ip-rtos
> >>>> libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native
> >>>> ti-pdk- build-rtos"
> >>>>> +
> >>>>> +DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native"
> >>>>> +DEPENDS_remove_ti33x =3D "ti-cgt6x-native"
> >>>>> +DEPENDS_remove_ti43x =3D "ti-cgt6x-native"
> >>>>> +DEPENDS_append_omapl1 =3D " ti-cgt-arm-native"
> >>>>> +
> >>>>> +S =3D "${WORKDIR}/git"
> >>>>> +B =3D "${WORKDIR}/build"
> >>>>> +
> >>>>> +# HTML hyperlink text
> >>>>> +PDK_COMP_LINK_TEXT ?=3D ""
> >>>>> +
> >>>>> +DOC_FILE =3D "API_Documentation_${PN}.html"
> >>>>> +
> >>>>> +create_doc_link () {
> >>>>> +    PDK_COMP_DIR=3D`get_build_dir_bash`
> >>>>> +
> >>>>> +    echo "<a
> >>>>>
> >>
> +href=3D\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${PDK_COM
> >>>> P_LINK
> >>>>> +_TEXT}</a>" >>
> >>>>>
> +${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc/${DOC_FILE}
> >>>>> +}
> >>>>> +
> >>>>> +get_build_dir_bash() {
> >>>>> +  if [ -f ${S}/package.xdc ]
> >>>>> +  then
> >>>>> +    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk
> >>>>> +'{ print $2 }' |
> >>>> sed -e 's|\.|/|g'
> >>>>> +  else
> >>>>> +    echo ${S}
> >>>>> +    return 1
> >>>>> +  fi
> >>>>> +}
> >>>>> +
> >>>>> +export CROSS_TOOL_PRFX=3D"arm-none-eabi-"
> >>>>> +export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> >>>>> +export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
> >>>>> +export TOOLCHAIN_PATH_A15 =3D
> "${GCC_ARM_NONE_TOOLCHAIN}"
> >>>>> +export TOOLCHAIN_PATH_M4 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
> >>>>> +export TOOLCHAIN_PATH_Arm9 =3D
> "${M4_TOOLCHAIN_INSTALL_DIR}"
> >>>>> +export C6X_GEN_INSTALL_PATH =3D
> >>>> "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >>>>> +export CL_PRU_INSTALL_PATH =3D "${TI_CGT_PRU_INSTALL_DIR}"
> >>>> It appears that there is a missing dependency for the PRU toolchain?
> >>>>
> >>> This is back ported from meta-ti:
> >>> http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dblob;f=3Dclasses/ti=
-pdk.
> >>> bb
> >>>
> >>
> class;h=3D1e3a7cbb25136004962404e3987c17d56ceae17d;hb=3Da2743f55c36b90e
> >> 92b
> >>> 2a9f4f684e2a67e2cbe3e0 Also TI_CGT_PRU_INSTALL_DIR has been
> >> defined in
> >>> recipes-ti/includes/ti-paths.inc.
> >> The lack of a DEPENDS on ti-cgt-pru-native appears to be a gap. If
> >> directly building icss-emac-lld-rtos, it appears that the build will
> >> fail due to the missing toolchain as icss-emac-lld-rtos does not depen=
d on
> it either.
> >>
> > Thanks for catching this.
> >
> > pruss-lld-rtos_git.bb in my local build has DEPENDS on ti-cgt-pru-nativ=
e:
> > DEPENDS_append =3D " osal-rtos ti-cgt-pru-native"
> >
> > icss-emac-lld-rtos has DEPENDS on pruss-lld-rtos.
> >
> > Will submit a patch to add back the DEPENDS on ti-cgt-pru-native in pru=
ss-
> lld-rtos_git.bb.
>=20
> I think the depends should go here because this is what is controlling
> whether or not the firmwares are build (via LIMIT_CORES). If not here, th=
en
> it should be the recipe which actually produces the firmwares.
>=20
> >
> >>>>> +
> >>>>> +export ROOTDIR =3D "${B}"
> >>>>> +export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"
> >>>>> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"
> >>>>> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
> >>>>> +
> >>>>> +export XDCPATH =3D
> >>
> "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_I
> >>>> NSTALL_DIR}/packages"
> >>>>> +export SECTTI=3D"perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
> >>>>> +
> >>>>> +TI_PDK_XDCMAKE ?=3D "1"
> >>>>> +
> >>>>> +# By default, only build the cores with available toolchains
> >>>>> +TI_PDK_LIMIT_CORES ?=3D "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x
> >>>> c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
> >>>>> +TI_PDK_LIMIT_SOCS ?=3D ""
> >>>>> +TI_PDK_LIMIT_BOARDS ?=3D ""
> >>>>> +TI_PDK_MAKE_TARGET ?=3D "release"
> >>>>> +TI_PDK_EXTRA_MAKE ?=3D ""
> >>>>> +
> >>>>> +TI_PDK_XDC_ARGS ?=3D "${TI_PDK_LIMIT_SOCS}"
> >>>>> +
> >>>>> +PARALLEL_XDC =3D "--jobs=3D${BB_NUMBER_THREADS}"
> >>>>> +
> >>>>> +do_configure() {
> >>>>> +    BUILD_DIR=3D${B}/`get_build_dir_bash`
> >>>>> +
> >>>>> +    mkdir -p ${BUILD_DIR}
> >>>>> +    cp -r ${S}/* ${BUILD_DIR}
> >>>>> +
> >>>>> +    if [ "${TI_PDK_XDCMAKE}" =3D=3D "1" ]
> >>>>> +    then
> >>>>> +        cd ${BUILD_DIR}
> >>>>> +
> >>>>> +        sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
> >>>>> +        find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
> >>>>> +        find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} =
\;
> >>>>> +        find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
> >>>>> +        find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" =
{} \;
> >>>>> +    fi
> >>>>> +}
> >>>>> +
> >>>>> +do_compile() {
> >>>>> +
> >>>>> +    if [ "${TI_PDK_XDCMAKE}" =3D=3D "1" ]
> >>>>> +    then
> >>>>> +        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
> >>>>> +        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC}
> >>>> XDCARGS=3D"${TI_PDK_XDC_ARGS}" ROOTDIR=3D"${ROOTDIR}" -PR .
> >>>>> +        ${XDC_INSTALL_DIR}/xdc release
> >> XDCARGS=3D"${TI_PDK_XDC_ARGS}"
> >>>> -PR .
> >>>>> +    else
> >>>>> +        BUILD_DIR=3D${B}/`get_build_dir_bash`
> >>>>> +        cd ${BUILD_DIR}
> >>>>> +
> >>>>> +        make ${TI_PDK_MAKE_TARGET} \
> >>>>> +             LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" \
> >>>>> +             LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" \
> >>>>> +             LIMIT_CORES=3D"${TI_PDK_LIMIT_CORES}" \
> >>>>> +             ${TI_PDK_EXTRA_MAKE}
> >>>>> +    fi
> >>>>> +}
> >>>>> +
> >>>>> +do_install () {
> >>>>> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> >>>>> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C
> >>>>> +${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> >>>>> +
> >>>>> +    if [ "${PDK_COMP_LINK_TEXT}" !=3D "" ]
> >>>>> +    then
> >>>>> +        install -d
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
> >>>>> +        create_doc_link
> >>>>> +    fi
> >>>>> +}
> >>>>> +
> >>>>> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

