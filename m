Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4426652A28
	for <meta-arago@arago-project.org>;
	Mon, 16 Jun 2014 22:57:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5GMvfB5003146
	for <meta-arago@arago-project.org>; Mon, 16 Jun 2014 17:57:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5GMvfbG012562
	for <meta-arago@arago-project.org>; Mon, 16 Jun 2014 17:57:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 17:57:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5GMvflO023512;
	Mon, 16 Jun 2014 17:57:41 -0500
Date: Mon, 16 Jun 2014 18:57:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140616225740.GE1825@edge>
References: <1402686416-8127-1-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6D03BC@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D03BC@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] yavta: append yavta recipe to update to	latest
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
X-List-Received-Date: Mon, 16 Jun 2014 22:57:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 13, 2014 at 07:36:28PM +0000, Cooper Jr., Franklin wrote:
> 
> > diff --git a/meta-arago-extras/recipes-
> > multimedia/v4l2apps/yavta_git.bbappend b/meta-arago-extras/recipes-
> > multimedia/v4l2apps/yavta_git.bbappend
> > new file mode 100644
> > index 0000000..75721b8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend
> > @@ -0,0 +1,12 @@
> > +# This change has been accepted upstream and will be available in the
> > +next # stable 1.7 release of the Yocto Project after Daisy (version 1.6).
> > +# The updated version of the patch in the yavta directory can also be #
> > +removed at that point.
> > +
> > +SRCREV = "7e9f28bedc1ed3205fb5164f686aea96f27a0de2"
> > +
> > +PR_append = "-arago1"
> [Franklin] This should be 0.

Doesn't really matter 0 or 1, so it's rather wasteful to spend time "fixing" 
it...


> > +CFLAGS += "-I${S}/include"
> > +
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
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

