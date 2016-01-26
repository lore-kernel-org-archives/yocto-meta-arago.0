Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 86485529E2
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2016 21:35:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLZlcT009320
	for <meta-arago@arago-project.org>; Tue, 26 Jan 2016 15:35:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLZljo017805
	for <meta-arago@arago-project.org>; Tue, 26 Jan 2016 15:35:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:35:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLZlTQ031268;
	Tue, 26 Jan 2016 15:35:47 -0600
Date: Tue, 26 Jan 2016 16:35:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20160126213531.GE11314@edge>
References: <1453407350-27909-1-git-send-email-h-gou@ti.com>
	<20160121203655.GB11314@edge>
MIME-Version: 1.0
In-Reply-To: <20160121203655.GB11314@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-tisdk-addons-sdk-target: add elfutils-dev and elfutils-staticdev for dra7xx
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
X-List-Received-Date: Tue, 26 Jan 2016 21:35:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping. Do you want to mention why elfutils are needed? And why is it dra7xx 
specific?

On Thu, Jan 21, 2016 at 03:36:55PM -0500, Denys Dmytriyenko wrote:
> Short summary with the reasons for this change would be helpful. Thanks.
> 
> 
> On Thu, Jan 21, 2016 at 03:15:50PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> > index 7d5b290..44abbdb 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
> >  LICENSE = "MIT"
> > -PR = "r19"
> > +PR = "r20"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -120,6 +120,8 @@ UTILS_append_ti33x = " canutils-dev"
> >  UTILS_append_ti43x = " canutils-dev"
> >  UTILS_append_dra7xx = " canutils-dev \
> >                          opencl-staticdev \
> > +                        elfutils-dev \
> > +                        elfutils-staticdev \
> >  "
> >  UTILS_append_k2g-evm = " canutils-dev"
> >  
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

