Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4765652A2A
	for <meta-arago@arago-project.org>;
	Tue, 10 Nov 2015 15:52:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAAFq7ZW009805
	for <meta-arago@arago-project.org>; Tue, 10 Nov 2015 09:52:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAAFq7ar026080
	for <meta-arago@arago-project.org>; Tue, 10 Nov 2015 09:52:07 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Nov 2015 09:52:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAAFq6lV011695;
	Tue, 10 Nov 2015 09:52:07 -0600
Date: Tue, 10 Nov 2015 10:51:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20151110155151.GB3272@edge>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-8-git-send-email-h-gou@ti.com>
	<20151109194014.GW25957@edge>
	<2E957F12D11D904590FA9AF86D366BD926AEE0EA@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926AEE0EA@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x
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
X-List-Received-Date: Tue, 10 Nov 2015 15:52:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, pushed.

On Mon, Nov 09, 2015 at 06:01:43PM -0500, Gou, Hongmei wrote:
> Patch is rebased and submitted.
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, November 09, 2015 2:40 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix:
> > update the SGX demos for ti43x
> > 
> > Please rebase your patch with the recent opencl changes.
> > 
> > 
> > On Wed, Nov 04, 2015 at 03:00:17PM -0500, Hongmei Gou wrote:
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10
> > +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > > index a6d1b39..a63b8ea 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-matrix.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-matrix.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "Task to include Matrix v2"
> > >  LICENSE = "MIT"
> > > -PR = "r45"
> > > +PR = "r46"
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > > @@ -49,6 +49,14 @@ MATRIX_SGX_DEMOS_omap-a15 = " \
> > >      matrix-3d-demo-kmscubevideo \
> > >  "
> > >
> > > +MATRIX_SGX_DEMOS_ti43x = " \
> > > +    matrix-3d-demo-chameleon \
> > > +    matrix-3d-demo-coverflow \
> > > +    matrix-3d-demo-navigation \
> > > +    matrix-3d-demo-exampleui \
> > > +    matrix-3d-demo-kmscube \
> > > +"
> > > +
> > >  MATRIX_QT_APPS_keystone = ""
> > >
> > >  MATRIX_APPS = ""
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

