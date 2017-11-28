Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4932E52961
	for <meta-arago@arago-project.org>;
	Tue, 28 Nov 2017 21:19:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vASLJIBT003693
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:19:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511903958;
	bh=VDuAd4zw/8ENdUHL7NZSDto4POyIDUYe4vHH/s7fZuM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=fRWsgjKqM/F63PxsTZ9mth3Q7kHga+DT9ya1WSSPJqspxj/Tacb7SCOfkUBhEt890
	Be9itQFq3TO80b5O1MekDsYQrS4EHASGULH6zAMl3QOmQm9S+qsJxMUOB732pMKbMG
	D37vWskG+opj/bg58wLYr0lqEfc32VCI8Q6cRa4Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASLJDZf014096
	for <meta-arago@arago-project.org>; Tue, 28 Nov 2017 15:19:13 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 28 Nov 2017 15:19:12 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.0845.034; Tue, 28 Nov 2017 15:19:12 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk] [PATCH] linux: cmem: add
	support for am574x
Thread-Index: AQHTaI3fnvQjWY0ny0iHutGoxNQpeaMqS5TA
Date: Tue, 28 Nov 2017 21:19:12 +0000
Message-ID: <3c22ef926c714c31b256a9fa21e97418@ti.com>
References: <1511903512-31813-1-git-send-email-a0271529@ti.com>
	<20171128211410.GB1300@edge>
In-Reply-To: <20171128211410.GB1300@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-processor-sdk] [PATCH] linux: cmem: add support for am574x
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
X-List-Received-Date: Tue, 28 Nov 2017 21:19:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys for the suggestion. Will submit v2 patch to add the variables =
to kernel bbappend.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, November 28, 2017 4:14 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-processor-sdk] [PATCH] linux: cmem: add
> support for am574x
>=20
> Would it be easier/cleaner to just add necessary few variables to kernel
> bbappend instead of copying entire .inc file?
>=20
>=20
> On Tue, Nov 28, 2017 at 04:11:52PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  recipes-kernel/linux/cmem.inc | 83
> +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 recipes-kernel/linux/cmem.inc
> >
> > diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.=
inc
> > new file mode 100644
> > index 0000000..64d3264
> > --- /dev/null
> > +++ b/recipes-kernel/linux/cmem.inc
> > @@ -0,0 +1,83 @@
> > +# Add concept of machine variants to split DTBs into subsets
> > +#
> > +# Use these for temporary overrides
> > +CMEM_MACHINE =3D "${MACHINE}"
> > +CMEM_MACHINE_am57xx-evm =3D "am571x am572x am574x"
> > +CMEM_MACHINE_am57xx-hs-evm =3D "am571x am572x"
> > +CMEM_MACHINE_dra7xx-evm =3D "dra71x dra72x dra74x"
> > +CMEM_MACHINE_dra7xx-hs-evm =3D "dra71x dra72x dra74x"
> > +
> > +# Set cmem.dtsi per machine or machine variant
> > +CMEM_DTSI =3D "cmem.dtsi"
> > +CMEM_DTSI_am571x =3D "cmem-am571x.dtsi"
> > +CMEM_DTSI_dra71x =3D "cmem-dra71x.dtsi"
> > +CMEM_DTSI_dra72x =3D "cmem-dra72x.dtsi"
> > +
> > +# Split device trees between variants
> > +CMEM_DEVICETREE =3D "${KERNEL_DEVICETREE}"
> > +CMEM_DEVICETREE_am571x =3D "am571x-idk.dtb am571x-idk-lcd-
> osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb"
> > +CMEM_DEVICETREE_am572x =3D "am57xx-beagle-x15.dtb am57xx-beagle-
> x15-revb1.dtb \
> > +                          am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am=
57xx-
> evm-cam-ov10635.dtb \
> > +                          am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-
> mt9t111.dtb am57xx-evm-reva3-cam-ov10635.dtb \
> > +                          am572x-idk.dtb am572x-idk-lcd-osd101t2045.dt=
b am572x-
> idk-lcd-osd101t2587.dtb"
> > +CMEM_DEVICETREE_am574x =3D "am574x-idk.dtb am574x-idk-lcd-
> osd101t2587.dtb"
> > +CMEM_DEVICETREE_dra71x =3D "dra71-evm.dtb dra71-evm-lcd-auo-
> g101evn01.0.dtb"
> > +CMEM_DEVICETREE_dra72x =3D "dra72-evm.dtb dra72-evm-lcd-lg.dtb
> dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
> > +                          dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101=
t2045.dtb
> dra72-evm-revc-lcd-osd101t2587.dtb"
> > +CMEM_DEVICETREE_dra74x =3D "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-
> evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb"
> > +
> > +# Flag to enable CMEM injection
> > +RESERVE_CMEM ?=3D "0"
> > +
> > +# Add correct cmem.dtsi to SRC_URI for each variant for a given machin=
e
> > +python do_unpack() {
> > +    old_overrides =3D d.getVar('OVERRIDES', False)
> > +
> > +    # Initialize with empty string to simplify logic to append to SRC_=
URI
> > +    cmem_dtsi =3D set([''])
> > +
> > +    for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').split()=
:
> > +        # Create copy of data for additional override
> > +        localdata =3D bb.data.createCopy(d)
> > +        localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine,
> old_overrides))
> > +        bb.data.update_data(localdata)
> > +
> > +        cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
> > +
> > +    d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
> > +    bb.build.exec_func('base_do_unpack', d)
> > +}
> > +
> > +python do_setup_cmem() {
> > +    import shutil
> > +
> > +    old_overrides =3D d.getVar('OVERRIDES', False)
> > +
> > +    if d.getVar('RESERVE_CMEM', True) is '1':
> > +        for cmem_machine in (d.getVar('CMEM_MACHINE', True) or '').spl=
it():
> > +            # Create copy of data for additional override
> > +            localdata =3D bb.data.createCopy(d)
> > +            localdata.setVar('OVERRIDES', '%s:%s' % (cmem_machine,
> old_overrides))
> > +            bb.data.update_data(localdata)
> > +
> > +            # Get source directory and dtsi filename
> > +            src_dir  =3D localdata.getVar('WORKDIR', True)
> > +            src_dtsi =3D localdata.getVar('CMEM_DTSI', True)
> > +
> > +            # Get destination directory and destination dtsi filename =
which adds
> > +            #   the MACHINE prefix.
> > +            dst_dir  =3D os.path.join(localdata.getVar('S', True),
> 'arch/arm/boot/dts')
> > +            dst_dtsi =3D localdata.expand('${MACHINE}-${CMEM_DTSI}')
> > +
> > +            # Copy cmem.dtsi into source tree
> > +            shutil.copy(os.path.join(src_dir,src_dtsi),
> os.path.join(dst_dir,dst_dtsi))
> > +
> > +            # Inject dtsi into each dts in list
> > +            for dtb in (localdata.getVar('CMEM_DEVICETREE', True) or '=
').split():
> > +                dts =3D dtb[:-4] + '.dts'
> > +
> > +                with open(os.path.join(dst_dir,dts), 'a') as dts_file:
> > +                    dts_file.write('\n#include "%s"\n' % dst_dtsi)
> > +}
> > +
> > +do_patch[postfuncs] +=3D "do_setup_cmem"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

