Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9982C529A2
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2013 21:17:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8BLHB7l011022
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2013 16:17:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8BLHBrX022311
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2013 16:17:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 11 Sep 2013 16:17:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8BLHBbA009809;
	Wed, 11 Sep 2013 16:17:11 -0500
Date: Wed, 11 Sep 2013 17:17:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130911211711.GL8614@edge>
References: <1378866929-16570-1-git-send-email-denis@denix.org>
	<20130911170117.GH8614@edge>
	<B1A7D92B-0718-4262-A267-EF216902C823@ti.com>
MIME-Version: 1.0
In-Reply-To: <B1A7D92B-0718-4262-A267-EF216902C823@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-qt4: undo RRECOMMENDS for eglibc-gconv-utf-16
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
X-List-Received-Date: Wed, 11 Sep 2013 21:17:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 11, 2013 at 05:13:01PM -0400, Cooper Jr., Franklin wrote:
> Is there a plan to fix this for the external arago toolchain?

By discontinuing it completely? :)

There are no plans to make any more releases of the Arago toolchain, as far as 
I know. If something changes, we can consider adding this as well...


> On Sep 11, 2013, at 7:01 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > If there are no objections, I'd like to push this one in - it currently breaks 
> > builds with the external arago toolchain (am180x only now). But in general, it 
> > pulls in entire eglibc into the build to get that specific locale/gconv module.
> > 
> > -- 
> > Denys
> > 
> > On Tue, Sep 10, 2013 at 10:35:29PM -0400, Denys Dmytriyenko wrote:
> >> From: Denys Dmytriyenko <denys@ti.com>
> >> 
> >> Commit 995502d19cce43430c3f4dce80ce6ef5feee7421 in or-core adds RRECOMMENDS
> >> for eglibc-gconv-utf-16 to resolve Qt's warning related to i18n and l10n.
> >> Current external toolchains in use by meta-arago do not provide gconv modules.
> >> While it is possible to fix for Linaro, as it is shipped with gconv modules,
> >> Arago toolchain had no gconv modules distributed, unfortunately.
> >> 
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> ---
> >> meta-arago-distro/recipes-qt/qt4/arago-qt4.inc | 6 +++++-
> >> 1 file changed, 5 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
> >> index 0291555..715092e 100644
> >> --- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
> >> +++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
> >> @@ -1,11 +1,15 @@
> >> # Common file for patches or tweaks that are needed by qt4-embedded and
> >> # qt4-embedded-gles
> >> 
> >> -PR := "${PR}-arago4"
> >> +PR := "${PR}-arago5"
> >> 
> >> # look for files in this layer first
> >> FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> >> 
> >> +python __anonymous () {
> >> +    d.setVar("RRECOMMENDS_libqt-embeddedcore4", "")
> >> +}
> >> +
> >> # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> >> # For our distribution purposes we only use LGPLv2.1
> >> LICENSE = "LGPLv2.1"
> >> -- 
> >> 1.8.3.2
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

