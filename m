Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 65435529E5
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 07:31:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0387TBLG012086;
	Wed, 8 Apr 2020 02:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586330951;
	bh=T45uME+EVsPZPHydc4fuXu3MPuhw3qArwvFdUgjREPY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PECmaF7hFDrD2izPDMQWqpZSI/vjLt77OG7QqX3DjgM4fSnOgSj4VrYvYcGGxm3xr
	p0GX1LUwqA6Wc5vAkN4m2BEgCfAKpM8bConQhSCcX253WBCt+chPiOGYu0zQq/8a7b
	+Z99Y0oVcrQoSZWtouIWK4zi5mxP/3FnbC4L/7s4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0387TBC6040082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Apr 2020 02:29:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 8 Apr 2020 02:29:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 8 Apr 2020 02:29:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0387TBnj112255;
	Wed, 8 Apr 2020 02:29:11 -0500
Date: Wed, 8 Apr 2020 03:29:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Message-ID: <20200408072911.GT24070@beryl>
References: <1586307071-8916-1-git-send-email-denis@denix.org>
	<SY2PR01MB2426FA52445FE2AB9C08818FE5C00@SY2PR01MB2426.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY2PR01MB2426FA52445FE2AB9C08818FE5C00@SY2PR01MB2426.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master][PATCH] arago.conf, packagegroup-arago-tisdk-qte: enable examples PACKAGECONFIG for qt5 modules
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
X-List-Received-Date: Wed, 08 Apr 2020 07:31:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 08, 2020 at 01:05:46AM +0000, Ankur Tyagi wrote:
> Hi Denys
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
> > project.org> On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, 8 April 2020 12:51 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [master][PATCH] arago.conf, packagegroup-arago-tisdk-
> > qte: enable examples PACKAGECONFIG for qt5 modules
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > qtdeclarative-examples is broken for now.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf                     | 12 +++++++++++-
> >  .../packagegroups/packagegroup-arago-tisdk-qte.bb            |  2 +-
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> > distro/conf/distro/arago.conf
> > index 3215fe7..05201f3 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -103,7 +103,17 @@ PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples
> > accessibility gif gbm kms libinpu  PACKAGECONFIG_FONTS_pn-qtbase =
> > "fontconfig"
> > 
> >  # Add gstreamer in package configuration to enable video -
> > PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
> > +PACKAGECONFIG_append_pn-qtmultimedia = " gstreamer"
> > +
> > +# Add examples in Qt5 package configurations
> > +PACKAGECONFIG_append_pn-qtcharts = " examples"
> > +#PACKAGECONFIG_append_pn-qtdeclarative = " examples"
> > +PACKAGECONFIG_append_pn-qtlocation = " examples"
> > +PACKAGECONFIG_append_pn-qtmultimedia = " examples"
> > +PACKAGECONFIG_append_pn-qtscript = " examples"
> > +PACKAGECONFIG_append_pn-qtserialport = " examples"
> > +PACKAGECONFIG_append_pn-qtsvg = " examples"
> > +PACKAGECONFIG_append_pn-qtwayland = " examples"
> 
> That means every image including Qt5 based on arago now have to override these
> PACKAGECONFIG in bbappends as I don't expect anyone to include examples in their
> production image.
> Could this inclusion of examples in PACKAGECONFIG be handled in a better way that doesn't
> impact other arago users? Somewhere inside packagegroup-arago-tisdk-qte?

That's not how it works. PACKAGECONFIG controls what gets built, and not what 
gets included into the images.

This patch actually restores existing behavior - meta-qt5 used to enable 
examples for all qt5 modules, based on qtbase PACKAGECONFIG, which is already 
set above. Now meta-qt5 requires "examples" PACKAGECONFIG for each individual 
qt5 module.

And packagegroup-arago-tisdk-qte below already had all corresponding examples 
packages listed to be added into our default image. But you are free not to 
include such packages into your production image - it's as simple as not 
listing them in corresponding RDEPENDS on IMAGE_INSTALL...

-- 
Denys


> >  # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> > PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6",
> > "ipv6", "", d)} ssl zlib"
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-qte.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > index f83ac52..a2e3794 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > +++ sdk-qte.bb
> > @@ -12,9 +12,9 @@ QT4_DEMOS = "\
> >      ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles',
> > 'quick-playground', '', d)} \  "
> > 
> > +#    qtdeclarative-examples
> >  QT5_DEMOS = "\
> >      qtbase-examples \
> > -    qtdeclarative-examples \
> >      qtdeclarative-tools \
> >      qtlocation-examples \
> >      qtmultimedia-examples \
> > --
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

