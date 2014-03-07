Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EF0D052A14
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 20:38:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27Kc1B7005337
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:38:01 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27Kc19q026991
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:38:01 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 7 Mar 2014 14:38:01 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH] mcsdk-dylan-config: Update
	mcsdk-config to use java layer
Thread-Index: AQHPOkCCWtltJDe6CUS/O11Awnlj7prWcVIA//+kalA=
Date: Fri, 7 Mar 2014 20:38:01 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F4FCEA@DLEE11.ent.ti.com>
References: <1394222695-22077-1-git-send-email-sam.nelson@ti.com>
	<20140307200544.GO22125@edge>
In-Reply-To: <20140307200544.GO22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [oe-layersetup][PATCH] mcsdk-dylan-config: Update mcsdk-config to use java layer
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
X-List-Received-Date: Fri, 07 Mar 2014 20:38:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 07, 2014 3:06 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [oe-layersetup][PATCH] mcsdk-dylan-config:
> Update mcsdk-config to use java layer
>=20
> Thanks, that already went in.
>=20
> On Fri, Mar 07, 2014 at 03:04:55PM -0500, Sam Nelson wrote:
> > - Needed to support openjdk in filesystem for XDC tools native compilat=
ion
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  configs/mcsdk/mcsdk-dylan-config.txt |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/configs/mcsdk/mcsdk-dylan-config.txt b/configs/mcsdk/mcsdk=
-
> dylan-config.txt
> > index 9925642..1489b7b 100644
> > --- a/configs/mcsdk/mcsdk-dylan-config.txt
> > +++ b/configs/mcsdk/mcsdk-dylan-config.txt
> > @@ -8,6 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-
> qt5.git,master,HEAD,layers=3D
> >  meta-openembedded,git://git.openembedded.org/meta-
> openembedded,dylan,HEAD,layers=3Dtoolchain-layer:meta-networking:meta-
> ruby:meta-oe
> >  meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=3D
> >  meta-linaro,git://git.linaro.org/openembedded/meta-
> linaro.git,dylan,HEAD,layers=3Dmeta-linaro-toolchain
> > +meta-java,git://github.com/woglinde/meta-java,master,HEAD,layers=3D
> >  oe-core,git://git.openembedded.org/openembedded-
> core,dylan,HEAD,layers=3Dmeta
> >  OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >  OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

