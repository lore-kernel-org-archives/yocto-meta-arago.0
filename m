Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 17C9452A50
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 15:05:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CF5X5d028348
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 10:05:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CF5X4f004808
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 10:05:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 10:05:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CF5Wds006288;
	Tue, 12 Aug 2014 10:05:32 -0500
Date: Tue, 12 Aug 2014 11:05:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140812150532.GE23523@edge>
References: <1407848417-4123-1-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6F9C86@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6F9C86@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] evtest - update checksums
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
X-List-Received-Date: Tue, 12 Aug 2014 15:05:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yep, it was even backported to daisy:

http://cgit.openembedded.org/meta-openembedded/commit/?h=daisy&id=fe2bef61acec531acfecbcda1dc76cb739f8f49e


On Tue, Aug 12, 2014 at 02:20:59PM +0000, Cooper Jr., Franklin wrote:
> I would normally acknowledge this but this patch is no longer necessary.
> 
> https://github.com/openembedded/meta-oe/commit/fe2bef61acec531acfecbcda1dc76cb739f8f49e
> 
> Someone has fixed this problem in meta-oe for the same reason as your patch. 
> They also switched to git. If you update your meta-oe sources and rebase you 
> will already have this patch.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > Sent: Tuesday, August 12, 2014 8:00 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] evtest - update checksums
> > 
> > * The checksums no longer matched and caused a fetch error.
> > 
> > This patch has been submitted to upstream meta-oe and when accepted the
> > append can be removed.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../recipes-support/evtest/evtest_1.25.bbappend    |    4 ++++
> >  1 file changed, 4 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-
> > support/evtest/evtest_1.25.bbappend
> > 
> > diff --git a/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
> > b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
> > new file mode 100644
> > index 0000000..1c3b257
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
> > @@ -0,0 +1,4 @@
> > +PR_append = "-arago0"
> > +
> > +SRC_URI[archive.md5sum] = "0ef3fe5e20fa2dee8994827d48482902"
> > +SRC_URI[archive.sha256sum] =
> > "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b"
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

