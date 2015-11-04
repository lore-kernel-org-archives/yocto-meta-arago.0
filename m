Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3DAC352999
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 21:14:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4LEJhY025801
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:14:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4LEJj9024321
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:14:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 15:14:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4LEIpp015454;
	Wed, 4 Nov 2015 15:14:18 -0600
Date: Wed, 4 Nov 2015 16:14:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20151104211401.GL25957@edge>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-7-git-send-email-h-gou@ti.com>
	<20151104200520.GJ25957@edge>
	<2E957F12D11D904590FA9AF86D366BD926AE905F@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926AE905F@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 6/7] matrix-gui-3d-demos: add kmscube for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 21:14:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 04, 2015 at 04:11:36PM -0500, Gou, Hongmei wrote:
> Please see below inline.
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, November 04, 2015 3:05 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 6/7] matrix-gui-3d-demos: add kmscube
> > for ti43x
> > 
> > On Wed, Nov 04, 2015 at 03:00:16PM -0500, Hongmei Gou wrote:
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 6
> > > +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > > b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > > index 4373d5f..710bb75 100644
> > > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
> > demos_2.0.bb
> > > @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-
> > v2/matrix-gui-v2-apps"
> > >
> > >  require matrix-gui-apps-git.inc
> > >
> > > -PR = "${INC_PR}.5"
> > > +PR = "${INC_PR}.6"
> > >
> > >  S = "${WORKDIR}/git/3d_apps"
> > >
> > > @@ -33,6 +33,10 @@ PACKAGES_append_omap-a15 = " \
> > >              matrix-3d-demo-kmscubevideo \  "
> > >
> > > +PACKAGES_append_ti43x = " \
> > > +            matrix-3d-demo-kmscube \
> > 
> > What about kmscubevideo one?
> 
> kmscubevideo is not supported for AM4, as the video decoding is running on IVAHD.

Thanks


> > > +"
> > > +
> > >  MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
> > >
> > >  do_install_prepend() {
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

