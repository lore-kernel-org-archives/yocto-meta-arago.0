Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 80CA852ACD
	for <meta-arago@arago-project.org>;
	Fri, 28 Jul 2017 17:06:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6SH6qtR004189
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 12:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501261612;
	bh=7bCWzUCsxRqz+usopzhy/XKnDg3oG4M9m2GI+kwx8hg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kbnz7XnsWfSybN+USwobCNlDr8+EHZz5cFkl9CJIq6U48RsnnlHIYxlvq3I+9yuR0
	5yPrGvfpBPU+uycxKrNYqpepRf4De/FSbDWaAnahYIsdstGLKjFvv2YTfB0KXwrVqV
	orjZ3cBynQDk5MejxyVua6JDqgiqCCdi6nDstlpA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SH6q0p013850
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 12:06:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Jul 2017 12:06:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SH6pZZ025729;
	Fri, 28 Jul 2017 12:06:52 -0500
Date: Fri, 28 Jul 2017 13:06:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170728170648.GU18367@edge>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
	<1501194495-48938-5-git-send-email-e-ruei1@ti.com>
	<20170727232650.GS18367@edge>
	<009C030982313E4589C6BC55FBF1E82A2539705C@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A2539705C@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
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
X-List-Received-Date: Fri, 28 Jul 2017 17:06:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 28, 2017 at 09:36:36AM -0400, Ruei, Eric wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, July 27, 2017 7:27 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
> 
> On Thu, Jul 27, 2017 at 06:28:15PM -0400, Eric Ruei wrote:
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > index 7402427..9a19224 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to include Matrix v2"
> >  LICENSE = "MIT"
> > -PR = "r66"
> > +PR = "r67"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -128,6 +128,7 @@ MATRIX_APPS_append_omap-a15 = "     \
> >      matrix-gui-generic-pm           \
> >      matrix-gui-clocks               \
> >      matrix-gui-pm-demos-governor    \
> > +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-browser-demos','',d)} \
> 
> Are these really specific to sgx?
> 
> [Eric] One of the browser demo is chromium browser which is based on 
> wayland-egl . Does it make sense to allow the browser demos only when SGX is 
> enabled? Should I remove the condition?

Should it be dependent on "wayland" distro feature then?


> >  "
> >  
> >  MATRIX_APPS_append_dra7xx += " \
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

