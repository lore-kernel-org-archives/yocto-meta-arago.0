Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 28E36529F0
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2013 19:35:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3NJZTAj008881
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2013 14:35:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3NJZT0u006728
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2013 14:35:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Apr 2013 14:35:29 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3NJZTQt002882;
	Tue, 23 Apr 2013 14:35:29 -0500
Date: Tue, 23 Apr 2013 15:35:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20130423193529.GG11449@edge>
References: <1366524535-13207-1-git-send-email-eyalr@ti.com>
	<8665E2433BC68541A24DFFCA87B70F5B17C74011@DNCE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B17C74011@DNCE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v3 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Tue, 23 Apr 2013 19:35:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eyal,

Not yet - it failed to apply wpa-supplicant patch when I tried yesterday. I 
may need to massage the patches, once I have time...

-- 
Denys


On Tue, Apr 23, 2013 at 08:58:33AM +0000, Reizer, Eyal wrote:
> Ping on this set of wilink8 related patches.
> 
> Regards,
> Eyal
> 
> > -----Original Message-----
> > From: Reizer, Eyal
> > Sent: Sunday, April 21, 2013 9:09 AM
> > To: meta-arago@arago-project.org
> > Cc: Reizer, Eyal
> > Subject: [PATCH v3 1/9] wlconf: configuration utility for wilink8
> > wireless driver
> > 
> > Add a recipe for building and installing the wlconf configuration
> > utility for TI Wilink8 family of chips.
> > 
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> > Changes in v2:
> > * Rename to use an actual release name instead of _git
> > * Line indentation fixes
> > Changes in v3:
> > * Drop the PV assignment
> > 
> >  .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   36
> > ++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-
> > connectivity/wlconf/wlconf_r8.a6.01.bb
> > 
> > diff --git a/meta-arago-extras/recipes-
> > connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-
> > connectivity/wlconf/wlconf_r8.a6.01.bb
> > new file mode 100644
> > index 0000000..ade2e84
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> > @@ -0,0 +1,36 @@
> > +DESCRIPTION = "Configuration utility for TI wireless drivers"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> > "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9
> > 438"
> > +
> > +PR ="r1"
> > +PR_append = "+gitr${SRCREV}"
> > +
> > +SRCREV = "ol_r8.a6.01"
> > +SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> > +
> > +S = "${WORKDIR}/git/wlconf"
> > +
> > +EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
> > +
> > +do_install() {
> > +	install -d ${D}${bindir}
> > +	install -d ${D}${bindir}/wlconf/
> > +	install -d ${D}${bindir}/wlconf/official_inis
> > +
> > +	install -m 0755 wlconf ${D}${bindir}/wlconf/
> > +	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> > +	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> > +	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> > +	install -m 0755 README ${D}${bindir}/wlconf/
> > +	install -m 0755 example.conf ${D}${bindir}/wlconf/
> > +	install -m 0755 example.ini ${D}${bindir}/wlconf/
> > +	install -m 0755 ${S}/official_inis/*
> > +			${D}${bindir}/wlconf/official_inis/
> > +}
> > +
> > +FILES_${PN} += " \
> > +	${bindir}/wlconf \
> > +	${bindir}/wlconf/official_inis \
> > +"
> > +
> > +FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
> > --
> > 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

