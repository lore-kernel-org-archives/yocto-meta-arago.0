Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 3A3FB52998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 19:37:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW400A0T6IJBZ40@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 13:37:32 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9987120092; Mon,
	11 Nov 2013 14:37:31 -0500 (EST)
Date: Mon, 11 Nov 2013 14:37:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20131111193731.GG24766@denix.org>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
	<1384189628-21944-4-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C59CF0B@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BE91@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BED0@DLEE11.ent.ti.com>
	<20131111192716.GC24766@denix.org>
	<7D46E86EC0A8354091174257B2FED1015980C101@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1015980C101@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 4/4] arago-test: add linaro-pm-qa-utils to test	packages
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
X-List-Received-Date: Mon, 11 Nov 2013 19:37:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Nov 11, 2013 at 07:31:40PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Monday, November 11, 2013 1:27 PM
> >To: Maupin, Chase
> >Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-
> >qa-utils to test packages
> >
> >AFAIK, ltp-ddt in meta-oe is very old and hasn't been updated in
> >years. I
> >doubt that particular one had any thermal features.
> >
> >It should be Ok to add this dependency in meta-arago in bbappend,
> >once these
> >recipes land in meta-linaro, since we already have such
> >dependency.
> 
> Any idea who to work with for meta-linaro?
> 
> And can't this dependency be added now since even before it lands in 
> meta-linaro it will be in meta-arago?

Try linaro-dev@lists.linaro.org:
http://lists.linaro.org/mailman/listinfo/linaro-dev

Fathi Boudra has been responsive lately... Not sure if Koen will own that 
layer now. Either way, sending to the list is best, just add [meta-linaro] 
prefix...


> >On Mon, Nov 11, 2013 at 07:22:27PM +0000, Maupin, Chase wrote:
> >> Denys,
> >>
> >> I could use some advice here though.  Ltp-ddt sits in meta-
> >openembedded so
> >> even if we get the pm-utils into meta-linaro we still should not
> >introduce
> >> this dependency between layers right?
> >>
> >> However, we do append ltp-ddt in meta-arago so if we introduce
> >this
> >> dependency there would that be an issue?
> >>
> >> What do you think about how to handle this?
> >>
> >> >-----Original Message-----
> >> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> >bounces@arago-project.org] On Behalf Of Maupin, Chase
> >> >Sent: Monday, November 11, 2013 1:19 PM
> >> >To: Cooper Jr., Franklin; meta-arago@arago-project.org
> >> >Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-
> >pm-
> >> >qa-utils to test packages
> >> >
> >> >Good point.
> >> >
> >> >Sincerely,
> >> >Chase Maupin
> >> >Integration Team Manager
> >> >Linux Core Product Development
> >> >e-mail: chase.maupin@ti.com
> >> >phone: (214) 567-2950
> >> >
> >> >For support:
> >> >Forums - http://community.ti.com/forums/
> >> >Wiki - http://wiki.davincidsp.com/
> >> >
> >> >
> >> >>-----Original Message-----
> >> >>From: Cooper Jr., Franklin
> >> >>Sent: Monday, November 11, 2013 12:54 PM
> >> >>To: Maupin, Chase; meta-arago@arago-project.org
> >> >>Subject: RE: [meta-arago] [PATCH 4/4] arago-test: add linaro-
> >pm-
> >> >>qa-utils to test packages
> >> >>
> >> >>The current patch is fine as is but should there be another
> >patch
> >> >>that makes ltp-ddt RDEPENDS on linaro-pm-qa-utils?
> >> >>
> >> >>> -----Original Message-----
> >> >>> From: meta-arago-bounces@arago-project.org [mailto:meta-
> >arago-
> >> >>> bounces@arago-project.org] On Behalf Of Maupin, Chase
> >> >>> Sent: Monday, November 11, 2013 11:07 AM
> >> >>> To: meta-arago@arago-project.org
> >> >>> Subject: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-
> >qa-
> >> >>utils to test
> >> >>> packages
> >> >>>
> >> >>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> >>> ---
> >> >>>  .../packagegroups/packagegroup-arago-test.bb       |    3
> >++-
> >> >>>  1 files changed, 2 insertions(+), 1 deletions(-)
> >> >>>
> >> >>> diff --git a/meta-arago-distro/recipes-
> >> >>core/packagegroups/packagegroup-
> >> >>> arago-test.bb b/meta-arago-distro/recipes-
> >> >>core/packagegroups/packagegroup-
> >> >>> arago-test.bb
> >> >>> index 35fa627..58ecd83 100644
> >> >>> --- a/meta-arago-distro/recipes-
> >> >core/packagegroups/packagegroup-
> >> >>arago-
> >> >>> test.bb
> >> >>> +++ b/meta-arago-distro/recipes-
> >> >core/packagegroups/packagegroup-
> >> >>arago-
> >> >>> test.bb
> >> >>> @@ -1,6 +1,6 @@
> >> >>>  DESCRIPTION = "Extended task to get System Test specific
> >apps"
> >> >>>  LICENSE = "MIT"
> >> >>> -PR = "r9"
> >> >>> +PR = "r10"
> >> >>>
> >> >>>  inherit packagegroup
> >> >>>
> >> >>> @@ -21,6 +21,7 @@ ARAGO_TEST = "\
> >> >>>  ARAGO_TI_TEST = "\
> >> >>>      ltp-ddt \
> >> >>>      input-utils \
> >> >>> +    linaro-pm-qa-utils \
> >> >>>      "
> >> >>>
> >> >>>  ARAGO_TI_TEST_append_omap-a15 = " \
> >> >>> --
> >> >>> 1.7.0.4
> >> >>>
> >> >>> _______________________________________________
> >> >>> meta-arago mailing list
> >> >>> meta-arago@arago-project.org
> >> >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> >_______________________________________________
> >> >meta-arago mailing list
> >> >meta-arago@arago-project.org
> >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

