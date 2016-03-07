Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5D01852A79
	for <meta-arago@arago-project.org>;
	Mon,  7 Mar 2016 23:46:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27NkviN012487
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 17:46:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27NkvHR006283
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 17:46:57 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 7 Mar 2016 17:46:57 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] libnl-xfrm: add symbolic link to link
	netlink to libnl3/netlink
Thread-Index: AQHRdPnb8g6daoowFkm5T1VsXcT12Z9Oq8Jw
Date: Mon, 7 Mar 2016 23:46:56 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B90C6B@DLEE08.ent.ti.com>
References: <1456951436-25605-1-git-send-email-h-gou@ti.com>
	<20160303030729.GG7505@edge>
In-Reply-To: <20160303030729.GG7505@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] libnl-xfrm: add symbolic link to link netlink to libnl3/netlink
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
X-List-Received-Date: Mon, 07 Mar 2016 23:46:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

This is for resolving IR SDOCM00119615: netlink symbolic link is missing un=
der linux devkit

From IR Detailed Description:
"netlink symbol link is missing under usr/include. netlink was linked to li=
bnl3/netlink folder. The header files are needed for netfp proxy build. "

Also in ipsecmgr source code, the header files are referenced as under the =
netlink folder, e.g,
http://arago-project.org/git/projects/ipsecmgr.git?p=3Dprojects/ipsecmgr.gi=
t;a=3Dblob;f=3Dsrc/snoop/ipsecmgr_snoop_msg.h;h=3D388677ff5dad3174be87f1fb3=
3b3ff8f99383210;hb=3Dc385c146846a60f5f68cb12670dee6d7c5edb028
./src/snoop/ipsecmgr_snoop_msg.h:39:#include <netlink/addr.h>
./src/snoop/ipsecmgr_snoop_msg.h:40:#include <netlink/xfrm/ae.h>
./src/snoop/ipsecmgr_snoop_msg.h:41:#include <netlink/xfrm/sa.h>
./src/snoop/ipsecmgr_snoop_msg.h:42:#include <netlink/xfrm/sp.h>
./src/snoop/ipsecmgr_snoop_msg.h:43:#include <netlink/xfrm/selector.h>
./src/snoop/ipsecmgr_snoop_msg.h:44:#include <netlink/xfrm/lifetime.h>

I will modify the subject and resubmit the patch.

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 02, 2016 10:07 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] libnl-xfrm: add symbolic link to link n=
etlink
> to libnl3/netlink
>=20
> "add symbolic link to link netlink to libnl3/netlink" - please re-phrase =
the
> subject.
>=20
> Moreover, why is it required?
>=20
>=20
> On Wed, Mar 02, 2016 at 03:43:56PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git
> > a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> > b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> > index 74733f0..526ad0a 100644
> > --- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> > +++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> > @@ -14,6 +14,8 @@ BRANCH=3D"hawking_dev"
> >  SRCREV =3D "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
> >  SRC_URI =3D "git://arago-project.org/git/projects/libnl-
> xfrm.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > +PR =3D "r1"
> > +
> >  S =3D "${WORKDIR}/git"
> >
> >  LIBNL_XFRM_LIB =3D "lib/libnl-xfrm.a"
> > @@ -34,6 +36,8 @@ do_install_append() {
> >  	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
> >  	install -c -m 755 ${S}/include/netlink/xfrm/*.h
> ${D}${includedir}/libnl3/netlink/xfrm/
> >  	install -c -m 755 ${S}/lib/libnl-xfrm.so
> > ${D}${libdir}/libnl-xfrm.so.1.0.0
> > +	cd ${D}${includedir}/
> > +	ln -s libnl3/netlink netlink
> >  	cd ${D}${libdir}/
> >  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
> >  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

