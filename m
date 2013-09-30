Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BDADE52990
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 22:49:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UMnrGe026277
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:49:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMnrV9028597
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:49:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 30 Sep 2013 17:49:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMnq3P011541;
	Mon, 30 Sep 2013 17:49:52 -0500
Date: Mon, 30 Sep 2013 18:49:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130930224951.GN24472@edge>
References: <1380583400-8907-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C56578B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C56578B@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-source-ipk: Preserve latest kernel and u-boot git repository
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
X-List-Received-Date: Mon, 30 Sep 2013 22:49:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack for all others besides meta-toolchain-arago one.

On Mon, Sep 30, 2013 at 10:42:14PM +0000, Cooper Jr., Franklin wrote:
> I accidently left this patch out of the patch set I just sent. One of the 
> patches in the patchset I just sent out depends on this patch.
> 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Monday, September 30, 2013 6:23 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [PATCH] arago-source-ipk: Preserve latest kernel and u-boot git
> > repository
> > 
> > * Preserve the git repository when the sources are packaged up.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../conf/distro/arago-source-ipk.conf              |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-
> > distro/conf/distro/arago-source-ipk.conf
> > index 63cad0d..a321271 100644
> > --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > @@ -121,6 +121,7 @@ SRCIPK_PACKAGE_ARCH_pn-x-load =
> > "${MACHINE_ARCH}"
> >  CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
> >  SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}-
> > ${PR}"
> >  SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
> > +SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
> > 
> >  CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
> >  SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-
> > ${PR}"
> > @@ -145,6 +146,7 @@ SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 =
> > "${MACHINE_ARCH}"
> >  CREATE_SRCIPK_pn-linux-ti-staging = "1"
> >  SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
> >  SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
> > +SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
> > 
> >  CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
> >  SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-
> > psp${PSPREL}"
> > --
> > 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

