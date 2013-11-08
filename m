Return-Path: <rtivy@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8AFBB52A3E
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2013 00:33:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA80X0a0028288
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 18:33:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA80X0Yo010479
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 18:33:00 -0600
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 7 Nov 2013 18:33:00 -0600
From: "Tivy, Robert" <rtivy@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23a8hPYNfzr1mEOnMtA2IqI7ZZoZxXcA///eZzCAANkm0A==
Date: Fri, 8 Nov 2013 00:33:00 +0000
Message-ID: <13514BD7FAEBA745BBD7D8A672905C14573A6C00@DFLE12.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Ring, Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Fri, 08 Nov 2013 00:33:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see my comments inline below...

Regards,

- Rob

> -----Original Message-----
> From: Nelson, Sam
> Sent: Thursday, November 07, 2013 3:50 AM
> To: Maupin, Chase; meta-arago@arago-project.org
> Cc: Ring, Chris; Tivy, Robert
> Subject: RE: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
>=20

...

>=20
> > >+
> > >+S =3D "${WORKDIR}/git"
> > >+
> > >+inherit module
> > >+
> > >+do_compile () {
> > >+    cd ${S}
> > >+    make -f lu.mak module_clean
> > >+    make -f lu.mak module
> > >KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> > >TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
> >
> > You should use the default do_compile in the module.bbclass I think.
> You
> > should be able to pass this with MAKE_TARGETS variable.
> [Sam] Probably Chris and Rob on the CC list can comment on this. This
> will need change of the module.

Can you please explain the change needed?  I'm not familiar with do_compile=
().

> >
> > >+}
> > >+
> > >+do_install () {
> > >+    cd ${S}
> > >+    make -f lu.mak module_install
> > >KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> > >EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> > >INSTALL_MOD_PATH=3D"${D}"
> >
> > Hmmm.  The default do_install for the module.bbclass uses
> > "modules_install" instead of "module_install".  If you can get the
> lu.mak file
> > updated that would be ideal.  If not then you should at least copy
> the base
> > function which unsets some variables.
> >
> [Sam] Probably Chris and Rob on the CC list can comment on this. This
> will need change of the module.

This should be fine, I will make a change to lu.mak and commit to ludev.git=
.

How about module_clean?  Should that be changed to modules_clean?

> > Is there perhaps a value to having the version in the package name
> instead of
> > using _git versions?  Will all SDKs be in step with using the same
> version?
> >
> [Sam] Chris or Rob, can you comment on this.  I am not sure of when the
> other verticals pick up CMEM.

I need to let Chris comment on this.



