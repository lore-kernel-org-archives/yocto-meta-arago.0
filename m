Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5727C529A7
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 12:42:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RCgPNv010097
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 06:42:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RCgOII028281
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 06:42:24 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 27 Feb 2015 06:42:24 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2]
	packagegroup-arago-mcsdk-toolchain-target:	Add package group for mcsdk
	toolchain
Thread-Index: AQHQUT17W4D6zjEXdUa4uAGDw0lrmp0B3keQgACdQACAAfeqxA==
Date: Fri, 27 Feb 2015 12:42:24 +0000
Message-ID: <DA8DA1A1-E75F-4150-88B3-A39AF80EE6F8@ti.com>
References: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C81E357@DLEE08.ent.ti.com>,
	<4F9216F96E5DF9428610502835A9F49058122FE9@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058122FE9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-target:	Add package group for mcsdk toolchain
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
X-List-Received-Date: Fri, 27 Feb 2015 12:42:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Feb 25, 2015, at 6:39 PM, Nelson, Sam <sam.nelson@ti.com> wrote:
>=20
> I think the intention was to allow users to choose either static or share=
d library based on their preference.
> If we have to decide on one, not sure what is the criteria to be used.
If that's is best for the user then that's fine.=20

Also I thought I remember some software licenses have a restriction regardi=
ng using static libraries (ex Qt?)  but if that isn't a concern for the sof=
tware your including then that should be fine.

> Sam
>=20
>> -----Original Message-----
>> From: Cooper Jr., Franklin
>> Sent: Wednesday, February 25, 2015 4:17 PM
>> To: Nelson, Sam; meta-arago@arago-project.org
>> Subject: RE: [meta-arago] [PATCH 1/2] packagegroup-arago-mcsdk-toolchain=
-
>> target: Add package group for mcsdk toolchain
>>=20
>> Do you really need both shared libraries and static libraries? Usually I=
've seen
>> people just include one or the other.
>>=20
>>> -----Original Message-----
>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>> bounces@arago-project.org] On Behalf Of Nelson, Sam
>>> Sent: Wednesday, February 25, 2015 2:56 PM
>>> To: meta-arago@arago-project.org
>>> Subject: [meta-arago] [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-
>>> target: Add package group for mcsdk toolchain
>>>=20
>>> - Adds ti dev packages, platform specific packages and other additional
>>> packages
>>>=20
>>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>> ---
>>> .../packagegroup-arago-mcsdk-toolchain-target.bb   |   94
>>> ++++++++++++++++++++
>>> 1 file changed, 94 insertions(+)
>>> create mode 100644 meta-arago-extras/recipes-
>>> core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
>>>=20
>>> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>>> arago-mcsdk-toolchain-target.bb b/meta-arago-extras/recipes-
>>> core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
>>> new file mode 100644
>>> index 0000000..9265a8c
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>>> arago-mcsdk-toolchain-target.bb
>>> @@ -0,0 +1,94 @@
>>> +DESCRIPTION =3D "Target dev packages for MCSDK SDK"
>>> +LICENSE =3D "BSD-3-Clause"
>>> +
>>> +PR =3D "r0"
>>> +
>>> +inherit packagegroup
>>> +
>>> +TI_PKGS_DEV =3D "\
>>> +    cmem-dev \
>>> +    cmem-staticdev \
>>> +    "
>>> +TI_SECURE_STORAGE_DEV =3D "\
>>> +    ti-softhsmv2-dev \
>>> +    libp11-dev \
>>> +    libp11-staticdev \
>>> +    "
>>> +
>>> +TI_PKGS_DEV_append_keystone =3D "\
>>> +    ${TI_SECURE_STORAGE_DEV} \
>>> +    udma-dev \
>>> +    udma-staticdev \
>>> +    traceframework-dev \
>>> +    traceframework-staticdev \
>>> +    cuia-dev \
>>> +    cuia-staticdev \
>>> +    common-csl-ip-dev \
>>> +    cppi-lld-dev \
>>> +    cppi-lld-staticdev \
>>> +    qmss-lld-dev \
>>> +    qmss-lld-staticdev \
>>> +    pa-lld-dev \
>>> +    pa-lld-staticdev \
>>> +    rm-lld-dev \
>>> +    rm-lld-staticdev \
>>> +    hyplnk-lld-dev \
>>> +    hyplnk-lld-staticdev \
>>> +    sa-lld-dev \
>>> +    sa-lld-staticdev \
>>> +    hplib-dev \
>>> +    hplib-staticdev \
>>> +    nwal-lld-dev \
>>> +    nwal-lld-staticdev \
>>> +    pktlib-dev \
>>> +    pktlib-staticdev \
>>> +    mmap-lld \
>>> +    mmap-lld-staticdev \
>>> +    netapi-dev \
>>> +    netapi-staticdev \
>>> +    ipsecmgr-dev \
>>> +    ipsecmgr-staticdev \
>>> +    libnl-xfrm-dev \
>>> +    libnl-xfrm-staticdev \
>>> +    libnl-dev \
>>> +    libnl-staticdev \
>>> +    ti-ipc-dev \
>>> +    ti-ipc-staticdev \
>>> +    multiprocmgr-dev \
>>> +    multiprocmgr-staticdev \
>>> +    mpm-transport-dev \
>>> +    mpm-transport-staticdev \
>>> +    edma3-lld-dev \
>>> +    edma3-lld-staticdev \
>>> +    lksctp-tools-dev \
>>> +    lksctp-tools-staticdev \
>>> +    "
>>> +
>>> +TI_PKGS_DEV_append_k2l-evm =3D "\
>>> +    dfe-lld-dev \
>>> +    dfe-lld-staticdev \
>>> +    iqn2-lld-dev \
>>> +    iqn2-lld-staticdev \
>>> +    "
>>> +
>>> +TI_PKGS_DEV_append_k2hk-evm =3D "\
>>> +    srio-lld-dev \
>>> +    srio-lld-staticdev \
>>> +    "
>>> +
>>> +RDEPENDS_${PN} +=3D " \
>>> +    packagegroup-arago-standalone-sdk-target \
>>> +    kernel-dev \
>>> +    ${TI_PKGS_DEV} \
>>> +    libdnet-dev \
>>> +    libdnet-staticdev \
>>> +    binutils-dev \
>>> +    binutils-staticdev \
>>> +    elfutils-dev \
>>> +    elfutils-staticdev \
>>> +    libbz2-dev \
>>> +    libbz2-staticdev \
>>> +    libgl-mesa-dev \
>>> +    boost-dev \
>>> +    libsdl-dev \
>>> +    "
>>> --
>>> 1.7.9.5
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

