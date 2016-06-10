Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 458DC52AA9
	for <meta-arago@arago-project.org>;
	Fri, 10 Jun 2016 16:38:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AGcEno023608
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 11:38:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AGcVUB031758
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 11:38:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Jun 2016 11:38:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AGcV3d010117;
	Fri, 10 Jun 2016 11:38:31 -0500
Date: Fri, 10 Jun 2016 12:38:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <20160610163830.GJ2466@edge>
References: <1465416813-20165-1-git-send-email-xuj@ti.com>
	<20160610162041.GI2466@edge>
	<025FAFE323E47A42AFE6A51B24577A8A322EC784@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <025FAFE323E47A42AFE6A51B24577A8A322EC784@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] LINALG: removed 'mmv' from makefile.
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
X-List-Received-Date: Fri, 10 Jun 2016 16:38:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 10, 2016 at 12:22:19PM -0400, Xu, Jianzhong wrote:
> LINALG's makefile uses non-standard utility 'mmv'. This commit removes it 
> from the makefile.

Please add this explanation to the commit log and re-submit.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, June 10, 2016 12:21 PM
> To: Xu, Jianzhong
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] LINALG: removed 'mmv' from makefile.
> 
> What does your subject mean?
> 
> 
> On Wed, Jun 08, 2016 at 04:13:33PM -0400, Jianzhong Xu wrote:
> > Signed-off-by: Jianzhong Xu <xuj@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/linalg/linalg.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> > index bb132dc..aa33923 100644
> > --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> > +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> > @@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
> >  LICENSE = "BSD-3-Clause"
> >  
> >  PV = "1_2_0_0"
> > -INC_PR = "r4"
> > +INC_PR = "r5"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > @@ -12,7 +12,7 @@ require recipes-ti/includes/ti-staging.inc
> >  BRANCH = "master"
> >  SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
> >  LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
> > -SRCREV = "19bc67da92b66acc99941183868ffb0dc234a0e9"
> > +SRCREV = "0833183162a47876a8f24532264da51010d80623"
> >  
> >  DEPENDS = "common-csl-ip \
> >             libarch \
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

