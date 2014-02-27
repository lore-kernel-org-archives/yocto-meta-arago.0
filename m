Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E9D7252A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2014 00:53:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1R0rVRm006708;
	Wed, 26 Feb 2014 18:53:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1R0rVWX000768;
	Wed, 26 Feb 2014 18:53:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Feb 2014 18:53:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1R0rU4g024299;
	Wed, 26 Feb 2014 18:53:30 -0600
Date: Wed, 26 Feb 2014 19:53:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140227005329.GV22125@edge>
References: <1393455273-32719-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6592BA@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6592BA@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-source-ipk, packagegroup-*-crypto-sdk-host: enable cryptodev sources
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
X-List-Received-Date: Thu, 27 Feb 2014 00:53:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 26, 2014 at 11:07:31PM +0000, Cooper Jr., Franklin wrote:
> Are you planning on submitting patches that also integrate this with the top 
> level Makefile, SDK integrated Makefile and also create the necessary CCS 
> project?

Good question. I wasn't planning on doing it though, at least not now. All I 
need for now is to provide sources with the SDK... But we can definitely do it 
later, as it's not a requirement for the release.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, February 26, 2014 4:55 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] arago-source-ipk, packagegroup-*-crypto-sdk-
> > host: enable cryptodev sources
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago-source-ipk.conf                 | 4 ++++
> >  .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb       | 6
> > +++++-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-
> > distro/conf/distro/arago-source-ipk.conf
> > index d2a9600..691ba60 100644
> > --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > @@ -187,6 +187,10 @@ CREATE_SRCIPK_pn-linux-omapl1 = "1"
> >  SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-
> > psp${PSPREL}"
> >  SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
> > 
> > +CREATE_SRCIPK_pn-cryptodev = "1"
> > +SRCIPK_INSTALL_DIR_pn-cryptodev = "board-support/cryptodev-${PV}"
> > +SRCIPK_PACKAGE_ARCH_pn-cryptodev = "${MACHINE_ARCH}"
> > +
> >  CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
> >  SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-
> > applications/linux-driver-examples-${PV}"
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> > index f86accf..0026ea3 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-crypto-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-crypto-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install crypto sources in SDK"
> >  LICENSE = "MIT"
> > -PR = "r5"
> > +PR = "r6"
> > 
> >  inherit packagegroup
> > 
> > @@ -11,6 +11,10 @@ CRYPTO_RDEPENDS = ""
> >  CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
> >  CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
> > 
> > +CRYPTO_RDEPENDS_append_ti33x = " cryptodev-src"
> > +CRYPTO_RDEPENDS_append_ti43x = " cryptodev-src"
> > +CRYPTO_RDEPENDS_append_dra7xx-evm = " cryptodev-src"
> > +
> >  CRYPTO_RDEPENDS_append_am37x-evm = "\
> >      ti-ocf-crypto-module-src \
> >  "
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

