Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D794052A50
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 17:05:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HH5nLQ015750
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 12:05:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HH5mr7023887
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 12:05:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 12:05:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HH5mOJ021988;
	Thu, 17 Jul 2014 12:05:48 -0500
Date: Thu, 17 Jul 2014 13:05:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140717170547.GR15788@edge>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-4-git-send-email-Chase.Maupin@ti.com>
	<20140715172820.GF15788@edge>
MIME-Version: 1.0
In-Reply-To: <20140715172820.GF15788@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/4] arago: unset ASSUME_PROVIDED for git-native
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
X-List-Received-Date: Thu, 17 Jul 2014 17:05:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 15, 2014 at 01:28:22PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 15, 2014 at 06:28:34AM -0500, Chase Maupin wrote:
> > * To get maximum size reduction use the later version of git
> >   that is provided by git-native.  This reduces the kernel sources
> >   size from 1002MB to 762MB.
> > * Older versions of git work but they provide a depth of 1 for
> >   all branches and tags instead of just for the branch requested.
> > * This was tested with git version 1.7.9.5 and 1.9 as comparison
> >   points.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index b9af13f..1470f22 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -50,6 +50,11 @@ require conf/distro/include/arago-prefs.inc
> >  # Hack out sgx flag for now, as breaking on kernels >= 3.14
> >  MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
> >  
> > +# Remove the ASSUME_PROVIDED setting for git-native so that we can
> > +# use the latest version for the sourceipk which leads to a smaller
> > +# git history.
> > +ASSUME_PROVIDED := "${@filter_out('git-native','${ASSUME_PROVIDED}',d)}"
> 
> This now should work:
> 
> ASSUME_PROVIDED -= "git-native"

Correction:

ASSUME_PROVIDED_remove = "git-native"


> >  # Allow branding on top of Arago Distro and Core TI-SDK
> >  # If ARAGO_BRAND is not set in local.conf, default to core
> >  ARAGO_BRAND ??= "core"
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

