Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4F90B529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 15:55:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53FtY9i031253;
	Tue, 3 Jun 2014 10:55:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53FtYMI003066;
	Tue, 3 Jun 2014 10:55:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 3 Jun 2014 10:55:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53FtXb0018684;
	Tue, 3 Jun 2014 10:55:33 -0500
Date: Tue, 3 Jun 2014 11:55:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140603155533.GC21819@edge>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-4-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6C22A7@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6C22A7@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER aware	of Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 15:55:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 03, 2014 at 02:48:12PM +0000, Cooper Jr., Franklin wrote:
> Currently we also use ARAGO_QT_PROVIDER to determine if we need to include 
> GLES based applications or not specifically quick-playground.

Right now GLES side of Qt5 apps is not complete and quick-playground is not 
ported, so it doesn't make any difference. Once more and more apps are ported 
to Qt5, we can look into that.


> We also use it to set QT_SGX_SUPPORT in 
> packagegroup-arago-qte-toolchain-target.bb and packagegroup-arago-qte.bb so 
> maybe we need to pull this variable to arago-prefs.inc make it a boolean 
> variable. This way we can still conditional set it to TRUE depending on the 
> Qt 4 version we are using and always set it to true for Qt 5.

Those packagegroups are Qt4 specific and it's still Ok to use that variable 
for that purpose. Those packagegroups won't be included when building with Qt5


> Once we fixup the QT_SGX_SUPPORT variable then we can use that variable to 
> determine if a gles application should be pulled in or not.
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, June 02, 2014 9:30 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 3/5] arago-prefs: make ARAGO_QT_PROVIDER
> > aware of Qt5
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > As ARAGO_QT_PROVIDER is used to select between gles and non-gles versions
> > of Qt4, make it aware of Qt5 and set it empty in that case.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-
> > arago-distro/conf/distro/include/arago-prefs.inc
> > index 6ae11e9..0885acf 100644
> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > @@ -25,7 +25,7 @@ PREFERRED_VERSION_libdrm = "2.4.46"
> > 
> >  PREFERRED_PROVIDER_virtual/gettext = "gettext"
> > 
> > -ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-
> > embedded-gles','qt4-embedded',d)}"
> > +ARAGO_QT_PROVIDER =
> > "${@base_contains('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES
> > ','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
> >  PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
> > 
> >  PREFERRED_VERSION_qt4-embedded = "4.8.5"
> > --
> > 1.9.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

