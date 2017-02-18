Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 46AB4529CD
	for <meta-arago@arago-project.org>;
	Sat, 18 Feb 2017 03:21:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1I3LPXV016827
	for <meta-arago@arago-project.org>; Fri, 17 Feb 2017 21:21:25 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1I3LPqh001645
	for <meta-arago@arago-project.org>; Fri, 17 Feb 2017 21:21:25 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Feb 2017 21:21:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1I3LPI7012530;
	Fri, 17 Feb 2017 21:21:25 -0600
Date: Fri, 17 Feb 2017 22:21:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <20170218032124.GA26872@edge>
References: <1487275110-60319-1-git-send-email-denys@ti.com>
	<b38e8d46-ea7b-2a4d-393c-4de3c4b26973@ti.com>
MIME-Version: 1.0
In-Reply-To: <b38e8d46-ea7b-2a4d-393c-4de3c4b26973@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] kms++: update to the latest, package python bindings
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
X-List-Received-Date: Sat, 18 Feb 2017 03:21:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 17, 2017 at 09:06:01AM +0200, Tomi Valkeinen wrote:
> On 16/02/17 21:58, Denys Dmytriyenko wrote:
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Alejandro Hernandez <ajhernandez@ti.com>
> > ---
> >  meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> > index 9b30569..121479b 100644
> > --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> > +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> > @@ -4,17 +4,21 @@ LICENSE = "MPL-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=c670e18272184fc0e86e1648678b4f2a"
> >  
> >  PV = "1.0"
> > -PR = "r0"
> > +PR = "r1"
> >  
> >  BRANCH = "master"
> >  SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "546e8d16dbc4dc74038dbcf86567186dbd80c3ab"
> > +SRCREV = "6d28a0dd5d6747116f631d24bcc59d944a1b8b95"
> >  
> > -DEPENDS = "drm python3 python3-pybind11"
> > +DEPENDS = "drm python3-pybind11"
> 
> I'm not familiar with the packaging so I could be wrong, but I presume
> these are dependencies to other packages? kms++ gets pybind11 as a git
> submodule, so I don't think there should be a dependency to
> python3-pybind11 package.

Tomi,

That wasn't the case before, right? If that's how it works now, then we can 
probably drop that dependency.

-- 
Denys

