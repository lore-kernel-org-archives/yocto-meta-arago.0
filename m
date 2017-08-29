Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 054BB52ABA
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 14:29:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TETt5w021559
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 09:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504016995;
	bh=HzhSOeJ368AVVEcXYcc7HOpYXm5BpF9rYOIFQ0r9aTY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=vS4QsFqpnlCccjLPp6Fqbk7FU2JMINGR2gkiA4FSiyRop1GgfxMWRqdE7F3ryzlZN
	lkClz2R9y5goSBYfbz/CmjLCqtGG2O/Ru+MWyAvMSwdCoAwyOkFkw5TCvcLLfG/o/Y
	eK9XuJYXtxcclqV4p1azXbQGO1HX8ESEEDhA3VaQ=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TETsjJ015856
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 09:29:54 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Tue, 29 Aug 2017 09:29:54 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [matrix-gui-v2-apps][PATCH] qt5_browser: replace
	webkit-based demo browser with webengine-based one
Thread-Index: AQHTINMqxsKAgLIkakqtKOpt8PmgjqKbZNxg
Date: Tue, 29 Aug 2017 14:29:54 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825431D8B@DFLE09.ent.ti.com>
References: <1503948203-51821-1-git-send-email-e-ruei1@ti.com>
	<20170828192941.GP4311@edge>
	<009C030982313E4589C6BC55FBF1E82A253A42A6@DFLE09.ent.ti.com>
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A253A42A6@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [matrix-gui-v2-apps][PATCH] qt5_browser: replace webkit-based demo browser with webengine-based one
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
X-List-Received-Date: Tue, 29 Aug 2017 14:29:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have not pushed this yet.

> -----Original Message-----
> From: Ruei, Eric
> Sent: Tuesday, August 29, 2017 10:29 AM
> To: Dmytriyenko, Denys; Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [matrix-gui-v2-apps][PATCH] qt5_browser:
> replace webkit-based demo browser with webengine-based one
>=20
> Hi, Jake:
>=20
> Have you pushed this change yet? If you have not, I plan to generate patc=
h
> v2 to replace the webkit browser at the browser group as well.
>=20
> Best regards,
>=20
> Eric
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 28, 2017 3:30 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [matrix-gui-v2-apps][PATCH] qt5_browser:
> replace webkit-based demo browser with webengine-based one
>=20
> Looks good to me!
>=20
>=20
> Eric,
>=20
> Do you have more patches pending to finally make the switch? Thanks.
>=20
>=20
> On Mon, Aug 28, 2017 at 03:23:23PM -0400, Eric Ruei wrote:
> > Replace webkit-based demo browser because webkit is obsolete and will
> > be removed soon.
> >
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  qt5_apps/qt5_browser/qt5_browser.desktop | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop
> > b/qt5_apps/qt5_browser/qt5_browser.desktop
> > index 2f6636f..a5d3953 100644
> > --- a/qt5_apps/qt5_browser/qt5_browser.desktop
> > +++ b/qt5_apps/qt5_browser/qt5_browser.desktop
> > @@ -4,7 +4,7 @@
> >  Name=3DBrowser
> >  GenericName=3DDemo App
> >  Icon=3D/usr/share/matrix-gui-2.0/apps/images/web-icon.png
> > -Exec=3D/usr/share/qt5/examples/webkitwidgets/browser/browser
> > http://www.ti.com
> >
> +Exec=3D/usr/share/qt5/examples/webenginewidgets/demobrowser/demob
> rowser
> > +http://www.ti.com
> >  Type=3DApplication
> >  ProgramType=3Dgui
> >  Categories=3DQt5
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

