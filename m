Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 396AE52A67
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 18:44:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MIiKX4026871
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506105860;
	bh=rXqy3UafNy9bca/T3JmkbnBVzFK5j7YDaafzqxDmix4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bRvQxay01OEG+57WtiVR6gz82B9IObPQutXAD8FRTT/p57g3A/5E1buXEywpnoulv
	zHNYWhBJVP37wNajKsQCQcHtlfDM8kg55cSMwawC0cs1u6CuBIBB0x4T3dWGo1EqWl
	akyqXzJX3S7bAgVsPYOUwi50cYy4PChtzbD299EQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MIiKju011849
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:44:20 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Fri, 22 Sep 2017 13:44:19 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][morty][PATCH v1 2/6] matrix-gui-apps-git : update
	SRCREV version
Thread-Index: AQHTI2QKM4tvM8DVEUSwYizv6lWgQaKw6e6AgBBTXXCAAHKtgP//rn0Q
Date: Fri, 22 Sep 2017 18:44:18 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC55C22@DFLE12.ent.ti.com>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
	<20170901205107.25462-2-manisha.agrawal@ti.com>
	<20170912022548.GT8304@edge>
	<3AC2660648D2B04999D9C7562469E8AF7EC55BC3@DFLE12.ent.ti.com>
	<20170922183447.GP26843@edge>
In-Reply-To: <20170922183447.GP26843@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty][PATCH v1 2/6] matrix-gui-apps-git : update SRCREV version
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
X-List-Received-Date: Fri, 22 Sep 2017 18:44:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yeah, I see it there but somehow below instruction is not updating the dire=
ctories/recipes
#./oe-layertool-setup.sh  -f configs/arago-morty-config.txt

Do I need to fresh clone tisdk and run above instruction?

Regards,
Manisha


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, September 22, 2017 1:35 PM
To: Agrawal, Manisha
Cc: meta-arago@arago-project.org; Stiffler, Jacob
Subject: Re: [meta-arago][morty][PATCH v1 2/6] matrix-gui-apps-git : update=
 SRCREV version

Manisha,

All evse-hmi patches were merged to morty branch. See this changelog on=20
2017-08-31 between ti2017.04-rc1 and ti2017.04-rc2 tags:

http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dshortlog;h=3Drefs/head=
s/morty

--=20
Denys


On Fri, Sep 22, 2017 at 02:25:06PM -0400, Agrawal, Manisha wrote:
> Hi Denys,
>=20
> Which meta-arago branch is attached patch series applied to? My patch ser=
ies=20
> below are on top of attached one. I tried to update my local repo with be=
low=20
> instruction but I do not see evse-hmi under meta-arago-extras/recipe-apps=
/
> #./oe-layertool-setup.sh  -f configs/arago-morty-config.txt
>=20
>=20
> Regards,
> Manisha
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys=20
> Sent: Monday, September 11, 2017 9:26 PM
> To: Agrawal, Manisha
> Cc: meta-arago@arago-project.org; Stiffler, Jacob
> Subject: Re: [meta-arago][morty][PATCH v1 2/6] matrix-gui-apps-git : upda=
te SRCREV version
>=20
> On Fri, Sep 01, 2017 at 03:51:03PM -0500, Manisha Agrawal wrote:
> > Add new demo pretection-relays-hmi in hmi_apps.
>=20
> "pretection"
>=20
>=20
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.=
inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index 551416d9..1b20f919 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,7 +4,7 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149c=
b25f373057fa9"
> >  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> > =20
> >  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;pro=
tocol=3Dgit;branch=3D${BRANCH}"
> > -SRCREV =3D "50a2f2ec7043e17bc7af72186e3d0a8d7773ec0a"
> > +SRCREV =3D "094736065e1a15a49da19ef4c5a100aa763c41d1"
> >  BRANCH =3D "master"
> >  INC_PR =3D "r48"
> > =20
> > --=20
> > 2.13.0
> >=20

Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE72.ent.ti.com
 (128.247.5.109) with Microsoft SMTP Server (TLS) id 14.3.294.0; Thu, 31 Au=
g
 2017 14:02:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Thu, =
31
 Aug 2017 14:02:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=3DTLS1_0,
 cipher=3DTLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transpo=
rt;
 Thu, 31 Aug 2017 14:02:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
 dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VJ2mQf010131;	Thu, 31 Au=
g
 2017 14:02:48 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
CC: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Stiffle=
r,
 Jacob" <j-stiffler@ti.com>
Subject: Re: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo
Thread-Topic: [meta-arago][morty][PATCH v3 1/7] evse-hmi : add new demo
Thread-Index: AQHTIblaDylsZV2NCUSDbzHOnlsw4aKfJ9IA
Date: Thu, 31 Aug 2017 15:02:44 -0400
Message-ID: <20170831190244.GB8304@edge>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE107.ent.ti.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=3D"us-ascii"
Content-ID: <67368E74756CB6439B51C29CF3D1000A@owa.mail.ti.com>
MIME-Version: 1.0
>=20
> Thanks. The entire series now looks good. Though your separate patch for
> tisdk-rootfs-image should have been part of this series as well, somewher=
e
> between patch #6 and #7...
>=20
> --
> Denys
>=20
>=20
> On Wed, Aug 30, 2017 at 12:56:41PM -0500, Manisha Agrawal wrote:
> > EVSE stands for electronic vehicle supply station.  This demo is create=
d as part
> > of TID on EVSE to demonsrate drawing the gui for EVSE application using=
 QT
> > QWidget and rendering on LCD panel using  linuxfb QPA.
> >
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_gi=
t.bb
> >
> > diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/=
meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> > new file mode 100755
> > index 00000000..27a58a96
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "HMI demo for electronic vehicle charging station (EVSE) u=
sing QT QWidget tools"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=
=3Da9cde3921a8be42ed79ab74661799104"
> > +
> > +inherit qt-provider
> > +
> > +PV =3D "1.0"
> > +PR =3D "r0"
> > +
> > +BRANCH =3D "master"
> > +SRC_URI =3D "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=3Dgit=
;branch=3D${BRANCH}"
> > +
> > +SRCREV =3D "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 755 evse_hmi ${D}${bindir}
> > +}
> > --
> > 2.13.0
> >


