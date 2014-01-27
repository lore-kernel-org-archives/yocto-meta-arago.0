Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 781FF5298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 20:40:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RKe30I015309
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:40:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKe3fh032579
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:40:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 14:40:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKe23o008148;
	Mon, 27 Jan 2014 14:40:02 -0600
Date: Mon, 27 Jan 2014 15:40:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>
Message-ID: <20140127204002.GN6814@edge>
References: <1390853985-8457-1-git-send-email-yanivma@ti.com>
	<1390853985-8457-3-git-send-email-yanivma@ti.com>
	<20140127203349.GM6814@edge>
	<AE1C82FB3D0EC64DB1F752C81CBD11012626E0AC@DFRE01.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <AE1C82FB3D0EC64DB1F752C81CBD11012626E0AC@DFRE01.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] wl18xx wlconf: add missing default bin
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
X-List-Received-Date: Mon, 27 Jan 2014 20:40:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2014 at 03:37:17PM -0500, Machani, Yaniv wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, January 27, 2014 10:34 PM
> To: Machani, Yaniv
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/3] wl18xx wlconf: add missing default bin
> 
> On Mon, Jan 27, 2014 at 10:19:45PM +0200, Yaniv Mahani wrote:
> > From: Yaniv Machani <yanivma@ti.com>
> > 
> > - Add missing configuration file, eliminate loading error message.
> > - Update to latest version.
> > 
> > Signed-off-by: Yaniv Machani <yanivma@ti.com>
> > ---
> >  .../{wlconf_r8.a8.08.bb => wlconf_r8.a8.10.bb}     |    9 ++++++---
> >  1 files changed, 6 insertions(+), 3 deletions(-)  rename 
> > meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a8.08.bb => 
> > wlconf_r8.a8.10.bb} (80%)
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb 
> > b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> > similarity index 80%
> > rename from 
> > meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> > rename to 
> > meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> > index f4adc18..5f50e88 100644
> > --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> > +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> > @@ -2,11 +2,11 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
> >  
> > -PR ="r0"
> > +PR ="r1"
> >  PR_append = "+gitr${SRCPV}"
> >  
> > -# Tag: ol_r8.a8.08
> > -SRCREV = "c976584589981c9ab8741d1819a5019e17cac13b"
> > +# Tag: ol_r8.a8.10
> > +SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
> >  SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> >  
> >  S = "${WORKDIR}/git/wlconf"
> > @@ -17,12 +17,14 @@ do_install() {
> >  	install -d ${D}${bindir}
> >  	install -d ${D}${bindir}/wlconf/
> >  	install -d ${D}${bindir}/wlconf/official_inis
> > +	install -d ${D}/lib/firmware/ti-connectivity
> >  
> >  	install -m 0755 wlconf ${D}${bindir}/wlconf/
> >  	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> >  	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> >  	install -m 0755 default.conf ${D}${bindir}/wlconf/
> >  	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> > +	install -m 0755 wl18xx-conf-default.bin 
> > +${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
> 
> So, do you need this same .bin file in both places - in /usr/bin/wlconf and /lib/firmware/ti-connectivity?
> [Machani, Yaniv] Yes, one is saved as default (under wlconf), the other can be changed by user configuration. 
> When loading the driver, he looks for the file under ti-connectivity, if nothing is in there it prints an error, and uses the default.
> The purpose is to eliminate the error message to have a clean load.

Thanks, merged in.


> >  	install -m 0755 README ${D}${bindir}/wlconf/
> >  	install -m 0755 example.conf ${D}${bindir}/wlconf/
> >  	install -m 0755 example.ini ${D}${bindir}/wlconf/
> > @@ -33,6 +35,7 @@ do_install() {
> >  FILES_${PN} += " \
> >  	${bindir}/wlconf \
> >  	${bindir}/wlconf/official_inis \
> > +	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
> >  "
> >  
> >  FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
> > -- 
> > 1.7.9
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

