Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 89A6D52A7F
	for <meta-arago@arago-project.org>;
	Sat, 21 Mar 2015 17:35:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2LHZNnL009237
	for <meta-arago@arago-project.org>; Sat, 21 Mar 2015 12:35:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2LHZM7Z013056
	for <meta-arago@arago-project.org>; Sat, 21 Mar 2015 12:35:22 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Sat, 21 Mar 2015 12:35:21 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2 1/2]
	packagegroup-arago-base-tisdk-server-extra: Add new package group
Thread-Index: AQHQUT7e4skZjYaYaEa+ZCLZKvbu7Z0m4fYAgAB2DZA=
Date: Sat, 21 Mar 2015 17:35:21 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905815C1F1@DLEE11.ent.ti.com>
References: <1424898364-24979-1-git-send-email-sam.nelson@ti.com>
	<20150321053144.GV11557@edge>
In-Reply-To: <20150321053144.GV11557@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2 1/2] packagegroup-arago-base-tisdk-server-extra: Add new package group
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
X-List-Received-Date: Sat, 21 Mar 2015 17:35:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After the discussion in the mailing list earlier, this can be removed.
You want me to send an updated patch.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Saturday, March 21, 2015 1:32 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2 1/2] packagegroup-arago-base-tisdk-
> server-extra: Add new package group
>=20
> Sam,
>=20
> Please see at the very end.
>=20
>=20
> On Wed, Feb 25, 2015 at 04:06:03PM -0500, Sam Nelson wrote:
> > - Adds other packages libnl, perl, ndisc6, python and other ti packages
> >   meant to be shared by tisdk server filesystem.
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Update from previous version for patch
> > -- Reorganised to separate Machine specific packages
> > -- Added additional components
> > ---
> > ---
> >  .../packagegroup-arago-base-tisdk-server-extra.bb  |  163
> ++++++++++++++++++++
> >  1 file changed, 163 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > new file mode 100644
> > index 0000000..5f71b2f
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk-server-extra.bb
> > @@ -0,0 +1,163 @@
> > +DESCRIPTION =3D "Additional packages beyond console packages shared by=
 TI
> SDKs"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4d
> e20420"
> > +PR =3D "r0"
> > +
> > +inherit packagegroup
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +ARAGO_LIBNL =3D "\
> > +    libnl-route \
> > +    libnl-nf \
> > +    libnl-genl \
> > +    libnl-cli \
> > +    "
> > +
> > +ARAGO_PERL =3D "\
> > +    perl \
> > +    perl-module-carp \
> > +    perl-module-class-struct \
> > +    perl-module-errno \
> > +    perl-module-exporter \
> > +    perl-module-exporter-heavy \
> > +    perl-module-fcntl \
> > +    perl-module-file-spec \
> > +    perl-module-file-spec-unix \
> > +    perl-module-file-stat \
> > +    perl-module-io-dir \
> > +    perl-module-io-file \
> > +    perl-module-io-handle \
> > +    perl-module-io-pipe \
> > +    perl-module-io-poll \
> > +    perl-module-io-seekable \
> > +    perl-module-io-select \
> > +    perl-module-io-socket-inet \
> > +    perl-module-io-socket-unix \
> > +    perl-module-io-socket \
> > +    perl-module-io \
> > +    perl-module-list-util \
> > +    perl-module-selectsaver \
> > +    perl-module-socket \
> > +    perl-module-strict \
> > +    perl-module-symbol \
> > +    perl-module-tie-handle \
> > +    perl-module-tie-hash \
> > +    perl-module-tie-stdhandle \
> > +    perl-module-vars \
> > +    perl-module-warnings-register \
> > +    perl-module-warnings \
> > +    perl-module-xsloader \
> > +    "
> > +
> > +ARAGO_NDISC6 =3D "\
> > +    ndisc6-ndisc6 \
> > +    ndisc6-rdisc6 \
> > +    ndisc6-rltraceroute6 \
> > +    ndisc6-tcpspray6 \
> > +    ndisc6-tcptraceroute6 \
> > +    ndisc6-tracert6 \
> > +    "
> > +
> > +ARAGO_PYTHON =3D "\
> > +    python-core \
> > +    python-io \
> > +    python-ctypes \
> > +    python-json \
> > +    python-numpy \
> > +    python-codecs \
> > +    python-subprocess \
> > +    python-pickle \
> > +    python-shell \
> > +    python-logging \
> > +    python-mmap \
> > +    python-profile \
> > +    python \
> > +    "
> > +
> > +ARAGO_SECURE_STORAGE =3D "\
> > +    ti-softhsmv2 \
> > +    libp11 \
> > +    engine-pkcs11 \
> > +    "
> > +
> > +ARAGO_TI_KEYSTONE_PKGS =3D "\
> > +    ${ARAGO_SECURE_STORAGE} \
> > +    uio-module-drv \
> > +    multiprocmgr \
> > +    mpm-transport \
> > +    traceframework \
> > +    cuia \
> > +    hplib \
> > +    hplib-mod \
> > +    netapi \
> > +    netapi-test \
> > +    ipsecmgr-mod \
> > +    libnl-xfrm \
> > +    demo-image-proc \
> > +    ti-ipc \
> > +    rm-lld \
> > +    cmem \
> > +    cmem-mod \
> > +    mmap-lld \
> > +    udma \
> > +    cuia \
> > +    qmss-lld \
> > +    pa-lld \
> > +    cppi-lld \
> > +    edma3-lld \
> > +    hyplnk-lld \
> > +    pktlib \
> > +    nwal-lld \
> > +    srss-tc \
> > +    "
> > +
> > +ARAGO_TI_PKGS =3D "\
> > +    uio-module-drv \
> > +    cmem \
> > +    cmem-mod \
> > +    "
> > +ARAGO_TI_PKGS_append_keystone =3D "${ARAGO_TI_KEYSTONE_PKGS}"
> > +ARAGO_TI_PKGS_append_k2l-evm =3D "\
> > +    dfe-lld \
> > +    iqn2-lld \
> > +    "
> > +
> > +ARAGO_TI_PKGS_append_k2hk-evm =3D "\
> > +    srio-lld \
> > +    "
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    ${ARAGO_LIBNL} \
> > +    ${ARAGO_PERL} \
> > +    ${ARAGO_NDISC6} \
> > +    ${ARAGO_PYTHON} \
> > +    ${ARAGO_TI_PKGS} \
> > +    ptpd \
> > +    vsftpd \
> > +    syslog-ng \
> > +    dtc \
> > +    strongswan \
> > +    procps \
> > +    dhcp-client \
> > +    ipsec-tools \
> > +    kexec \
> > +    kdump \
> > +    tzdata \
> > +    lksctp-tools \
> > +    lksctp-tools-utils \
> > +    libdnet \
> > +    vtun \
> > +    bridge-utils \
> > +    ebtables \
> > +    rng-tools \
> > +    elfutils \
> > +    zip \
> > +    libsdl \
> > +    libgomp \
> > +    libgomp-dev \
> > +    file \
> > +    libbz2 \
> > +    boost \
> > +    libgl \
>=20
> ^^^^^^^^^^^^^
> So, why do you have libgl here? I thought you don't have any graphics and=
 it's
> definitely breaking the build now...
>=20
> --
> Denys

